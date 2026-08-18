part of 'index.dart';

enum ViewType { loading, common, empty }

class BatteryClusterLogic extends GetxController with NetWorkRefreshEvent {
  String? devType;
  String? siteId;
  int? did;
  int? nodeNo;
  int? devNo;

  List<CompTreeEntity> titles = [];
  ComTypeListEntity? comTypeList;
  List<ComCardVoEntity> comCardVoList = [];
  String compTree = "--";

  ///实时数据
  ViewType viewStatus = ViewType.loading;
  List<SocEntity> arrList = [];

  String? labelName;

  UiState state = Loading();

  @override
  void onInit() {
    super.onInit();
    if (Get.arguments != null) {
      devType = Get.arguments["devType"] as String?;
      siteId = Get.arguments["siteId"] as String?;
      labelName = Get.arguments["labelName"] as String?;
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
    fetchData();
  }

  Future<void> fetchData() async {
    await Future.delayed(Duration(milliseconds: 500));
    bool isSuccessful = await getCompTree();
    if (isSuccessful) {
      Future.wait([loadComType(), loadComponentListByDev()]);
      loadSocGraph();
      state = Complete();
      update();
    } else {
      state = Failure();
      update();
    }
  }

  Future<bool> getCompTree() async {
    final (bool isSuccessful, List<CompTreeEntity> value) =
        await SiteAPI.getCompTree(siteId: siteId, type: devType);
    if (isSuccessful) {
      titles.assignAll(value);
      did = value.first.val;
      nodeNo = value.first.child?.first.val;
      devNo = value.first.child?.first.child?.first.val;
      update();
    }
    return isSuccessful;
  }

  Future<void> loadComType() async {
    ComTypeListEntity? value = await RealTimeDataAPI.postComponentTypeList(
      siteId: siteId,
      compType: devType,
      did: did,
      devNo: devNo,
      nodeNo: nodeNo,
    );
    if (value != null) {
      comTypeList = value;
      update();
    }
  }

  Future<void> loadComponentListByDev() async {
    List<ComCardVoEntity> value = await RealTimeDataAPI.postComponentListByDev(
      siteId: siteId,
      compType: devType,
      did: did,
      nodeNo: nodeNo,
      devNo: devNo,
    );
    comCardVoList.assignAll(value);
    update();
  }

  Future<void> loadSocGraph() async {
    DateTime now = DateTime.now();
    DateTime startOfDay = DateTime(now.year, now.month, now.day, 0, 0, 0);
    DateTime endOfToday = DateTime(
      now.year,
      now.month,
      now.day,
      24,
      0,
      0,
    ).subtract(Duration(microseconds: 1));

    viewStatus = ViewType.loading;
    update(["realTimeData"]);
    await Future.delayed(Duration(milliseconds: 500));

    final (
      bool isSuccessful,
      List<SocEntity> value,
    ) = await RealTimeDataAPI.postSocGraph(
      siteId: siteId,
      did: did,
      devNo: devNo,
      nodeNo: nodeNo,
      compType: "CLU",
      startTimeStamp: (startOfDay.microsecondsSinceEpoch / 1000).floor(),
      endTimeStamp: (endOfToday.microsecondsSinceEpoch / 1000).floor(),
    );
    if (isSuccessful) {
      arrList.assignAll(value);
      viewStatus = arrList.isNotEmpty ? ViewType.common : ViewType.empty;
      update(["realTimeData"]);
    } else {
      viewStatus = ViewType.empty;
      update(["realTimeData"]);
    }
  }
}
