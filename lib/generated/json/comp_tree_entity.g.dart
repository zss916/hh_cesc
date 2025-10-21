import 'package:cescpro/generated/json/base/json_convert_content.dart';
import 'package:cescpro/http/bean/comp_tree_entity.dart';

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
  final List<CompTreeChild>? child = (json['child'] as List<dynamic>?)
      ?.map((e) => jsonConvert.convert<CompTreeChild>(e) as CompTreeChild)
      .toList();
  if (child != null) {
    compTreeEntity.child = child;
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
    List<CompTreeChild>? child,
  }) {
    return CompTreeEntity()
      ..label = label ?? this.label
      ..key = key ?? this.key
      ..val = val ?? this.val
      ..type = type ?? this.type
      ..labelVal = labelVal ?? this.labelVal
      ..labelCn = labelCn ?? this.labelCn
      ..labelEn = labelEn ?? this.labelEn
      ..child = child ?? this.child;
  }
}

CompTreeChild $CompTreeChildFromJson(Map<String, dynamic> json) {
  final CompTreeChild compTreeChild = CompTreeChild();
  final String? label = jsonConvert.convert<String>(json['label']);
  if (label != null) {
    compTreeChild.label = label;
  }
  final String? key = jsonConvert.convert<String>(json['key']);
  if (key != null) {
    compTreeChild.key = key;
  }
  final int? val = jsonConvert.convert<int>(json['val']);
  if (val != null) {
    compTreeChild.val = val;
  }
  final String? type = jsonConvert.convert<String>(json['type']);
  if (type != null) {
    compTreeChild.type = type;
  }
  final String? labelVal = jsonConvert.convert<String>(json['labelVal']);
  if (labelVal != null) {
    compTreeChild.labelVal = labelVal;
  }
  final String? labelCn = jsonConvert.convert<String>(json['labelCn']);
  if (labelCn != null) {
    compTreeChild.labelCn = labelCn;
  }
  final String? labelEn = jsonConvert.convert<String>(json['labelEn']);
  if (labelEn != null) {
    compTreeChild.labelEn = labelEn;
  }
  final List<CompTreeChild>? child = (json['child'] as List<dynamic>?)
      ?.map((e) => jsonConvert.convert<CompTreeChild>(e) as CompTreeChild)
      .toList();
  if (child != null) {
    compTreeChild.child = child;
  }
  return compTreeChild;
}

Map<String, dynamic> $CompTreeChildToJson(CompTreeChild entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['label'] = entity.label;
  data['key'] = entity.key;
  data['val'] = entity.val;
  data['type'] = entity.type;
  data['labelVal'] = entity.labelVal;
  data['labelCn'] = entity.labelCn;
  data['labelEn'] = entity.labelEn;
  data['child'] = entity.child?.map((v) => v.toJson()).toList();
  return data;
}

extension CompTreeChildExtension on CompTreeChild {
  CompTreeChild copyWith({
    String? label,
    String? key,
    int? val,
    String? type,
    String? labelVal,
    String? labelCn,
    String? labelEn,
    List<CompTreeChild>? child,
  }) {
    return CompTreeChild()
      ..label = label ?? this.label
      ..key = key ?? this.key
      ..val = val ?? this.val
      ..type = type ?? this.type
      ..labelVal = labelVal ?? this.labelVal
      ..labelCn = labelCn ?? this.labelCn
      ..labelEn = labelEn ?? this.labelEn
      ..child = child ?? this.child;
  }
}
