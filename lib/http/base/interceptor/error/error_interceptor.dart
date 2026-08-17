import 'package:cescpro/core/setting/app_loading.dart';
import 'package:cescpro/http/base/exceptions/network_exception.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

// Dio 的 onError 是 逆序执行 的（后添加的先执行）
class ErrorInterceptor extends Interceptor {
  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    final retryCount = err.requestOptions.extra['retryCount'] ?? 0;
    final maxRetryCount = err.requestOptions.extra['_maxRetryCount'] ?? 0;
    debugPrint(
      '[ErrorInterceptor] retryCount=$retryCount, maxRetry=$maxRetryCount, path=${err.requestOptions.path}',
    );

    if (retryCount < maxRetryCount) {
      handler.next(err);
      return;
    }

    _handleError(err);
    handler.next(err);
  }

  void _handleError(DioException error) {
    if (kDebugMode) {
      debugPrint('[DIO Error] ${error.message}');
      debugPrint('[DIO Error] Path: ${error.requestOptions.path}');
      if (error.response != null) {
        debugPrint('[DIO Error] Status: ${error.response!.statusCode}');
        debugPrint('[DIO Error] Data: ${error.response!.data}');
      }
    }

    if (error.type == DioExceptionType.cancel) {
      return;
    }

    if (error.response != null) {
      final statusCode = error.response!.statusCode;
      switch (statusCode) {
        case 400:
          AppLoading.showError('请求参数错误');
          break;
        case 403:
          AppLoading.showError('无权访问');
          break;
        case 404:
          AppLoading.showError('请求地址不存在');
          break;
        case 500:
          AppLoading.showError('服务器内部错误');
          break;
        default:
          final data = error.response!.data;
          if (data is Map && data.containsKey('message')) {
            AppLoading.showError(data['message']);
          } else {
            AppLoading.showError('请求失败: $statusCode');
          }
          break;
      }
    } else {
      switch (error.type) {
        case DioExceptionType.connectionTimeout:
          AppLoading.showError('连接超时，请检查网络');
          break;
        case DioExceptionType.sendTimeout:
          AppLoading.showError('发送超时');
          break;
        case DioExceptionType.receiveTimeout:
          AppLoading.showError('接收超时');
          break;
        case DioExceptionType.connectionError:
          AppLoading.showError('网络连接错误');
          break;
        case DioExceptionType.unknown:
          if (error.error is NetworkException) {
            AppLoading.showError('网络不可用');
          } else {
            final message = error.message ?? '未知网络异常';
            AppLoading.showError('网络异常: $message');
          }
          break;
        default:
          AppLoading.showError('未知错误');
          break;
      }
    }
  }
}
