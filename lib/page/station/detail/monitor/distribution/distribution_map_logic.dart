import 'package:cescpro/http/api/realTimeData.dart';
import 'package:cescpro/http/bean/cell_data_entity.dart';
import 'package:get/get.dart';

class DistributionMapLogic extends GetxController {
  List<CellDataEntity> cells = [];
  String? title;
  String? content;

  String? siteId;
  int? did;
  int? nodeNo;
  int? devNo;
  int? type;

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
      type = Get.arguments["type"] as int?;
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
    final (
      bool isSuccessful,
      List<CellDataEntity> value,
    ) = await RealTimeDataAPI.postCellData(
      siteId: siteId,
      compType: "CLU",
      did: did,
      devNo: devNo,
      nodeNo: nodeNo,
    );
    if (isSuccessful) {
      cells.assignAll(value);
      update();
    }
  }
}
