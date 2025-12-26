part of 'index.dart';

class LoginLogic extends GetxController {
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
  }

  String account = '';
  String password = '';

  Future<void> toLogin() async {
    AppLoading.show();
    TokenEntity? value =
        await AdminAPI.login(
          username: account,
          password: password,
        ).whenComplete(() {
          AppLoading.dismiss();
        });
    if (value != null) {
      User.setTokenHead(tokenHead: value.tokenHeadValue);
      User.setToken(token: value.tokenValue);
      await loadCurrencyList();
      //PageTools.toMain();
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
