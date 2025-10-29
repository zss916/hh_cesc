import 'dart:convert';

import 'package:cescpro/generated/json/base/json_field.dart';
import 'package:cescpro/generated/json/token_entity.g.dart';

export 'package:cescpro/generated/json/token_entity.g.dart';

@JsonSerializable()
class TokenEntity {
  String? tokenHead;
  int? expires;
  String? accessToken;
  String? refreshToken;

  TokenEntity();

  factory TokenEntity.fromJson(Map<String, dynamic> json) =>
      $TokenEntityFromJson(json);

  Map<String, dynamic> toJson() => $TokenEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }

  String get tokenHeadValue => tokenHead ?? '';

  String get tokenValue => accessToken ?? '';
}
