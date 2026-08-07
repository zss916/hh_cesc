import 'package:cescpro/http/base/exceptions/business_exception.dart';
import 'package:cescpro/http/base/toast/toast_service.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

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
          ToastService.instance.show('请求参数错误');
          break;
        case 401:
          break;
        case 403:
          ToastService.instance.show('无权访问');
          break;
        case 404:
          ToastService.instance.show('请求地址不存在');
          break;
        case 500:
          ToastService.instance.show('服务器内部错误');
          break;
        default:
          final data = error.response!.data;
          if (data is Map && data.containsKey('message')) {
            ToastService.instance.show(data['message']);
          } else {
            ToastService.instance.show('请求失败: $statusCode');
          }
          break;
      }
    } else {
      switch (error.type) {
        case DioExceptionType.connectionTimeout:
          ToastService.instance.show('连接超时，请检查网络');
          break;
        case DioExceptionType.sendTimeout:
          ToastService.instance.show('发送超时');
          break;
        case DioExceptionType.receiveTimeout:
          ToastService.instance.show('接收超时');
          break;
        case DioExceptionType.connectionError:
          ToastService.instance.show('网络连接错误');
          break;
        case DioExceptionType.unknown:
          if (error.error is NetworkException) {
            ToastService.instance.show('网络不可用');
          } else {
            final message = error.message ?? '未知网络异常';
            ToastService.instance.show('网络异常: $message');
          }
          break;
        default:
          ToastService.instance.show('未知错误');
          break;
      }
    }
  }
}
