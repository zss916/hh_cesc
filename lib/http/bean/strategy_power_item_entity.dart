import 'dart:convert';

import 'package:cescpro/generated/json/base/json_field.dart';
import 'package:cescpro/generated/json/strategy_power_item_entity.g.dart';

export 'package:cescpro/generated/json/strategy_power_item_entity.g.dart';

@JsonSerializable()
class StrategyPowerItemEntity {
  double? time;
  double? strategyPower;
  double? actualPower;

  StrategyPowerItemEntity();

  factory StrategyPowerItemEntity.fromJson(Map<String, dynamic> json) =>
      $StrategyPowerItemEntityFromJson(json);

  Map<String, dynamic> toJson() => $StrategyPowerItemEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}
