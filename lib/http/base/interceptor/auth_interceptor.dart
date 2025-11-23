import 'package:cescpro/core/router/index.dart' show PageTools;
import 'package:cescpro/core/setting/app_loading.dart';
import 'package:cescpro/core/user/user.dart';
import 'package:cescpro/http/base/header/authorization_header.dart';
import 'package:cescpro/http/base/header/locale_header.dart';
import 'package:cescpro/http/base/header/timezone_header.dart';
import 'package:dio/dio.dart';
import 'package:get/get_connect/http/src/status/http_status.dart';

class AuthInterceptor extends Interceptor {
  AuthInterceptor();

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.headers["Accept-Timezone"] = TimezoneHeader.getTimezone();
    options.headers["Accept-Language"] = LocaleHeader.getLocal();
    options.headers["Authorization"] = AuthorizationHeader.getAuthorization();
    handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    if (response.statusCode == HttpStatus.ok) {
      //  debugPrint("data =>> ${response.data}");
      Map<String, dynamic> map = response.data as Map<String, dynamic>;
      if (map["code"] == 99999) {
        User.removeToken();
        PageTools.offAllNamedSplash();
        AppLoading.toast("${map["message"]}");
      } else {
        super.onResponse(response, handler);
      }
    }
  }
}
