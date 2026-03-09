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

  Future<void> toNext({int seconds = 2}) async {
    if (User.to.isLogin) {
      final (bool isSuccessful, List<SiteEntity> list) =
          await SiteAPI.postSiteList(pageNum: 1, name: null, status: null);
      if (list.length == 1) {
        PageTools.offAllNamedStation(siteId: list.first.id, site: list.first);
      } else {
        PageTools.offAllNamedMain();
      }
    } else {
      Future.delayed(Duration(seconds: seconds), () {
        PageTools.offAndToNamedLogin();
      });
    }
  }

  @override
  void onClose() {
    super.onClose();
  }
}
