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
      update();
    }
  }
}
