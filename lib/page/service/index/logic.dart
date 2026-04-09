part of 'index.dart';

class ServiceLogic extends GetxController {
  UserInfoEntity? value;

  String get userName => value?.username ?? '--';
  String get icon => value?.icon ?? '';
  int? get id => value?.id;

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
    value = await AdminAPI.getUserInfo2();
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

  ///注销账号
  void toRemoveAccount() {
    User.to.setPrivacyAgreed(isAgree: false);
    User.removeToken();
    PageTools.offAllNamedSplash();
  }

  @override
  void onClose() {
    AppLoading.dismiss();
    super.onClose();
  }

  ///编辑头像
  void editImage({bool camera = true}) {
    PhotoUtils.chooseImage(camera: camera).then((xFile) {
      PhotoUtils.compressImageAndGetFile(File(xFile?.path ?? "")).then((
        path,
      ) async {
        AppLoading.show();
        String? icon = await AdminAPI.uploadImage(path).whenComplete(() {
          AppLoading.dismiss();
        });
        value?.icon = icon;
        update();
        if (value != null) {
          await AdminAPI.editUser(id: id.toString(), map: value!.toJson());
        }
      });
    });
  }
}
