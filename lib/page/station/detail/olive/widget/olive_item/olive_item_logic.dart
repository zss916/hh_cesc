import 'package:cescpro/core/helper/extension_helper.dart';
import 'package:cescpro/core/model/site_info_card_entity.dart';
import 'package:cescpro/core/setting/app_loading.dart';
import 'package:cescpro/core/tools/state.dart';
import 'package:cescpro/core/tools/time_tools.dart';
import 'package:cescpro/core/translations/en.dart';
import 'package:cescpro/core/user/user.dart';
import 'package:cescpro/generated/assets.dart';
import 'package:cescpro/http/api/site.dart';
import 'package:cescpro/http/api/weather.dart';
import 'package:cescpro/http/bean/site_detail_entity.dart';
import 'package:cescpro/http/bean/site_entity.dart';
import 'package:cescpro/http/bean/site_topology_entity.dart';
import 'package:cescpro/http/bean/statistic_record_entity.dart';
import 'package:cescpro/http/bean/weather_entity.dart';
import 'package:dio/dio.dart';
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

  ///工作模式
  String workModel = "";

  ///状态
  int status = 0;

  List<SiteInfoCardEntity> data = [];
  SiteDetailEntity? siteDetail;

  ///站点名称
  String get siteName => siteDetail?.showName ?? "";
  StatisticRecordEntity? statisticRecord;
  bool revenueShow = false;
  bool pvCardShow = true;

  @override
  void onInit() {
    super.onInit();
    if (Get.arguments != null) {
      Map<String, dynamic> map = Get.arguments as Map<String, dynamic>;
      siteId = map['siteId'] as int?;
      SiteEntity? siteEntity =
          ((Get.arguments as Map<String, dynamic>)['site'] as SiteEntity?);
      revenueShow = siteEntity?.calculateRevenue ?? false;
      pvCardShow = siteEntity?.isPvPower ?? true;
    }
    initData();
  }

  void initData() {
    data = [
      SiteInfoCardEntity()
        ..id = 0
        ..icon = Assets.imgCumulativeCharging2
        ..value = '0.00 '
        ..unit = 'kWh'
        ..title = TKey.todayCharging.tr
        ..image = Assets.imgTodayCharging2,

      SiteInfoCardEntity()
        ..id = 1
        ..icon = Assets.imgCumulativeDischarge2
        ..value = '0.00 '
        ..unit = 'kWh'
        ..title = TKey.todayDischarge.tr
        ..image = Assets.imgTodayDisCharging2,

      SiteInfoCardEntity()
        ..id = 2
        ..icon = Assets.imgLastDayRecharge
        ..value = '${currencyUnit}0.00'
        ..unit = ""
        ..title = TKey.lastDayIncome.tr
        ..image = Assets.lastDayIncome2,

      if (pvCardShow)
        SiteInfoCardEntity()
          ..id = 3
          ..icon = Assets.imgAccumulatedPhotovoltaic2
          ..value = '0.00 '
          ..unit = 'kWh'
          ..title = TKey.todayPVNeg.tr
          ..image = Assets.todayPvGeneration2,

      SiteInfoCardEntity()
        ..id = 4
        ..icon = Assets.imgEle
        ..value = '0.00 '
        ..unit = 'kWh'
        ..title = TKey.todayGridPos.tr
        ..image = Assets.imgTodayDisCharging2,

      SiteInfoCardEntity()
        ..id = 5
        ..icon = Assets.imgGridExport
        ..value = '0.00 '
        ..unit = 'kWh'
        ..title = TKey.todayGridNeg.tr
        ..image = Assets.imgTodayDisCharging2,
    ];
    update();
  }

  @override
  void onReady() {
    super.onReady();
    SiteEntity? siteEntity =
        ((Get.arguments as Map<String, dynamic>)['site'] as SiteEntity?);
    if (siteEntity != null) {
      siteDetail = SiteDetailEntity()
        ..name = siteEntity.name
        ..cname = siteEntity.cname
        ..picture = siteEntity.picture
        ..location = siteEntity.location;
      update();
    }
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
    TimeTools.instance.stop();
    topologyCancelToken.cancel();
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

  CancelToken topologyCancelToken = CancelToken();

  ///获取拓扑图
  Future<void> loadSiteTopologyDelayed() async {
    SiteTopologyEntity? value = await SiteAPI.getSiteTopology(
      siteId: siteId ?? 0,
      cancelToken: topologyCancelToken,
    );
    if (value != null) {
      topology = value;
      line = value.line ?? [];
      update();
    }
  }

  ///拓扑图
  Future<void> getSiteTopology() async {
    try {
      SiteTopologyEntity? value = await SiteAPI.getSiteTopology(
        siteId: siteId ?? 0,
      );
      if (value != null) {
        topology = value;
        line = value.line ?? [];
        update();
      }
    } finally {
      TimeTools.instance.start(
        onCall: () {
          loadSiteTopologyDelayed();
        },
      );
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

      data.clear();
      data.add(
        SiteInfoCardEntity()
          ..id = 0
          ..icon = Assets.imgCumulativeCharging2
          ..value = '${(value.todayTotalPos ?? 0).formatPowerValue()} '
          ..unit = (value.todayTotalPos ?? 0).formatPowerValueUnit()
          ..title = TKey.todayCharging.tr
          ..image = Assets.imgTodayCharging2,
      );

      data.add(
        SiteInfoCardEntity()
          ..id = 1
          ..icon = Assets.imgCumulativeDischarge2
          ..value = '${(value.todayTotalNeg ?? 0).formatPowerValue()} '
          ..unit = (value.todayTotalNeg ?? 0).formatPowerValueUnit()
          ..title = TKey.todayDischarge.tr
          ..image = Assets.imgTodayDisCharging2,
      );

      if (AppState.instance.isShowRevenue() && revenueShow) {
        data.add(
          SiteInfoCardEntity()
            ..id = 2
            ..icon = Assets.imgLastDayRecharge
            ..value =
                '$currencyUnit${(value.lastDayIncome ?? 0).toString().moneyFormat2()}'
            ..unit = ""
            ..title = TKey.lastDayIncome.tr
            ..image = Assets.lastDayIncome2,
        );
      }

      if (pvCardShow) {
        data.add(
          SiteInfoCardEntity()
            ..id = 3
            ..icon = Assets.imgAccumulatedPhotovoltaic2
            ..value = '${(value.todayPvTotalNeg ?? 0).formatPowerValue()} '
            ..unit = (value.todayPvTotalNeg ?? 0).formatPowerValueUnit()
            ..title = TKey.todayPVNeg.tr
            ..image = Assets.todayPvGeneration2,
        );
      }

      data.add(
        SiteInfoCardEntity()
          ..id = 4
          ..icon = Assets.imgGridPos
          ..value = '${(value.todayGridPos ?? 0).formatPowerValue()} '
          ..unit = (value.todayGridPos ?? 0).formatPowerValueUnit()
          ..title = TKey.todayGridPos.tr
          ..image = Assets.imgTodayDisCharging2,
      );

      data.add(
        SiteInfoCardEntity()
          ..id = 5
          ..icon = Assets.imgGridNeg
          ..value = '${(value.todayGridNeg ?? 0).formatPowerValue()} '
          ..unit = (value.todayGridNeg ?? 0).formatPowerValueUnit()
          ..title = TKey.todayGridNeg.tr
          ..image = Assets.imgTodayDisCharging2,
      );

      /*if (value.todayLoadPos != null) {
        data.add(
          SiteInfoCardEntity()
            ..id = 6
            ..icon = Assets.imgEle
            ..value = '${(value.todayLoadPos ?? 0).formatPowerValue()} '
            ..unit = (value.todayLoadPos ?? 0).formatPowerValueUnit()
            ..title = TKey.loadElectricity.tr
            ..image = Assets.imgTodayDisCharging2,
        );
      }*/
      update();
    }
  }
}
