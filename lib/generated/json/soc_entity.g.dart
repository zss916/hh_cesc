import 'package:cescpro/generated/json/base/json_convert_content.dart';
import 'package:cescpro/http/bean/soc_entity.dart';

SocEntity $SocEntityFromJson(Map<String, dynamic> json) {
  final SocEntity socEntity = SocEntity();
  final int? time = jsonConvert.convert<int>(json['time']);
  if (time != null) {
    socEntity.time = time;
  }
  final int? soc = jsonConvert.convert<int>(json['soc']);
  if (soc != null) {
    socEntity.soc = soc;
  }
  final double? power = jsonConvert.convert<double>(json['power']);
  if (power != null) {
    socEntity.power = power;
  }
  return socEntity;
}

Map<String, dynamic> $SocEntityToJson(SocEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['time'] = entity.time;
  data['soc'] = entity.soc;
  data['power'] = entity.power;
  return data;
}

extension SocEntityExtension on SocEntity {
  SocEntity copyWith({
    int? time,
    int? soc,
    double? power,
  }) {
    return SocEntity()
      ..time = time ?? this.time
      ..soc = soc ?? this.soc
      ..power = power ?? this.power;
  }
}