part of 'index.dart';

class AlarmLogic extends GetxController {
  List<AlarmItemEntity> data = [];

  int viewState = 0;
  int pageNum = 1;

  @override
  void onInit() {
    super.onInit();
    viewState = 2;
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
  }

  Future<void> loadData({int pageNum = 1}) async {
    //https://ems.cescpower.com:9088/api/v1/business/alarm/listPage?adcode=&pageSize=10&pageNum=1
    final (bool isSuccessful, List<AlarmItemEntity> value) =
        await AlarmAPI.getListPageApp(pageNum: pageNum);
    if (isSuccessful) {
      if (pageNum == 1) {
        data = value;
        viewState = data.isEmpty ? 1 : 0;
        update();
      } else {
        data.addAll(value);
        viewState = data.isEmpty ? 1 : 0;
        update();
      }
    }
  }

  refreshData() {
    pageNum = 1;
    loadData(pageNum: pageNum);
  }

  loadMoreData() {
    pageNum += 1;
    loadData(pageNum: pageNum);
  }
}
