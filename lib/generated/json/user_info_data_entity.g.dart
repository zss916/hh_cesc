import 'package:cescpro/generated/json/base/json_convert_content.dart';
import 'package:cescpro/http/bean/user_info_data_entity.dart';

UserInfoDataEntity $UserInfoDataEntityFromJson(Map<String, dynamic> json) {
  final UserInfoDataEntity userInfoDataEntity = UserInfoDataEntity();
  final UserInfoDataUserInfo? userInfo = jsonConvert.convert<
      UserInfoDataUserInfo>(json['userInfo']);
  if (userInfo != null) {
    userInfoDataEntity.userInfo = userInfo;
  }
  final List<String>? roles = (json['roles'] as List<dynamic>?)?.map(
          (e) => jsonConvert.convert<String>(e) as String).toList();
  if (roles != null) {
    userInfoDataEntity.roles = roles;
  }
  final List<UserInfoDataMenus>? menus = (json['menus'] as List<dynamic>?)
      ?.map(
          (e) => jsonConvert.convert<UserInfoDataMenus>(e) as UserInfoDataMenus)
      .toList();
  if (menus != null) {
    userInfoDataEntity.menus = menus;
  }
  final List<UserInfoDataRoleList>? roleList = (json['roleList'] as List<
      dynamic>?)
      ?.map(
          (e) =>
      jsonConvert.convert<UserInfoDataRoleList>(e) as UserInfoDataRoleList)
      .toList();
  if (roleList != null) {
    userInfoDataEntity.roleList = roleList;
  }
  return userInfoDataEntity;
}

Map<String, dynamic> $UserInfoDataEntityToJson(UserInfoDataEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['userInfo'] = entity.userInfo?.toJson();
  data['roles'] = entity.roles;
  data['menus'] = entity.menus?.map((v) => v.toJson()).toList();
  data['roleList'] = entity.roleList?.map((v) => v.toJson()).toList();
  return data;
}

extension UserInfoDataEntityExtension on UserInfoDataEntity {
  UserInfoDataEntity copyWith({
    UserInfoDataUserInfo? userInfo,
    List<String>? roles,
    List<UserInfoDataMenus>? menus,
    List<UserInfoDataRoleList>? roleList,
  }) {
    return UserInfoDataEntity()
      ..userInfo = userInfo ?? this.userInfo
      ..roles = roles ?? this.roles
      ..menus = menus ?? this.menus
      ..roleList = roleList ?? this.roleList;
  }
}

UserInfoDataUserInfo $UserInfoDataUserInfoFromJson(Map<String, dynamic> json) {
  final UserInfoDataUserInfo userInfoDataUserInfo = UserInfoDataUserInfo();
  final int? tenantId = jsonConvert.convert<int>(json['tenantId']);
  if (tenantId != null) {
    userInfoDataUserInfo.tenantId = tenantId;
  }
  final int? cid = jsonConvert.convert<int>(json['cid']);
  if (cid != null) {
    userInfoDataUserInfo.cid = cid;
  }
  final int? id = jsonConvert.convert<int>(json['id']);
  if (id != null) {
    userInfoDataUserInfo.id = id;
  }
  final String? username = jsonConvert.convert<String>(json['username']);
  if (username != null) {
    userInfoDataUserInfo.username = username;
  }
  final String? icon = jsonConvert.convert<String>(json['icon']);
  if (icon != null) {
    userInfoDataUserInfo.icon = icon;
  }
  final String? email = jsonConvert.convert<String>(json['email']);
  if (email != null) {
    userInfoDataUserInfo.email = email;
  }
  final String? nickName = jsonConvert.convert<String>(json['nickName']);
  if (nickName != null) {
    userInfoDataUserInfo.nickName = nickName;
  }
  final int? accStatus = jsonConvert.convert<int>(json['accStatus']);
  if (accStatus != null) {
    userInfoDataUserInfo.accStatus = accStatus;
  }
  final int? limitPass = jsonConvert.convert<int>(json['limitPass']);
  if (limitPass != null) {
    userInfoDataUserInfo.limitPass = limitPass;
  }
  final String? userPhone = jsonConvert.convert<String>(json['userPhone']);
  if (userPhone != null) {
    userInfoDataUserInfo.userPhone = userPhone;
  }
  final String? loginTime = jsonConvert.convert<String>(json['loginTime']);
  if (loginTime != null) {
    userInfoDataUserInfo.loginTime = loginTime;
  }
  final dynamic logoUrl = json['logoUrl'];
  if (logoUrl != null) {
    userInfoDataUserInfo.logoUrl = logoUrl;
  }
  final String? currencyCode = jsonConvert.convert<String>(
      json['currencyCode']);
  if (currencyCode != null) {
    userInfoDataUserInfo.currencyCode = currencyCode;
  }
  return userInfoDataUserInfo;
}

