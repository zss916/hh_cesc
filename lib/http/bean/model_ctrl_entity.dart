import 'dart:convert';

import 'package:cescpro/core/translations/en.dart';
import 'package:cescpro/generated/json/base/json_field.dart';
import 'package:cescpro/generated/json/model_ctrl_entity.g.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';

export 'package:cescpro/generated/json/model_ctrl_entity.g.dart';

@JsonSerializable()
class ModelCtrlEntity {
  int? activeType;
  dynamic power;
  dynamic peak;
  dynamic demand;
  dynamic sub;
  dynamic selfGenerateInfo;

  ModelCtrlEntity();

  factory ModelCtrlEntity.fromJson(Map<String, dynamic> json) =>
      $ModelCtrlEntityFromJson(json);

  Map<String, dynamic> toJson() => $ModelCtrlEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }

  String get activeTypeText {
    switch (activeType) {
      case 1:
        return TKey.totalPowerType.tr;
      case 2:
        return TKey.subSystemType.tr;
      case 3:
        return TKey.peakShavingAndValleyFillingMonthType.tr;
      case 4:
        return TKey.peakShavingAndValleyFillingDayType.tr;
      case 5:
        return TKey.selfGenerationAndSelfConsumptionType.tr;
      case 6:
        return TKey.aiModeType.tr;
      default:
        return '--';
    }
  }
}
