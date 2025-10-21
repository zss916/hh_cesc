import 'dart:convert';

import 'package:cescpro/generated/json/alarm_item_entity.g.dart';
import 'package:cescpro/generated/json/base/json_field.dart';

export 'package:cescpro/generated/json/alarm_item_entity.g.dart';

@JsonSerializable()
class AlarmItemEntity {
  int? alarmId; //告警记录id
  int? alarmLevel; //告警等级
  String? content; //告警内容
  int? devNo; //组件设备号
  String? devType;
  int? did; //设备id
  int? endTimeMill; //结束时间
  String? name; //设备名
  String? enName;
  int? siteId; //站点id
  String? siteName;
  String? sn; //序列号
  int? startTimeMill; //发生时间
  int? status; //0-已结束，1-发生中
  int? arrNo; //组件堆号
  bool? attention;
  String? createTime;
  String? label;

  AlarmItemEntity();

  factory AlarmItemEntity.fromJson(Map<String, dynamic> json) =>
      $AlarmItemEntityFromJson(json);

  Map<String, dynamic> toJson() => $AlarmItemEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}
