part of 'index.dart';

class StationDetailLogic extends GetxController {
  SiteEntity? siteEntity;
  bool enableStrategy = false;

  @override
  void onInit() {
    super.onInit();
    siteEntity =
        ((Get.arguments as Map<String, dynamic>)['site'] as SiteEntity?);
    if (siteEntity != null) {
      enableStrategy = siteEntity?.enableStrategy ?? false;
    }
  }

  @override
  void onReady() {
    super.onReady();
    // getPointDetails();
  }

  @override
  void onClose() {
    super.onClose();
  }

  /*Future<void> getPointDetails() async {
    SiteDetailEntity? value = await SiteAPI.getPointDetails(
      siteId: siteEntity?.id ?? 0,
    );
    if (value != null) {
      enableStrategy = (value.enableStrategy ?? false);
      update();
    }
  }*/
}
