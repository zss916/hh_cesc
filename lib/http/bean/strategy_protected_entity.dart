import 'dart:convert';

import 'package:cescpro/generated/json/base/json_field.dart';
import 'package:cescpro/generated/json/strategy_protected_entity.g.dart';

export 'package:cescpro/generated/json/strategy_protected_entity.g.dart';

@JsonSerializable()
class StrategyProtectedEntity {
  ///电压保护
  bool? volEnabled;

  ///soc保护
  bool? socEnabled;

  ///温度保护
  bool? temEnabled;

  ///防逆流保护
  bool? backEnabled;

  ///需量保护
  bool? needEnabled;

  StrategyProtectedEntity();

  factory StrategyProtectedEntity.fromJson(Map<String, dynamic> json) =>
      $StrategyProtectedEntityFromJson(json);

  Map<String, dynamic> toJson() => $StrategyProtectedEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}
