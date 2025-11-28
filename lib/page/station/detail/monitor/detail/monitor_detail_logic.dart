import 'dart:math';

import 'package:cescpro/core/helper/extension_helper.dart';
import 'package:cescpro/core/setting/app_loading.dart';
import 'package:cescpro/http/api/realTimeData.dart';
import 'package:cescpro/http/api/site.dart';
import 'package:cescpro/http/bean/com_card_vo_entity.dart';
import 'package:cescpro/http/bean/com_type_list_entity.dart';
import 'package:cescpro/http/bean/comp_tree_entity.dart';
import 'package:cescpro/http/bean/power_entity.dart';
import 'package:cescpro/http/bean/soc_entity.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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

  @override
  void onInit() {
    super.onInit();
    if (Get.arguments != null) {
      devType = Get.arguments["devType"] as String?;
      siteId = Get.arguments["siteId"] as String?;
      title = Get.arguments["title"] as String;
    }
  }

  @override
  void onReady() {
    super.onReady();
    loadData();
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
      List<Map<String, dynamic>> list = value.map((e) => e.toJson()).toList();
      String title = _handExtractPath(list);
      compTree = title;
      titles.assignAll(value);
      did = value.first.val;
      nodeNo = value.first.child?.first.val;
      devNo = value.first.child?.first.child?.first.val;
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

  String _handExtractPath(List<dynamic> data) {
    List<String> pathSegments = [];

    void traverse(Map<String, dynamic> node) {
      if (node['labelCn'] != null && node['labelEn'] != null) {
        pathSegments.add(Get.isEn ? node['labelEn'] : node['labelCn']);
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

  ///实时数据
  List<SocEntity> arrList = [];
  double arrMaxY = 0.0;
  double arrMinY = 0.0;
  double arrMaxX = 0.0;
  List<PowerEntity> powerList = [];
  double powerMaxY = 0.0;
  double powerMinY = 0.0;
  double powerMaxX = 0.0;

  Future<void> loadSocGraph() async {
    DateTime now = DateTime.now();
    DateTime startOfDay = DateTime(now.year, now.month, now.day - 1, 0, 0, 0);
    DateTime endOfToday = DateTime(
      now.year,
      now.month,
      now.day,
      24,
      0,
      0,
    ).subtract(Duration(microseconds: 1));

    if (devType == "ARR") {
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
        if (arrList.isNotEmpty) {
          List<double> powerList = arrList.map((e) => e.power ?? 0).toList();
          double powerListMax = powerList.reduce(max);
          double powerListMin = powerList.reduce(min);
          List<int> socList = arrList.map((e) => e.soc ?? 0).toList();
          int socListMax = socList.reduce(max);
          int socListMin = socList.reduce(min);
          arrMaxY = (powerListMax > socListMax.toDouble())
              ? powerListMax
              : socListMax.toDouble();
          arrMinY = (powerListMin > socListMin.toDouble())
              ? socListMin.toDouble()
              : powerListMin;
          arrMaxX = arrList.length.toDouble();
        }
        update(["realTimeData"]);
        //debugPrint("maxY:$maxY, minY:$minY,maxY:$maxX");
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
          List<double> powers = powerList.map((e) => e.power ?? 0).toList();
          powerMaxY = powers.reduce(max);
          powerMinY = powers.reduce(min);
          powerMaxX = powerList.length.toDouble();
        }
        update(["realTimeData"]);
        debugPrint("maxY:$powerMaxX, minY:$powerMinY,maxY:$powerMaxY");
      }
    }
  }
}
