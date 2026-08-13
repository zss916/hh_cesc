import 'package:cescpro/generated/json/base/json_convert_content.dart';
import 'package:cescpro/http/bean/weather_entity.dart';

WeatherEntity $WeatherEntityFromJson(Map<String, dynamic> json) {
  final WeatherEntity weatherEntity = WeatherEntity();
  final int? siteId = jsonConvert.convert<int>(json['siteId']);
  if (siteId != null) {
    weatherEntity.siteId = siteId;
  }
  final String? date = jsonConvert.convert<String>(json['date']);
  if (date != null) {
    weatherEntity.date = date;
  }
  final String? code = jsonConvert.convert<String>(json['code']);
  if (code != null) {
    weatherEntity.code = code;
  }
  final String? desc = jsonConvert.convert<String>(json['desc']);
  if (desc != null) {
    weatherEntity.desc = desc;
  }
  final double? tempMax = jsonConvert.convert<double>(json['tempMax']);
  if (tempMax != null) {
    weatherEntity.tempMax = tempMax;
  }
  final double? tempMin = jsonConvert.convert<double>(json['tempMin']);
  if (tempMin != null) {
    weatherEntity.tempMin = tempMin;
  }
  final int? humidity = jsonConvert.convert<int>(json['humidity']);
  if (humidity != null) {
    weatherEntity.humidity = humidity;
  }
  final double? windSpeed = jsonConvert.convert<double>(json['windSpeed']);
  if (windSpeed != null) {
    weatherEntity.windSpeed = windSpeed;
  }
  return weatherEntity;
}

Map<String, dynamic> $WeatherEntityToJson(WeatherEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['siteId'] = entity.siteId;
  data['date'] = entity.date;
  data['code'] = entity.code;
  data['desc'] = entity.desc;
  data['tempMax'] = entity.tempMax;
  data['tempMin'] = entity.tempMin;
  data['humidity'] = entity.humidity;
  data['windSpeed'] = entity.windSpeed;
  return data;
}

extension WeatherEntityExtension on WeatherEntity {
  WeatherEntity copyWith({
    int? siteId,
    String? date,
    String? code,
    String? desc,
    double? tempMax,
    double? tempMin,
    int? humidity,
    double? windSpeed,
  }) {
    return WeatherEntity()
      ..siteId = siteId ?? this.siteId
      ..date = date ?? this.date
      ..code = code ?? this.code
      ..desc = desc ?? this.desc
      ..tempMax = tempMax ?? this.tempMax
      ..tempMin = tempMin ?? this.tempMin
      ..humidity = humidity ?? this.humidity
      ..windSpeed = windSpeed ?? this.windSpeed;
  }
}