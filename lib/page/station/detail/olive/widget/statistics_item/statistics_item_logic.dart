import 'dart:async';

import 'package:cescpro/core/setting/app_loading.dart';
import 'package:cescpro/http/api/site.dart';
import 'package:cescpro/http/bean/elec_graph_entity.dart';
import 'package:cescpro/http/bean/power_graph_entity.dart';
import 'package:cescpro/http/bean/pv_trend_entity.dart';
import 'package:cescpro/http/bean/site_entity.dart';
import 'package:cescpro/http/bean/site_topology_entity.dart';
import 'package:cescpro/page/station/detail/olive/widget/statistics_item/power/power_line_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

enum ViewType { loading, common, empty }

enum DataType { revenue, ele }

class StatisticsItemLogic extends GetxController {
  int? siteId;

  int? powerStartTime = DateTime(
    DateTime.now().year,
    DateTime.now().month,
    DateTime.now().day,
    0,
    0,
    0,
  ).millisecondsSinceEpoch;
  int? powerEndTime = DateTime(
    DateTime.now().year,
    DateTime.now().month,
    DateTime.now().day,
    24,
    0,
    0,
  ).subtract(Duration(microseconds: 1)).millisecondsSinceEpoch;

  ///功率折线图表
  int powerViewStatus = ViewType.loading.index;
  DateTime minT = DateTime.now();
  DateTime maxT = DateTime.now();
  AxisConfig axis = AxisConfig(
    interval: 2,
    intervalType: DateTimeIntervalType.minutes,
    format: DateFormat('HH:mm'),
  );
  List<FastLineSeries<ChartData, DateTime>> series =
      <FastLineSeries<ChartData, DateTime>>[];

  ///光伏发电量
  List<PvTrendEntity> pvList = [];
  int pvViewStatus = ViewType.loading.index;
  bool hasPv = false;

  ///收益
  List<ElecGraphEntity> revenueList = [];
  int revenueViewStatus = ViewType.loading.index;

  ///电量指标
  List<ElecGraphEntity> eleList = [];
  int eleViewStatus = ViewType.loading.index;
  bool revenueShow = false;
  bool isPvSite = false;

  @override
  void onInit() {
    super.onInit();
    if (Get.arguments != null) {
      Map<String, dynamic> map = Get.arguments as Map<String, dynamic>;
      siteId = map['siteId'] as int?;
      SiteEntity? siteEntity =
          ((Get.arguments as Map<String, dynamic>)['site'] as SiteEntity?);
      revenueShow = siteEntity?.calculateRevenue ?? false;
      isPvSite = siteEntity?.isPvPower ?? false;
    }
  }

