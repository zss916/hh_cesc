import 'dart:io';

import 'package:cescpro/core/setting/app_loading.dart';
import 'package:cescpro/http/bean/token_entity.dart';
import 'package:cescpro/http/bean/user_info_entity.dart';
import 'package:cescpro/http/http.dart';
import 'package:cescpro/http/path.dart';

///admin
abstract class AdminAPI {
  ///登录
  static Future<TokenEntity?> login({
    required String username,
    required String password,
  }) async {
    try {
      var result = await Http.instance.post(
        ApiPath.postLogin,
        data: {"username": username, "password": password},
      );
      if (result["code"] == HttpStatus.ok) {
        return TokenEntity.fromJson(result["data"]);
      } else {
        AppLoading.toast(result["message"]);
        return null;
      }
    } catch (error) {
      return null;
    }
  }

  ///获取当前登录用户信息
  static Future<UserInfoEntity?> getUserInfo({String? id}) async {
    try {
      Map<String, dynamic> params = {};
      if (id != null) {
        params["id"] = id;
      }
      var result = await Http.instance.get(ApiPath.getInfoApp, query: params);
      if (result["code"] == HttpStatus.ok) {
        UserInfoEntity value = UserInfoEntity.fromJson(
          result["data"]["userInfo"],
        );
        return value;
      } else {
        AppLoading.toast(result["message"]);
        return null;
      }
    } catch (error) {
      return null;
    }
  }
}
