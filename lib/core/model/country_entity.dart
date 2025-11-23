import 'dart:convert';

import 'package:cescpro/core/helper/extension_helper.dart';
import 'package:cescpro/generated/json/base/json_field.dart';
import 'package:cescpro/generated/json/country_entity.g.dart';
import 'package:get/get.dart';

export 'package:cescpro/generated/json/country_entity.g.dart';

@JsonSerializable()
class CountryEntity {
  String? en;
  String? zh;
  String? code;

  CountryEntity();

  factory CountryEntity.fromJson(Map<String, dynamic> json) =>
      $CountryEntityFromJson(json);

  Map<String, dynamic> toJson() => $CountryEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }

  String get name => Get.isEn ? (en ?? "") : (zh ?? "");
}
