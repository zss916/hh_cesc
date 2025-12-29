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

class EleLogic extends GetxController {
  String? location;
  int? siteId;
  QueryType queryType = QueryType.daily;
  int? date;
  int? startTimeStamp;
  int? endTimeStamp;

  List<ReportDataEntity> eleList = [];

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

  void loadData() {
    loadEleList();
  }

  Future<void> loadEleList() async {
    // debugPrint("startTimeStamp:$startTimeStamp \n endTimeStamp:$endTimeStamp");
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
      eleList.assignAll(value);
      update();
    }
  }

  @override
  void onClose() {
    super.onClose();
    AppLoading.dismiss();
  }
}
