part of 'index.dart';

enum QueryType { daily, monthly, yearly }

extension QueryTypeValue on QueryType {
  int get value {
    if (this == QueryType.daily) {
      return 1;
    } else if (this == QueryType.monthly) {
      return 2;
    } else if (this == QueryType.yearly) {
      return 3;
    } else {
      return 1;
    }
  }
}

class RevenueLogic extends GetxController {
  String? location;
  int? siteId;
  QueryType queryType = QueryType.daily;
  int? date;
  int? startTimeStamp;
  int? endTimeStamp;
  //是否显示分时
  bool? isShowTimeSlot;

  List<StatisticReportDailyElecIncomeDetail> list = [];
  List<ReportDataEntity> revenueList = [];

  List<String> get headersRevenue => [
    TKey.date.tr,
    "${TKey.allRevenue.tr}(${User.to.getCurrencyUnit()})",
    "${TKey.feedInRevenue.tr}(${User.to.getCurrencyUnit()})",
    "${TKey.selfGenerationRevenue.tr}(${User.to.getCurrencyUnit()})",
    "${TKey.energyStoragePriceDifferenceRevenue.tr}(${User.to.getCurrencyUnit()})",
  ];

  List<String> get headersList => [
    TKey.date.tr,
    TKey.duration.tr,
    "${TKey.chargingAmount.tr}(${User.to.getCurrencyUnit()})",
    "${TKey.dischargingAmount.tr}(${User.to.getCurrencyUnit()})",
    "${TKey.amount.tr}(${User.to.getCurrencyUnit()})",
  ];

  List<List<String>> rows2 = [];
  List<List<String>> rows = [];

  @override
  void onInit() {
    super.onInit();
    if (Get.arguments != null) {
      Map<String, dynamic> map = Get.arguments as Map<String, dynamic>;
      location = map['location'] as String?;
      siteId = map['siteId'] as int?;
      isShowTimeSlot = map['isShowTimeSlot'] as bool?;
    }
    DateTime dateTime = DateTime.now();
    date = dateTime.millisecondsSinceEpoch;
    DateTime start = DateTime(dateTime.year, dateTime.month, 1);
    startTimeStamp = start.millisecondsSinceEpoch;

    DateTime end = DateTime(dateTime.year, dateTime.month, dateTime.day + 1);
    endTimeStamp = end.millisecondsSinceEpoch;

    rows2.clear();
    rows.clear();
  }

  @override
  void onReady() {
    super.onReady();
    loadData();
  }

  void loadData() {
    if (AppSetting.isOverseas) {
      loadRevenueList2();
    } else {
      ///
      if (isShowTimeSlot ?? false) {
        loadRevenueList2();
      } else {
        loadRevenueList();
      }
    }
  }

  //  //{siteId: 477, dataType: 1, startTimeStamp: 1764518400000, endTimeStamp: 1767196799999, date: null}
  Future<void> loadRevenueList2() async {
    debugPrint("startTimeStamp:$startTimeStamp \n endTimeStamp:$endTimeStamp");
    AppLoading.show();
    final (
      bool isSuccessful,
      List<ReportDataEntity> value,
    ) = await HomeAPI.postStatisticReportApp2(
      siteId: siteId,
      dataType: queryType.value,
      startTimeStamp: startTimeStamp,
      endTimeStamp: endTimeStamp,
      date: date,
    ).whenComplete(() => AppLoading.dismiss());
    if (isSuccessful) {
      revenueList.assignAll(value);
      rows2.clear();
      rows2.add(headersRevenue);
      rows2.addAll(valueToList2(revenueList));
      update();
    }
  }

  @override
  void onClose() {
    super.onClose();
    AppLoading.dismiss();
  }

  Future<void> loadRevenueList() async {
    //1.daily 2.monthly 3.yearly
    AppLoading.show();
    final (
      bool isSuccessful,
      List<StatisticReportEntity> value,
    ) = await HomeAPI.postStatisticReportApp(
      siteId: siteId,
      queryType: queryType.value,
      reportType: 3,
      startTimeStamp: startTimeStamp,
      endTimeStamp: endTimeStamp,
      date: date,
    ).whenComplete(() => AppLoading.dismiss());
    if (isSuccessful) {
      list.assignAll(value.first.dailyElecIncomeDetail ?? []);
      rows.clear();
      rows.add(headersList);
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
        "${value.verPosAmount ?? 0}",
        "${value.verNegAmount ?? 0}",
        "0",
      ],
      [
        "${value.formatDate}",
        TKey.peak.tr,
        "${value.higPosAmount ?? 0}",
        "${value.higNegAmount ?? 0}",
        "0",
      ],
      [
        "${value.formatDate}",
        TKey.average.tr,
        "${value.midPosAmount ?? 0}",
        "${value.midNegAmount ?? 0}",
        "0",
      ],
      [
        "${value.formatDate}",
        TKey.valley.tr,
        "${value.lowPosAmount ?? 0}",
        "${value.lowNegAmount ?? 0}",
        "0",
      ],
      [
        "${value.formatDate}",
        TKey.all.tr,
        "${value.totalPosAmount ?? 0}",
        "${value.totalNegAmount ?? 0}",
        "${value.totalElecIncome ?? 0}",
      ],
    ];
  }

  List<List<String>> valueToList2(List<ReportDataEntity> value) {
    return value
        .map(
          (e) => [
            "${e.dayDate}",
            e.allRevenue,
            e.isShow ? (e.gridFeedGain ?? 0.00).formatAmount() : "--",
            e.isHasPV ? (e.pvSelfUseGain ?? 0.00).formatAmount() : "--",
            (e.storageProfit ?? 0.00).formatAmount(),
          ],
        )
        .toList();
  }
}
