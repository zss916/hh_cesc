import 'dart:convert';

import 'package:cescpro/generated/json/base/json_field.dart';
import 'package:cescpro/generated/json/child_item_info.g.dart';

@JsonSerializable()
class ChildItemInfo {
  String? unitName;
  int? unitSort;
  String? fieldName;
  String? name;
  dynamic value;

  ChildItemInfo();

  factory ChildItemInfo.fromJson(Map<String, dynamic> json) =>
      $ChildItemInfoFromJson(json);

  Map<String, dynamic> toJson() => $ChildItemInfoToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}
