import 'package:cescpro/generated/json/base/json_convert_content.dart';
import 'package:cescpro/http/bean/message_content_entity.dart';

MessageContentEntity $MessageContentEntityFromJson(Map<String, dynamic> json) {
  final MessageContentEntity messageContentEntity = MessageContentEntity();
  final int? id = jsonConvert.convert<int>(json['id']);
  if (id != null) {
    messageContentEntity.id = id;
  }
  final String? title = jsonConvert.convert<String>(json['title']);
  if (title != null) {
    messageContentEntity.title = title;
  }
  final String? digest = jsonConvert.convert<String>(json['digest']);
  if (digest != null) {
    messageContentEntity.digest = digest;
  }
  final String? content = jsonConvert.convert<String>(json['content']);
  if (content != null) {
    messageContentEntity.content = content;
  }
  final int? sendUserId = jsonConvert.convert<int>(json['sendUserId']);
  if (sendUserId != null) {
    messageContentEntity.sendUserId = sendUserId;
  }
  final int? sendTime = jsonConvert.convert<int>(json['sendTime']);
  if (sendTime != null) {
    messageContentEntity.sendTime = sendTime;
  }
  final int? expirationTime = jsonConvert.convert<int>(json['expirationTime']);
  if (expirationTime != null) {
    messageContentEntity.expirationTime = expirationTime;
  }
  final int? businessType = jsonConvert.convert<int>(json['businessType']);
  if (businessType != null) {
    messageContentEntity.businessType = businessType;
  }
  final dynamic bizId = json['bizId'];
  if (bizId != null) {
    messageContentEntity.bizId = bizId;
  }
  final int? status = jsonConvert.convert<int>(json['status']);
  if (status != null) {
    messageContentEntity.status = status;
  }
  final dynamic audioUrl = json['audioUrl'];
  if (audioUrl != null) {
    messageContentEntity.audioUrl = audioUrl;
  }
  final dynamic iconUrl = json['iconUrl'];
  if (iconUrl != null) {
    messageContentEntity.iconUrl = iconUrl;
  }
  final dynamic detailUrl = json['detailUrl'];
  if (detailUrl != null) {
    messageContentEntity.detailUrl = detailUrl;
  }
  final int? createdId = jsonConvert.convert<int>(json['createdId']);
  if (createdId != null) {
    messageContentEntity.createdId = createdId;
  }
  final int? createTime = jsonConvert.convert<int>(json['createTime']);
  if (createTime != null) {
    messageContentEntity.createTime = createTime;
  }
  final int? modifiedId = jsonConvert.convert<int>(json['modifiedId']);
  if (modifiedId != null) {
    messageContentEntity.modifiedId = modifiedId;
  }
  final int? modifyTime = jsonConvert.convert<int>(json['modifyTime']);
  if (modifyTime != null) {
    messageContentEntity.modifyTime = modifyTime;
  }
  final int? tenantId = jsonConvert.convert<int>(json['tenantId']);
  if (tenantId != null) {
    messageContentEntity.tenantId = tenantId;
  }
  final dynamic receiverIds = json['receiverIds'];
  if (receiverIds != null) {
    messageContentEntity.receiverIds = receiverIds;
  }
  final dynamic receiverType = json['receiverType'];
  if (receiverType != null) {
    messageContentEntity.receiverType = receiverType;
  }
  final int? channelType = jsonConvert.convert<int>(json['channelType']);
  if (channelType != null) {
    messageContentEntity.channelType = channelType;
  }
  final int? channelDestination = jsonConvert.convert<int>(
      json['channelDestination']);
  if (channelDestination != null) {
    messageContentEntity.channelDestination = channelDestination;
  }
  final String? senderName = jsonConvert.convert<String>(json['senderName']);
  if (senderName != null) {
    messageContentEntity.senderName = senderName;
  }
  return messageContentEntity;
}

Map<String, dynamic> $MessageContentEntityToJson(MessageContentEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['id'] = entity.id;
  data['title'] = entity.title;
  data['digest'] = entity.digest;
  data['content'] = entity.content;
  data['sendUserId'] = entity.sendUserId;
  data['sendTime'] = entity.sendTime;
  data['expirationTime'] = entity.expirationTime;
  data['businessType'] = entity.businessType;
  data['bizId'] = entity.bizId;
  data['status'] = entity.status;
  data['audioUrl'] = entity.audioUrl;
  data['iconUrl'] = entity.iconUrl;
  data['detailUrl'] = entity.detailUrl;
  data['createdId'] = entity.createdId;
  data['createTime'] = entity.createTime;
  data['modifiedId'] = entity.modifiedId;
  data['modifyTime'] = entity.modifyTime;
  data['tenantId'] = entity.tenantId;
  data['receiverIds'] = entity.receiverIds;
  data['receiverType'] = entity.receiverType;
  data['channelType'] = entity.channelType;
  data['channelDestination'] = entity.channelDestination;
  data['senderName'] = entity.senderName;
  return data;
}

extension MessageContentEntityExtension on MessageContentEntity {
  MessageContentEntity copyWith({
    int? id,
    String? title,
    String? digest,
    String? content,
    int? sendUserId,
    int? sendTime,
    int? expirationTime,
    int? businessType,
    dynamic bizId,
    int? status,
    dynamic audioUrl,
    dynamic iconUrl,
    dynamic detailUrl,
    int? createdId,
    int? createTime,
    int? modifiedId,
    int? modifyTime,
    int? tenantId,
    dynamic receiverIds,
    dynamic receiverType,
    int? channelType,
    int? channelDestination,
    String? senderName,
  }) {
    return MessageContentEntity()
      ..id = id ?? this.id
      ..title = title ?? this.title
      ..digest = digest ?? this.digest
      ..content = content ?? this.content
      ..sendUserId = sendUserId ?? this.sendUserId
      ..sendTime = sendTime ?? this.sendTime
      ..expirationTime = expirationTime ?? this.expirationTime
      ..businessType = businessType ?? this.businessType
      ..bizId = bizId ?? this.bizId
      ..status = status ?? this.status
      ..audioUrl = audioUrl ?? this.audioUrl
      ..iconUrl = iconUrl ?? this.iconUrl
      ..detailUrl = detailUrl ?? this.detailUrl
      ..createdId = createdId ?? this.createdId
      ..createTime = createTime ?? this.createTime
      ..modifiedId = modifiedId ?? this.modifiedId
      ..modifyTime = modifyTime ?? this.modifyTime
      ..tenantId = tenantId ?? this.tenantId
      ..receiverIds = receiverIds ?? this.receiverIds
      ..receiverType = receiverType ?? this.receiverType
      ..channelType = channelType ?? this.channelType
      ..channelDestination = channelDestination ?? this.channelDestination
      ..senderName = senderName ?? this.senderName;
  }
}