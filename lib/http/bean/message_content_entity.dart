import 'dart:convert';

import 'package:cescpro/generated/json/base/json_field.dart';
import 'package:cescpro/generated/json/message_content_entity.g.dart';

export 'package:cescpro/generated/json/message_content_entity.g.dart';

@JsonSerializable()
class MessageContentEntity {
  int? id;
  String? title;
  String? digest;
  String? content;
  int? sendUserId;
  int? sendTime;
  int? expirationTime;
  int? businessType;
  dynamic bizId;
  int? status;
  dynamic audioUrl;
  dynamic iconUrl;
  dynamic detailUrl;
  int? createdId;
  int? createTime;
  int? modifiedId;
  int? modifyTime;
  int? tenantId;
  dynamic receiverIds;
  dynamic receiverType;
  int? channelType;
  int? channelDestination;
  String? senderName;

  MessageContentEntity();

  factory MessageContentEntity.fromJson(Map<String, dynamic> json) =>
      $MessageContentEntityFromJson(json);

  Map<String, dynamic> toJson() => $MessageContentEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}