Map<String, dynamic> $UserInfoDataUserInfoToJson(UserInfoDataUserInfo entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['tenantId'] = entity.tenantId;
  data['cid'] = entity.cid;
  data['id'] = entity.id;
  data['username'] = entity.username;
  data['icon'] = entity.icon;
  data['email'] = entity.email;
  data['nickName'] = entity.nickName;
  data['accStatus'] = entity.accStatus;
  data['limitPass'] = entity.limitPass;
  data['userPhone'] = entity.userPhone;
  data['loginTime'] = entity.loginTime;
  data['logoUrl'] = entity.logoUrl;
  data['currencyCode'] = entity.currencyCode;
  return data;
}

extension UserInfoDataUserInfoExtension on UserInfoDataUserInfo {
  UserInfoDataUserInfo copyWith({
    int? tenantId,
    int? cid,
    int? id,
    String? username,
    String? icon,
    String? email,
    String? nickName,
    int? accStatus,
    int? limitPass,
    String? userPhone,
    String? loginTime,
    dynamic logoUrl,
    String? currencyCode,
  }) {
    return UserInfoDataUserInfo()
      ..tenantId = tenantId ?? this.tenantId
      ..cid = cid ?? this.cid
      ..id = id ?? this.id
      ..username = username ?? this.username
      ..icon = icon ?? this.icon
      ..email = email ?? this.email
      ..nickName = nickName ?? this.nickName
      ..accStatus = accStatus ?? this.accStatus
      ..limitPass = limitPass ?? this.limitPass
      ..userPhone = userPhone ?? this.userPhone
      ..loginTime = loginTime ?? this.loginTime
      ..logoUrl = logoUrl ?? this.logoUrl
      ..currencyCode = currencyCode ?? this.currencyCode;
  }
}

UserInfoDataMenus $UserInfoDataMenusFromJson(Map<String, dynamic> json) {
  final UserInfoDataMenus userInfoDataMenus = UserInfoDataMenus();
  final dynamic createTime = json['createTime'];
  if (createTime != null) {
    userInfoDataMenus.createTime = createTime;
  }
  final dynamic modifyTime = json['modifyTime'];
  if (modifyTime != null) {
    userInfoDataMenus.modifyTime = modifyTime;
  }
  final dynamic createdByName = json['createdByName'];
  if (createdByName != null) {
    userInfoDataMenus.createdByName = createdByName;
  }
  final dynamic modifiedByName = json['modifiedByName'];
  if (modifiedByName != null) {
    userInfoDataMenus.modifiedByName = modifiedByName;
  }
  final dynamic createdId = json['createdId'];
  if (createdId != null) {
    userInfoDataMenus.createdId = createdId;
  }
  final dynamic modifiedId = json['modifiedId'];
  if (modifiedId != null) {
    userInfoDataMenus.modifiedId = modifiedId;
  }
  final dynamic cid = json['cid'];
  if (cid != null) {
    userInfoDataMenus.cid = cid;
  }
  final int? id = jsonConvert.convert<int>(json['id']);
  if (id != null) {
    userInfoDataMenus.id = id;
  }
  final int? parentId = jsonConvert.convert<int>(json['parentId']);
  if (parentId != null) {
    userInfoDataMenus.parentId = parentId;
  }
  final String? title = jsonConvert.convert<String>(json['title']);
  if (title != null) {
    userInfoDataMenus.title = title;
  }
  final int? level = jsonConvert.convert<int>(json['level']);
  if (level != null) {
    userInfoDataMenus.level = level;
  }
  final int? sort = jsonConvert.convert<int>(json['sort']);
  if (sort != null) {
    userInfoDataMenus.sort = sort;
  }
  final String? name = jsonConvert.convert<String>(json['name']);
  if (name != null) {
    userInfoDataMenus.name = name;
  }
  final String? path = jsonConvert.convert<String>(json['path']);
  if (path != null) {
    userInfoDataMenus.path = path;
  }
  final dynamic type = json['type'];
  if (type != null) {
    userInfoDataMenus.type = type;
  }
  final String? icon = jsonConvert.convert<String>(json['icon']);
  if (icon != null) {
    userInfoDataMenus.icon = icon;
  }
  final int? hidden = jsonConvert.convert<int>(json['hidden']);
  if (hidden != null) {
    userInfoDataMenus.hidden = hidden;
  }
  final int? keepAlive = jsonConvert.convert<int>(json['keepAlive']);
  if (keepAlive != null) {
    userInfoDataMenus.keepAlive = keepAlive;
  }
  return userInfoDataMenus;
}

