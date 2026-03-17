part of 'index.dart';

class ChangeLanguageLogic extends GetxController {
  List<Map<String, dynamic>> get _data => [
    {
      "title": TKey.languageZh.tr,
      "locale": Locale('zh', 'CN'),
      "isCheck": false,
    },
    {
      "title": TKey.languageEn.tr,
      "locale": Locale('en', 'US'),
      "isCheck": false,
    },
    {
      "title": TKey.languageDe.tr,
      "locale": Locale('de', 'DE'),
      "isCheck": false,
    },
    {
      "title": TKey.languageEs.tr,
      "locale": Locale('es', 'DE'),
      "isCheck": false,
    },
  ];

  List<Map<String, dynamic>> _sortList = [];
  List<Map<String, dynamic>> list = [];

  //Locale? selectLocale;

  @override
  void onInit() {
    super.onInit();
    Locale? locale = LanTools.getLocale() ?? Get.deviceLocale;
    initData(locale);
  }

  @override
  void onClose() {
    super.onClose();
  }

  void initData(Locale? locale) {
    List<Map<String, dynamic>> mapList = _data
        .map((e) => e..['isCheck'] = (e['locale'] == locale))
        .toList();

    mapList.sort(
      (a, b) => (b['isCheck'] == true ? 1 : 0).compareTo(
        (a['isCheck'] == true ? 1 : 0),
      ),
    );
    _sortList.assignAll(mapList);
    list.assignAll(mapList);
    update();
  }

  void setData(Locale? locale) {
    if (_sortList.isNotEmpty) {
      list.assignAll(
        _sortList.map((e) => e..['isCheck'] = (e['locale'] == locale)).toList(),
      );
      update();
    }
  }

  Future<void> switchLocale(Locale? locale) async {
    if (locale != null) {
      await Get.updateLocale(locale);
      LanTools.setLocal();
      //PageTools.offAndToNamedMain();
      setData(locale);
    }
  }
}
