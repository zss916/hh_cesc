import 'package:dio/dio.dart';

import '../../exceptions/business_exception.dart';

class ResponseInterceptor extends Interceptor {
  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    final data = response.data;

    if (data is Map) {
      final code = data['code'] as int? ?? 200;
      final message = data['message'] as String? ?? '';

      if (code != 200) {
        handler.reject(
          DioException(
            message: message,
            requestOptions: response.requestOptions,
            response: response,
            type: DioExceptionType.badResponse,
            error: BusinessException(code: code, message: message),
          ),
        );
        return;
      }

      ///不用去糖
      // response.data = data['data'];
    }

    handler.next(response);
  }
}
