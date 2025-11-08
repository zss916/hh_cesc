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

  /* @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    //super.onResponse(response, handler);
    //99999
    if (response.statusCode == HttpStatus.ok) {
      var entity = const JsonDecoder().convert(response.data.toString());
      if (entity is Map<String, dynamic>) {
        int code = entity["code"];
        String msg = entity["message"];
        debugPrint("====>>>>  code:$code, msg:$msg");
      }
    }
  }*/
}
