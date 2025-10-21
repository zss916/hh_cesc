import 'dart:convert';

import 'package:cescpro/generated/json/base/json_field.dart';
import 'package:cescpro/generated/json/statistic_record_entity.g.dart';

export 'package:cescpro/generated/json/statistic_record_entity.g.dart';

@JsonSerializable()
class StatisticRecordEntity {
  int? groupId;
  String? groupName;
  double? totalIncome;
  double? totalPos;
  double? totalNeg;
  double? todayIncome; //今日
  double? todayTotalPos;
  double? todayTotalNeg;
  double? lastDayIncome; //昨日
  double? lastDayTotalPos;
  double? lastDayTotalNeg;
  double? currentMonthIncome; //本月
  double? currentMonthTotalPos;
  double? currentMonthTotalNeg;
  double? currentYearIncome; //本年
  double? currentYearTotalPos;
  double? currentYearTotalNeg;
  double? todayPvTotalNeg; //光伏
  double? totalPvTotalNeg;
  double? monthPvTotalNeg;
  double? lastDayPvTotalNeg;
  double? yearPvTotalNeg;
  int? deviceNum; //设备数量
  int? capacity; //站点容量
  int? power; //站点功率
  int? operationTime; //投运时间
  int? status; //状态
  List<StatisticRecordDailyStatisticVOList>? dailyStatisticVOList;

  StatisticRecordEntity();

  factory StatisticRecordEntity.fromJson(Map<String, dynamic> json) =>
      $StatisticRecordEntityFromJson(json);

  Map<String, dynamic> toJson() => $StatisticRecordEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class StatisticRecordDailyStatisticVOList {
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
  List<StatisticRecordDailyStatisticVOListDeviceList>? deviceList;

  StatisticRecordDailyStatisticVOList();

  factory StatisticRecordDailyStatisticVOList.fromJson(
    Map<String, dynamic> json,
  ) => $StatisticRecordDailyStatisticVOListFromJson(json);

  Map<String, dynamic> toJson() =>
      $StatisticRecordDailyStatisticVOListToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class StatisticRecordDailyStatisticVOListDeviceList {
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

  StatisticRecordDailyStatisticVOListDeviceList();

  factory StatisticRecordDailyStatisticVOListDeviceList.fromJson(
    Map<String, dynamic> json,
  ) => $StatisticRecordDailyStatisticVOListDeviceListFromJson(json);

  Map<String, dynamic> toJson() =>
      $StatisticRecordDailyStatisticVOListDeviceListToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}
