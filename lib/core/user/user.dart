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
  static final String isShowRevenueKey = "isShowRevenueKey";
  static final String isLimitLoginKey = "isLimitLoginKey";

  void setIsShowRevenue({required bool isShowRevenue}) =>
      StorageService.to.setBool(isShowRevenueKey, isShowRevenue);

  bool getIsShowRevenue() => StorageService.to.getBool(isShowRevenueKey);

  ///是否同意隐私
  setPrivacyAgreed({required bool isAgree}) =>
      StorageService.to.setBool(privacyAgreed, isAgree);

  bool getPrivacyAgreed() => StorageService.to.getBool(privacyAgreed);

  ///是否登录
  bool get isLogin => hasToken && !isLimit;

  static String getToken() {
    return StorageService.to.getString(tokenKey);
  }

  static bool get hasToken => getToken().isNotEmpty;

  static removeToken() {
    StorageService.to.remove(tokenKey);
  }

  static setToken({required String token}) {
    StorageService.to.setString(tokenKey, token);
  }

  static setLimitLogin({required bool limit}) {
    StorageService.to.setBool(isLimitLoginKey, limit);
  }

  ///是否限制
  static bool get isLimit => StorageService.to.getBool(isLimitLoginKey);

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
