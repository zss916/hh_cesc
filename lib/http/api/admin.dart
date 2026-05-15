import 'dart:io';
import 'dart:math';

import 'package:cescpro/core/setting/app_loading.dart';
import 'package:cescpro/http/bean/currency_entity.dart';
import 'package:cescpro/http/bean/token_entity.dart';
import 'package:cescpro/http/bean/user_info_entity.dart';
import 'package:cescpro/http/http.dart';
import 'package:cescpro/http/path.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

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
  /*
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
*/

  static Future<UserInfoEntity?> getUserInfo2({String? id}) async {
    try {
      Map<String, dynamic> params = {};
      if (id != null) {
        params["id"] = id;
      }
      var result = await Http.instance.get(ApiPath.getInfoApp2, query: params);
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

  static Future<List<CurrencyEntity>> getCurrencyList() async {
    try {
      var result = await Http.instance.get(ApiPath.getCurrencyList);
      if (result["code"] == HttpStatus.ok) {
        List<CurrencyEntity> value = await compute(
          (List<dynamic> jsonList) =>
              jsonList.map((e) => CurrencyEntity.fromJson(e)).toList(),
          (result['data'] as List),
        );
        return value;
      } else {
        AppLoading.toast(result["message"]);
        return <CurrencyEntity>[];
      }
    } catch (error) {
      return <CurrencyEntity>[];
    }
  }

  ///上传图片
  static Future<String?> uploadImage(String path) async {
    try {
      // 生成随机数文件名
      String name =
          Random().nextInt(10000).toString() +
          DateTime.now().millisecondsSinceEpoch.toString() +
          path.substring((path).lastIndexOf("."));

      FormData formData = FormData.fromMap({
        "file": await MultipartFile.fromFile(path, filename: name),
      });

      var result = await Http.instance.post(
        ApiPath.uploadImage,
        data: formData,
        onSendProgress: (int sent, int total) {
          debugPrint("uploading image: $sent/$total"); // 打印上传进度信息
        },
      );
      if (result["code"] == HttpStatus.ok) {
        return result["data"];
      } else {
        AppLoading.toast(result["message"]);
        return null;
      }
    } catch (e) {
      debugPrint("Error uploading image: $e"); // 打印错误信息
      return null;
    }
  }

  ///编辑用户
  static Future<bool> editUser({
    required String id,
    required Map<String, dynamic> map,
  }) async {
    try {
      var result = await Http.instance.post(ApiPath.uploadUser + id, data: map);
      if (result["code"] == HttpStatus.ok) {
        return true;
      } else {
        AppLoading.toast(result["message"]);
        return false;
      }
    } catch (e) {
      return false;
    }
  }

  ///更新密码
  static Future<bool> updatePs({
    String? username,
    String? oldPassword,
    String? newPassword,
  }) async {
    try {
      Map<String, dynamic> map = {};
      if (username != null) {
        map["username"] = username;
      }
      if (oldPassword != null) {
        map["oldPassword"] = oldPassword;
      }
      if (newPassword != null) {
        map["newPassword"] = newPassword;
        map["rePassword"] = newPassword;
      }
      var result = await Http.instance.post(ApiPath.updatePs, data: map);
      if (result["code"] == HttpStatus.ok) {
        return true;
      } else {
        AppLoading.toast(result["message"]);
        return false;
      }
    } catch (e) {
      return false;
    }
  }
}
