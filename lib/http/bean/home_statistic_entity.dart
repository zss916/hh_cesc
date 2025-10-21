import 'dart:convert';

import 'package:cescpro/generated/json/base/json_field.dart';
import 'package:cescpro/generated/json/home_statistic_entity.g.dart';

export 'package:cescpro/generated/json/home_statistic_entity.g.dart';

@JsonSerializable()
class HomeStatisticEntity {
  double? totalIncome; //累计收益
  double? todayIncome; //今日收益
  int? capacity; //站点容量
  double? totalPos; //累计充电
  double? totalNeg; //累计放电
  double? totalPvNeg; //累计光伏发电
  int? deviceNum; //设备数量
  int? siteNum; //站点数量
  int? normalNum; //正常站点数
  int? faultNum; //故障站点数
  int? alarmNum; //告警站点数
  int? cutOffNum; //中断告警数
  double? co2;
  double? coal; //煤

  HomeStatisticEntity();

  factory HomeStatisticEntity.fromJson(Map<String, dynamic> json) =>
      $HomeStatisticEntityFromJson(json);

  Map<String, dynamic> toJson() => $HomeStatisticEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}
