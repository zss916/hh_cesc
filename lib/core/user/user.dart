import 'package:cescpro/core/storage/storage.dart';
import 'package:get/get.dart';

class User extends GetxService {
  static User get to => Get.find();

  Future<User> init() async {
    return this;
  }

  static final String tokenKey = "tokenKey";
  static final String tokenHeadKey = "tokenHeadKey";
  static final String currencyListKey = "currencyListKey";
  static final String currencyUnitKey = "currencyUnitKey";

  ///是否登录
  bool get isLogin => getToken().isNotEmpty;

  static String getToken() {
    return StorageService.to.getString(tokenKey);
  }

  static removeToken() {
    StorageService.to.remove(tokenKey);
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

  ///保存货币单位
  void setCurrencyUnit({required String unit}) {
    StorageService.to.setString(currencyUnitKey, unit);
  }

  ///获取货币单位
  String getCurrencyUnit() {
    return StorageService.to.getString(currencyUnitKey);
  }
}
