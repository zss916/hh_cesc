import 'dart:convert';

import 'package:cescpro/core/helper/extension_helper.dart';
import 'package:cescpro/core/translations/en.dart';
import 'package:cescpro/generated/json/base/json_field.dart';
import 'package:cescpro/generated/json/v1_dido_info_entity.g.dart';
import 'package:cescpro/http/bean/child_item_info.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';

export 'package:cescpro/generated/json/v1_dido_info_entity.g.dart';

@JsonSerializable()
class V1DidoInfoEntity {
  bool? alarmStatus;
  bool? communicationStatus;
  dynamic devStatus;
  String? statusNameDesc;
  String? statusEnNameDesc;
  int? statusUpdateTimeMill;
  int? id;
  int? did;
  int? siteId;
  int? rawTimestamp;
  int? arrNo;
  int? cluNo;
  int? devNo;
  List<ChildItemInfo>? diList;
  List<ChildItemInfo>? doList;

  V1DidoInfoEntity();

  factory V1DidoInfoEntity.fromJson(Map<String, dynamic> json) =>
      $V1DidoInfoEntityFromJson(json);

  Map<String, dynamic> toJson() => $V1DidoInfoEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }

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
