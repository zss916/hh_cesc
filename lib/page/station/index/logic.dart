part of 'index.dart';

class StationLogic extends GetxController {
  List<SiteEntity> data = [];

  int viewState = ViewStateEnum.common.index;
  int pageNum = 1;

  String? nameParam;
  int? statusParam;

  late RefreshController refreshCtrl = RefreshController(
    initialRefresh: false,
    initialLoadStatus: LoadStatus.canLoading,
  );

  ///站点状态数据
  List<Map<String, dynamic>> get stationStatus => [
    {"title": TKey.common.tr, "value": 99},
    {"title": TKey.alarm.tr, "value": -2},
    {"title": TKey.fault.tr, "value": 4},
    {"title": TKey.interrupt.tr, "value": -3},
    {"title": TKey.charge.tr, "value": 1},
    {"title": TKey.discharge.tr, "value": 2},
    {"title": TKey.standby.tr, "value": 3},
  ];

  @override
  void onInit() {
    super.onInit();
    viewState = ViewStateEnum.loading.index;
    update();
  }

  @override
  void onReady() {
    super.onReady();
    //loadData();
    refreshData();
  }

  @override
  void onClose() {
    refreshCtrl.dispose();
    super.onClose();
    AppLoading.dismiss();
  }

  // //99.正常 (0:停止1:充电2:放电3:待机) 4: 故障，-3:中断 -2:告警
  toSearch() {
    viewState = ViewStateEnum.loading.index;
    update();
    pageNum = 1;
    loadList(pageNumber: pageNum);
  }

  refreshData({bool isLoading = false}) {
    pageNum = 1;
    loadList(pageNumber: pageNum, isLoading: isLoading);
  }

  loadMoreData() {
    pageNum += 1;
    loadList(pageNumber: pageNum);
  }

  void refreshAndLoadCtl(bool isRefresh, int size) {
    if (isRefresh) {
      refreshCtrl.refreshCompleted(resetFooterState: true);
    } else {
      if (size == 0) {
        refreshCtrl.loadNoData();
      } else {
        refreshCtrl.loadComplete();
      }
    }
  }

  Future<void> loadList({int pageNumber = 1, bool isLoading = false}) async {
    if (isLoading) {
      AppLoading.show();
    }

    final (
      bool isSuccessful,
      List<SiteEntity> value,
    ) = await SiteAPI.postSiteList(
      pageNum: pageNumber,
      name: nameParam,
      status: statusParam,
    ).whenComplete(() => AppLoading.dismiss());
    if (isSuccessful) {
      if (pageNumber == 1) {
        data = value;
        //update();
      } else {
        data.addAll(value);
        //update();
      }
      refreshAndLoadCtl(pageNumber == 1, value.length);
      viewState = data.isEmpty
          ? ViewStateEnum.empty.index
          : ViewStateEnum.common.index;
      update();
    } else {
      pageNum -= 1;
      viewState = data.isEmpty
          ? ViewStateEnum.empty.index
          : ViewStateEnum.common.index;
      refreshCtrl.loadNoData();
      update();
      // AppLoading.toast("Fail");
    }
  }

  /*Future<void> loadData({String? name}) async {
    final (bool isSuccessful, List<SiteEntity> value) =
        await SiteAPI.postPointList(name: name);
    if (isSuccessful) {
      data = value;
      viewState = data.isEmpty ? 1 : 0;
      update();
    }
  }*/
}
