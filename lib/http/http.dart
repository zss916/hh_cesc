import 'dart:async';

import 'package:cescpro/http/base/interceptor/network_status.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import 'base/base_options.dart' show baseDioOptions;
import 'base/httpClientAdapter.dart' show httpAdapter;
import 'base/interceptor/auth_interceptor.dart';

class Http {
  static final Http _instance = Http._internal();
  static Http get instance => Http();
  factory Http() => _instance;

  late Dio _dio;
  CancelToken cancelTokenAll = CancelToken();

  /// 网络质量监听订阅
  StreamSubscription<NetworkQuality>? _qualitySub;

  Http._internal() {
    _dio = Dio(baseDioOptions);
    _dio.httpClientAdapter = httpAdapter;
    _setupInterceptors();
    //_setupNetworkQualityListener();
  }

  void _setupInterceptors() {
    _dio.interceptors.add(AuthInterceptor());
    // _dio.interceptors.add(NetworkStatusInterceptor(dioGetter: () => _dio));
    //_dio.interceptors.add(ErrorInterceptor(),);
    _dio.interceptors.add(prettyDioLogger);
  }

  /// 监听网络质量变化，动态调整超时时间
  void _setupNetworkQualityListener() {
    _qualitySub = NetworkStatusService.instance.qualityStream.listen((quality) {
      debugPrint('[ApiClient] 网络质量变化: $quality，动态调整超时配置');
      _dio.options.connectTimeout =
          NetworkStatusService.instance.connectTimeout;
      _dio.options.receiveTimeout =
          NetworkStatusService.instance.receiveTimeout;
    });
  }

  void cancelALLRequests() {
    cancelTokenAll.cancel("cancel all request");
  }

  /// 释放资源
  void dispose() {
    _qualitySub?.cancel();
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
    Function(int count, int total)? onSendProgress,
  }) async {
    try {
      final response = await _dio.post(
        path,
        data: data,
        queryParameters: queryParameters,
        //options: options,
        cancelToken: cancelToken ?? cancelTokenAll,
        onSendProgress: onSendProgress,
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
        cancelToken: cancelToken ?? cancelTokenAll,
      );
      return result.data ?? '{}';
    } catch (error) {
      rethrow;
    }
  }
}
