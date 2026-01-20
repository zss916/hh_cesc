part of 'index.dart';

class SplashLogic extends GetxController {
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
    /*if (GetPlatform.isAndroid && !AppSetting.isOverseas) {
      checkPrivacyAgreement();
    } else {
      toNext();
    }*/
    toNext();
  }

  Future<void> checkPrivacyAgreement() async {
    bool agreed = User.to.getPrivacyAgreed();
    if (!agreed) {
      // 首次打开或未同意，显示隐私弹窗
      PrivacyDialog.showPrivacyPolicyDialog(
        onNext: () {
          toNext(seconds: 1);
        },
      );
    } else {
      toNext();
    }
  }

  void toNext({int seconds = 2}) {
    Future.delayed(Duration(seconds: seconds), () {
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
