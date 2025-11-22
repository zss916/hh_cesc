import 'dart:convert';

import 'package:cescpro/core/helper/extension_helper.dart';
import 'package:cescpro/generated/json/base/json_field.dart';
import 'package:cescpro/generated/json/com_type_list_entity.g.dart';
import 'package:get/get_core/src/get_main.dart';

export 'package:cescpro/generated/json/com_type_list_entity.g.dart';

@JsonSerializable()
class ComTypeListEntity {
  int? statusUpdateTimeMill; //数据状态更新时间戳
  List<ComTypeListItem>? selfList;
  List<List<ComTypeListItem>>? otherList;

  ComTypeListEntity();

  factory ComTypeListEntity.fromJson(Map<String, dynamic> json) =>
      $ComTypeListEntityFromJson(json);

  Map<String, dynamic> toJson() => $ComTypeListEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }

  ///pcs

  ComTypeListItem? get dcCurrent =>
      (selfList ?? []).where((e) => e.fieldName == "dcCurrent").firstOrNull;

  ComTypeListItem? get dcVoltage =>
      (selfList ?? []).where((e) => e.fieldName == "dcVoltage").firstOrNull;

  ComTypeListItem? get dcPower =>
      (selfList ?? []).where((e) => e.fieldName == "dcPower").firstOrNull;

  ComTypeListItem? get activePowerA =>
      (selfList ?? []).where((e) => e.fieldName == "activePowerA").firstOrNull;

  ComTypeListItem? get activePowerB =>
      (selfList ?? []).where((e) => e.fieldName == "activePowerB").firstOrNull;

  ComTypeListItem? get activePowerC =>
      (selfList ?? []).where((e) => e.fieldName == "activePowerC").firstOrNull;

  ComTypeListItem? get currentC =>
      (selfList ?? []).where((e) => e.fieldName == "currentC").firstOrNull;

  ComTypeListItem? get currentB =>
      (selfList ?? []).where((e) => e.fieldName == "currentB").firstOrNull;

  ComTypeListItem? get currentA =>
      (selfList ?? []).where((e) => e.fieldName == "currentA").firstOrNull;

  ComTypeListItem? get voltageA =>
      (selfList ?? []).where((e) => e.fieldName == "voltageA").firstOrNull;

  ComTypeListItem? get voltageB =>
      (selfList ?? []).where((e) => e.fieldName == "voltageB").firstOrNull;

  ComTypeListItem? get voltageC =>
      (selfList ?? []).where((e) => e.fieldName == "voltageC").firstOrNull;

  ComTypeListItem? get gridStatus =>
      (selfList ?? []).where((e) => e.fieldName == "gridStatus").firstOrNull;

  ComTypeListItem? get totalChargeElectric => (selfList ?? [])
      .where((e) => e.fieldName == "totalChargeElectric")
      .firstOrNull;

  ComTypeListItem? get totalOutElectric => (selfList ?? [])
      .where((e) => e.fieldName == "totalOutElectric")
      .firstOrNull;

  ComTypeListItem? get hz =>
      (selfList ?? []).where((e) => e.fieldName == "hz").firstOrNull;

  ComTypeListItem? get temp =>
      (selfList ?? []).where((e) => e.fieldName == "temp").firstOrNull;

  ComTypeListItem? get apparentPowerT => (selfList ?? [])
      .where((e) => e.fieldName == "apparentPowerT")
      .firstOrNull;

  ComTypeListItem? get reactivePowerT => (selfList ?? [])
      .where((e) => e.fieldName == "reactivePowerT")
      .firstOrNull;

  ComTypeListItem? get powerTFactor =>
      (selfList ?? []).where((e) => e.fieldName == "powerTFactor").firstOrNull;

  ComTypeListItem? get activePowerT =>
      (selfList ?? []).where((e) => e.fieldName == "activePowerT").firstOrNull;

  ComTypeListItem? get powerCFactor =>
      (selfList ?? []).where((e) => e.fieldName == "powerCFactor").firstOrNull;

  ComTypeListItem? get powerBFactor =>
      (selfList ?? []).where((e) => e.fieldName == "powerBFactor").firstOrNull;

  ComTypeListItem? get powerAFactor =>
      (selfList ?? []).where((e) => e.fieldName == "powerAFactor").firstOrNull;

  ///电量

  ComTypeListItem? get signalStatus =>
      (selfList ?? []).where((e) => e.fieldName == "signalStatus").firstOrNull;

  ComTypeListItem? get alarmStatus =>
      (selfList ?? []).where((e) => e.fieldName == "alarmStatus").firstOrNull;

  ComTypeListItem? get runStatus =>
      (selfList ?? []).where((e) => e.fieldName == "runStatus").firstOrNull;

  ComTypeListItem? get soc =>
      (selfList ?? []).where((e) => e.fieldName == "soc").firstOrNull;

  ComTypeListItem? get voltage =>
      (selfList ?? []).where((e) => e.fieldName == "voltage").firstOrNull;

  ComTypeListItem? get current =>
      (selfList ?? []).where((e) => e.fieldName == "current").firstOrNull;

  ComTypeListItem? get singleMaxVoltage => (selfList ?? [])
      .where((e) => e.fieldName == "singleMaxVoltage")
      .firstOrNull;

  ComTypeListItem? get singleMinVoltage => (selfList ?? [])
      .where((e) => e.fieldName == "singleMinVoltage")
      .firstOrNull;

  ComTypeListItem? get singleMaxTemp =>
      (selfList ?? []).where((e) => e.fieldName == "singleMaxTemp").firstOrNull;

  ComTypeListItem? get singleMinTemp =>
      (selfList ?? []).where((e) => e.fieldName == "singleMinTemp").firstOrNull;

  ComTypeListItem? get maxChargePower => (selfList ?? [])
      .where((e) => e.fieldName == "maxChargePower")
      .firstOrNull;

  ComTypeListItem? get maxOutPower =>
      (selfList ?? []).where((e) => e.fieldName == "maxOutPower").firstOrNull;
}

@JsonSerializable()
class ComTypeListItem {
  String? devType;
  String? fieldName;
  String? fieldNameCn;
  String? fieldNameEn;
  String? unit;
  int? sort;
  String? value;
  String? enValue;

  ComTypeListItem();

  factory ComTypeListItem.fromJson(Map<String, dynamic> json) =>
      $ComTypeListItemFromJson(json);

  Map<String, dynamic> toJson() => $ComTypeListItemToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }

  String get showFieldName =>
      Get.isEn ? (fieldNameEn ?? "") : (fieldNameCn ?? "");

  String get showValue => Get.isEn ? (enValue ?? "") : (value ?? "");

  // String? get currentValue => (fieldName == "current") ? showValue : "";

  // String? get currentName => (fieldName == "current") ? showFieldName : "";
}
