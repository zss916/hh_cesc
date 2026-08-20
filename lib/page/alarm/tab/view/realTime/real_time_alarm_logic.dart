part of 'index.dart';

class RealTimeAlarmLogic extends GetxController
    with RefreshControllerHelper, NetWorkRefreshEvent {
  final List<AlarmItemEntity> _list = [];

  int pageNum = 1;
  int? startTimeMill;
  int? endTimeMill;
  CountryEntity? country;
  int? alarmLevel;
  int? siteId;
  String? siteName;

  UiState state = Loading();

  @override
  void onInit() {
    super.onInit();
    onNetWorkRefresh(
      onRefresh: () {
        loadData(loading: true, isDelayed: true);
      },
    );
    state = Empty();
    update();
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

  void refreshData() {
    pageNum = 1;
    fetchData(pageNum: pageNum);
  }

  void loadMoreData() {
    pageNum += 1;
    fetchData(pageNum: pageNum);
  }

  Future<void> fetchData({int pageNum = 1}) async {
    ApiResult<List<AlarmItemEntity>> result = await AlarmAPI.getAlarmList(
      pageNum: pageNum,
      adcode: country?.code,
      alarmLevel: alarmLevel,
      siteId: siteId,
      startTimeMill: startTimeMill,
      endTimeMill: endTimeMill,
      status: 1,
    );

    switch (result) {
      case ApiSuccess(:final data):
        if (pageNum == 1) {
          _list.assignAll(data);
        } else {
          _list.addAll(data);
        }
        refreshAndLoadCtl(pageNum <= 1, data.length);
        state = _list.isEmpty ? Empty() : Success<List<AlarmItemEntity>>(_list);
        update();
      case ApiError(:final errorState, :final msg):
        pageNum -= 1;
        refreshAndLoadCtl(pageNum <= 1, _list.length);
        state = Failure();
        update();
        if (errorState == ErrorState.error) {
          AppLoading.toast(msg ?? "");
        } else {
          AppLoading.toast("Fail");
        }
    }
  }

  ///选
  void toFilter({bool isLoading = false}) {
    if (isLoading) {
      state = Loading();
      update();
    }
    pageNum = 1;
    fetchData(pageNum: pageNum);
  }
}
