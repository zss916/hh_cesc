import 'package:cescpro/core/helper/extension_helper.dart';
import 'package:cescpro/core/setting/app_loading.dart';
import 'package:cescpro/http/api/realTimeData.dart';
import 'package:cescpro/http/api/site.dart';
import 'package:cescpro/http/bean/com_card_vo_entity.dart';
import 'package:cescpro/http/bean/com_type_list_entity.dart';
import 'package:cescpro/http/bean/comp_tree_entity.dart';
import 'package:cescpro/http/bean/power_entity.dart';
import 'package:cescpro/http/bean/soc_entity.dart';
import 'package:cescpro/page/station/detail/monitor/index.dart';
import 'package:get/get.dart';

enum ViewType { loading, common, empty }

class MonitorDetailLogic extends GetxController {
  String title = "";
  String? devType;
  String? siteId;
  int? did;
  int? nodeNo;
  int? devNo;

  List<CompTreeEntity> titles = [];
  ComTypeListEntity? comTypeList;
  List<ComCardVoEntity> comCardVoList = [];
  String compTree = "";
  bool isV1 = false;

  ///实时数据
  ViewType realTimeViewStatus = ViewType.loading;
  List<SocEntity> arrList = [];

  ViewType powerViewStatus = ViewType.loading;
  List<PowerEntity> powerList = [];

  @override
  void onInit() {
    super.onInit();
    if (Get.arguments != null) {
      siteId = Get.arguments["siteId"] as String?;
      MonitorModel? data = Get.arguments["data"] as MonitorModel?;
      devType = data?.type;
      title = data?.title ?? "";
      isV1 = data?.isV1 ?? false;
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
    getCompTree().then((isOK) {
      if (isOK) {
        Future.wait([
          loadComType(),
          loadComponentListByDev(),
        ]).whenComplete(() => AppLoading.dismiss());

        ///ARR,PCS,METER
        loadSocGraph();
      } else {
        AppLoading.dismiss();
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
      await Future.delayed(Duration(seconds: 1));

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
        if (powerList.isNotEmpty) {
          powerViewStatus = ViewType.common;
        } else {
          powerViewStatus = ViewType.empty;
        }
        update(["realTimeData"]);
      } else {
        powerViewStatus = ViewType.empty;
        update(["realTimeData"]);
      }
    }
  }
}
