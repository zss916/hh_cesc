import 'dart:convert';

import 'package:cescpro/core/helper/extension_helper.dart';
import 'package:cescpro/core/translations/en.dart';
import 'package:cescpro/generated/json/base/json_field.dart';
import 'package:cescpro/generated/json/v1_cell_info_entity.g.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';

export 'package:cescpro/generated/json/v1_cell_info_entity.g.dart';

@JsonSerializable()
class V1CellInfoEntity {
  bool? alarmStatus;
  bool? communicationStatus;
  int? devStatus;
  String? statusNameDesc;
  String? statusEnNameDesc;
  int? statusUpdateTimeMill;
  List<V1CellInfoList>? list;

  V1CellInfoEntity();

  factory V1CellInfoEntity.fromJson(Map<String, dynamic> json) =>
      $V1CellInfoEntityFromJson(json);

  Map<String, dynamic> toJson() => $V1CellInfoEntityToJson(this);

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

@JsonSerializable()
class V1CellInfoList {
  dynamic id;
  int? did;
  int? siteId;
  dynamic rawTimestamp;
  String? sn;
  int? arrNo;
  int? cluNo;
  String? packNo;
  int? cellNo;
  double? cellVol;
  dynamic cellCur;
  double? cellTemp;
  double? cellSoc;
  dynamic cellSoh;
  dynamic cellR;
  dynamic cellBla;
  dynamic cellCu;
  dynamic cellCmd;
  dynamic cellStus;
  dynamic createTime;

  V1CellInfoList();

  factory V1CellInfoList.fromJson(Map<String, dynamic> json) =>
      $V1CellInfoListFromJson(json);

  Map<String, dynamic> toJson() => $V1CellInfoListToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}
