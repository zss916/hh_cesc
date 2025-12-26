import 'package:cescpro/generated/json/base/json_convert_content.dart';
import 'package:cescpro/http/bean/comp_tree_entity.dart';
import 'package:cescpro/core/helper/extension_helper.dart';

import 'package:get/get_core/src/get_main.dart';


CompTreeEntity $CompTreeEntityFromJson(Map<String, dynamic> json) {
  final CompTreeEntity compTreeEntity = CompTreeEntity();
  final String? label = jsonConvert.convert<String>(json['label']);
  if (label != null) {
    compTreeEntity.label = label;
  }
  final String? key = jsonConvert.convert<String>(json['key']);
  if (key != null) {
    compTreeEntity.key = key;
  }
  final int? val = jsonConvert.convert<int>(json['val']);
  if (val != null) {
    compTreeEntity.val = val;
  }
  final String? type = jsonConvert.convert<String>(json['type']);
  if (type != null) {
    compTreeEntity.type = type;
  }
  final String? labelVal = jsonConvert.convert<String>(json['labelVal']);
  if (labelVal != null) {
    compTreeEntity.labelVal = labelVal;
  }
  final String? labelCn = jsonConvert.convert<String>(json['labelCn']);
  if (labelCn != null) {
    compTreeEntity.labelCn = labelCn;
  }
  final String? labelEn = jsonConvert.convert<String>(json['labelEn']);
  if (labelEn != null) {
    compTreeEntity.labelEn = labelEn;
  }
  final List<CompTreeEntity>? child = (json['child'] as List<dynamic>?)
      ?.map(
          (e) => jsonConvert.convert<CompTreeEntity>(e) as CompTreeEntity)
      .toList();
  if (child != null) {
    compTreeEntity.child = child;
  }
  final bool? isSelected = jsonConvert.convert<bool>(json['isSelected']);
  if (isSelected != null) {
    compTreeEntity.isSelected = isSelected;
  }
  final bool? isChildSelected = jsonConvert.convert<bool>(
      json['isChildSelected']);
  if (isChildSelected != null) {
    compTreeEntity.isChildSelected = isChildSelected;
  }
  final bool? isChildChildSelected = jsonConvert.convert<bool>(
      json['isChildChildSelected']);
  if (isChildChildSelected != null) {
    compTreeEntity.isChildChildSelected = isChildChildSelected;
  }
  return compTreeEntity;
}

Map<String, dynamic> $CompTreeEntityToJson(CompTreeEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['label'] = entity.label;
  data['key'] = entity.key;
  data['val'] = entity.val;
  data['type'] = entity.type;
  data['labelVal'] = entity.labelVal;
  data['labelCn'] = entity.labelCn;
  data['labelEn'] = entity.labelEn;
  data['child'] = entity.child?.map((v) => v.toJson()).toList();
  data['isSelected'] = entity.isSelected;
  data['isChildSelected'] = entity.isChildSelected;
  data['isChildChildSelected'] = entity.isChildChildSelected;
  return data;
}

extension CompTreeEntityExtension on CompTreeEntity {
  CompTreeEntity copyWith({
    String? label,
    String? key,
    int? val,
    String? type,
    String? labelVal,
    String? labelCn,
    String? labelEn,
    List<CompTreeEntity>? child,
    bool? isSelected,
    bool? isChildSelected,
    bool? isChildChildSelected,
  }) {
    return CompTreeEntity()
      ..label = label ?? this.label
      ..key = key ?? this.key
      ..val = val ?? this.val
      ..type = type ?? this.type
      ..labelVal = labelVal ?? this.labelVal
      ..labelCn = labelCn ?? this.labelCn
      ..labelEn = labelEn ?? this.labelEn
      ..child = child ?? this.child
      ..isSelected = isSelected ?? this.isSelected
      ..isChildSelected = isChildSelected ?? this.isChildSelected
      ..isChildChildSelected = isChildChildSelected ??
          this.isChildChildSelected;
  }
}