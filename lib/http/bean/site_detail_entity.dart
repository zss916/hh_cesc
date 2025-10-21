import 'dart:convert';

import 'package:cescpro/generated/json/base/json_field.dart';
import 'package:cescpro/generated/json/site_detail_entity.g.dart';

export 'package:cescpro/generated/json/site_detail_entity.g.dart';

@JsonSerializable()
class SiteDetailEntity {
  int? id;
  String? name;
  String? picture;
  String? location;
  double? lng;
  double? lat;
  String? remark;
  int? hasDevCount;
  int? operationTimeMill;
  int? capacity;
  int? power;
  double? activePower;
  double? reactivePower;
  int? alarmNum;
  int? status; //运行状态
  double? soc;
  double? charge; //总充电量
  double? recharge; //总放电量
  double? efficiency;
  double? totalIncome;
  double? rechargeAvg; //今日放电量
  double? chargeAvg; //今日充电量
  int? cid; //客户id
  String? cname; //客户名称
  int? elecVolLevel; //电压等级
  int? elecSubType; //用电分类 1：大工业 2：一般工商业
  int? protocolId;
  int? latestTimeMill; //最新数据时间戳
  double? pvCapacity; //PV容量
  double? pvPower; //PV功率
  bool? hasPv;
  String? protocolVersion; //协议版本

  SiteDetailEntity();

  factory SiteDetailEntity.fromJson(Map<String, dynamic> json) =>
      $SiteDetailEntityFromJson(json);

  Map<String, dynamic> toJson() => $SiteDetailEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}
