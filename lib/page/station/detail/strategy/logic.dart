import 'package:cescpro/core/translations/en.dart';
import 'package:cescpro/http/api/ai.dart';
import 'package:cescpro/http/bean/check_ai_open_entity.dart';
import 'package:cescpro/http/bean/ctrl_model_entity.dart';
import 'package:cescpro/http/bean/site_entity.dart';
import 'package:cescpro/http/bean/strategy_power_item_entity.dart';
import 'package:cescpro/http/bean/strategy_protected_entity.dart';
import 'package:cescpro/page/station/detail/monitor/detail/widget/line_bar/f_line_chart.dart';
import 'package:flutter/material.dart';
//import 'package:cescpro/page/station/detail/monitor/detail/widget/line_bar/f_line_chart.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
//import 'package:cescpro/page/station/detail/strategy/widget/strategy_power_line_c

class StrategyPageLogic extends GetxController {
  SiteEntity? site;
  String get siteName => site?.name ?? "";
  String get siteInfo =>
      '${TKey.energyStorageInstalledPower.tr} ${site?.power ?? "0"}kW · ${TKey.photovoltaicInstalledCapacity.tr} ${site?.capacity ?? "0"}kWh';
  int? get id => site?.id;
  CtrlModelEntity? modelCtrl;
  String get activeType => modelCtrl?.activeTypeText ?? "--";
  StrategyProtectedEntity? protected;
  CheckAiOpenEntity? checkAiOpen;
  bool get isFullDay => checkAiOpen?.isDaysEnough ?? false;
  int get runningDays => checkAiOpen?.runningDays ?? 0;

  @override
  void onInit() {
    super.onInit();
    SiteEntity? siteEntity =
        ((Get.arguments as Map<String, dynamic>)['site'] as SiteEntity?);
    if (siteEntity != null) {
      site = siteEntity;
      update();
    }
  }

  @override
  void onReady() {
    super.onReady();
    checkOpenAI();
    fetchModelControl();
    queryStrategyProtected();
    queryStrategyCurve();
  }

  @override
  void onClose() {
    super.onClose();
  }

  Future<void> checkOpenAI() async {
    checkAiOpen = await AIControlAPI.checkOpenAI(siteId: '$id');
  }

  Future<void> fetchModelControl() async {
    CtrlModelEntity? value = await AIControlAPI.fetchModelControl(
      siteId: '$id',
    );
    modelCtrl = value;
    update();
  }

  Future<void> queryStrategyProtected() async {
    StrategyProtectedEntity? value = await AIControlAPI.queryStrategyProtected(
      siteId: '$id',
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

  Future<void> queryStrategyCurve() async {
    List<StrategyPowerItemEntity> value = await AIControlAPI.queryStrategyCurve(
      siteId: '$id',
    );

    if (value.isNotEmpty) {
      series.clear();

      ///strategyPower
      List<ChartData> strategyPowerList = value
          .map(
            (e) => ChartData.fromJson({
              'time': e.time,
              'value': (e.strategyPower ?? 0),
            }),
          )
          .toList();

      series.add(
        FastLineSeries<ChartData, DateTime>(
          name: TKey.strategyCurve.tr,
          dataSource: strategyPowerList,
          xValueMapper: (p, _) => p.time,
          yValueMapper: (p, _) => p.value,
          color: Color(0xff4a9eff),
          width: 1.5,
          markerSettings: markerSettings,
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

      ///actualPower
      List<ChartData> actualPowerList = value
          .map(
            (e) => ChartData.fromJson({'time': e.time, 'value': e.actualPower}),
          )
          .toList();

      series.add(
        FastLineSeries<ChartData, DateTime>(
          name: TKey.actualOperation.tr,
          dataSource: actualPowerList,
          xValueMapper: (p, _) => p.time,
          yValueMapper: (p, _) => p.value,
          color: Color(0xff2dd4bf),
          width: 1.5,
          markerSettings: markerSettings,
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

      for (final p in actualPowerList) {
        if (p.time.isBefore(minT)) minT = p.time;
        if (p.time.isAfter(maxT)) maxT = p.time;
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
