import 'dart:convert';

import 'package:cescpro/generated/json/base/json_field.dart';
import 'package:cescpro/generated/json/home_statistic_entity.g.dart';

export 'package:cescpro/generated/json/home_statistic_entity.g.dart';

@JsonSerializable()
class HomeStatisticEntity {
  num? totalIncome; //累计收益
  num? todayIncome; //今日收益
  num? capacity; //站点容量
  num? totalPos; //累计充电
  num? totalNeg; //累计放电
  num? totalPvNeg; //累计光伏发电
  int? deviceNum; //设备数量
  int? siteNum; //站点数量
  int? normalNum; //正常站点数
  int? faultNum; //故障站点数
  int? alarmNum; //告警站点数
  int? cutOffNum; //中断告警数
  num? co2;
  num? coal; //煤

  HomeStatisticEntity();

  factory HomeStatisticEntity.fromJson(Map<String, dynamic> json) =>
      $HomeStatisticEntityFromJson(json);

  Map<String, dynamic> toJson() => $HomeStatisticEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }

  /*  /// 今日收入
  String get showTodayIncome => (todayIncome ?? 0.0).moneyFormatted;

  /// 累计收入
  String get showTotalIncome => (totalIncome ?? 0.0).moneyFormatted;

  /// 是否超过万
  bool get isExceedThousand => (totalIncome ?? 0) >= 10000;*/
}
