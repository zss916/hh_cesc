import 'dart:async';

import 'package:cescpro/core/router/index.dart' show PageTools;
import 'package:cescpro/core/setting/app_loading.dart';
import 'package:cescpro/core/user/user.dart';
import 'package:cescpro/http/base/header/authorization_header.dart';
import 'package:cescpro/http/base/header/locale_header.dart';
import 'package:cescpro/http/base/header/timezone_header.dart';
import 'package:dio/dio.dart';
import 'package:get/get_connect/http/src/status/http_status.dart';

class AuthInterceptor extends Interceptor {
  static bool _isRedirecting = false;
  static final _redirectLock = Completer<Null>.sync();

  //AuthInterceptor();

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.headers["Accept-Timezone"] = TimezoneHeader.getTimezone();
    options.headers["Accept-Language"] = LocaleHeader.getLocal();
    options.headers["Authorization"] = AuthorizationHeader.getAuthorization();
    handler.next(options);
  }

  @override
  Future<void> onResponse(
    Response response,
    ResponseInterceptorHandler handler,
  ) async {
    if (response.statusCode == HttpStatus.ok) {
      Map<String, dynamic> map = response.data as Map<String, dynamic>;
      // debugPrint("map:${map}");
      if (map["code"] == 99999) {
        await _handleUnauthorized(msg: "${map["message"]}");
      } else {
        super.onResponse(response, handler);
      }
    }
  }

  ///Completer实现异步锁机制
  Future _handleUnauthorized({required String msg}) async {
    // 检查是否已有重定向操作在进行
    if (_isRedirecting) {
      // 等待正在进行的重定向完成
      if (!_redirectLock.isCompleted) {
        await _redirectLock.future;
      }
      return;
    }

    // 设置重定向标志
    _isRedirecting = true;
    // final completer = Completer<Null>();
    _redirectLock.complete();

    try {
      User.removeToken();
      PageTools.offAllNamedSplash();
      AppLoading.toast(msg);
    } finally {
      // 重置状态以便下次使用
      _isRedirecting = false;
      _redirectLock.complete();
    }
  }
}
