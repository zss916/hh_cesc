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
  int? revenueShowType;

  ///1:所有站点，2:计算收益的站点 3:不展示

  UserInfoEntity();

  factory UserInfoEntity.fromJson(Map<String, dynamic> json) =>
      $UserInfoEntityFromJson(json);

  Map<String, dynamic> toJson() => $UserInfoEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }

  ///是否显示收益
  bool get isShowRevenue => (revenueShowType != 3 && revenueShowType != null);
}
