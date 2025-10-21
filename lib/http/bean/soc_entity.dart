import 'dart:convert';

import 'package:cescpro/generated/json/base/json_field.dart';
import 'package:cescpro/generated/json/soc_entity.g.dart';

export 'package:cescpro/generated/json/soc_entity.g.dart';

@JsonSerializable()
class SocEntity {
  int? time;
  int? soc;
  double? power;

  SocEntity();

  factory SocEntity.fromJson(Map<String, dynamic> json) =>
      $SocEntityFromJson(json);

  Map<String, dynamic> toJson() => $SocEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}
