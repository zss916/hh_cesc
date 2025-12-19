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
  }

  loadSites() async {
    final (bool isSuccessful, List<SiteDataEntity> value) =
        await SiteAPI.postSites();
    if (isSuccessful) {
      sites.assignAll(value);
    }
  }

  @override
  void onClose() {
    super.onClose();
  }
}
