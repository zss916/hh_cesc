import 'package:cescpro/generated/json/base/json_convert_content.dart';
import 'package:cescpro/http/bean/model_ctrl_entity.dart';
import 'package:cescpro/core/translations/en.dart';

import 'package:get/get_utils/src/extensions/internacionalization.dart';


ModelCtrlEntity $ModelCtrlEntityFromJson(Map<String, dynamic> json) {
  final ModelCtrlEntity modelCtrlEntity = ModelCtrlEntity();
  final int? activeType = jsonConvert.convert<int>(json['activeType']);
  if (activeType != null) {
    modelCtrlEntity.activeType = activeType;
  }
  final dynamic power = json['power'];
  if (power != null) {
    modelCtrlEntity.power = power;
  }
  final dynamic peak = json['peak'];
  if (peak != null) {
    modelCtrlEntity.peak = peak;
  }
  final dynamic demand = json['demand'];
  if (demand != null) {
    modelCtrlEntity.demand = demand;
  }
  final dynamic sub = json['sub'];
  if (sub != null) {
    modelCtrlEntity.sub = sub;
  }
  final dynamic selfGenerateInfo = json['selfGenerateInfo'];
  if (selfGenerateInfo != null) {
    modelCtrlEntity.selfGenerateInfo = selfGenerateInfo;
  }
  return modelCtrlEntity;
}

Map<String, dynamic> $ModelCtrlEntityToJson(ModelCtrlEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['activeType'] = entity.activeType;
  data['power'] = entity.power;
  data['peak'] = entity.peak;
  data['demand'] = entity.demand;
  data['sub'] = entity.sub;
  data['selfGenerateInfo'] = entity.selfGenerateInfo;
  return data;
}

extension ModelCtrlEntityExtension on ModelCtrlEntity {
  ModelCtrlEntity copyWith({
    int? activeType,
    dynamic power,
    dynamic peak,
    dynamic demand,
    dynamic sub,
    dynamic selfGenerateInfo,
  }) {
    return ModelCtrlEntity()
      ..activeType = activeType ?? this.activeType
      ..power = power ?? this.power
      ..peak = peak ?? this.peak
      ..demand = demand ?? this.demand
      ..sub = sub ?? this.sub
      ..selfGenerateInfo = selfGenerateInfo ?? this.selfGenerateInfo;
  }
}