part of 'index.dart';

class SplashLogic extends GetxController {
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
    Future.delayed(Duration(seconds: 2), () {
      if (User.to.isLogin) {
        PageTools.offAllNamedMain();
      } else {
        PageTools.offAndToNamedLogin();
      }
    });
  }

  @override
  void onClose() {
    super.onClose();
  }
}
