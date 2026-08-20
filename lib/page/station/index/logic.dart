part of 'index.dart';

class StationLogic extends GetxController
    with NetWorkRefreshEvent, RefreshControllerHelper {
  List<SiteEntity> siteList = [];
  int pageNum = 1;
  String? nameParam;
  int? statusParam;
  UiState state = Loading();

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
    onNetWorkRefresh(
      onRefresh: () {
        loadData(loading: true, isDelayed: true);
      },
    );
  }

  @override
  void onReady() {
    super.onReady();
    loadData();
  }

  @override
  void onClose() {
    super.onClose();
    onRefreshDispose();
    onDisposeNetWork();
    AppLoading.dismiss();
  }

  Future<void> loadData({bool loading = true, bool? isDelayed}) async {
    if (loading) {
      state = Loading();
      update();
      if (isDelayed == true) await Future.delayed(Duration(seconds: 2));
    }

    final isConnected = await NetworkStatusService.instance.isConnected();
    if (!isConnected) {
      state = Offline();
      update();
      return;
    }

    refreshData();
  }

  // //99.正常 (0:停止1:充电2:放电3:待机) 4: 故障，-3:中断 -2:告警
  void toSearch({bool isLoading = false}) {
    if (isLoading) {
      state = Loading();
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

  Future<void> loadList({int pageNumber = 1, bool isLoading = false}) async {
    if (isLoading) {
      AppLoading.show();
    }
    ApiResult<List<SiteEntity>> result = await SiteAPI.fetchSites(
      pageNum: pageNumber,
      name: nameParam,
      status: statusParam,
    ).whenComplete(() => AppLoading.dismiss());
    switch (result) {
      case ApiSuccess(:final data):
        if (pageNumber == 1) {
          siteList = data;
        } else {
          siteList.addAll(data);
        }
        refreshAndLoadCtl(pageNumber <= 1, data.length);
        state = siteList.isEmpty
            ? Empty()
            : Success<List<SiteEntity>>(siteList);
        update();
      case ApiError(:final errorState, :final msg):
        pageNum -= 1;
        refreshAndLoadCtl(pageNum <= 1, siteList.length);
        state = Failure();
        update();
        if (errorState == ErrorState.error) {
          AppLoading.toast(msg ?? "");
        } else {
          AppLoading.toast("Fail");
        }
    }
  }
}
