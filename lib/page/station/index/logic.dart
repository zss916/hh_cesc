part of 'index.dart';

class StationLogic extends GetxController {
  List<SiteEntity> data = [];

  int viewState = 0;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
    loadData();
    //loadList();
  }

  @override
  void onClose() {
    super.onClose();
  }

  Future<void> loadData({String? name}) async {
    final (bool isSuccessful, List<SiteEntity> value) =
        await SiteAPI.postPointList(name: name);
    if (isSuccessful) {
      data = value;
      update();
    }
  }

  Future<void> loadList() async {
    final (bool isSuccessful, List<SiteEntity> value) =
        await SiteAPI.postSiteList(pageNum: 1);
    if (isSuccessful) {
      data = value;
      update();
    }
  }
}
