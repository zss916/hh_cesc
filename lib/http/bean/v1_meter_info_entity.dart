import 'dart:convert';

import 'package:cescpro/core/helper/extension_helper.dart';
import 'package:cescpro/core/translations/en.dart';
import 'package:cescpro/generated/json/base/json_field.dart';
import 'package:cescpro/generated/json/v1_meter_info_entity.g.dart';
import 'package:cescpro/http/bean/child_item_info.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';

export 'package:cescpro/generated/json/v1_meter_info_entity.g.dart';

@JsonSerializable()
class V1MeterInfoEntity {
  bool? alarmStatus;
  bool? communicationStatus;
  dynamic devStatus;
  String? statusNameDesc;
  String? statusEnNameDesc;
  int? statusUpdateTimeMill;
  int? id;
  int? did;
  int? siteId;
  dynamic rawTimestamp;
  int? arrNo;
  int? cluNo;
  int? devNo;
  double? meterAVol;
  double? meterBVol;
  double? meterCVol;
  double? meterACur;
  double? meterBCur;
  double? meterCCur;
  double? meterAllPow;
  double? meterTotPf;
  double? meterF;
  double? meterAddPos;
  double? meterVerPos;
  double? meterHigPos;
  double? meterMidPos;
  double? meterLowPos;
  double? meterAddNeg;
  double? meterVerNeg;
  double? meterHigNeg;
  double? meterMidNeg;
  double? meterLowNeg;
  List<ChildItemInfo>? list;

  V1MeterInfoEntity();

  factory V1MeterInfoEntity.fromJson(Map<String, dynamic> json) =>
      $V1MeterInfoEntityFromJson(json);

  Map<String, dynamic> toJson() => $V1MeterInfoEntityToJson(this);

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
