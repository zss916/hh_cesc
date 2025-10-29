import 'package:cescpro/core/storage/storage.dart';
import 'package:get/get.dart';

class User extends GetxService {
  static User get to => Get.find();

  Future<User> init() async {
    return this;
  }

  static final String tokenKey = "tokenKey";
  static final String tokenHeadKey = "tokenHeadKey";

  ///是否登录
  bool get isLogin => getToken().isNotEmpty;

  static String getToken() {
    return StorageService.to.getString(tokenKey);
  }

  static setToken({required String token}) {
    StorageService.to.setString(tokenKey, token);
  }

  static String getTokenHead() {
    return StorageService.to.getString(tokenHeadKey);
  }

  static setTokenHead({required String tokenHead}) {
    StorageService.to.setString(tokenHeadKey, tokenHead);
  }
}
