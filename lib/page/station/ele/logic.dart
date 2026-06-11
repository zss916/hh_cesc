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

  List<String> get headers => [
    TKey.date.tr,
    "${TKey.photovoltaicPowerGeneration2.tr}(kWh)",
    "${TKey.gridEleGeneration.tr}(kWh)",
    "${TKey.energyStorageCharge.tr}(kWh)",
    "${TKey.energyStorageDischarge.tr}(kWh)",
  ];

  List<List<String>> rows = [];
  String? excelName;
  String? siteName;

  @override
  void onInit() {
    super.onInit();
    if (Get.arguments != null) {
      Map<String, dynamic> map = Get.arguments as Map<String, dynamic>;
      location = map['location'] as String?;
      siteId = map['siteId'] as int?;
      siteName = map['name'] as String?;
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
      rows.clear();
      rows.add(headers);
      rows.addAll(valueToList(eleList));
      excelName = getExcelName(
        queryType: queryType,
        startTimeStamp: startTimeStamp,
        endTimeStamp: endTimeStamp,
        siteName: siteName,
      );
      update();
    }
  }

  String getExcelName({
    required QueryType queryType,
    int? startTimeStamp,
    int? endTimeStamp,
    String? siteName,
  }) {
    if (queryType == QueryType.daily) {
      String startTime = DateFormat(
        'yyyy-MM-dd',
      ).format(DateTime.fromMillisecondsSinceEpoch(startTimeStamp ?? 0));
      String endTime = DateFormat(
        'yyyy-MM-dd',
      ).format(DateTime.fromMillisecondsSinceEpoch(endTimeStamp ?? 0));

      return "$startTime-${endTime}_$siteName";
    } else if (queryType == QueryType.monthly) {
      String startTime = DateFormat(
        'yyyy-MM',
      ).format(DateTime.fromMillisecondsSinceEpoch(startTimeStamp ?? 0));
      return "${startTime}_$siteName";
    } else if (queryType == QueryType.yearly) {
      String startTime = DateFormat(
        'yyyy',
      ).format(DateTime.fromMillisecondsSinceEpoch(startTimeStamp ?? 0));
      return "${startTime}_$siteName";
    }
    return "$siteName";
  }

  List<List<String>> valueToList(List<ReportDataEntity> value) {
    return value
        .map(
          (e) => [
            "${e.dayDate}",
            e.isHasPV ? (e.pvGeneration ?? 0).formatNum() : "--",
            e.isShow ? (e.gridFeed ?? 0).formatNum() : "--",
            (e.pos ?? 0).formatNum(),
            (e.neg ?? 0).formatNum(),
          ],
        )
        .toList();
  }

  @override
  void onClose() {
    super.onClose();
    AppLoading.dismiss();
  }
}
