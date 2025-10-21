import 'package:cescpro/http/path.dart';
import 'package:dio/dio.dart';

BaseOptions baseDioOptions = BaseOptions(
  baseUrl: ApiPath.baseUrl,
  connectTimeout: const Duration(seconds: 30),
  receiveTimeout: const Duration(seconds: 30),
  headers: {},
  contentType: Headers.jsonContentType,
  responseType: ResponseType.json,
);
