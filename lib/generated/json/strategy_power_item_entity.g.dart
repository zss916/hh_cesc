import 'package:cescpro/generated/json/base/json_convert_content.dart';
import 'package:cescpro/http/bean/strategy_power_item_entity.dart';

StrategyPowerItemEntity $StrategyPowerItemEntityFromJson(
    Map<String, dynamic> json) {
  final StrategyPowerItemEntity strategyPowerItemEntity = StrategyPowerItemEntity();
  final double? time = jsonConvert.convert<double>(json['time']);
  if (time != null) {
    strategyPowerItemEntity.time = time;
  }
  final double? strategyPower = jsonConvert.convert<double>(
      json['strategyPower']);
  if (strategyPower != null) {
    strategyPowerItemEntity.strategyPower = strategyPower;
  }
  final double? actualPower = jsonConvert.convert<double>(json['actualPower']);
  if (actualPower != null) {
    strategyPowerItemEntity.actualPower = actualPower;
  }
  return strategyPowerItemEntity;
}

Map<String, dynamic> $StrategyPowerItemEntityToJson(
    StrategyPowerItemEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['time'] = entity.time;
  data['strategyPower'] = entity.strategyPower;
  data['actualPower'] = entity.actualPower;
  return data;
}

extension StrategyPowerItemEntityExtension on StrategyPowerItemEntity {
  StrategyPowerItemEntity copyWith({
    double? time,
    double? strategyPower,
    double? actualPower,
  }) {
    return StrategyPowerItemEntity()
      ..time = time ?? this.time
      ..strategyPower = strategyPower ?? this.strategyPower
      ..actualPower = actualPower ?? this.actualPower;
  }
}