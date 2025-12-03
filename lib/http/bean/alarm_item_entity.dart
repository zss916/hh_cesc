import 'dart:convert';

import 'package:cescpro/core/helper/extension_helper.dart';
import 'package:cescpro/core/translations/en.dart';
import 'package:cescpro/generated/json/alarm_item_entity.g.dart';
import 'package:cescpro/generated/json/base/json_field.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

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

  String get deviceName =>
      "${label ?? ''}${Get.isEn ? (enName ?? "") : (name ?? "")}";

  AlarmItemEntity();

  factory AlarmItemEntity.fromJson(Map<String, dynamic> json) =>
      $AlarmItemEntityFromJson(json);

  Map<String, dynamic> toJson() => $AlarmItemEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }

  String getStartTime() {
    return DateFormat(
      'yyyy-MM-dd HH:mm:ss',
    ).format(DateTime.fromMillisecondsSinceEpoch(startTimeMill ?? 0));
  }

  String? get alarmLevelType {
    if (alarmLevel == 1) {
      return TKey.alarmLevel1.tr;
    } else if (alarmLevel == 2) {
      return TKey.alarmLevel2.tr;
    } else if (alarmLevel == 3) {
      return TKey.alarmLevel3.tr;
    } else {
      return null;
    }
  }

  ///持续时间
  Duration get dif => DateTime.fromMillisecondsSinceEpoch(
    endTimeMill ?? (DateTime.now().millisecondsSinceEpoch),
  ).difference(DateTime.fromMillisecondsSinceEpoch(startTimeMill ?? 0));

  String get keepTime {
    if (dif.inDays == 0) {
      return "${(dif.inHours) % 24}时${(dif.inMinutes) % 60}分${(dif.inSeconds) % 60}秒";
    } else if ((dif.inDays == 0) && (dif.inHours == 0)) {
      return "${(dif.inMinutes) % 60}分${(dif.inSeconds) % 60}秒";
    } else if ((dif.inDays == 0) &&
        (dif.inHours == 0) &&
        (dif.inMinutes == 0)) {
      return "${(dif.inSeconds) % 60}秒";
    } else {
      return "${dif.inDays}天${(dif.inHours) % 24}时${(dif.inMinutes) % 60}分${(dif.inSeconds) % 60}秒";
    }
  }

  String showContent() {
    return "${label ?? ""}${devType ?? ""}, ${(startTimeMill ?? 0).timestampFormat}发生了${alarmLevelType ?? ""}${content ?? ""},持续时间${keepTime}\n\n";
  }
}
