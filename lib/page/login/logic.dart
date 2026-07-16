part of 'index.dart';

class LoginLogic extends GetxController {
  String account = '';
  String password = '';
  bool isChecked = false;

  FocusNode? accountFocusNode = FocusNode();
  FocusNode? pwdFocusNode = FocusNode();
  TextEditingController? accountTextEditCtrl = TextEditingController();
  TextEditingController? pwdTextEditCtrl = TextEditingController();

  @override
  void onInit() {
    super.onInit();

    if (accountFocusNode != null) {
      accountFocusNode?.unfocus();
      accountFocusNode = null;
    }
    if (pwdFocusNode != null) {
      pwdFocusNode?.unfocus();
      pwdFocusNode = null;
    }
  }

  @override
  void onReady() {
    super.onReady();
    if (GetPlatform.isAndroid && !AppSetting.isOverseas) {
      checkPrivacyAgreement();
    }
    initData();
  }

  Future<void> initData() async {
    account = await User.to.getAccount();
    accountTextEditCtrl?.text = account;
    password = await User.to.getPwd();
    pwdTextEditCtrl?.text = password;
    isChecked = password.isNotEmpty;
    update();
  }

  @override
  void onClose() {
    super.onClose();
    if (accountFocusNode != null) {
      accountFocusNode?.dispose();
      accountFocusNode = null;
    }
    if (pwdFocusNode != null) {
      pwdFocusNode?.unfocus();
      pwdFocusNode = null;
    }
    if (accountTextEditCtrl != null) {
      accountTextEditCtrl?.dispose();
      accountTextEditCtrl = null;
    }
    if (pwdTextEditCtrl != null) {
      pwdTextEditCtrl?.dispose();
      pwdTextEditCtrl = null;
    }

    AppLoading.dismiss();
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

  Future<void> toLogin({
    required String account,
    required String password,
    Function(String newPassword)? onUpdatePsd,
    bool? isCheck,
  }) async {
    if (GetPlatform.isAndroid && !AppSetting.isOverseas) {
      if (!User.to.getPrivacyAgreed()) {
        AppLoading.toast(TKey.privacyAgreementRequired.tr);
        return;
      }
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
    TokenEntity? value = await AdminAPI.login(
      username: (account.trim()),
      password: (password.trim()),
    );
    if (value != null) {
      User.to.setAccount(account: account.trim());
      if (isCheck == true) {
        User.to.setPwd(pwd: password.trim());
      } else {
        User.to.removePwd();
      }
      User.to.setIsGuest(isGuest: false);
      User.setTokenHead(tokenHead: value.tokenHeadValue);
      User.setToken(token: value.tokenValue);
      UserInfoEntity? userInfo = await AdminAPI.getUserInfo2();
      User.setLimitLogin(limit: !(userInfo?.canLogin ?? true));
      if (userInfo?.canLogin ?? true) {
        await loadCurrencyList(userInfo);
        final (bool isSuccessful, List<SiteEntity> list) =
            await SiteAPI.postSiteList(pageNum: 1, name: null, status: null);
        AppLoading.dismiss();
        if (list.length == 1) {
          PageTools.offAllNamedStation(siteId: list.first.id, site: list.first);
        } else {
          PageTools.offAllNamedMain();
        }
      } else {
        AppLoading.dismiss();
        updatePassWord(
          onConfirm: (value) {
            updatePsd(
              account: account,
              oldPassword: password,
              newPassword: value,
              onUpdate: onUpdatePsd,
            );
          },
        );
      }
    }
  }

  Future<void> toGuestLogin() async {
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
      UserInfoEntity? userInfo = await AdminAPI.getUserInfo2();
      await loadCurrencyList(userInfo);
      PageTools.offAllNamedMain();
    }
  }

  Future<String> loadCurrencyList(UserInfoEntity? userInfo) async {
    List<CurrencyEntity> list = await AdminAPI.getCurrencyList();
    if (userInfo != null) {
      User.to.setIsShowRevenue(isShowRevenue: userInfo.isShowRevenue);
    }
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

  ///更新密码
  Future<bool> updatePsd({
    required String account,
    required String oldPassword,
    required String newPassword,
    Function(String value)? onUpdate,
  }) async {
    AppLoading.show();
    bool isNext = await AdminAPI.updatePs(
      username: account,
      oldPassword: oldPassword,
      newPassword: newPassword,
    ).whenComplete(() => AppLoading.dismiss());
    if (isNext) {
      onUpdate?.call(newPassword);
      Get.snackbar("Successful", TKey.newPsdLogin.tr, colorText: Colors.white);
    }
    return isNext;
  }
}
