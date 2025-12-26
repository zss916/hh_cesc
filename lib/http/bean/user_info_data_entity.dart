import 'dart:convert';

import 'package:cescpro/generated/json/base/json_field.dart';
import 'package:cescpro/generated/json/user_info_data_entity.g.dart';

export 'package:cescpro/generated/json/user_info_data_entity.g.dart';

@JsonSerializable()
class UserInfoDataEntity {
  UserInfoDataUserInfo? userInfo;
  List<String>? roles;
  List<UserInfoDataMenus>? menus;
  List<UserInfoDataRoleList>? roleList;

  UserInfoDataEntity();

  factory UserInfoDataEntity.fromJson(Map<String, dynamic> json) =>
      $UserInfoDataEntityFromJson(json);

  Map<String, dynamic> toJson() => $UserInfoDataEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class UserInfoDataUserInfo {
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
  dynamic logoUrl;
  String? currencyCode;

  UserInfoDataUserInfo();

  factory UserInfoDataUserInfo.fromJson(Map<String, dynamic> json) =>
      $UserInfoDataUserInfoFromJson(json);

  Map<String, dynamic> toJson() => $UserInfoDataUserInfoToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class UserInfoDataMenus {
  dynamic createTime;
  dynamic modifyTime;
  dynamic createdByName;
  dynamic modifiedByName;
  dynamic createdId;
  dynamic modifiedId;
  dynamic cid;
  int? id;
  int? parentId;
  String? title;
  int? level;
  int? sort;
  String? name;
  String? path;
  dynamic type;
  String? icon;
  int? hidden;
  int? keepAlive;

  UserInfoDataMenus();

  factory UserInfoDataMenus.fromJson(Map<String, dynamic> json) =>
      $UserInfoDataMenusFromJson(json);

  Map<String, dynamic> toJson() => $UserInfoDataMenusToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class UserInfoDataRoleList {
  int? id;
  String? name;
  String? description;
  int? status;

  UserInfoDataRoleList();

  factory UserInfoDataRoleList.fromJson(Map<String, dynamic> json) =>
      $UserInfoDataRoleListFromJson(json);

  Map<String, dynamic> toJson() => $UserInfoDataRoleListToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}
