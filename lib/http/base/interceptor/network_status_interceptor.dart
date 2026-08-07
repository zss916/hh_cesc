import 'dart:async';

import 'package:cescpro/http/base/interceptor/network_status.dart';
import 'package:cescpro/http/base/interceptor/request_queue.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

/// 网络状态拦截器
/// 1. 请求前检查网络状态，断网时将请求入队
/// 2. 网络恢复后自动执行队列中的请求
/// 3. 网络切换时短暂延迟，避免切换瞬间的请求失败
class NetworkStatusInterceptor extends Interceptor {
  /// Dio 实例获取函数，用于网络恢复后执行队列请求
  final Dio Function() dioGetter;

  StreamSubscription? _statusSub;

  NetworkStatusInterceptor({required this.dioGetter}) {
    _statusSub = NetworkStatusService.instance.statusStream.listen(
      _onStatusChanged,
    );
  }

  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    // 是否允许断网入队（默认 true），部分关键请求可关闭
    final enqueueOnOffline = options.extra['enqueueOnOffline'] ?? true;

    // 当前正在切换网络，短暂等待
    if (NetworkStatusService.instance.isSwitching) {
      await Future.delayed(const Duration(milliseconds: 500));
    }

    final isConnected = await NetworkStatusService.instance.isConnected();

    if (!isConnected) {
      if (enqueueOnOffline) {
        // 断网时请求入队，网络恢复后自动重试
        debugPrint('[NetworkStatusInterceptor] 断网，请求入队: ${options.path}');
        //ToastService.instance.show('当前网络不可用，请求将在网络恢复后自动发送');
        RequestQueue.instance.enqueue(
          QueuedRequest(options: options, handler: handler),
        );
        return;
      } else {
        // 不入队则直接失败
        // ToastService.instance.show('当前网络不可用');
        handler.reject(
          DioException(
            requestOptions: options,
            //error: NetworkException(message: '网络不可用'),
          ),
        );
        return;
      }
    }

    handler.next(options);
  }

  /// 网络状态变化回调
  void _onStatusChanged(NetworkStatus status) async {
    if (status == NetworkStatus.connected && !RequestQueue.instance.isEmpty) {
      debugPrint('[NetworkStatusInterceptor] 网络恢复，开始执行队列请求');
      await RequestQueue.instance.flush((options) {
        return dioGetter().fetch(options);
      });
    }
  }

  void dispose() {
    _statusSub?.cancel();
  }
}
