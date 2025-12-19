import 'package:cescpro/generated/json/base/json_convert_content.dart';
import 'package:cescpro/http/bean/child_item_info.dart';

ChildItemInfo $ChildItemInfoFromJson(Map<String, dynamic> json) {
  final ChildItemInfo childItemInfo = ChildItemInfo();
  final String? unitName = jsonConvert.convert<String>(json['unitName']);
  if (unitName != null) {
    childItemInfo.unitName = unitName;
  }
  final int? unitSort = jsonConvert.convert<int>(json['unitSort']);
  if (unitSort != null) {
    childItemInfo.unitSort = unitSort;
  }
  final String? fieldName = jsonConvert.convert<String>(json['fieldName']);
  if (fieldName != null) {
    childItemInfo.fieldName = fieldName;
  }
  final String? name = jsonConvert.convert<String>(json['name']);
  if (name != null) {
    childItemInfo.name = name;
  }
  final dynamic value = json['value'];
  if (value != null) {
    childItemInfo.value = value;
  }
  return childItemInfo;
}

Map<String, dynamic> $ChildItemInfoToJson(ChildItemInfo entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['unitName'] = entity.unitName;
  data['unitSort'] = entity.unitSort;
  data['fieldName'] = entity.fieldName;
  data['name'] = entity.name;
  data['value'] = entity.value;
  return data;
}

extension ChildItemInfoExtension on ChildItemInfo {
  ChildItemInfo copyWith({
    String? unitName,
    int? unitSort,
    String? fieldName,
    String? name,
    dynamic value,
  }) {
    return ChildItemInfo()
      ..unitName = unitName ?? this.unitName
      ..unitSort = unitSort ?? this.unitSort
      ..fieldName = fieldName ?? this.fieldName
      ..name = name ?? this.name
      ..value = value ?? this.value;
  }
}
