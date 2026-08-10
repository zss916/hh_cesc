part of 'index.dart';

class AlarmDetailLogic extends GetxController
    with RefreshControllerHelper, NetWorkRefreshEvent {
  int? siteId;
  final List<AlarmItemEntity> _list = [];
  int pageNum = 1;
  int? alarmLevel;
  String? alarmTitle;
  String? compType;

  UiState state = Loading();

  @override
  void onInit() {
    super.onInit();
    if (Get.arguments != null) {
      Map<String, dynamic> map = Get.arguments as Map<String, dynamic>;
      siteId = map['siteId'] as int?;
      state = Loading();
      update();
    }
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
    onRefreshDispose();
    onDisposeNetWork();
    super.onClose();
    _list.clear();
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

  void refreshData() {
    pageNum = 1;
    fetchData(pageNum: pageNum);
  }

  void loadMoreData() {
    pageNum += 1;
    fetchData(pageNum: pageNum);
  }

  Future<void> fetchData({int pageNum = 1, bool isLoading = false}) async {
    if (siteId != null) {
      if (isLoading) {
        AppLoading.show();
      }
      final result = await AlarmAPI.postRealTimePage(
        siteId: "$siteId",
        alarmLevel: alarmLevel,
        compType: compType,
        pageNum: pageNum,
      ).whenComplete(() => AppLoading.dismiss());

      switch (result) {
        case ApiSuccess(:final data):
          if (pageNum == 1) {
            _list.assignAll(data);
          } else {
            _list.addAll(data);
          }
          refreshAndLoadCtl(pageNum <= 1, data.length);
          state = data.isEmpty ? Empty() : Success<List<AlarmItemEntity>>(data);
          update();
        case ApiError(:final errorState, :final msg):
          pageNum -= 1;
          refreshAndLoadCtl(pageNum <= 1, _list.length);
          state = Failure();
          update();
          if (errorState == ErrorState.error) {
            AppLoading.toast(msg);
          } else {
            AppLoading.toast("Fail");
          }
      }
    } else {
      state = Failure();
      update();
    }
  }
}
