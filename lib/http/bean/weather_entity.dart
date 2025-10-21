import 'dart:convert';

import 'package:cescpro/generated/json/base/json_field.dart';
import 'package:cescpro/generated/json/weather_entity.g.dart';

export 'package:cescpro/generated/json/weather_entity.g.dart';

@JsonSerializable()
class WeatherEntity {
  int? siteId;
  String? date;
  String? code; //天气代码
  String? desc;
  double? tempMax; //最高温度
  double? tempMin; //最低温度
  int? humidity; //湿度
  double? windSpeed; //风速

  WeatherEntity();

  factory WeatherEntity.fromJson(Map<String, dynamic> json) =>
      $WeatherEntityFromJson(json);

  Map<String, dynamic> toJson() => $WeatherEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}
