part of 'index.dart';

class HomeLogic extends GetxController with NetWorkRefreshEvent {
  HomeStatisticsModel data = HomeStatisticsModel();
  UiState state = Loading();

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
    loadData(loading: true);
  }

  @override
  void onClose() {
    super.onClose();
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
    loadHome();
  }

  Future<void> loadHome() async {
    ApiResult<HomeStatisticsModel> result = await HomeAPI.loadHomeData();
    switch (result) {
      case ApiSuccess(:final data):
        state = Success<HomeStatisticsModel>(data);
        update();
      case ApiError():
        state = Failure();
        update();
    }
  }
}
