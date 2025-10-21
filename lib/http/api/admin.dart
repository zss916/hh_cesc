import 'package:cescpro/core/setting/app_loading.dart';
import 'package:cescpro/http/bean/token_entity.dart';
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
      if (result["code"] == 0) {
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
  static Future<dynamic> getLoginInfo({required String id}) async {
    try {
      var result = await Http.instance.get(
        ApiPath.getInfoApp,
        // query: {"id": id},
      );
      if (result["code"] == 0) {
        return result["data"];
      } else {
        AppLoading.toast(result["message"]);
        return null;
      }
    } catch (error) {
      return null;
    }
  }
}
