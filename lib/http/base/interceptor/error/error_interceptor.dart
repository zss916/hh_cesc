import 'package:cescpro/core/setting/app_loading.dart';
import 'package:cescpro/core/translations/en.dart';
import 'package:cescpro/http/base/exceptions/network_exception.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';

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
          AppLoading.showError(TKey.requestParameterError.tr);
          break;
        case 403:
          AppLoading.showError(TKey.noAccess.tr);
          break;
        case 404:
          AppLoading.showError(TKey.requestedAddressDoesNotExist.tr);
          break;
        case 500:
          AppLoading.showError(TKey.internalServerError.tr);
          break;
        default:
          final data = error.response!.data;
          if (data is Map && data.containsKey('message')) {
            AppLoading.showError(data['message']);
          } else {
            AppLoading.showError('${TKey.requestFailed.tr}: $statusCode');
          }
          break;
      }
    } else {
      switch (error.type) {
        case DioExceptionType.connectionTimeout:
          AppLoading.showError(TKey.timeout.tr);
          break;
        case DioExceptionType.sendTimeout:
          AppLoading.showError(TKey.sendTimeout.tr);
          break;
        case DioExceptionType.receiveTimeout:
          AppLoading.showError(TKey.receiveTimeout.tr);
          break;
        case DioExceptionType.connectionError:
          AppLoading.showError(TKey.connectionError.tr);
          break;
        case DioExceptionType.unknown:
          if (error.error is NetworkException) {
            AppLoading.showError(TKey.networkUnavailable.tr);
          } else {
            final message = error.message ?? TKey.unknownNetworkAnomaly.tr;
            AppLoading.showError('${TKey.networkAnomaly.tr}: $message');
          }
          break;
        default:
          AppLoading.showError(TKey.unknownError.tr);
          break;
      }
    }
  }
}
