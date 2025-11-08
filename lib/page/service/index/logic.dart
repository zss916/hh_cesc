part of 'index.dart';

class ServiceLogic extends GetxController {
  UserInfoEntity? value;

  String get userName => value?.username ?? '';
  String get icon => value?.icon ?? '';

  int unreadNum = 0;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
    loadUserInfo();
    getUnreadNum();
  }

  Future<void> loadUserInfo() async {
    value = await AdminAPI.getUserInfo();
    update();
  }

  Future<void> getUnreadNum() async {
    unreadNum = await MessageAPI.getUnreadNum();
    update();
  }

  /// 退出登录
  void toLogOut() {
    User.removeToken();
    PageTools.offAllNamedSplash();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
