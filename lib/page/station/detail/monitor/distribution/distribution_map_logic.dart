part of 'index.dart';

enum MapType { temp, soc, voltage, other }

class DistributionMapLogic extends GetxController {
  final List<CellDataEntity> _cells = [];
  String? title;
  String? content;

  String? siteId;
  int? did;
  int? nodeNo;
  int? devNo;
  MapType type = MapType.other;

  UiState state = Loading();

  @override
  void onInit() {
    super.onInit();
    if (Get.arguments != null) {
      title = Get.arguments["title"] as String?;
      content = Get.arguments["content"] as String?;
      siteId = Get.arguments["siteId"] as String?;
      did = Get.arguments["did"] as int?;
      nodeNo = Get.arguments["nodeNo"] as int?;
      devNo = Get.arguments["devNo"] as int?;
      type = (Get.arguments["type"] as MapType?) ?? MapType.other;
      //debugPrint("===>>> did:$did,nodeNo:$nodeNo,devNo:$devNo");
    }
  }

  @override
  void onReady() {
    super.onReady();
    loadData();
  }

  //{"siteId":530,"compType":"CLU","did":577,"devNo":3,"nodeNo":2}
  Future<void> loadData() async {
    state = Loading();
    update();
    final (
      bool isSuccessful,
      List<CellDataEntity> value,
    ) = await RealTimeDataAPI.postCellData(
      siteId: siteId,
      compType: "CLU",
      did: did,
      devNo: devNo,
      nodeNo: nodeNo,
      showLoading: false,
    );
    if (isSuccessful) {
      _cells.assignAll(value);
      state = Success(_cells);
      await Future.delayed(Duration(milliseconds: 500));
      update();
    } else {
      state = Failure();
      update();
    }
  }
}
