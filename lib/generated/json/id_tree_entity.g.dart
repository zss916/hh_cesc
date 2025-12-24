import 'package:cescpro/generated/json/base/json_convert_content.dart';
import 'package:cescpro/http/bean/id_tree_entity.dart';

IdTreeEntity $IdTreeEntityFromJson(Map<String, dynamic> json) {
  final IdTreeEntity idTreeEntity = IdTreeEntity();
  final String? label = jsonConvert.convert<String>(json['label']);
  if (label != null) {
    idTreeEntity.label = label;
  }
  final String? key = jsonConvert.convert<String>(json['key']);
  if (key != null) {
    idTreeEntity.key = key;
  }
  final int? val = jsonConvert.convert<int>(json['val']);
  if (val != null) {
    idTreeEntity.val = val;
  }
  final dynamic type = json['type'];
  if (type != null) {
    idTreeEntity.type = type;
  }
  final dynamic labelVal = json['labelVal'];
  if (labelVal != null) {
    idTreeEntity.labelVal = labelVal;
  }
  final String? labelCn = jsonConvert.convert<String>(json['labelCn']);
  if (labelCn != null) {
    idTreeEntity.labelCn = labelCn;
  }
  final String? labelEn = jsonConvert.convert<String>(json['labelEn']);
  if (labelEn != null) {
    idTreeEntity.labelEn = labelEn;
  }
  final List<IdTreeEntity>? child = (json['child'] as List<dynamic>?)
      ?.map((e) => jsonConvert.convert<IdTreeEntity>(e) as IdTreeEntity)
      .toList();
  if (child != null) {
    idTreeEntity.child = child;
  }
  final bool? isSelected = jsonConvert.convert<bool>(json['isSelected']);
  if (isSelected != null) {
    idTreeEntity.isSelected = isSelected;
  }
  final bool? isChildSelected = jsonConvert.convert<bool>(
    json['isChildSelected'],
  );
  if (isChildSelected != null) {
    idTreeEntity.isChildSelected = isChildSelected;
  }
  final bool? isChildChildSelected = jsonConvert.convert<bool>(
    json['isChildChildSelected'],
  );
  if (isChildChildSelected != null) {
    idTreeEntity.isChildChildSelected = isChildChildSelected;
  }
  final String? selectTitle = jsonConvert.convert<String>(json['selectTitle']);
  if (selectTitle != null) {
    idTreeEntity.selectTitle = selectTitle;
  }
  return idTreeEntity;
}

Map<String, dynamic> $IdTreeEntityToJson(IdTreeEntity entity) {
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
  data['selectTitle'] = entity.selectTitle;
  return data;
}

extension IdTreeEntityExtension on IdTreeEntity {
  IdTreeEntity copyWith({
    String? label,
    String? key,
    int? val,
    dynamic type,
    dynamic labelVal,
    String? labelCn,
    String? labelEn,
    List<IdTreeEntity>? child,
    bool? isSelected,
    bool? isChildSelected,
    bool? isChildChildSelected,
    String? selectTitle,
  }) {
    return IdTreeEntity()
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
      ..isChildChildSelected = isChildChildSelected ?? this.isChildChildSelected
      ..selectTitle = selectTitle ?? this.selectTitle;
  }
}
