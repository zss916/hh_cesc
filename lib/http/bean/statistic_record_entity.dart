import 'dart:convert';

import 'package:cescpro/core/helper/extension_helper.dart';
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

  String showValue(double value) {
    if (value > 1000) {
      double mwhValue = value / 1000;
      return mwhValue.formatMWh();
    } else {
      return value.formatKWh();
    }
  }

  String showUnit(double value) {
    if (value > 1000) {
      return "MKh";
    } else {
      return "kWh";
    }
  }

  ///判断获取货币符号
  String get currencyUnit => true ? "¥" : "€";

  ///今日光伏充电量
  String showTodayPVTotalNeg() {
    double value = todayPvTotalNeg ?? 0;
    if (value > 1000) {
      double mwhValue = value / 1000;
      return "${mwhValue.formatMWh()}MWh";
    } else {
      return "${value.formatKWh()}kWh";
    }
  }

  ///今日充电量
  String showTodayTotalPos() {
    double value = todayTotalPos ?? 0;
    if (value > 1000) {
      double mwhValue = value / 1000;
      return "${mwhValue.formatMWh()}MWh";
    } else {
      return "${value.formatKWh()}kWh";
    }
  }

  ///今日放电量
  String showTodayTotalNeg() {
    double value = todayTotalNeg ?? 0;
    if (value > 1000) {
      double mwhValue = value / 1000;
      return "${mwhValue.formatMWh()}MWh";
    } else {
      return "${value.formatKWh()}kWh";
    }
  }

  ///本月充电量
  String showMonthTotalPos() {
    double value = currentMonthTotalPos ?? 0;
    if (value > 1000) {
      double mwhValue = value / 1000;
      return "${mwhValue.formatMWh()}MWh";
    } else {
      return "${value.formatKWh()}kWh";
    }
  }

  ///本月放电量
  String showMonthTotalNeg() {
    double value = currentMonthTotalNeg ?? 0;
    if (value > 1000) {
      double mwhValue = value / 1000;
      return "${mwhValue.formatMWh()}MWh";
    } else {
      return "${value.formatKWh()}kWh";
    }
  }

  ///本月光伏放电量
  String showMonthPVTotalNeg() {
    double value = monthPvTotalNeg ?? 0;
    if (value > 1000) {
      double mwhValue = value / 1000;
      return "${mwhValue.formatMWh()}MWh";
    } else {
      return "${value.formatKWh()}kWh";
    }
  }

  ///本年充电量
  String showYearTotalPos() {
    double value = currentYearTotalPos ?? 0;
    if (value > 1000) {
      double mwhValue = value / 1000;
      return "${mwhValue.formatMWh()}MWh";
    } else {
      return "${value.formatKWh()}kWh";
    }
  }

  ///本年光伏充电量
  String showYearPVTotalPos() {
    double value = yearPvTotalNeg ?? 0;
    if (value > 1000) {
      double mwhValue = value / 1000;
      return "${mwhValue.formatMWh()}MWh";
    } else {
      return "${value.formatKWh()}kWh";
    }
  }

  ///本年放电量
  String showYearTotalNeg() {
    double value = currentYearTotalNeg ?? 0;
    if (value > 1000) {
      double mwhValue = value / 1000;
      return "${mwhValue.formatMWh()}MWh";
    } else {
      return "${value.formatKWh()}kWh";
    }
  }

  ///总共充电量
  String showTotalPos() {
    double value = totalPos ?? 0;
    if (value > 1000) {
      double mwhValue = value / 1000;
      return "${mwhValue.formatMWh()}MWh";
    } else {
      return "${value.formatKWh()}kWh";
    }
  }

  ///总共放电量
  String showTotalNeg() {
    double value = totalNeg ?? 0;
    if (value > 1000) {
      double mwhValue = value / 1000;
      return "${mwhValue.formatMWh()}MWh";
    } else {
      return "${value.formatKWh()}kWh";
    }
  }

  ///总共光伏发电量
  String showTotalPVNeg() {
    double value = totalPvTotalNeg ?? 0;
    if (value > 1000) {
      double mwhValue = value / 1000;
      return "${mwhValue.formatMWh()}MWh";
    } else {
      return "${value.formatKWh()}kWh";
    }
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
