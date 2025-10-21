import 'package:cescpro/generated/json/base/json_convert_content.dart';
import 'package:cescpro/http/bean/message_item_entity.dart';

MessageItemEntity $MessageItemEntityFromJson(Map<String, dynamic> json) {
  final MessageItemEntity messageItemEntity = MessageItemEntity();
  final int? id = jsonConvert.convert<int>(json['id']);
  if (id != null) {
    messageItemEntity.id = id;
  }
  final String? title = jsonConvert.convert<String>(json['title']);
  if (title != null) {
    messageItemEntity.title = title;
  }
  final String? digest = jsonConvert.convert<String>(json['digest']);
  if (digest != null) {
    messageItemEntity.digest = digest;
  }
  final String? content = jsonConvert.convert<String>(json['content']);
  if (content != null) {
    messageItemEntity.content = content;
  }
  final int? templateId = jsonConvert.convert<int>(json['templateId']);
  if (templateId != null) {
    messageItemEntity.templateId = templateId;
  }
  final int? channelType = jsonConvert.convert<int>(json['channelType']);
  if (channelType != null) {
    messageItemEntity.channelType = channelType;
  }
  final int? channelDestination = jsonConvert.convert<int>(
    json['channelDestination'],
  );
  if (channelDestination != null) {
    messageItemEntity.channelDestination = channelDestination;
  }
  final int? sendUserId = jsonConvert.convert<int>(json['sendUserId']);
  if (sendUserId != null) {
    messageItemEntity.sendUserId = sendUserId;
  }
  final String? senderName = jsonConvert.convert<String>(json['senderName']);
  if (senderName != null) {
    messageItemEntity.senderName = senderName;
  }
  final String? sendTime = jsonConvert.convert<String>(json['sendTime']);
  if (sendTime != null) {
    messageItemEntity.sendTime = sendTime;
  }
  final String? expirationTime = jsonConvert.convert<String>(
    json['expirationTime'],
  );
  if (expirationTime != null) {
    messageItemEntity.expirationTime = expirationTime;
  }
  final int? businessType = jsonConvert.convert<int>(json['businessType']);
  if (businessType != null) {
    messageItemEntity.businessType = businessType;
  }
  final int? status = jsonConvert.convert<int>(json['status']);
  if (status != null) {
    messageItemEntity.status = status;
  }
  final int? receiverType = jsonConvert.convert<int>(json['receiverType']);
  if (receiverType != null) {
    messageItemEntity.receiverType = receiverType;
  }
  final String? audioUrl = jsonConvert.convert<String>(json['audioUrl']);
  if (audioUrl != null) {
    messageItemEntity.audioUrl = audioUrl;
  }
  final String? iconUrl = jsonConvert.convert<String>(json['iconUrl']);
  if (iconUrl != null) {
    messageItemEntity.iconUrl = iconUrl;
  }
  final String? detailUrl = jsonConvert.convert<String>(json['detailUrl']);
  if (detailUrl != null) {
    messageItemEntity.detailUrl = detailUrl;
  }
  final String? signTime = jsonConvert.convert<String>(json['signTime']);
  if (signTime != null) {
    messageItemEntity.signTime = signTime;
  }
  final int? deleted = jsonConvert.convert<int>(json['deleted']);
  if (deleted != null) {
    messageItemEntity.deleted = deleted;
  }
  final int? tenantId = jsonConvert.convert<int>(json['tenantId']);
  if (tenantId != null) {
    messageItemEntity.tenantId = tenantId;
  }
  return messageItemEntity;
}

Map<String, dynamic> $MessageItemEntityToJson(MessageItemEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['id'] = entity.id;
  data['title'] = entity.title;
  data['digest'] = entity.digest;
  data['content'] = entity.content;
  data['templateId'] = entity.templateId;
  data['channelType'] = entity.channelType;
  data['channelDestination'] = entity.channelDestination;
  data['sendUserId'] = entity.sendUserId;
  data['senderName'] = entity.senderName;
  data['sendTime'] = entity.sendTime;
  data['expirationTime'] = entity.expirationTime;
  data['businessType'] = entity.businessType;
  data['status'] = entity.status;
  data['receiverType'] = entity.receiverType;
  data['audioUrl'] = entity.audioUrl;
  data['iconUrl'] = entity.iconUrl;
  data['detailUrl'] = entity.detailUrl;
  data['signTime'] = entity.signTime;
  data['deleted'] = entity.deleted;
  data['tenantId'] = entity.tenantId;
  return data;
}

extension MessageItemEntityExtension on MessageItemEntity {
  MessageItemEntity copyWith({
    int? id,
    String? title,
    String? digest,
    String? content,
    int? templateId,
    int? channelType,
    int? channelDestination,
    int? sendUserId,
    String? senderName,
    String? sendTime,
    String? expirationTime,
    int? businessType,
    int? status,
    int? receiverType,
    String? audioUrl,
    String? iconUrl,
    String? detailUrl,
    String? signTime,
    int? deleted,
    int? tenantId,
  }) {
    return MessageItemEntity()
      ..id = id ?? this.id
      ..title = title ?? this.title
      ..digest = digest ?? this.digest
      ..content = content ?? this.content
      ..templateId = templateId ?? this.templateId
      ..channelType = channelType ?? this.channelType
      ..channelDestination = channelDestination ?? this.channelDestination
      ..sendUserId = sendUserId ?? this.sendUserId
      ..senderName = senderName ?? this.senderName
      ..sendTime = sendTime ?? this.sendTime
      ..expirationTime = expirationTime ?? this.expirationTime
      ..businessType = businessType ?? this.businessType
      ..status = status ?? this.status
      ..receiverType = receiverType ?? this.receiverType
      ..audioUrl = audioUrl ?? this.audioUrl
      ..iconUrl = iconUrl ?? this.iconUrl
      ..detailUrl = detailUrl ?? this.detailUrl
      ..signTime = signTime ?? this.signTime
      ..deleted = deleted ?? this.deleted
      ..tenantId = tenantId ?? this.tenantId;
  }
}
