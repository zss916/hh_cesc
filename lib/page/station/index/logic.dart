part of 'index.dart';

class StationLogic extends ViewStateController {
  List<SiteEntity> data = [];
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
    onLoading();
    update();
  }

  @override
  void onReady() {
    super.onReady();
    loadData();
  }

  @override
  void onClose() {
    refreshCtrl.dispose();
    super.onClose();
    AppLoading.dismiss();
  }

  Future<void> loadData({bool loading = true, bool? isDelayed}) async {
    if (loading) {
      onLoading();
      update();
      if (isDelayed == true) await Future.delayed(Duration(seconds: 2));
    }

    final isConnected = await NetworkStatusService.instance.isConnected();
    if (!isConnected) {
      onOffline();
      update();
      return;
    }

    refreshData();
  }

  // //99.正常 (0:停止1:充电2:放电3:待机) 4: 故障，-3:中断 -2:告警
  void toSearch({bool isLoading = false}) {
    if (isLoading) {
      onLoading();
      update();
    }
    pageNum = 1;
    loadList(pageNumber: pageNum);
  }

  void refreshData({bool isLoading = false}) {
    pageNum = 1;
    loadList(pageNumber: pageNum, isLoading: isLoading);
  }

  void loadMoreData() {
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
      } else {
        data.addAll(value);
      }
    } else {
      pageNum -= 1;
    }
    refreshAndLoadCtl(pageNumber <= 1, value.length);
    data.isEmpty ? onEmpty() : onComplete();
    update();
  }
}
