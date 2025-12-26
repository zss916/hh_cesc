import 'package:cescpro/generated/json/base/json_convert_content.dart';
import 'package:cescpro/http/bean/token_entity.dart';

TokenEntity $TokenEntityFromJson(Map<String, dynamic> json) {
  final TokenEntity tokenEntity = TokenEntity();
  final String? tokenHead = jsonConvert.convert<String>(json['tokenHead']);
  if (tokenHead != null) {
    tokenEntity.tokenHead = tokenHead;
  }
  final int? expires = jsonConvert.convert<int>(json['expires']);
  if (expires != null) {
    tokenEntity.expires = expires;
  }
  final String? accessToken = jsonConvert.convert<String>(json['accessToken']);
  if (accessToken != null) {
    tokenEntity.accessToken = accessToken;
  }
  final String? refreshToken = jsonConvert.convert<String>(
      json['refreshToken']);
  if (refreshToken != null) {
    tokenEntity.refreshToken = refreshToken;
  }
  return tokenEntity;
}

Map<String, dynamic> $TokenEntityToJson(TokenEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['tokenHead'] = entity.tokenHead;
  data['expires'] = entity.expires;
  data['accessToken'] = entity.accessToken;
  data['refreshToken'] = entity.refreshToken;
  return data;
}

extension TokenEntityExtension on TokenEntity {
  TokenEntity copyWith({
    String? tokenHead,
    int? expires,
    String? accessToken,
    String? refreshToken,
  }) {
    return TokenEntity()
      ..tokenHead = tokenHead ?? this.tokenHead
      ..expires = expires ?? this.expires
      ..accessToken = accessToken ?? this.accessToken
      ..refreshToken = refreshToken ?? this.refreshToken;
  }
}