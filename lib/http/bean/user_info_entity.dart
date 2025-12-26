import 'dart:convert';

import 'package:cescpro/generated/json/base/json_field.dart';
import 'package:cescpro/generated/json/user_info_entity.g.dart';

@JsonSerializable()
class UserInfoEntity {
  int? tenantId;
  int? cid;
  int? id;
  String? username;
  String? icon;
  String? email;
  String? nickName;
  int? accStatus;
  int? limitPass;
  String? userPhone;
  String? loginTime;
  String? logoUrl;
  String? currencyCode;

  UserInfoEntity();

  factory UserInfoEntity.fromJson(Map<String, dynamic> json) =>
      $UserInfoEntityFromJson(json);

  Map<String, dynamic> toJson() => $UserInfoEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}
