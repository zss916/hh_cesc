import 'dart:convert';

import 'package:cescpro/generated/json/base/json_field.dart';
import 'package:cescpro/generated/json/com_card_vo_entity.g.dart';

export 'package:cescpro/generated/json/com_card_vo_entity.g.dart';

@JsonSerializable()
class ComCardVoEntity {
  int? id;
  String? cardName; //卡片名称
  int? componentGroupId; //分组ID
  int? sort; //排序
  int? xAxis; //x轴位置
  int? yAxis; //y轴位置
  List<ComCardVoItems>? items; //卡片项列表
  List<ComCardVoDefaultList>? defaultList; //默认列表

  ComCardVoEntity();

  factory ComCardVoEntity.fromJson(Map<String, dynamic> json) =>
      $ComCardVoEntityFromJson(json);

  Map<String, dynamic> toJson() => $ComCardVoEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class ComCardVoItems {
  int? id;
  int? componentCardId; //卡片ID
  String? fieldName; //卡片项协议名称
  String? fieldNameCn;
  String? fieldNameEn;
  String? unit; //单位
  int? sort; //排序
  String? value;
  String? enValue;

  ComCardVoItems();

  factory ComCardVoItems.fromJson(Map<String, dynamic> json) =>
      $ComCardVoItemsFromJson(json);

  Map<String, dynamic> toJson() => $ComCardVoItemsToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class ComCardVoDefaultList {
  String? fieldName; //协议内容名称
  String? fieldNameCn;
  String? fieldNameEn;
  String? unit; //单位
  int? sort; //排序
  String? value;
  String? enValue;

  ComCardVoDefaultList();

  factory ComCardVoDefaultList.fromJson(Map<String, dynamic> json) =>
      $ComCardVoDefaultListFromJson(json);

  Map<String, dynamic> toJson() => $ComCardVoDefaultListToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}
