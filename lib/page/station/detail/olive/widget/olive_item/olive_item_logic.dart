import 'package:cescpro/core/helper/extension_helper.dart';
import 'package:cescpro/http/api/site.dart';
import 'package:cescpro/http/api/weather.dart';
import 'package:cescpro/http/bean/site_detail_entity.dart';
import 'package:cescpro/http/bean/site_topology_entity.dart';
import 'package:cescpro/http/bean/statistic_record_entity.dart';
import 'package:cescpro/http/bean/weather_entity.dart';
import 'package:get/get.dart';

class OliveItemLogic extends GetxController {
  int? siteId;

  WeatherEntity? weather;

  String get weatherData => weather == null
      ? ""
      : "${weather?.desc ?? ""}${weather?.tempMin ?? 0}°~${weather?.tempMax ?? 0}°";

  SiteTopologyEntity? topology;
  double get pvPower => topology?.pv?.power ?? 0;
  double get gridPower => topology?.grid?.power ?? 0;
  double get loadPower => topology?.load?.power ?? 0;
  double get storagePower => topology?.storage?.power ?? 0;
  double get storageSoc => topology?.storage?.soc ?? 0;
  bool get isHasPv => topology?.hasPv ?? false;
  List<SiteTopologyLine> line = [];

  SiteDetailEntity? siteDetail;
  String get showChargeAvg => "${siteDetail?.chargeAvg ?? 0}";
  String get showRechargeAvg => "${siteDetail?.rechargeAvg ?? 0}";

  StatisticRecordEntity? statisticRecord;
  String get showTodayIncome => "${statisticRecord?.todayIncome ?? 0}";
  String get showLastDayIncome => "${statisticRecord?.lastDayIncome ?? 0}";
  String get showTodayPvTotalNeg => "${statisticRecord?.todayPvTotalNeg ?? 0}";

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
    loadWeather();
    getSiteTopology();
    getPointDetails();
    getSiteStatisticRecord();
  }

  @override
  void onClose() {
    super.onClose();
  }

  Future<void> loadWeather() async {
    WeatherEntity? value = await WeatherAPI.postForecastApp(
      siteId: siteId,
      date: DateTime.now().timestampFormat,
    );
    if (value != null) {
      weather = value;
      update();
    }
  }

  ///todo 定时轮询刷新
  Future<void> getSiteTopology() async {
    SiteTopologyEntity? value = await SiteAPI.getSiteTopology(
      siteId: siteId ?? 0,
    );
    if (value != null) {
      topology = value;

      ///todo 拓扑图
      List<SiteTopologyLine> topologyLine = value.line ?? [];
      // [{from: GRID, to: LOAD}, {from: GRID, to: STORAGE}]
      //PV,STORAGE,LOAD,GRID
      update();
    }
  }

  Future<void> getPointDetails() async {
    SiteDetailEntity? value = await SiteAPI.getPointDetails(
      siteId: siteId ?? 0,
    );
    if (value != null) {
      siteDetail = value;
      update();
    }
  }

  Future<void> getSiteStatisticRecord() async {
    StatisticRecordEntity? value = await SiteAPI.getSiteStatisticRecord(
      siteId: siteId ?? 0,
    );
    if (value != null) {
      statisticRecord = value;
      update();
    }
  }
}