Map<String, dynamic> $UserInfoDataMenusToJson(UserInfoDataMenus entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['createTime'] = entity.createTime;
  data['modifyTime'] = entity.modifyTime;
  data['createdByName'] = entity.createdByName;
  data['modifiedByName'] = entity.modifiedByName;
  data['createdId'] = entity.createdId;
  data['modifiedId'] = entity.modifiedId;
  data['cid'] = entity.cid;
  data['id'] = entity.id;
  data['parentId'] = entity.parentId;
  data['title'] = entity.title;
  data['level'] = entity.level;
  data['sort'] = entity.sort;
  data['name'] = entity.name;
  data['path'] = entity.path;
  data['type'] = entity.type;
  data['icon'] = entity.icon;
  data['hidden'] = entity.hidden;
  data['keepAlive'] = entity.keepAlive;
  return data;
}

extension UserInfoDataMenusExtension on UserInfoDataMenus {
  UserInfoDataMenus copyWith({
    dynamic createTime,
    dynamic modifyTime,
    dynamic createdByName,
    dynamic modifiedByName,
    dynamic createdId,
    dynamic modifiedId,
    dynamic cid,
    int? id,
    int? parentId,
    String? title,
    int? level,
    int? sort,
    String? name,
    String? path,
    dynamic type,
    String? icon,
    int? hidden,
    int? keepAlive,
  }) {
    return UserInfoDataMenus()
      ..createTime = createTime ?? this.createTime
      ..modifyTime = modifyTime ?? this.modifyTime
      ..createdByName = createdByName ?? this.createdByName
      ..modifiedByName = modifiedByName ?? this.modifiedByName
      ..createdId = createdId ?? this.createdId
      ..modifiedId = modifiedId ?? this.modifiedId
      ..cid = cid ?? this.cid
      ..id = id ?? this.id
      ..parentId = parentId ?? this.parentId
      ..title = title ?? this.title
      ..level = level ?? this.level
      ..sort = sort ?? this.sort
      ..name = name ?? this.name
      ..path = path ?? this.path
      ..type = type ?? this.type
      ..icon = icon ?? this.icon
      ..hidden = hidden ?? this.hidden
      ..keepAlive = keepAlive ?? this.keepAlive;
  }
}

UserInfoDataRoleList $UserInfoDataRoleListFromJson(Map<String, dynamic> json) {
  final UserInfoDataRoleList userInfoDataRoleList = UserInfoDataRoleList();
  final int? id = jsonConvert.convert<int>(json['id']);
  if (id != null) {
    userInfoDataRoleList.id = id;
  }
  final String? name = jsonConvert.convert<String>(json['name']);
  if (name != null) {
    userInfoDataRoleList.name = name;
  }
  final String? description = jsonConvert.convert<String>(json['description']);
  if (description != null) {
    userInfoDataRoleList.description = description;
  }
  final int? status = jsonConvert.convert<int>(json['status']);
  if (status != null) {
    userInfoDataRoleList.status = status;
  }
  return userInfoDataRoleList;
}

Map<String, dynamic> $UserInfoDataRoleListToJson(UserInfoDataRoleList entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['id'] = entity.id;
  data['name'] = entity.name;
  data['description'] = entity.description;
  data['status'] = entity.status;
  return data;
}

extension UserInfoDataRoleListExtension on UserInfoDataRoleList {
  UserInfoDataRoleList copyWith({
    int? id,
    String? name,
    String? description,
    int? status,
  }) {
    return UserInfoDataRoleList()
      ..id = id ?? this.id
      ..name = name ?? this.name
      ..description = description ?? this.description
      ..status = status ?? this.status;
  }
}