  @override
  void onReady() {
    super.onReady();
    DateTime now = DateTime.now().toUtc();
    DateTime end = DateTime(
      now.year,
      now.month,
      now.day + 1,
      24,
      0,
      0,
    ).subtract(Duration(microseconds: 1));
    DateTime startsSubtract = end.subtract(Duration(days: 7));
    DateTime start = DateTime(
      startsSubtract.year,
      startsSubtract.month,
      startsSubtract.day,
      0,
      0,
      0,
    );

    loadPower(startTimeStamp: powerStartTime, endTimeStamp: powerEndTime);

    loadRevenue(
      queryType: 0,
      startTimeStamp: start.millisecondsSinceEpoch,
      endTimeStamp: end.millisecondsSinceEpoch,
    );

    loadEle(
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
    AppLoading.dismiss();
  }

  Future<void> loadPower({
    int type = 0,
    int? startTimeStamp,
    int? endTimeStamp,
  }) async {
    series.clear();
    powerViewStatus = ViewType.loading.index;
    update(["powerGraph"]);
    maxT = DateTime.fromMillisecondsSinceEpoch(
      ((startTimeStamp ?? 0).toInt() * 1),
    );
    minT = DateTime.fromMillisecondsSinceEpoch(
      ((startTimeStamp ?? 0).toInt() * 1),
    );

    final (
      bool isSuccessful,
      List<PowerGraphEntity> value,
    ) = await SiteAPI.postPowerGraph(
      siteId: siteId,
      startTimeStamp: startTimeStamp,
      endTimeStamp: endTimeStamp,
    );

    if (isSuccessful) {
      if (value.isNotEmpty) {
        if (!isPvSite) {
          value.removeWhere((d) => d.type == 3);
        }

        bool isHasItemData = value.any((e) => (e.list ?? []).isNotEmpty);
        if (isHasItemData) {
          /// 直接生成 Map<String, List<ChartData>>
          final Map<String, List<ChartData>> powerMap = {
            for (var v in value)
              "${v.title}": (v.list ?? [])
                  .map(
                    (e) => ChartData.fromJson({'time': e.time, 'value': e.val}),
                  )
                  .toList(),
          };

          for (final list in powerMap.values) {
            for (final p in list) {
              if (p.time.isBefore(minT)) minT = p.time;
              if (p.time.isAfter(maxT)) maxT = p.time;
            }
          }
          Duration range = maxT.difference(minT);
          axis = AxisConfig.fromRange(range);
          var i = 0;
          powerMap.forEach((lineName, points) {
            final isSecondary = lineName.toLowerCase() == 'soc'.toLowerCase();
            series.add(
              /*SplineSeries<ChartData, DateTime>(
                name: lineName,
                dataSource: points,
                xValueMapper: (ChartData p, _) => p.time,
                yValueMapper: (ChartData p, _) => p.value,
                color: isSecondary ? Colors.blue : palette[i % palette.length],
                width: 1,
                splineType: SplineType.natural,
                yAxisName: isSecondary ? 'secondaryYAxis' : null,
                markerSettings: MarkerSettings(
                  isVisible: true,
                  shape: DataMarkerType.circle,
                  borderWidth: 0.0,
                  height: 0.0,
                  width: 0.0,
                ),
              ),*/
              FastLineSeries<ChartData, DateTime>(
                name: lineName,
                yAxisName: isSecondary ? 'secondaryYAxis' : null,
                dataSource: points,
                xValueMapper: (p, _) => p.time,
                yValueMapper: (p, _) => p.value,
                color: isSecondary ? Colors.blue : palette[i % palette.length],
                width: 1,
                markerSettings: MarkerSettings(
                  isVisible: true,
                  shape: DataMarkerType.circle,
                  borderWidth: 0.0,
                  height: 0.0,
                  width: 0.0,
                ),
              ),
            );
            i++;
          });
          powerViewStatus = series.isEmpty
              ? ViewType.empty.index
              : ViewType.common.index;
          update(["powerGraph"]);
        } else {
          powerViewStatus = ViewType.empty.index;
          update(["powerGraph"]);
        }
      } else {
        powerViewStatus = ViewType.empty.index;
        update(["powerGraph"]);
      }
    } else {
      powerViewStatus = ViewType.empty.index;
      update(["powerGraph"]);
    }
  }

  ///收益统计
  Future<void> loadRevenue({
    int queryType = 0,
    int? startTimeStamp,
    int? endTimeStamp,
  }) async {
    revenueViewStatus = ViewType.loading.index;
    update(["revenue"]);
    await Future.delayed(Duration(seconds: 1));

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
      revenueViewStatus = revenueList.isEmpty
          ? ViewType.empty.index
          : ViewType.common.index;
      update(["revenue"]);
    } else {
      revenueViewStatus = ViewType.empty.index;
      update(["revenue"]);
    }
  }

  ///电量指标
  Future<void> loadEle({
    int queryType = 0,
    int? startTimeStamp,
    int? endTimeStamp,
  }) async {
    eleViewStatus = ViewType.loading.index;
    update(["ele"]);
    await Future.delayed(Duration(seconds: 1));

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
      eleList.assignAll(value);
      eleViewStatus = eleList.isEmpty
          ? ViewType.empty.index
          : ViewType.common.index;
      update(["ele"]);
    } else {
      eleViewStatus = ViewType.empty.index;
      update(["ele"]);
    }
  }

  ///光伏发电
  Future<void> loadPVTrend({
    int queryType = 0,
    int? startTimeStamp,
    int? endTimeStamp,
  }) async {
    pvViewStatus = ViewType.loading.index;
    update(["pv"]);
    await Future.delayed(Duration(seconds: 1));

    SiteTopologyEntity? data = await SiteAPI.getSiteTopology(
      siteId: siteId ?? 0,
    );
    hasPv = data?.hasPv ?? false;
    update(["pv"]);

    if (!hasPv) {
      AppLoading.dismiss();
      return;
    } else {
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
        pvViewStatus = pvList.isEmpty
            ? ViewType.empty.index
            : ViewType.common.index;
        update(["pv"]);
      } else {
        pvViewStatus = ViewType.empty.index;
        update(["pv"]);
      }
    }
  }
}
