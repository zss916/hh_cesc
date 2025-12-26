import 'package:cescpro/core/helper/extension_helper.dart';
import 'package:cescpro/core/setting/app_loading.dart';
import 'package:cescpro/core/user/user.dart';
import 'package:cescpro/http/api/site.dart';
import 'package:cescpro/http/api/weather.dart';
import 'package:cescpro/http/bean/site_detail_entity.dart';
import 'package:cescpro/http/bean/site_topology_entity.dart';
import 'package:cescpro/http/bean/statistic_record_entity.dart';
import 'package:cescpro/http/bean/weather_entity.dart';
import 'package:get/get.dart';

class OliveItemLogic extends GetxController {
  int? siteId;

  ///天气
  WeatherEntity? weather;

  String get weatherData => weather == null
      ? "--"
      : "${weather?.desc ?? ""}${weather?.tempMin ?? 0}°~${weather?.tempMax ?? 0}°";

  ///拓扑图
  SiteTopologyEntity? topology;
  double get pvPower => topology?.pv?.power ?? 0;
  double get gridPower => topology?.grid?.power ?? 0;
  double get loadPower => topology?.load?.power ?? 0;
  double get storagePower => topology?.storage?.power ?? 0;
  double get storageSoc => topology?.storage?.soc ?? 0;
  bool get isHasPv => topology?.hasPv ?? false;
  List<SiteTopologyLine> line = [];

  ///判断获取货币符号
  String get currencyUnit => User.to.getCurrencyUnit();

  ///今天充电
  String showChargeAvg = "0.00";
  String showChargeAvgUnit = "";

  ///今天放电
  String showRechargeAvg = "0.00";
  String showRechargeAvgUnit = "";

  ///工作模式
  String workModel = "";

  ///状态
  int status = 0;

  ///昨日收益
  String showLastDayIncome = "0.00";

  ///今日光伏发电量
  String showTodayPvTotalNeg = "0.00";
  String showTodayPvTotalNegUnit = "";

  SiteDetailEntity? siteDetail;
  StatisticRecordEntity? statisticRecord;

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
    loadData();
  }

  Future<void> loadData() async {
    loadWeather();
    getSiteTopology();
    getPointDetails();
    getSiteStatisticRecord();
  }

  @override
  void onClose() {
    super.onClose();
    AppLoading.dismiss();
  }

  ///天气
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

  ///拓扑图
  Future<void> getSiteTopology() async {
    SiteTopologyEntity? value = await SiteAPI.getSiteTopology(
      siteId: siteId ?? 0,
    );
    if (value != null) {
      topology = value;
      line = value.line ?? [];
      update();
    }
  }

  ///获取今天充电/今天放电
  Future<void> getPointDetails() async {
    SiteDetailEntity? value = await SiteAPI.getPointDetails(
      siteId: siteId ?? 0,
    );
    if (value != null) {
      siteDetail = value;
      workModel = value.workModel;
      status = value.status ?? 0;
      update();
    }
  }

  ///获取昨日收益/今日光伏发电量
  Future<void> getSiteStatisticRecord() async {
    StatisticRecordEntity? value = await SiteAPI.loadSiteStatisticRecord(
      siteId: siteId ?? 0,
    );
    if (value != null) {
      statisticRecord = value;
      showChargeAvg = (value.todayTotalPos ?? 0).formatPowerValue();
      showChargeAvgUnit = (value.todayTotalPos ?? 0).formatPowerValueUnit();
      showRechargeAvg = (value.todayTotalNeg ?? 0).formatPowerValue();
      showRechargeAvgUnit = (value.todayTotalNeg ?? 0).formatPowerValueUnit();
      showLastDayIncome = (value.lastDayIncome ?? 0).moneyFormatted;
      showTodayPvTotalNeg = (value.todayPvTotalNeg ?? 0).formatPowerValue();
      showTodayPvTotalNegUnit = (value.todayPvTotalNeg ?? 0)
          .formatPowerValueUnit();
      update();
    }
  }
}
