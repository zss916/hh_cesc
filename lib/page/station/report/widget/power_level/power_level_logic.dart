import 'package:cescpro/core/setting/app_loading.dart';
import 'package:cescpro/core/translations/en.dart';
import 'package:cescpro/http/api/home.dart';
import 'package:cescpro/http/bean/statistic_report_entity.dart';
import 'package:cescpro/page/station/revenue/index.dart';
import 'package:get/get.dart';

class PowerLevelLogic extends GetxController {
  String? location;
  int? siteId;
  int reportType = 1;
  QueryType queryType = QueryType.daily;
  int? date;
  int? startTimeStamp;
  int? endTimeStamp;

  List<StatisticReportDailyElecIncomeDetail> list = [];
  List<List<String>> rows = [];

  List<String> get headers => [
    TKey.date.tr,
    TKey.duration.tr,
    "${TKey.chargingData.tr}(kWh)",
    "${TKey.neg.tr}(kWh)",
    "${TKey.totalEfficiency.tr}(%)",
  ];

  @override
  void onInit() {
    super.onInit();
    if (Get.arguments != null) {
      Map<String, dynamic> map = Get.arguments as Map<String, dynamic>;
      location = map['location'] as String?;
      siteId = map['siteId'] as int?;
    }
    DateTime dateTime = DateTime.now();
    date = dateTime.millisecondsSinceEpoch;
    DateTime start = DateTime(dateTime.year, dateTime.month, 1);
    startTimeStamp = start.millisecondsSinceEpoch;
    DateTime end = DateTime(dateTime.year, dateTime.month, dateTime.day + 1);
    endTimeStamp = end.millisecondsSinceEpoch;
    rows.clear();
  }

  @override
  void onReady() {
    super.onReady();
    loadData();
  }

  @override
  void onClose() {
    super.onClose();
    AppLoading.dismiss();
  }

  Future<void> loadData() async {
    AppLoading.show();
    final (
      bool isSuccessful,
      List<StatisticReportEntity> value,
    ) = await HomeAPI.postStatisticReportApp(
      siteId: siteId,
      queryType: queryType.value,
      reportType: reportType,
      startTimeStamp: startTimeStamp,
      endTimeStamp: endTimeStamp,
      date: date,
    ).whenComplete(() => AppLoading.dismiss());
    if (isSuccessful) {
      list.assignAll(value.first.dailyElecIncomeDetail ?? []);
      rows.clear();
      rows.add(headers);
      rows.addAll(valueToList(list));
      update();
    }
  }

  List<List<String>> valueToList(
    List<StatisticReportDailyElecIncomeDetail> value,
  ) {
    return value.map((e) => toItems(e)).expand((e) => e).toList();
  }

  List<List<String>> toItems(StatisticReportDailyElecIncomeDetail value) {
    return [
      [
        "${value.formatDate}",
        TKey.sharp.tr,
        "${value.verPos ?? 0}",
        "${value.verNeg ?? 0}",
        "0",
      ],
      [
        "${value.formatDate}",
        TKey.peak.tr,
        "${value.higPos ?? 0}",
        "${value.higNeg ?? 0}",
        "0",
      ],
      [
        "${value.formatDate}",
        TKey.average.tr,
        "${value.midPos ?? 0}",
        "${value.midNeg ?? 0}",
        "0",
      ],
      [
        "${value.formatDate}",
        TKey.valley.tr,
        "${value.lowPos ?? 0}",
        "${value.lowNeg ?? 0}",
        "0",
      ],
      [
        "${value.formatDate}",
        TKey.all.tr,
        "${value.batChargeWhSum ?? 0}",
        "${value.batDisChargeWhSum ?? 0}",
        "${value.efficiency}",
      ],
    ];
  }
}
