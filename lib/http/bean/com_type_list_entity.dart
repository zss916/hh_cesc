import 'dart:convert';

import 'package:cescpro/generated/json/base/json_field.dart';
import 'package:cescpro/generated/json/com_type_list_entity.g.dart';

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
}
