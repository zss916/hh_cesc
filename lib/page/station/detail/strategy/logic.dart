import 'dart:async';

import 'package:cescpro/core/state/view_state_mixin.dart';
import 'package:cescpro/core/tools/time_tools.dart';
import 'package:cescpro/core/translations/en.dart';
import 'package:cescpro/http/api/ai.dart';
import 'package:cescpro/http/base/interceptor/network_status/network_status.dart';
import 'package:cescpro/http/bean/check_ai_open_entity.dart';
import 'package:cescpro/http/bean/ctrl_model_entity.dart';
import 'package:cescpro/http/bean/site_entity.dart';
import 'package:cescpro/http/bean/strategy_power_item_entity.dart';
import 'package:cescpro/http/bean/strategy_protected_entity.dart';
import 'package:cescpro/page/station/detail/monitor/detail/widget/line_bar/f_line_chart.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class StrategyPageLogic extends ViewStateController {
  SiteEntity? site;
  String get siteName => site?.name ?? "";
  String get siteInfo =>
      '${TKey.energyStorageInstalledPower.tr} ${site?.power ?? "0"}kW · ${TKey.photovoltaicInstalledCapacity.tr} ${site?.capacity ?? "0"}kWh';
  int? get id => site?.id;
  CtrlModelEntity? modelCtrl;
  String get activeType => modelCtrl?.activeTypeText ?? "--";
  bool get running => modelCtrl?.running ?? false;
  StrategyProtectedEntity? protected;
  bool get isUseSafe => protected?.isUseProtected ?? false;
  CheckAiOpenEntity? checkAiOpen;
  bool get isFullDay => checkAiOpen?.daysEnough ?? false;
  int get runningDays => checkAiOpen?.runningDays ?? 0;

  CancelToken cancelToken = CancelToken();
  String strategyPageLogicTag = "StrategyPageLogic";

  List<Color> colors = [];

  @override
  void onInit() {
    super.onInit();
    SiteEntity? siteEntity =
        ((Get.arguments as Map<String, dynamic>)['site'] as SiteEntity?);
    if (siteEntity != null) {
      site = siteEntity;
      update();
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
    checkOpenAI();
    loadData(loading: false);
  }

  Future<void> loadData({bool loading = true, bool? isDelayed}) async {
    if (loading) {
      onLoading();
      update();
      if (isDelayed == true) await Future.delayed(Duration(seconds: 2));
    }

    final isConnected = await NetworkStatusService.instance.isConnected();
    if (!isConnected) {
      onOffline();
      update();
      return;
    }
    onComplete();
    loop();
  }

  @override
  void onClose() {
    cancelToken.cancel(strategyPageLogicTag);
    TimeTools.instance.stop(tag: strategyPageLogicTag);
    onDisposeNetWork();
    super.onClose();
  }

  Future<void> checkOpenAI() async {
    checkAiOpen = await AIControlAPI.checkOpenAI(siteId: '$id');
  }

  Future<void> fetchModelControl({CancelToken? cancelToken}) async {
    CtrlModelEntity? value = await AIControlAPI.fetchModelControl(
      siteId: '$id',
      cancelToken: cancelToken,
    );
    modelCtrl = value;
    update();
  }

  Future<void> queryStrategyProtected({CancelToken? cancelToken}) async {
    StrategyProtectedEntity? value = await AIControlAPI.queryStrategyProtected(
      siteId: '$id',
      cancelToken: cancelToken,
    );
    protected = value;
    update();
  }

  DateTime minT = DateTime.now();
  DateTime maxT = DateTime.now();
  AxisConfig axis = AxisConfig(
    interval: 2,
    intervalType: DateTimeIntervalType.minutes,
    format: DateFormat('HH:mm'),
  );

  List<XyDataSeries<ChartData, DateTime>> series =
      <XyDataSeries<ChartData, DateTime>>[];

  ///轮询
  Future<void> loop() async {
    try {
      fetchModelControl();
      queryStrategyProtected();
      queryStrategyCurve();
    } finally {
      TimeTools.instance.start(
        tag: strategyPageLogicTag,
        duration: Duration(minutes: 2),
        //duration: Duration(seconds: 5),
        onCall: () {
          fetchModelControl(cancelToken: cancelToken);
          queryStrategyProtected(cancelToken: cancelToken);
          queryStrategyCurve(cancelToken: cancelToken);
        },
      );
    }
  }

  Future<void> queryStrategyCurve({CancelToken? cancelToken}) async {
    List<StrategyPowerItemEntity> value = await AIControlAPI.queryStrategyCurve(
      siteId: '$id',
      cancelToken: cancelToken,
    );

    if (value.isNotEmpty) {
      series.clear();
      colors.clear();

      List<StrategyPowerItemEntity> strategyPowerData = value
          .where((e) => e.strategyPower != null)
          .toList();

      ///strategyPower
      List<ChartData> strategyPowerList = strategyPowerData
          .map(
            (e) => ChartData.fromJson({
              'time': e.time,
              'value': (e.strategyPower ?? 0),
            }),
          )
          .toList();

      if (strategyPowerList.isNotEmpty) {
        colors.add(Color(0xff4a9eff));
        series.add(
          FastLineSeries<ChartData, DateTime>(
            name: TKey.strategyCurve.tr,
            dataSource: strategyPowerList,
            xValueMapper: (p, _) => p.time,
            yValueMapper: (p, _) => p.value,
            color: Color(0xff4a9eff),
            width: 1.5,
            markerSettings: markerSettings,
            enableTooltip: false,
          ),
          /*AreaSeries<ChartData, DateTime>(
          name: TKey.strategyCurve.tr,
          dataSource: strategyPowerList,
          xValueMapper: (e, _) => e.time,
          yValueMapper: (e, _) => e.value,
          color: Color(0xff4a9eff).withValues(alpha: 0.1),
          borderColor: Color(0xff4a9eff),
          borderWidth: 1.5,
          markerSettings: markerSettings,
        ),*/
        );
      }

      List<StrategyPowerItemEntity> actualPowerData = value
          .where((e) => e.actualPower != null)
          .toList();

      ///actualPower
      List<ChartData> actualPowerList = actualPowerData
          .map(
            (e) => ChartData.fromJson({'time': e.time, 'value': e.actualPower}),
          )
          .toList();

      if (actualPowerList.isNotEmpty) {
        colors.add(Color(0xff2dd4bf));
        series.add(
          FastLineSeries<ChartData, DateTime>(
            name: TKey.actualOperation.tr,
            dataSource: actualPowerList,
            xValueMapper: (p, _) => p.time,
            yValueMapper: (p, _) => p.value,
            color: Color(0xff2dd4bf),
            width: 1.5,
            markerSettings: markerSettings,
            enableTooltip: false,
            // dashArray: <double>[6, 4],
          ),
          /*AreaSeries<ChartData, DateTime>(
          name: TKey.actualOperation.tr,
          dataSource: actualPowerList,
          xValueMapper: (e, _) => e.time,
          yValueMapper: (e, _) => e.value,
          color: Color(0xff2dd4bf).withValues(alpha: 0.1),
          borderColor: Color(0xff2dd4bf),
          borderWidth: 1.5,
          markerSettings: markerSettings,
        ),*/
        );

        ///获取时间轴
        List<DateTime> timeList = value
            .map((e) => ChartData.toDateTime((e.time ?? 0)))
            .toList();
        for (final p in timeList) {
          if (p.isBefore(minT)) minT = p;
          if (p.isAfter(maxT)) maxT = p;
        }
      }

      update();
    }
  }

  MarkerSettings markerSettings = MarkerSettings(
    isVisible: true,
    shape: DataMarkerType.circle,
    borderWidth: 0.0,
    height: 0.0,
    width: 0.0,
  );
}
