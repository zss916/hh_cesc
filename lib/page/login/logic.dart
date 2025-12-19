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
      //PageTools.toMain();
      PageTools.offAllNamedMain();
    }
  }
}
