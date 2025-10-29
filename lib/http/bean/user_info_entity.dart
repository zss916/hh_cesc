import 'dart:convert';

import 'package:cescpro/generated/json/base/json_field.dart';
import 'package:cescpro/generated/json/user_info_entity.g.dart';

@JsonSerializable()
class UserInfoEntity {
  int? tenantId;
  int? cid;
  int? id;
  String? username;
  dynamic icon;
  dynamic email;
  dynamic nickName;
  int? accStatus;
  int? limitPass;
  String? userPhone;
  String? loginTime;
  dynamic logoUrl;
  dynamic currencyCode;

  UserInfoEntity();

  factory UserInfoEntity.fromJson(Map<String, dynamic> json) =>
      $UserInfoEntityFromJson(json);

  Map<String, dynamic> toJson() => $UserInfoEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}
