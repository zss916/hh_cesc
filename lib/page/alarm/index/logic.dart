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

  refreshData() {
    pageNum = 1;
    loadData(pageNum: pageNum);
  }

  loadMoreData() {
    pageNum += 1;
    loadData(pageNum: pageNum);
  }

  Future<void> loadData({int pageNum = 1}) async {
    //https://ems.cescpower.com:9088/api/v1/business/alarm/listPage?adcode=&pageSize=10&pageNum=1
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
    );
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
