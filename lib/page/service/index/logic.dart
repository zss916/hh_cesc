part of 'index.dart';

class ServiceLogic extends GetxController {
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
    loadUserInfo();
  }

  Future<void> loadUserInfo() async {
    UserInfoEntity? value = await AdminAPI.getUserInfo();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
