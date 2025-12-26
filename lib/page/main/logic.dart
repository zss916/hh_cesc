part of 'index.dart';

class MainLogic extends GetxController {
  List<SiteDataEntity> sites = [];

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
    loadSites();
    loadCurrencyList();
  }

  loadSites() async {
    final (bool isSuccessful, List<SiteDataEntity> value) =
        await SiteAPI.postSites();
    if (isSuccessful) {
      sites.assignAll(value);
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

  @override
  void onClose() {
    super.onClose();
  }
}
