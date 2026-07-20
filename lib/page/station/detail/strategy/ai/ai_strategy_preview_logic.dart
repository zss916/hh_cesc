import 'package:cescpro/core/helper/extension_helper.dart';
import 'package:cescpro/core/tools/time_tools.dart';
import 'package:cescpro/core/translations/en.dart';
import 'package:cescpro/core/user/user.dart';
import 'package:cescpro/http/api/ai.dart';
import 'package:cescpro/http/bean/ai_compare_data_entity.dart';
import 'package:cescpro/http/bean/ai_power_graph_entity.dart';
import 'package:cescpro/page/station/detail/monitor/detail/widget/line_bar/f_line_chart.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class AIStrategyPreviewLogic extends GetxController {
  int? id;
  AiCompareDataEntity? revenueForecast;

  ///提升幅度
  String get profitGrowthRate => revenueForecast?.profitGrowthRate ?? "-";

  ///ai策略收益
  String? get aiAllRevenue => (revenueForecast?.aiPredictTotalProfit == null)
      ? "-"
      : "$currencySymbol${revenueForecast?.aiPredictTotalProfit ?? 0}";

  ///当前策略收益
  String? get currentRevenue => (revenueForecast?.actualTotalProfit == null)
      ? "-"
      : "$currencySymbol${revenueForecast?.actualTotalProfit ?? 0}";

  ///日增长收益
  String get dayGrowthRevenue => (revenueForecast?.profitGrowth == null)
      ? "-"
      : "$currencySymbol${revenueForecast?.profitGrowth ?? 0}";

  ///货币符号
  String get currencySymbol =>
      (revenueForecast?.currency ?? (User.to.getCurrencyUnit())).currencySymbol;

  bool isFullDay = false;
  int runningDays = 0;

  ///预测电价货币符号
  String priceCurrencySymbol = User.to.getCurrencyUnit().currencySymbol;

  String aiStrategyPreviewTag = "AIStrategyPreviewLogic";

  @override
  void onInit() {
    super.onInit();
    id = ((Get.arguments as Map<String, dynamic>)['siteId'] as int?);
    isFullDay =
        ((Get.arguments as Map<String, dynamic>)['isDaysEnough'] as bool?) ??
        false;
    runningDays =
        ((Get.arguments as Map<String, dynamic>)['runningDays'] as int?) ?? 0;
  }

  @override
  void onReady() {
    super.onReady();
    if (!isFullDay) {
      // showAIProgressDialog(day: runningDays);
    }

    getAIDataCompare();
    loop();
  }

  @override
  void onClose() {
    TimeTools.instance.stop(tag: aiStrategyPreviewTag);
    cancelToken.cancel("fetchAIData");
    super.onClose();
  }

  CancelToken cancelToken = CancelToken();

  ///轮询
  Future<void> loop() async {
    try {
      await fetchAIData(cancelToken: null);
    } finally {
      TimeTools.instance.start(
        tag: aiStrategyPreviewTag,
        duration: Duration(minutes: 2),
        onCall: () {
          fetchAIData(cancelToken: cancelToken);
        },
      );
    }
  }

  Future<void> getAIDataCompare() async {
    AiCompareDataEntity? value = await AIControlAPI.getAIDataCompare(
      siteId: '$id',
    );
    revenueForecast = value;
    update();
  }

  List<XyDataSeries<ChartData, DateTime>> series =
      <XyDataSeries<ChartData, DateTime>>[];
  DateTime minT = DateTime.now();
  DateTime maxT = DateTime.now();
  AxisConfig axis = AxisConfig(
    interval: 2,
    intervalType: DateTimeIntervalType.minutes,
    format: DateFormat('HH:mm'),
  );

  List<XyDataSeries<ChartData, DateTime>> priceSeries =
      <XyDataSeries<ChartData, DateTime>>[];

  Future<void> fetchAIData({CancelToken? cancelToken}) async {
    final startOfDay = DateTime.now();
    final start = DateTime(startOfDay.year, startOfDay.month, startOfDay.day);
    final end = DateTime(
      startOfDay.year,
      startOfDay.month,
      startOfDay.day,
      23,
      59,
      59,
    );
    AiPowerGraphEntity? value = await AIControlAPI.fetchAIData(
      siteId: '$id',
      startTime: start.millisecondsSinceEpoch,
      endTime: end.millisecondsSinceEpoch,
      cancelToken: cancelToken,
    );
    priceCurrencySymbol =
        (value?.currencyCode ?? (User.to.getCurrencyUnit())).currencySymbol;
    update();

    List<AiPowerGraphData> aiPowerGraph = value?.data ?? [];
    if (aiPowerGraph.isNotEmpty) {
      series.clear();
      priceSeries.clear();

      ///预测用电电价
      List<ChartData> predictConsumptionPriceList = aiPowerGraph
          .map(
            (e) => ChartData.fromJson({
              'time': e.timestamp,
              'value': (e.predictConsumptionPrice ?? 0),
            }),
          )
          .toList();

      priceSeries.add(
        /*AreaSeries<ChartData, DateTime>(
          name: TKey.predictingElectricityPrices.tr,
          dataSource: predictConsumptionPriceList,
          xValueMapper: (e, _) => e.time,
          yValueMapper: (e, _) => e.value,
          color: Color(0xff2dd4bf).withValues(alpha: 0.1),
          borderColor: Color(0xff2dd4bf),
          borderWidth: 1,
          markerSettings: markerSettings,
        ),*/
        FastLineSeries<ChartData, DateTime>(
          name: TKey.predictingElectricityPrices.tr,
          dataSource: predictConsumptionPriceList,
          xValueMapper: (p, _) => p.time,
          yValueMapper: (p, _) => p.value,
          color: Color(0xff2dd4bf),
          width: 1.5,
          markerSettings: markerSettings,
        ),
      );

      ///预测售电电价
      List<ChartData> predictSellingPriceList = aiPowerGraph
          .map(
            (e) => ChartData.fromJson({
              'time': e.timestamp,
              'value': (e.predictSellingPrice ?? 0),
            }),
          )
          .toList();

      priceSeries.add(
        /*AreaSeries<ChartData, DateTime>(
          name: TKey.predictSellingPrice.tr,
          dataSource: predictSellingPriceList,
          xValueMapper: (e, _) => e.time,
          yValueMapper: (e, _) => e.value,
          color: Color(0xffecc207).withValues(alpha: 0.1),
          borderColor: Color(0xffecc207),
          markerSettings: markerSettings,
          borderWidth: 1,
        ),*/
        FastLineSeries<ChartData, DateTime>(
          name: TKey.predictSellingPrice.tr,
          dataSource: predictSellingPriceList,
          xValueMapper: (p, _) => p.time,
          yValueMapper: (p, _) => p.value,
          color: Color(0xffecc207),
          width: 1.5,
          markerSettings: markerSettings,
          //dashArray: <double>[6, 4],
        ),
      );

      ///策略预测
      List<ChartData> predictPowerList = aiPowerGraph
          .map(
            (e) => ChartData.fromJson({
              'time': e.timestamp,
              'value': (e.predictPower ?? 0),
            }),
          )
          .toList();

      series.add(
        FastLineSeries<ChartData, DateTime>(
          name: TKey.aiStrategyPlanning.tr,
          dataSource: predictPowerList,
          xValueMapper: (p, _) => p.time,
          yValueMapper: (p, _) => p.value,
          color: Color(0xFF3874F2),
          width: 1.5,
          markerSettings: markerSettings,
        ),
        /*AreaSeries<ChartData, DateTime>(
          name: TKey.aiStrategyPlanning.tr,
          dataSource: predictPowerList,
          xValueMapper: (e, _) => e.time,
          yValueMapper: (e, _) => e.value,
          color: Color(0xFF3874F2).withValues(alpha: 0.2),
          borderColor: Color(0xFF3874F2),
          borderWidth: 1.5,
        ),*/
      );

      ///光伏预测
      List<ChartData> pvPredictPowerList = aiPowerGraph
          .map(
            (e) => ChartData.fromJson({
              'time': e.timestamp,
              'value': (e.pvPredictPower ?? 0),
            }),
          )
          .toList();

      series.add(
        FastLineSeries<ChartData, DateTime>(
          name: TKey.pvForecast.tr,
          dataSource: pvPredictPowerList,
          xValueMapper: (p, _) => p.time,
          yValueMapper: (p, _) => p.value,
          color: Color(0xfffbbf24),
          width: 1.5,
          markerSettings: markerSettings,
          dashArray: <double>[6, 4],
        ),
      );

      ///负载预测
      List<ChartData> loadPredictPowerList = aiPowerGraph
          .map(
            (e) => ChartData.fromJson({
              'time': e.timestamp,
              'value': (e.loadPredictPower ?? 0),
            }),
          )
          .toList();

      series.add(
        FastLineSeries<ChartData, DateTime>(
          name: TKey.loadForecast.tr,
          dataSource: loadPredictPowerList,
          xValueMapper: (p, _) => p.time,
          yValueMapper: (p, _) => p.value,
          color: Color(0xffff9933),
          width: 1.5,
          markerSettings: markerSettings,
          dashArray: <double>[6, 4],
        ),
      );

      for (final p in predictPowerList) {
        if (p.time.isBefore(minT)) minT = p.time;
        if (p.time.isAfter(maxT)) maxT = p.time;
      }
    }

    update();
  }

  MarkerSettings markerSettings = MarkerSettings(
    isVisible: true,
    shape: DataMarkerType.circle,
    borderWidth: 0.0,
    height: 0.0,
    width: 0.0,
  );
}
