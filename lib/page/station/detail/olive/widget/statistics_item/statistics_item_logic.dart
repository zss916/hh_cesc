import 'dart:math';

import 'package:cescpro/core/setting/app_loading.dart';
import 'package:cescpro/http/api/site.dart';
import 'package:cescpro/http/bean/elec_graph_entity.dart';
import 'package:cescpro/http/bean/power_graph_entity.dart';
import 'package:cescpro/http/bean/pv_trend_entity.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

enum PowerViewType { common, loading, empty }

enum DataType { revenue, ele }

class StatisticsItemLogic extends GetxController {
  int? siteId;
  int? startTimeStamp = DateTime.now().millisecondsSinceEpoch;
  int? endTimeStamp = DateTime.now().millisecondsSinceEpoch;

  ///功率折线图表
  List<List<PowerGraphList>> powerLines = [];
  List<String> titles = [];
  double minY = 0.0;
  double maxY = 0.0;
  double maxX = 0.0;

  ///光伏发电量
  List<PvTrendEntity> pvList = [];
  List<String> pvLabels = [];
  double? pvMaxY;
  double? pvMinY;

  ///收益
  List<ElecGraphEntity> revenueList = [];
  double? revenueMaxY;
  double? revenueMinY;
  List<String> labels = [];

  ///电量指标
  double? eleMaxY;

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
    DateTime now = DateTime.now().toUtc();
    DateTime end = DateTime(now.year, now.month, now.day);
    DateTime start = end.subtract(Duration(days: 7));

    loadPower();

    loadRevenue(
      type: DataType.revenue,
      queryType: 0,
      startTimeStamp: start.millisecondsSinceEpoch,
      endTimeStamp: end.millisecondsSinceEpoch,
    );

    loadRevenue(
      type: DataType.ele,
      queryType: 0,
      startTimeStamp: start.millisecondsSinceEpoch,
      endTimeStamp: end.millisecondsSinceEpoch,
    );

    loadPVTrend(
      queryType: 0,
      startTimeStamp: start.millisecondsSinceEpoch,
      endTimeStamp: end.millisecondsSinceEpoch,
    );
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
    final (
      bool isSuccessful,
      List<PowerGraphEntity> value,
    ) = await SiteAPI.postPowerGraph(
      siteId: siteId,
      startTimeStamp: 1764086400000,
      endTimeStamp: 1764172799999,
    );
    if (isSuccessful) {
      powerLines.assignAll(
        value
            .where(((a) => (a.list ?? []).isNotEmpty))
            .map((e) => (e.list ?? [])),
      );
      titles.assignAll(
        value
            .where(((a) => (a.list ?? []).isNotEmpty))
            .map((w) => w.title ?? ""),
      );
      handData(value);
      update(["powerGraph"]);
    }
  }

  ///处理数据
  void handData(List<PowerGraphEntity> powerList) {
    List<List<PowerGraphList>> data = powerList
        .where((e) => (e.list ?? []).isNotEmpty)
        .map((e) => (e.list ?? []))
        .toList();
    if (data.isNotEmpty) {
      maxY = data
          .map((e) => e.map((e) => e.val).toList().reduce(max))
          .toList()
          .reduce(max);
      minY = data
          .map((e) => e.map((e) => e.val).toList().reduce(min))
          .toList()
          .reduce(min);

      maxX = data.map((e) => e.length).reduce(max).toDouble();

      for (List<PowerGraphList> value in data) {
        //List<double> valList = value.map((e) => e.val).toList();
        //double maxVal = valList.reduce(max);
        //double minVal = valList.reduce(min);
        //double len = valList.length.toDouble();
        // debugPrint("maxVal:$maxVal,minVal:$minVal");
        //I/flutter (21958): maxVal:118.1,minVal:-70.4
        // I/flutter (21958): maxVal:72.7,minVal:-131.9
      }
    }
  }

  List<double> maxVals = [];
  List<double> minVals = [];
  List<double> lens = [];

  ///收益统计和电量指标
  Future<void> loadRevenue({
    required DataType type,
    int queryType = 0,
    int? startTimeStamp,
    int? endTimeStamp,
  }) async {
    AppLoading.show();
    final (
      bool isSuccessful,
      List<ElecGraphEntity> value,
    ) = await SiteAPI.postElecGraph(
      siteId: siteId,
      startTimeStamp: startTimeStamp,
      endTimeStamp: endTimeStamp,
      queryType: queryType,
    ).whenComplete(() => AppLoading.dismiss());
    if (isSuccessful) {
      revenueList.assignAll(value);
      if (type == DataType.revenue) {
        handRevenueData(revenueList);
        update(["revenue"]);
      } else if (type == DataType.ele) {
        handEleData(revenueList);
        update(["ele"]);
      }
    }
  }

  void handRevenueData(List<ElecGraphEntity> eleList) {
    List<double> incomes = eleList.map((e) => (e.totalIncome ?? 0)).toList();
    revenueMaxY = incomes.reduce(max);
    revenueMinY = incomes.reduce(min);
    debugPrint("revenueMaxY:$revenueMaxY,revenueMinY:$revenueMinY");
    labels.assignAll(eleList.map((e) => (e.dateTime ?? "")).toList());
  }

  void handEleData(List<ElecGraphEntity> eleList) {
    //充电
    List<double> charges = eleList.map((e) => (e.totalCharge ?? 0)).toList();
    //放电
    List<double> recharge = eleList.map((e) => (e.totalRecharge ?? 0)).toList();
    double? chargesMax = charges.reduce(max);
    double? rechargeMax = recharge.reduce(max);
    eleMaxY = (chargesMax ?? 0) > (rechargeMax ?? 0) ? chargesMax : rechargeMax;
    labels.assignAll(eleList.map((e) => (e.dateTime ?? "")).toList());
  }

  ///光伏发电
  Future<void> loadPVTrend({
    int queryType = 0,
    int? startTimeStamp,
    int? endTimeStamp,
  }) async {
    AppLoading.show();
    final (
      bool isSuccessful,
      List<PvTrendEntity> value,
    ) = await SiteAPI.postPvTrend(
      siteId: siteId,
      queryType: queryType,
      startTimeStamp: startTimeStamp,
      endTimeStamp: endTimeStamp,
    ).whenComplete(() => AppLoading.dismiss());
    if (isSuccessful) {
      pvList.assignAll(value);
      handPVData(pvList);
      update(["pv"]);
    }
  }

  void handPVData(List<PvTrendEntity> pvList) {
    List<double> pvs = pvList.map((e) => (e.summaryValue ?? 0)).toList();
    double pvMax = pvs.reduce(max);
    pvMaxY = (pvMax == 0.0) ? 100 : pvMax;
    pvMinY = pvs.reduce(min);
    // debugPrint("pvMaxY:$pvMaxY,pvMinY:$pvMinY");
    pvLabels.assignAll(pvList.map((e) => (e.dateTime ?? "")).toList());
  }
}
