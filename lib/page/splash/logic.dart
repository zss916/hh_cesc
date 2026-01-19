part of 'index.dart';

class SplashLogic extends GetxController {
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
    checkPrivacyAgreement();
  }

  Future<void> checkPrivacyAgreement() async {
    final agreed = StorageService.to.getBool('privacy_agreed');
    if (!agreed) {
      // 首次打开或未同意，显示隐私弹窗
      PrivacyDialog.showPrivacyPolicyDialog(
        onNext: () {
          toNext();
        },
      );
    } else {
      toNext();
    }
  }

  void toNext() {
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
