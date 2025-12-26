import 'dart:convert';

import 'package:cescpro/generated/json/base/json_field.dart';
import 'package:cescpro/generated/json/currency_entity.g.dart';

export 'package:cescpro/generated/json/currency_entity.g.dart';

@JsonSerializable()
class CurrencyEntity {
  double? id;
  String? name;
  String? symbol;
  String? enName;
  String? code;

  CurrencyEntity();

  factory CurrencyEntity.fromJson(Map<String, dynamic> json) =>
      $CurrencyEntityFromJson(json);

  Map<String, dynamic> toJson() => $CurrencyEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}
