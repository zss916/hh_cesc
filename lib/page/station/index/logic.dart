part of 'index.dart';

class StationLogic extends GetxController {
  List<SiteEntity> data = [];

  int viewState = ViewStateEnum.common.index;
  int pageNum = 1;

  String? nameParam;
  int? statusParam;

  /* late RefreshController refreshCtrl = RefreshController(
    initialRefresh: false,
    initialLoadStatus: LoadStatus.canLoading,
  );*/

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
    super.onClose();
    // refreshCtrl.dispose();
  }

  // //99.正常 (0:停止1:充电2:放电3:待机) 4: 故障，-3:中断 -2:告警
  toSearch() {
    viewState = ViewStateEnum.loading.index;
    update();
    pageNum = 1;
    loadList(pageNumber: pageNum);
  }

  refreshData() {
    pageNum = 1;
    loadList(pageNumber: pageNum);
  }

  loadMoreData() {
    pageNum += 1;
    loadList(pageNumber: pageNum);
  }

  /* void refreshAndLoadCtl(bool isRefresh, int size) {
    if (isRefresh) {
      refreshCtrl.refreshCompleted();
    } else {
      if (size == 0) {
        refreshCtrl.loadNoData();
      } else {
        refreshCtrl.loadComplete();
      }
    }
  }
*/
  Future<void> loadList({int pageNumber = 1}) async {
    final (
      bool isSuccessful,
      List<SiteEntity> value,
    ) = await SiteAPI.postSiteList(
      pageNum: pageNumber,
      name: nameParam,
      status: statusParam,
    );
    if (isSuccessful) {
      if (pageNumber == 1) {
        data = value;
      } else {
        data.addAll(value);
      }
      // refreshAndLoadCtl(pageNumber == 1, value.length);
      viewState = data.isEmpty
          ? ViewStateEnum.empty.index
          : ViewStateEnum.common.index;
      update();
    } else {
      pageNum -= 1;
      viewState = data.isEmpty
          ? ViewStateEnum.empty.index
          : ViewStateEnum.common.index;
      update();
      AppLoading.toast("Fail");
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
