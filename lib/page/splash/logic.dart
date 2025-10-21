part of 'index.dart';

class SplashLogic extends GetxController {
  @override
  void onInit() {
    super.onInit();
    Future.delayed(Duration(seconds: 2), () {
      PageTools.toLogin();
    });
  }

  @override
  void onClose() {
    super.onClose();
  }
}
