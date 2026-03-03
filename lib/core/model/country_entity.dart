import 'dart:convert';

import 'package:cescpro/generated/json/base/json_field.dart';
import 'package:cescpro/generated/json/country_entity.g.dart';
import 'package:get/get.dart';

export 'package:cescpro/generated/json/country_entity.g.dart';

@JsonSerializable()
class CountryEntity {
  String? en;
  String? zh;
  String? de;
  String? es;
  String? code;

  CountryEntity();

  factory CountryEntity.fromJson(Map<String, dynamic> json) =>
      $CountryEntityFromJson(json);

  Map<String, dynamic> toJson() => $CountryEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }

  String? getLocaleName() {
    switch (Get.locale?.languageCode) {
      case 'en':
        return en;
      case 'de':
        return de;
      case 'es':
        return es;
      case 'zh':
        return zh;
      default:
        return en;
    }
  }
}
