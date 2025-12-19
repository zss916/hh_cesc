import 'package:cescpro/generated/json/base/json_convert_content.dart';
import 'package:cescpro/http/bean/power_entity.dart';

PowerEntity $PowerEntityFromJson(Map<String, dynamic> json) {
  final PowerEntity powerEntity = PowerEntity();
  final int? time = jsonConvert.convert<int>(json['time']);
  if (time != null) {
    powerEntity.time = time;
  }
  final double? power = jsonConvert.convert<double>(json['power']);
  if (power != null) {
    powerEntity.power = power;
  }
  return powerEntity;
}

Map<String, dynamic> $PowerEntityToJson(PowerEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['time'] = entity.time;
  data['power'] = entity.power;
  return data;
}

extension PowerEntityExtension on PowerEntity {
  PowerEntity copyWith({
    int? time,
    double? power,
  }) {
    return PowerEntity()
      ..time = time ?? this.time
      ..power = power ?? this.power;
  }
}