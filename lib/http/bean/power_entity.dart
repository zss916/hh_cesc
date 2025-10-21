import 'dart:convert';

import 'package:cescpro/generated/json/base/json_field.dart';
import 'package:cescpro/generated/json/power_entity.g.dart';

export 'package:cescpro/generated/json/power_entity.g.dart';

@JsonSerializable()
class PowerEntity {
  int? time;
  double? power;

  PowerEntity();

  factory PowerEntity.fromJson(Map<String, dynamic> json) =>
      $PowerEntityFromJson(json);

  Map<String, dynamic> toJson() => $PowerEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}
