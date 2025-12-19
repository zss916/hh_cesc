import 'dart:convert';

import 'package:cescpro/core/helper/extension_helper.dart';
import 'package:cescpro/core/translations/en.dart';
import 'package:cescpro/generated/json/base/json_field.dart';
import 'package:cescpro/generated/json/v1_clu_info_entity.g.dart';
import 'package:cescpro/http/bean/child_item_info.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';

export 'package:cescpro/generated/json/v1_clu_info_entity.g.dart';

@JsonSerializable()
class V1CluInfoEntity {
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
  int? cluStatus;
  int? bmsStatus;
  double? cluVol;
  double? cluCur;
  double? cluSoc;
  double? cluSoh;
  dynamic cluPosres;
  dynamic cluNegres;
  dynamic cluRechaElec;
  dynamic cluRedischgElec;
  dynamic lastSumsDischgElec;
  dynamic cluSumsChaElec;
  dynamic cluSumsDischgElec;
  dynamic lastSumsChaElec;
  dynamic maxCellVol;
  dynamic minCellVol;
  dynamic maxCellTem;
  dynamic minCellTem;
  dynamic maxCellSoc;
  dynamic minCellSoc;
  dynamic maxCellSoh;
  dynamic minCellSoh;
  dynamic maxCellVolCellNum;
  dynamic minCellVolCellNum;
  dynamic maxCellTemCellNum;
  dynamic minCellTemCellNum;
  dynamic cellVolTotalSum;
  dynamic maxDischgArrCur;
  dynamic cluRtPower;
  dynamic cluPosContactPos;
  dynamic cluNegContactPos;
  dynamic cluPreChargeContactorPos;
  dynamic cluPreserveSwitchPos;
  dynamic cluFuseStatus;
  dynamic deviceLock;
  dynamic deviceAlert;
  dynamic arrBanCharge;
  dynamic arrBanDischarge;
  List<V1CluInfoUnitList>? unitList;

  V1CluInfoEntity();

  factory V1CluInfoEntity.fromJson(Map<String, dynamic> json) =>
      $V1CluInfoEntityFromJson(json);

  Map<String, dynamic> toJson() => $V1CluInfoEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }

  ///实时数据显示
  List<ChildItemInfo> get childList => (unitList ?? []).isEmpty
      ? <ChildItemInfo>[]
      : (unitList?.first.list ?? []);

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
class V1CluInfoUnitList {
  String? name;
  int? sort;
  List<ChildItemInfo>? list;

  V1CluInfoUnitList();

  factory V1CluInfoUnitList.fromJson(Map<String, dynamic> json) =>
      $V1CluInfoUnitListFromJson(json);

  Map<String, dynamic> toJson() => $V1CluInfoUnitListToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}
