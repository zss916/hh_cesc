import 'dart:convert';

import 'package:cescpro/generated/json/base/json_field.dart';
import 'package:cescpro/generated/json/home_data2_entity.g.dart';

export 'package:cescpro/generated/json/home_data2_entity.g.dart';

@JsonSerializable()
class HomeData2Entity {
  int? groupId;
  String? groupName;
  double? totalIncome;
  double? totalPos;
  double? totalNeg;
  double? todayIncome;
  double? todayTotalPos;
  double? todayTotalNeg;
  double? lastDayIncome;
  double? lastDayTotalPos;
  double? lastDayTotalNeg;
  double? currentMonthIncome;
  double? currentMonthTotalPos;
  double? currentMonthTotalNeg;
  double? currentYearIncome;
  double? currentYearTotalPos;
  double? currentYearTotalNeg;
  double? todayPvTotalNeg;
  double? totalPvTotalNeg;
  double? monthPvTotalNeg;
  double? lastDayPvTotalNeg;
  double? yearPvTotalNeg;
  int? deviceNum;
  int? capacity;
  int? power;
  int? pvPower;
  int? pvCapacity;
  int? operationTime;
  int? status;
  List<HomeData2DailyStatisticVOList>? dailyStatisticVOList;
  int? siteNum;
  int? normalNum;
  int? faultNum;
  int? alarmNum;
  int? cutOffNum;
  double? co2;
  double? coal;

  HomeData2Entity();

  factory HomeData2Entity.fromJson(Map<String, dynamic> json) =>
      $HomeData2EntityFromJson(json);

  Map<String, dynamic> toJson() => $HomeData2EntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class HomeData2DailyStatisticVOList {
  int? siteId;
  String? siteName;
  double? totalIncome;
  double? totalPos;
  double? totalNeg;
  double? todayIncome;
  double? todayTotalPos;
  double? todayTotalNeg;
  double? lastDayIncome;
  double? lastDayTotalPos;
  double? lastDayTotalNeg;
  double? currentMonthIncome;
  double? currentMonthTotalPos;
  double? currentMonthTotalNeg;
  double? currentYearIncome;
  double? currentYearTotalPos;
  double? currentYearTotalNeg;
  int? deviceNum;
  int? capacity;
  int? power;
  int? operationTime;
  int? status;
  List<HomeData2DailyStatisticVOListDeviceList>? deviceList;

  HomeData2DailyStatisticVOList();

  factory HomeData2DailyStatisticVOList.fromJson(Map<String, dynamic> json) =>
      $HomeData2DailyStatisticVOListFromJson(json);

  Map<String, dynamic> toJson() => $HomeData2DailyStatisticVOListToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class HomeData2DailyStatisticVOListDeviceList {
  int? devNo;
  double? totalIncome;
  double? totalPos;
  double? totalNeg;
  double? todayIncome;
  double? todayTotalPos;
  double? todayTotalNeg;
  double? lastDayIncome;
  double? lastDayTotalPos;
  double? lastDayTotalNeg;
  double? currentMonthIncome;
  double? currentMonthTotalPos;
  double? currentMonthTotalNeg;
  double? currentYearIncome;
  double? currentYearTotalPos;
  double? currentYearTotalNeg;

  HomeData2DailyStatisticVOListDeviceList();

  factory HomeData2DailyStatisticVOListDeviceList.fromJson(
    Map<String, dynamic> json,
  ) => $HomeData2DailyStatisticVOListDeviceListFromJson(json);

  Map<String, dynamic> toJson() =>
      $HomeData2DailyStatisticVOListDeviceListToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}
