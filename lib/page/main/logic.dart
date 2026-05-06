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

    ///todo 通过改弹窗，可以优化
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

  @override
  void onClose() {
    super.onClose();
  }
}
