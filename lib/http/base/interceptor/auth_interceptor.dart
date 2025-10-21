import 'package:cescpro/http/base/header/authorization_header.dart';
import 'package:cescpro/http/base/header/locale_header.dart';
import 'package:cescpro/http/base/header/timezone_header.dart';
import 'package:dio/dio.dart';

class AuthInterceptor extends Interceptor {
  AuthInterceptor();

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.headers["Accept-Timezone"] = TimezoneHeader.getTimezone();
    options.headers["Accept-Language"] = LocaleHeader.getLocal();
    options.headers["Authorization"] = AuthorizationHeader.getAuthorization();
    handler.next(options);
  }
}
