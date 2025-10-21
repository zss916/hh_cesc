import 'package:cescpro/generated/json/base/json_convert_content.dart';
import 'package:cescpro/http/bean/com_type_list_entity.dart';

ComTypeListEntity $ComTypeListEntityFromJson(Map<String, dynamic> json) {
  final ComTypeListEntity comTypeListEntity = ComTypeListEntity();
  final int? statusUpdateTimeMill = jsonConvert.convert<int>(
    json['statusUpdateTimeMill'],
  );
  if (statusUpdateTimeMill != null) {
    comTypeListEntity.statusUpdateTimeMill = statusUpdateTimeMill;
  }
  final List<ComTypeListItem>? selfList = (json['selfList'] as List<dynamic>?)
      ?.map((e) => jsonConvert.convert<ComTypeListItem>(e) as ComTypeListItem)
      .toList();
  if (selfList != null) {
    comTypeListEntity.selfList = selfList;
  }
  final List<List<ComTypeListItem>>? otherList =
      (json['otherList'] as List<dynamic>?)
          ?.map(
            (e) => (e as List<dynamic>)
                .map(
                  (e) =>
                      jsonConvert.convert<ComTypeListItem>(e)
                          as ComTypeListItem,
                )
                .toList(),
          )
          .toList();
  if (otherList != null) {
    comTypeListEntity.otherList = otherList;
  }
  return comTypeListEntity;
}

Map<String, dynamic> $ComTypeListEntityToJson(ComTypeListEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['statusUpdateTimeMill'] = entity.statusUpdateTimeMill;
  data['selfList'] = entity.selfList?.map((v) => v.toJson()).toList();
  data['otherList'] = entity.otherList;
  return data;
}

extension ComTypeListEntityExtension on ComTypeListEntity {
  ComTypeListEntity copyWith({
    int? statusUpdateTimeMill,
    List<ComTypeListItem>? selfList,
    List<List<ComTypeListItem>>? otherList,
  }) {
    return ComTypeListEntity()
      ..statusUpdateTimeMill = statusUpdateTimeMill ?? this.statusUpdateTimeMill
      ..selfList = selfList ?? this.selfList
      ..otherList = otherList ?? this.otherList;
  }
}

ComTypeListItem $ComTypeListItemFromJson(Map<String, dynamic> json) {
  final ComTypeListItem comTypeListItem = ComTypeListItem();
  final String? devType = jsonConvert.convert<String>(json['devType']);
  if (devType != null) {
    comTypeListItem.devType = devType;
  }
  final String? fieldName = jsonConvert.convert<String>(json['fieldName']);
  if (fieldName != null) {
    comTypeListItem.fieldName = fieldName;
  }
  final String? fieldNameCn = jsonConvert.convert<String>(json['fieldNameCn']);
  if (fieldNameCn != null) {
    comTypeListItem.fieldNameCn = fieldNameCn;
  }
  final String? fieldNameEn = jsonConvert.convert<String>(json['fieldNameEn']);
  if (fieldNameEn != null) {
    comTypeListItem.fieldNameEn = fieldNameEn;
  }
  final String? unit = jsonConvert.convert<String>(json['unit']);
  if (unit != null) {
    comTypeListItem.unit = unit;
  }
  final int? sort = jsonConvert.convert<int>(json['sort']);
  if (sort != null) {
    comTypeListItem.sort = sort;
  }
  final String? value = jsonConvert.convert<String>(json['value']);
  if (value != null) {
    comTypeListItem.value = value;
  }
  final String? enValue = jsonConvert.convert<String>(json['enValue']);
  if (enValue != null) {
    comTypeListItem.enValue = enValue;
  }
  return comTypeListItem;
}

Map<String, dynamic> $ComTypeListItemToJson(ComTypeListItem entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['devType'] = entity.devType;
  data['fieldName'] = entity.fieldName;
  data['fieldNameCn'] = entity.fieldNameCn;
  data['fieldNameEn'] = entity.fieldNameEn;
  data['unit'] = entity.unit;
  data['sort'] = entity.sort;
  data['value'] = entity.value;
  data['enValue'] = entity.enValue;
  return data;
}

extension ComTypeListItemExtension on ComTypeListItem {
  ComTypeListItem copyWith({
    String? devType,
    String? fieldName,
    String? fieldNameCn,
    String? fieldNameEn,
    String? unit,
    int? sort,
    String? value,
    String? enValue,
  }) {
    return ComTypeListItem()
      ..devType = devType ?? this.devType
      ..fieldName = fieldName ?? this.fieldName
      ..fieldNameCn = fieldNameCn ?? this.fieldNameCn
      ..fieldNameEn = fieldNameEn ?? this.fieldNameEn
      ..unit = unit ?? this.unit
      ..sort = sort ?? this.sort
      ..value = value ?? this.value
      ..enValue = enValue ?? this.enValue;
  }
}
