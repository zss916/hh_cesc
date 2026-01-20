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
  static final String privacyAgreed = "privacy_agreed";
  static final String isGuestKey = "isGuestKey";

  ///是否同意隐私
  setPrivacyAgreed({required bool isAgree}) =>
      StorageService.to.setBool(privacyAgreed, isAgree);

  bool getPrivacyAgreed() => StorageService.to.getBool(privacyAgreed);

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

  ///是否是游客
  void setIsGuest({required bool isGuest}) =>
      StorageService.to.setBool(isGuestKey, isGuest);

  bool getIsGuest() => StorageService.to.getBool(isGuestKey);
}
