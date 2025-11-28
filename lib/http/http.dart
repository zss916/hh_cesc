import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import 'base/base_options.dart' show baseDioOptions;
import 'base/httpClientAdapter.dart' show httpAdapter;
import 'base/interceptor/auth_interceptor.dart';

class Http {
  static final Http _instance = Http._internal();
  static Http get instance => Http();
  factory Http() => _instance;

  late Dio _dio;
  CancelToken cancelToken = CancelToken();

  Http._internal() {
    _dio = Dio(baseDioOptions);
    _dio.httpClientAdapter = httpAdapter;
    _dio.interceptors.add(AuthInterceptor());
    _dio.interceptors.add(prettyDioLogger);
  }

  void cancelRequests(CancelToken token) {
    token.cancel("cancel request");
  }

  PrettyDioLogger prettyDioLogger = PrettyDioLogger(
    requestHeader: true,
    requestBody: true,
    responseHeader: false,
    responseBody: true,
  );

  ///post
  Future<dynamic> post(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    bool showLoading = false,
    bool showToast = true,
    CancelToken? cancelToken,
  }) async {
    try {
      final response = await _dio.post(
        path,
        data: data,
        queryParameters: queryParameters,
        //options: options,
        cancelToken: cancelToken,
      );
      return response.data ?? '{}';
    } catch (error) {
      rethrow;
    }
  }

  ///get
  Future<dynamic> get(
    String url, {
    Map<String, dynamic>? query,
    Object? data,
    Options? options,
    CancelToken? cancelToken,
  }) async {
    try {
      final result = await _dio.get(
        url,
        queryParameters: query,
        data: data,
        //options: options,
        cancelToken: cancelToken,
      );
      return result.data ?? '{}';
    } catch (error) {
      rethrow;
    }
  }

  ///delete
  Future<dynamic> delete(
    String url, {
    Map<String, dynamic>? query,
    Object? data,
    Options? options,
    CancelToken? cancelToken,
  }) async {
    try {
      final result = await _dio.delete(
        url,
        queryParameters: query,
        data: data,
        //options: options,
        cancelToken: cancelToken,
      );
      return result.data ?? '{}';
    } catch (error) {
      rethrow;
    }
  }

  ///patch
  Future<dynamic> patch(
    String url, {
    Map<String, dynamic>? query,
    Object? data,
    Options? options,
    CancelToken? cancelToken,
  }) async {
    try {
      final result = await _dio.patch(
        url,
        queryParameters: query,
        data: data,
        //options: options,
        cancelToken: cancelToken,
      );
      return result.data ?? '{}';
    } catch (error) {
      rethrow;
    }
  }

  ///put
  Future<dynamic> put(
    String url, {
    Map<String, dynamic>? query,
    Object? data,
    Options? options,
    CancelToken? cancelToken,
  }) async {
    try {
      final result = await _dio.put(
        url,
        queryParameters: query,
        data: data,
        //options: options,
        cancelToken: cancelToken,
      );
      return result.data ?? '{}';
    } catch (error) {
      rethrow;
    }
  }
}
