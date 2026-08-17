import 'package:cescpro/http/base/interceptor/loading/loading_service.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

class LoadingInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    final showLoading = options.extra['showLoading'] ?? false;
    if (showLoading) {
      LoadingService.instance.show();
    }
    handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    final showLoading = response.requestOptions.extra['showLoading'] ?? false;
    if (showLoading) {
      LoadingService.instance.dismiss();
    }
    handler.next(response);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    final showLoading = err.requestOptions.extra['showLoading'] ?? false;
    if (!showLoading) {
      handler.next(err);
      return;
    }

    final retryCount = err.requestOptions.extra['retryCount'] ?? 0;
    final maxRetryCount = err.requestOptions.extra['_maxRetryCount'] ?? 0;
    debugPrint(
      '[LoadingInterceptor] retryCount=$retryCount, maxRetry=$maxRetryCount, path=${err.requestOptions.path}',
    );

    if (retryCount < maxRetryCount) {
      handler.next(err);
      return;
    }

    LoadingService.instance.dismiss();
    handler.next(err);
  }
}
