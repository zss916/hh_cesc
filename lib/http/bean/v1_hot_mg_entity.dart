import 'dart:convert';

import 'package:cescpro/core/helper/extension_helper.dart';
import 'package:cescpro/core/translations/en.dart';
import 'package:cescpro/generated/json/base/json_field.dart';
import 'package:cescpro/generated/json/v1_hot_mg_entity.g.dart';
import 'package:cescpro/http/bean/child_item_info.dart';
import 'package:get/get.dart';

export 'package:cescpro/generated/json/v1_hot_mg_entity.g.dart';

@JsonSerializable()
class V1HotMgEntity {
  bool? alarmStatus;
  bool? communicationStatus;
  double? devStatus;
  String? statusNameDesc;
  String? statusEnNameDesc;
  int? statusUpdateTimeMill;
  String? name;
  dynamic enName;
  double? did;
  double? siteId;
  dynamic rawTimestamp;
  double? arrNo;
  double? cluNo;
  double? devNo;
  List<ChildItemInfo>? list;

  V1HotMgEntity();

  factory V1HotMgEntity.fromJson(Map<String, dynamic> json) =>
      $V1HotMgEntityFromJson(json);

  Map<String, dynamic> toJson() => $V1HotMgEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }

  ///是否超过30分钟
  bool get isWithin30Minutes =>
      (DateTime.now().millisecondsSinceEpoch -
              ((statusUpdateTimeMill ?? 0) * 1000))
          .abs() <=
      (30 * 60 * 1000);

  ///告警状态
  String get showAlarmStatus => alarmStatus == null
      ? "-"
      : (alarmStatus == true ? TKey.alarm.tr : TKey.common.tr);

  ///通信状态
  String get showCommunicationStatus => communicationStatus == null
      ? "-"
      : (communicationStatus == true ? TKey.interrupt.tr : TKey.common.tr);

  ///运行状态
  String get showRunStatus =>
      Get.isEn ? (statusEnNameDesc ?? "") : (statusNameDesc ?? "");
}
