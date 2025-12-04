part of 'index.dart';

class AlarmLogic extends GetxController {
  List<AlarmItemEntity> data = [];

  int viewState = ViewStateEnum.common.index;
  int pageNum = 1;
  int? startTimeMill;
  int? endTimeMill;
  CountryEntity? country;
  //
  int? alarmLevel;
  // String? adcode;
  SiteEntity? site;

  @override
  void onInit() {
    super.onInit();
    viewState = ViewStateEnum.loading.index;
    update();
  }

  @override
  void onReady() {
    super.onReady();
    refreshData();
  }

  @override
  void onClose() {
    super.onClose();
  }

  refreshData({bool? isLoading}) {
    pageNum = 1;
    loadData(pageNum: pageNum, isLoading: isLoading ?? false);
  }

  loadMoreData() {
    pageNum += 1;
    loadData(pageNum: pageNum);
  }

  Future<void> loadData({int pageNum = 1, bool isLoading = false}) async {
    if (isLoading) AppLoading.show();
    final (
      bool isSuccessful,
      List<AlarmItemEntity> value,
    ) = await AlarmAPI.getListPageApp(
      pageNum: pageNum,
      adcode: country?.code,
      alarmLevel: alarmLevel,
      siteId: site?.id,
      startTimeMill: startTimeMill,
      endTimeMill: endTimeMill,
    ).whenComplete(() => AppLoading.dismiss());
    if (isSuccessful) {
      if (pageNum == 1) {
        data.assignAll(value);
      } else {
        data.addAll(value);
      }
    } else {
      pageNum -= 1;
      AppLoading.toast("Fail");
    }
    viewState = data.isEmpty
        ? ViewStateEnum.empty.index
        : ViewStateEnum.common.index;
    update();
  }
}
