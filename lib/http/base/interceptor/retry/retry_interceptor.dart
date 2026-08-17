import 'dart:async';
import 'dart:math';

import 'package:cescpro/http/base/interceptor/network_status/network_status.dart';
import 'package:cescpro/http/base/interceptor/retry/circuit_breaker.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

/// 重试拦截器
/// 优化原则：指数退避 + 随机抖动 + 重试上限 + 熔断保护
/// - 指数退避：每次重试间隔翻倍，给网络恢复时间
/// - 随机抖动：在退避时间上加随机增量，避免多请求同时重试导致惊群效应
/// - 重试上限：限制最大重试次数，防止单请求无限重试
/// - 熔断保护：连续失败达阈值时熔断，阻止所有重试，给服务器喘息时间
class RetryInterceptor extends Interceptor {
  /// Dio 实例获取函数，用于重试请求
  final Dio Function() dioGetter;

  /// 正常网络最大重试次数
  final int maxRetryCount;

  /// 正常网络基础重试延迟（毫秒）
  final int baseRetryDelayMs;

  /// 弱网最大重试次数
  final int poorNetworkMaxRetryCount;

  /// 弱网基础重试延迟（毫秒）
  final int poorNetworkBaseRetryDelayMs;

  /// 抖动比例（0-1），实际抖动 = 退避时间 * jitterRatio * random()
  /// 0.3 表示最大抖动量为退避时间的 30%
  final double jitterRatio;

  /// 熔断器
  final CircuitBreaker circuitBreaker;

  /// 哪些错误类型需要重试
  final Set<DioExceptionType> retryableErrorTypes;

  /// 随机数生成器
  final Random _random = Random();

  RetryInterceptor({
    required this.dioGetter,
    this.maxRetryCount = 3,
    this.baseRetryDelayMs = 500,
    this.poorNetworkMaxRetryCount = 2,
    this.poorNetworkBaseRetryDelayMs = 2000,
    this.jitterRatio = 0.3,
    CircuitBreaker? circuitBreaker,
    this.retryableErrorTypes = const {
      DioExceptionType.connectionTimeout,
      DioExceptionType.sendTimeout,
      DioExceptionType.receiveTimeout,
      DioExceptionType.connectionError,
    },
  }) : circuitBreaker = circuitBreaker ?? CircuitBreaker();

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.extra['_originalShowError'] = options.extra['showError'] ?? true;
    final isPoorNetwork = NetworkStatusService.instance.isPoorNetwork;
    options.extra['_maxRetryCount'] = isPoorNetwork
        ? poorNetworkMaxRetryCount
        : maxRetryCount;
    handler.next(options);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    final retryCount = err.requestOptions.extra['retryCount'] ?? 0;
    debugPrint(
      '[RetryInterceptor] retryCount=$retryCount, type=${err.type}, path=${err.requestOptions.path}',
    );

    // 非可重试错误类型，直接传递
    // 可重试类型：connectionTimeout, sendTimeout, receiveTimeout, connectionError
    // 不可重试类型：badResponse(4xx/5xx), cancel, unknown
    if (!retryableErrorTypes.contains(err.type)) {
      handler.next(err);
      return;
    }

    // 熔断保护：熔断器打开时，直接失败不重试
    if (!circuitBreaker.allowRequest) {
      debugPrint('[RetryInterceptor] 熔断器开启，跳过重试: ${err.requestOptions.path}');
      handler.next(err);
      return;
    }

    // 根据网络质量选择重试策略
    final isPoorNetwork = NetworkStatusService.instance.isPoorNetwork;
    final currentMaxRetry = isPoorNetwork
        ? poorNetworkMaxRetryCount
        : maxRetryCount;
    final currentBaseDelay = isPoorNetwork
        ? poorNetworkBaseRetryDelayMs
        : baseRetryDelayMs;

    // 重试上限：已达最大重试次数，记录失败并传递
    if (retryCount >= currentMaxRetry) {
      debugPrint(
        '[RetryInterceptor] 已达重试上限 $currentMaxRetry'
        '${isPoorNetwork ? "(弱网)" : ""}，放弃重试: ${err.requestOptions.path}',
      );
      circuitBreaker.recordFailure();
      err.requestOptions.extra['showError'] =
          err.requestOptions.extra['_originalShowError'] ?? true;
      handler.next(err);
      return;
    }

    final nextRetryCount = retryCount + 1;
    err.requestOptions.extra['retryCount'] = nextRetryCount;

    // 计算重试延迟：指数退避 + 随机抖动
    final delayMs = _calculateDelay(currentBaseDelay, nextRetryCount);

    debugPrint(
      '[RetryInterceptor] 第 $nextRetryCount/$currentMaxRetry 次重试'
      '${isPoorNetwork ? "(弱网)" : ""}，延迟 ${delayMs}ms: ${err.requestOptions.path}',
    );

    await Future.delayed(Duration(milliseconds: delayMs));

    try {
      err.requestOptions.extra['showError'] = false;
      final response = await dioGetter().fetch(err.requestOptions);
      circuitBreaker.recordSuccess();
      handler.resolve(response);
    } on DioException catch (e) {
      e.requestOptions.extra['showError'] = false;
      onError(e, handler);
    } catch (e) {
      circuitBreaker.recordFailure();
      handler.next(err);
    }
  }

  /// 计算重试延迟
  /// 指数退避：baseDelay * 2^(retryCount-1)
  /// 随机抖动：在退避时间上增加 0 ~ (退避时间 * jitterRatio) 的随机量
  ///
  /// 示例（正常网络，baseDelay=500, jitterRatio=0.3）：
  ///   第1次：500ms + (0~150ms) = 500~650ms
  ///   第2次：1000ms + (0~300ms) = 1000~1300ms
  ///   第3次：2000ms + (0~600ms) = 2000~2600ms
  ///
  /// 示例（弱网，baseDelay=2000, jitterRatio=0.3）：
  ///   第1次：2000ms + (0~600ms) = 2000~2600ms
  ///   第2次：4000ms + (0~1200ms) = 4000~5200ms
  int _calculateDelay(int baseDelay, int retryCount) {
    // 指数退避
    final exponentialDelay = baseDelay * (1 << (retryCount - 1));
    // 随机抖动：0 ~ exponentialDelay * jitterRatio
    final maxJitter = (exponentialDelay * jitterRatio).toInt();
    final jitter = maxJitter > 0 ? _random.nextInt(maxJitter + 1) : 0;
    return exponentialDelay + jitter;
  }
}
