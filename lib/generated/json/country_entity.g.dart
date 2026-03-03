import 'package:cescpro/core/model/country_entity.dart';
import 'package:cescpro/generated/json/base/json_convert_content.dart';

CountryEntity $CountryEntityFromJson(Map<String, dynamic> json) {
  final CountryEntity countryEntity = CountryEntity();
  final String? en = jsonConvert.convert<String>(json['en']);
  if (en != null) {
    countryEntity.en = en;
  }
  final String? zh = jsonConvert.convert<String>(json['zh']);
  if (zh != null) {
    countryEntity.zh = zh;
  }
  final String? de = jsonConvert.convert<String>(json['de']);
  if (de != null) {
    countryEntity.de = de;
  }
  final String? es = jsonConvert.convert<String>(json['es']);
  if (es != null) {
    countryEntity.es = es;
  }
  final String? code = jsonConvert.convert<String>(json['code']);
  if (code != null) {
    countryEntity.code = code;
  }
  return countryEntity;
}

Map<String, dynamic> $CountryEntityToJson(CountryEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['en'] = entity.en;
  data['zh'] = entity.zh;
  data['de'] = entity.de;
  data['es'] = entity.es;
  data['code'] = entity.code;
  return data;
}

extension CountryEntityExtension on CountryEntity {
  CountryEntity copyWith({
    String? en,
    String? zh,
    String? de,
    String? es,
    String? code,
  }) {
    return CountryEntity()
      ..en = en ?? this.en
      ..zh = zh ?? this.zh
      ..de = de ?? this.de
      ..es = es ?? this.es
      ..code = code ?? this.code;
  }
}
