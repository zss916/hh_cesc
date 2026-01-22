part of 'index.dart';

class LoginLogic extends GetxController {
  String account = '';
  String password = '';

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
    checkPrivacyAgreement();
  }

  @override
  void onClose() {
    super.onClose();
  }

  Future<void> checkPrivacyAgreement() async {
    bool agreed = User.to.getPrivacyAgreed();
    if (!agreed) {
      // 首次打开或未同意，显示隐私弹窗
      PrivacyDialog.showPrivacyPolicyDialog(
        onNext: () {
          // toNext(seconds: 1);
          AppEventBus.eventBus.fire(CheckPolicy(true));
        },
      );
    } else {
      // toNext();
    }
  }

  Future<void> toLogin() async {
    if (!User.to.getPrivacyAgreed()) {
      AppLoading.toast(TKey.privacyAgreementRequired.tr);
      return;
    }
    if (account.trim().isEmpty) {
      AppLoading.toast(TKey.accountRequired.tr);
      return;
    }

    if (password.trim().isEmpty) {
      AppLoading.toast(TKey.passwordRequired.tr);
      return;
    }

    AppLoading.show();
    TokenEntity? value =
        await AdminAPI.login(
          username: (account.trim()),
          password: (password.trim()),
        ).whenComplete(() {
          AppLoading.dismiss();
        });
    if (value != null) {
      User.to.setIsGuest(isGuest: false);
      User.setTokenHead(tokenHead: value.tokenHeadValue);
      User.setToken(token: value.tokenValue);
      await loadCurrencyList();
      //PageTools.toMain();
      PageTools.offAllNamedMain();
    }
  }

  Future<void> toGuestLogin() async {
    if (!User.to.getPrivacyAgreed()) {
      AppLoading.toast(TKey.privacyAgreementRequired.tr);
      return;
    }
    AppLoading.show();
    TokenEntity? value =
        await AdminAPI.login(
          username: "cesc",
          password: "cesc123!",
        ).whenComplete(() {
          AppLoading.dismiss();
        });
    if (value != null) {
      User.to.setIsGuest(isGuest: true);
      User.setTokenHead(tokenHead: value.tokenHeadValue);
      User.setToken(token: value.tokenValue);
      await loadCurrencyList();
      PageTools.offAllNamedMain();
    }
  }

  Future<String> loadCurrencyList() async {
    List<CurrencyEntity> list = await AdminAPI.getCurrencyList();
    UserInfoEntity? userInfo = await AdminAPI.getUserInfo2();
    if (list.isNotEmpty) {
      List<CurrencyEntity> value = list
          .where((e) => e.code == userInfo?.currencyCode)
          .toList();
      if (value.isNotEmpty) {
        String symbol = value.first.symbol ?? "";
        User.to.setCurrencyUnit(unit: symbol);
        return symbol;
      } else {
        User.to.setCurrencyUnit(unit: "");
        return "";
      }
    } else {
      User.to.setCurrencyUnit(unit: "");
      return "";
    }
  }
}
