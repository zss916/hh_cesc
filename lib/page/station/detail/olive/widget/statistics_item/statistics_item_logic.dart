import 'dart:math';

import 'package:cescpro/core/helper/extension_helper.dart';
import 'package:cescpro/http/api/site.dart';
import 'package:cescpro/http/bean/elec_graph_entity.dart';
import 'package:cescpro/http/bean/power_graph_entity.dart';
import 'package:cescpro/http/bean/pv_trend_entity.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

enum PowerViewType { common, loading, empty }

class StatisticsItemLogic extends GetxController {
  int? siteId;
  int? startTimeStamp = DateTime.now().millisecondsSinceEpoch;
  int? endTimeStamp = DateTime.now().millisecondsSinceEpoch;

  List<PowerGraphEntity> powerList = [];
  List<PowerGraphEntity> get showPowerList =>
      powerList.where((e) => (e.list ?? []).isNotEmpty).toList();
  List<PvTrendEntity> pvList = [];

  List<ElecGraphEntity> eleList = [];

  ///common 0,loading 1,empty 2
  int powerView = PowerViewType.common.index;

  ///收益Y轴
  List<int> incomeY = [];
  List<String> monthX = [];

  @override
  void onInit() {
    super.onInit();
    if (Get.arguments != null) {
      Map<String, dynamic> map = Get.arguments as Map<String, dynamic>;
      siteId = map['siteId'] as int?;
    }
  }

  @override
  void onReady() {
    super.onReady();
    // loadPower();
    //loadPVTrend();
    loadEle();
  }

  @override
  void onClose() {
    super.onClose();
  }

  ///功率分析
  Future<void> loadPower({
    int type = 0,
    int? startTimeStamp,
    int? endTimeStamp,
  }) async {
    //todo fl_animated_linechart: ^1.2.0
    powerView = PowerViewType.loading.index;
    update(["powerGraph"]);
    //{siteId: 530, startTimeStamp: 1763049600000, endTimeStamp: 1763135999999}

    //start:2025-11-14 00:00:00,end:2025-11-14 23:59:59
    debugPrint(
      "start:${1763049600000.timestampFormat},end:${1763135999999.timestampFormat}",
    );
    final (bool isSuccessful, List<PowerGraphEntity> value) =
        await SiteAPI.postPowerGraph(
          siteId: 530,
          startTimeStamp: 1763049600000,
          endTimeStamp: 1763135999999,
          /*siteId: siteId!,
      startTimeStamp: startTimeStamp,
      endTimeStamp: endTimeStamp,*/
        ).whenComplete(() {
          powerView = PowerViewType.common.index;
          update(["powerGraph"]);
        });
    if (isSuccessful) {
      powerList.assignAll(value);
      handData(powerList);
      powerView = PowerViewType.common.index;
      update(["powerGraph"]);
    }
  }

  ///处理数据
  void handData(List<PowerGraphEntity> powerList) {
    for (PowerGraphEntity value in powerList) {
      //List<int> timeList = (value.list??[]).map((e) => e.time).toList();
      List<double> valList = (value.list ?? []).map((e) => e.val).toList();
      if (valList.isNotEmpty) {
        double valMax = valList.reduce(max);
        double valMin = valList.reduce(min);
        double range = valMax - valMin;
        double interval = range / 4;
        List<int> partitions = [];
        for (int i = 0; i < 5; i++) {
          double point = valMin + (interval * i);
          partitions.add(point.round());
        }
        value.yList = partitions;
      }
    }
  }

  ///收益统计和电量指标
  Future<void> loadEle({
    int type = 1,
    int? startTimeStamp,
    int? endTimeStamp,
  }) async {
    ///日
    /*startTimeStamp: 1763049600000,
    endTimeStamp: 1763135999999,
    queryType: 0,*/
    ///年
    //{"startTimeStamp":1735660800000,"endTimeStamp":1767196799999,"queryType":2}
    ///月
    ///{"startTimeStamp":1759248000000,"endTimeStamp":1761926399999,"queryType":1}
    /// /*startTimeStamp: 1761926400000,
    //       endTimeStamp: 1764518399999,
    //       queryType: 1,*/
    //{"startTimeStamp":1761926400000,"endTimeStamp":1764518399999,"queryType":1}
    final (
      bool isSuccessful,
      List<ElecGraphEntity> value,
    ) = await SiteAPI.postElecGraph(
      siteId: 530,
      startTimeStamp: 1761926400000,
      endTimeStamp: 1764518399999,
      queryType: 1,
    );
    if (isSuccessful) {
      eleList.assignAll(value);
      handEleData(eleList);
      update(["revenue"]);
    }
  }

  void handEleData(List<ElecGraphEntity> eleList) {
    List<double> incomes = eleList.map((e) => (e.totalIncome ?? 0)).toList();
    double incomeMax = incomes.reduce(max);
    double interval = incomeMax / 4;
    List<int> partitions = [];
    for (int i = 0; i < 5; i++) {
      double point = (interval * i);
      partitions.add(point.round());
    }
    incomeY = partitions;
    monthX = eleList.map((e) => (e.dateTime ?? "")).toList();
  }

  ///光伏发电
  Future<void> loadPVTrend({
    int type = 0,
    int? startTimeStamp,
    int? endTimeStamp,
  }) async {
    //[{dateTime: 2025-11-13, summaryValue: 0}]

    final (
      bool isSuccessful,
      List<PvTrendEntity> value,
    ) = await SiteAPI.postPvTrend(
      //siteId: siteId!,
      siteId: 530,
      queryType: type,
      startTimeStamp: 1763049600000,
      endTimeStamp: 1763135999999,
      //startTimeStamp: startTimeStamp ?? (DateTime.now().millisecondsSinceEpoch),
      //endTimeStamp: endTimeStamp ?? (DateTime.now().millisecondsSinceEpoch),
    );
    if (isSuccessful) {
      pvList.assignAll(value);
      update();
    }
  }
}
