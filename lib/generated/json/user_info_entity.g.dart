import 'package:cescpro/generated/json/base/json_convert_content.dart';
import 'package:cescpro/http/bean/user_info_entity.dart';

UserInfoEntity $UserInfoEntityFromJson(Map<String, dynamic> json) {
  final UserInfoEntity userInfoEntity = UserInfoEntity();
  final int? tenantId = jsonConvert.convert<int>(json['tenantId']);
  if (tenantId != null) {
    userInfoEntity.tenantId = tenantId;
  }
  final int? cid = jsonConvert.convert<int>(json['cid']);
  if (cid != null) {
    userInfoEntity.cid = cid;
  }
  final int? id = jsonConvert.convert<int>(json['id']);
  if (id != null) {
    userInfoEntity.id = id;
  }
  final String? username = jsonConvert.convert<String>(json['username']);
  if (username != null) {
    userInfoEntity.username = username;
  }
  final String? icon = jsonConvert.convert<String>(json['icon']);
  if (icon != null) {
    userInfoEntity.icon = icon;
  }
  final String? email = jsonConvert.convert<String>(json['email']);
  if (email != null) {
    userInfoEntity.email = email;
  }
  final String? nickName = jsonConvert.convert<String>(json['nickName']);
  if (nickName != null) {
    userInfoEntity.nickName = nickName;
  }
  final int? accStatus = jsonConvert.convert<int>(json['accStatus']);
  if (accStatus != null) {
    userInfoEntity.accStatus = accStatus;
  }
  final int? limitPass = jsonConvert.convert<int>(json['limitPass']);
  if (limitPass != null) {
    userInfoEntity.limitPass = limitPass;
  }
  final String? userPhone = jsonConvert.convert<String>(json['userPhone']);
  if (userPhone != null) {
    userInfoEntity.userPhone = userPhone;
  }
  final String? loginTime = jsonConvert.convert<String>(json['loginTime']);
  if (loginTime != null) {
    userInfoEntity.loginTime = loginTime;
  }
  final String? logoUrl = jsonConvert.convert<String>(json['logoUrl']);
  if (logoUrl != null) {
    userInfoEntity.logoUrl = logoUrl;
  }
  final String? currencyCode = jsonConvert.convert<String>(
      json['currencyCode']);
  if (currencyCode != null) {
    userInfoEntity.currencyCode = currencyCode;
  }
  return userInfoEntity;
}

Map<String, dynamic> $UserInfoEntityToJson(UserInfoEntity entity) {
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

extension UserInfoEntityExtension on UserInfoEntity {
  UserInfoEntity copyWith({
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
    String? logoUrl,
    String? currencyCode,
  }) {
    return UserInfoEntity()
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