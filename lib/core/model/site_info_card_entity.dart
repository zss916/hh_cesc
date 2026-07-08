import 'dart:convert';

import 'package:cescpro/generated/json/base/json_field.dart';
import 'package:cescpro/generated/json/site_info_card_entity.g.dart';

export 'package:cescpro/generated/json/site_info_card_entity.g.dart';

@JsonSerializable()
class SiteInfoCardEntity {
  int? id;
  String? icon;
  String? value;
  String? unit;
  String? title;
  String? image;

  SiteInfoCardEntity();

  factory SiteInfoCardEntity.fromJson(Map<String, dynamic> json) =>
      $SiteInfoCardEntityFromJson(json);

  Map<String, dynamic> toJson() => $SiteInfoCardEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}
