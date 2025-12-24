import 'dart:convert';

import 'package:cescpro/core/helper/extension_helper.dart';
import 'package:cescpro/core/translations/en.dart';
import 'package:cescpro/generated/json/base/json_field.dart';
import 'package:cescpro/generated/json/v1_pcs_info_entity.g.dart';
import 'package:cescpro/http/bean/child_item_info.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';

export 'package:cescpro/generated/json/v1_pcs_info_entity.g.dart';

@JsonSerializable()
class V1PcsInfoEntity {
  bool? alarmStatus;
  bool? communicationStatus;
  int? devStatus;
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
  int? runSta;
  int? offGrdSta;
  dynamic powerInput;
  dynamic volInput;
  dynamic curInput;
  double? outPowP;
  double? outPowQ;
  dynamic outPowS;
  dynamic grdF;
  dynamic outPowPf;
  dynamic dissTemp;
  dynamic acAccChgCur;
  dynamic acAccDisCur;
  dynamic dcAccChgCur;
  dynamic dcAccDisCur;
  dynamic outUwVol;
  dynamic outVwVol;
  dynamic outWuVol;
  dynamic outUCur;
  dynamic outVCur;
  dynamic outWCur;
  dynamic acUPowPf;
  dynamic acVPowPf;
  dynamic acWPowPf;
  dynamic acUPowP;
  dynamic acVPowP;
  dynamic acWPowP;
  dynamic acUPowQ;
  dynamic acVPowQ;
  dynamic acWPowQ;
  dynamic acUPowS;
  dynamic acVPowS;
  dynamic acWPowS;
  List<ChildItemInfo>? list;

  V1PcsInfoEntity();

  factory V1PcsInfoEntity.fromJson(Map<String, dynamic> json) =>
      $V1PcsInfoEntityFromJson(json);

  Map<String, dynamic> toJson() => $V1PcsInfoEntityToJson(this);

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
