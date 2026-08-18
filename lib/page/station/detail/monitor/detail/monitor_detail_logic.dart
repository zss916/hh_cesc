part of 'index.dart';

enum ViewType { loading, common, empty }

class MonitorDetailLogic extends GetxController with NetWorkRefreshEvent {
  String title = "";
  String? devType;
  String? siteId;
  int? did;
  int? nodeNo;
  int? devNo;
  DeviceEnum? deviceType;

  List<CompTreeEntity> titles = [];
  ComTypeListEntity? comTypeList;
  List<ComCardVoEntity> comCardVoList = [];
  String compTree = "";
  bool isV1 = false;

  ///实时数据
  ViewType realTimeViewStatus = ViewType.loading;
  List<SocEntity> arrList = [];

  ///功率
  ViewType powerViewStatus = ViewType.loading;
  List<PowerEntity> powerList = [];

  UiState state = Loading();

  @override
  void onInit() {
    super.onInit();
    if (Get.arguments != null) {
      siteId = Get.arguments["siteId"] as String?;
      MonitorModel? data = Get.arguments["data"] as MonitorModel?;
      devType = data?.type;
      title = data?.title ?? "";
      isV1 = data?.isV1 ?? false;
      deviceType = data?.deviceType ?? (DeviceEnum.other);
    }
    onNetWorkRefresh(
      onRefresh: () {
        loadData(isDelayed: true);
      },
    );
  }

  @override
  void onReady() {
    super.onReady();
    loadData();
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

  @override
  void onClose() {
    super.onClose();
    AppLoading.dismiss();
    onDisposeNetWork();
  }

  Future<void> fetchData() async {
    //  AppLoading.show();
    state = Loading();
    update();
    await Future.delayed(Duration(milliseconds: 500));

    getCompTree().then((isOK) {
      if (isOK) {
        Future.wait([
          loadComType(),
          loadComponentListByDev(),
        ]).whenComplete(() => AppLoading.dismiss());

        ///ARR,PCS,METER
        loadSocGraph();

        state = Success();
        update();
      } else {
        AppLoading.dismiss();
        state = Failure();
        update();
      }
    });
  }

  void switchTree() {
    AppLoading.show();
    Future.wait([
      loadComType(),
      loadComponentListByDev(),
    ]).whenComplete(() => AppLoading.dismiss());
    loadSocGraph();
  }

  Future<bool> getCompTree() async {
    final (bool isSuccessful, List<CompTreeEntity> value) =
        await SiteAPI.getCompTree(siteId: siteId, type: devType);
    if (isSuccessful) {
      List<Map<String, dynamic>> list = value.map((e) => e.toJson()).toList();
      String title = _handExtractPath(list);
      compTree = title;
      titles.assignAll(value);
      did = value.first.val;
      nodeNo = value.first.child?.first.val;
      devNo = value.first.child?.first.child?.first.val;
      update();
      return true;
    } else {
      return false;
    }
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

  String _handExtractPath(List<dynamic> data) {
    List<String> pathSegments = [];

    void traverse(Map<String, dynamic> node) {
      if (node['labelCn'] != null && node['labelEn'] != null) {
        pathSegments.add(Get.isZh ? node['labelCn'] : node['labelEn']);
      }

      if (node['child'] != null && node['child'] is List) {
        List<dynamic> children = node['child'];
        if (children.isNotEmpty) {
          traverse(children.first);
        }
      }
    }

    if (data.isNotEmpty) {
      traverse(data.first);
    }

    return pathSegments.join('/');
  }

  ///loadSocGraph
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

    if (devType == "ARR") {
      realTimeViewStatus = ViewType.loading;
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
        compType: devType,
        startTimeStamp: (startOfDay.microsecondsSinceEpoch / 1000).floor(),
        endTimeStamp: (endOfToday.microsecondsSinceEpoch / 1000).floor(),
      );
      if (isSuccessful) {
        arrList.assignAll(value);
        realTimeViewStatus = arrList.isNotEmpty
            ? ViewType.common
            : ViewType.empty;
        update(["realTimeData"]);
      } else {
        realTimeViewStatus = ViewType.empty;
        update(["realTimeData"]);
      }
    } else if (devType == "PCS" || devType == "METER") {
      powerViewStatus = ViewType.loading;
      update(["realTimeData"]);
      await Future.delayed(Duration(milliseconds: 500));

      final (
        bool isSuccessful,
        List<PowerEntity> value,
      ) = await RealTimeDataAPI.postGraph(
        siteId: siteId,
        did: did,
        devNo: devNo,
        nodeNo: nodeNo,
        compType: devType,
        startTimeStamp: (startOfDay.microsecondsSinceEpoch / 1000).floor(),
        endTimeStamp: (endOfToday.microsecondsSinceEpoch / 1000).floor(),
      );
      if (isSuccessful) {
        powerList.assignAll(value);
        powerViewStatus = powerList.isNotEmpty
            ? ViewType.common
            : ViewType.empty;
        update(["realTimeData"]);
      } else {
        powerViewStatus = ViewType.empty;
        update(["realTimeData"]);
      }
    }
  }
}
