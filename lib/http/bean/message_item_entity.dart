import 'dart:convert';

import 'package:cescpro/generated/json/base/json_field.dart';
import 'package:cescpro/generated/json/message_item_entity.g.dart';

export 'package:cescpro/generated/json/message_item_entity.g.dart';

@JsonSerializable()
class MessageItemEntity {
  int? id;
  String? title; //消息标题
  String? digest; //消息摘要
  String? content; //消息内容
  int? templateId;
  int? channelType;
  int? channelDestination; //1-悬浮窗；2-弹窗；3-通知中心
  int? sendUserId; //消息推送人ID
  String? senderName; //消息推送人名称
  String? sendTime; //发送消息时间
  String? expirationTime; //消息过期时间
  int? businessType; //消息业务类型：1-系统用户发送；2-设备告警；3-工单信息变更
  int? status; //签收状态：0-未读；1-已读
  int? receiverType; //消息接收者类型
  String? audioUrl; //消息提示音ID
  String? iconUrl; //消息图标ID
  String? detailUrl; //消息链接地址
  String? signTime; //签收时间
  int? deleted; //是否删除：0-未删除；1-已删除
  int? tenantId; //租户ID

  MessageItemEntity();

  factory MessageItemEntity.fromJson(Map<String, dynamic> json) =>
      $MessageItemEntityFromJson(json);

  Map<String, dynamic> toJson() => $MessageItemEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}
