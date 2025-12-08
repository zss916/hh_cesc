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

  List<StatisticReportDailyElecIncomeDetail> list = [];

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
