import 'dart:math';

import 'package:cescpro/core/setting/app_loading.dart';
import 'package:cescpro/http/api/realTimeData.dart';
import 'package:cescpro/http/api/site.dart';
import 'package:cescpro/http/bean/com_card_vo_entity.dart';
import 'package:cescpro/http/bean/com_type_list_entity.dart';
import 'package:cescpro/http/bean/comp_tree_entity.dart';
import 'package:cescpro/http/bean/soc_entity.dart';
import 'package:get/get.dart';

class BatteryClusterLogic extends GetxController {
  String? devType;
  String? siteId;
  int? did;
  int? nodeNo;
  int? devNo;

  List<CompTreeEntity> titles = [];
  ComTypeListEntity? comTypeList;
  List<ComCardVoEntity> comCardVoList = [];
  String compTree = "--";

  @override
  void onInit() {
    super.onInit();
    if (Get.arguments != null) {
      devType = Get.arguments["devType"] as String?;
      siteId = Get.arguments["siteId"] as String?;
    }
  }

  @override
  void onReady() {
    super.onReady();
    loadData();
  }

  @override
  void onClose() {
    super.onClose();
    AppLoading.dismiss();
  }

  Future<void> loadData() async {
    AppLoading.show();
    await getCompTree();
    Future.wait([
      loadComType(),
      loadComponentListByDev(),
    ]).whenComplete(() => AppLoading.dismiss());
    loadSocGraph();
  }

  Future<void> getCompTree() async {
    final (bool isSuccessful, List<CompTreeEntity> value) =
        await SiteAPI.getCompTree(siteId: siteId, type: devType);
    if (isSuccessful) {
      titles.assignAll(value);
      did = value.first.val;
      nodeNo = value.first.child?.first.val;
      devNo = value.first.child?.first.child?.first.val;
      //debugPrint("ddd===>>>>>>did:$did,nodeNo:$nodeNo,devNo$devNo");
      update();
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

  ///实时数据
  List<SocEntity> arrList = [];
  double arrMaxY = 0.0;
  double arrMaxYR = 0.0;
  double arrMinY = 0.0;
  double arrMinYR = 0.0;
  double arrMaxX = 0.0;

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
      if (arrList.isNotEmpty) {
        List<double> powerList = arrList.map((e) => e.power ?? 0).toList();
        double powerListMax = powerList.reduce(max);
        arrMaxY = powerListMax;
        double powerListMin = powerList.reduce(min);
        arrMinY = powerListMin;
        List<int> socList = arrList.map((e) => e.soc ?? 0).toList();
        int socListMax = socList.reduce(max);
        arrMaxYR = socListMax.toDouble();
        int socListMin = socList.reduce(min);
        arrMinYR = socListMin.toDouble();
        /*   arrMaxY = (powerListMax > socListMax.toDouble())
            ? powerListMax
            : socListMax.toDouble();
        arrMinY = (powerListMin > socListMin.toDouble())
            ? socListMin.toDouble()
            : powerListMin;*/
        arrMaxX = arrList.length.toDouble();
      }
      update(["realTimeData"]);
      //debugPrint("maxY:$maxY, minY:$minY,maxY:$maxX");
    }
  }
}
