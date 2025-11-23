part of 'index.dart';

class MainLogic extends GetxController {
  List<SiteEntity> sites = [];

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
    final (bool isSuccessful, List<SiteEntity> value) =
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
