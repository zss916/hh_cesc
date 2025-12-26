import 'package:cescpro/generated/json/base/json_convert_content.dart';
import 'package:cescpro/http/bean/com_card_vo_entity.dart';
import 'package:cescpro/core/helper/extension_helper.dart';

import 'package:get/get_core/src/get_main.dart';


ComCardVoEntity $ComCardVoEntityFromJson(Map<String, dynamic> json) {
  final ComCardVoEntity comCardVoEntity = ComCardVoEntity();
  final int? id = jsonConvert.convert<int>(json['id']);
  if (id != null) {
    comCardVoEntity.id = id;
  }
  final String? cardName = jsonConvert.convert<String>(json['cardName']);
  if (cardName != null) {
    comCardVoEntity.cardName = cardName;
  }
  final int? componentGroupId = jsonConvert.convert<int>(
      json['componentGroupId']);
  if (componentGroupId != null) {
    comCardVoEntity.componentGroupId = componentGroupId;
  }
  final int? sort = jsonConvert.convert<int>(json['sort']);
  if (sort != null) {
    comCardVoEntity.sort = sort;
  }
  final int? xAxis = jsonConvert.convert<int>(json['xAxis']);
  if (xAxis != null) {
    comCardVoEntity.xAxis = xAxis;
  }
  final int? yAxis = jsonConvert.convert<int>(json['yAxis']);
  if (yAxis != null) {
    comCardVoEntity.yAxis = yAxis;
  }
  final List<ComCardVoItems>? items = (json['items'] as List<dynamic>?)
      ?.map(
          (e) => jsonConvert.convert<ComCardVoItems>(e) as ComCardVoItems)
      .toList();
  if (items != null) {
    comCardVoEntity.items = items;
  }
  final List<ComCardVoDefaultList>? defaultList = (json['defaultList'] as List<
      dynamic>?)
      ?.map(
          (e) =>
      jsonConvert.convert<ComCardVoDefaultList>(e) as ComCardVoDefaultList)
      .toList();
  if (defaultList != null) {
    comCardVoEntity.defaultList = defaultList;
  }
  return comCardVoEntity;
}

Map<String, dynamic> $ComCardVoEntityToJson(ComCardVoEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['id'] = entity.id;
  data['cardName'] = entity.cardName;
  data['componentGroupId'] = entity.componentGroupId;
  data['sort'] = entity.sort;
  data['xAxis'] = entity.xAxis;
  data['yAxis'] = entity.yAxis;
  data['items'] = entity.items?.map((v) => v.toJson()).toList();
  data['defaultList'] = entity.defaultList?.map((v) => v.toJson()).toList();
  return data;
}

extension ComCardVoEntityExtension on ComCardVoEntity {
  ComCardVoEntity copyWith({
    int? id,
    String? cardName,
    int? componentGroupId,
    int? sort,
    int? xAxis,
    int? yAxis,
    List<ComCardVoItems>? items,
    List<ComCardVoDefaultList>? defaultList,
  }) {
    return ComCardVoEntity()
      ..id = id ?? this.id
      ..cardName = cardName ?? this.cardName
      ..componentGroupId = componentGroupId ?? this.componentGroupId
      ..sort = sort ?? this.sort
      ..xAxis = xAxis ?? this.xAxis
      ..yAxis = yAxis ?? this.yAxis
      ..items = items ?? this.items
      ..defaultList = defaultList ?? this.defaultList;
  }
}

ComCardVoItems $ComCardVoItemsFromJson(Map<String, dynamic> json) {
  final ComCardVoItems comCardVoItems = ComCardVoItems();
  final int? id = jsonConvert.convert<int>(json['id']);
  if (id != null) {
    comCardVoItems.id = id;
  }
  final int? componentCardId = jsonConvert.convert<int>(
      json['componentCardId']);
  if (componentCardId != null) {
    comCardVoItems.componentCardId = componentCardId;
  }
  final String? fieldName = jsonConvert.convert<String>(json['fieldName']);
  if (fieldName != null) {
    comCardVoItems.fieldName = fieldName;
  }
  final String? fieldNameCn = jsonConvert.convert<String>(json['fieldNameCn']);
  if (fieldNameCn != null) {
    comCardVoItems.fieldNameCn = fieldNameCn;
  }
  final String? fieldNameEn = jsonConvert.convert<String>(json['fieldNameEn']);
  if (fieldNameEn != null) {
    comCardVoItems.fieldNameEn = fieldNameEn;
  }
  final String? unit = jsonConvert.convert<String>(json['unit']);
  if (unit != null) {
    comCardVoItems.unit = unit;
  }
  final int? sort = jsonConvert.convert<int>(json['sort']);
  if (sort != null) {
    comCardVoItems.sort = sort;
  }
  final String? value = jsonConvert.convert<String>(json['value']);
  if (value != null) {
    comCardVoItems.value = value;
  }
  final String? enValue = jsonConvert.convert<String>(json['enValue']);
  if (enValue != null) {
    comCardVoItems.enValue = enValue;
  }
  return comCardVoItems;
}

Map<String, dynamic> $ComCardVoItemsToJson(ComCardVoItems entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['id'] = entity.id;
  data['componentCardId'] = entity.componentCardId;
  data['fieldName'] = entity.fieldName;
  data['fieldNameCn'] = entity.fieldNameCn;
  data['fieldNameEn'] = entity.fieldNameEn;
  data['unit'] = entity.unit;
  data['sort'] = entity.sort;
  data['value'] = entity.value;
  data['enValue'] = entity.enValue;
  return data;
}

extension ComCardVoItemsExtension on ComCardVoItems {
  ComCardVoItems copyWith({
    int? id,
    int? componentCardId,
    String? fieldName,
    String? fieldNameCn,
    String? fieldNameEn,
    String? unit,
    int? sort,
    String? value,
    String? enValue,
  }) {
    return ComCardVoItems()
      ..id = id ?? this.id
      ..componentCardId = componentCardId ?? this.componentCardId
      ..fieldName = fieldName ?? this.fieldName
      ..fieldNameCn = fieldNameCn ?? this.fieldNameCn
      ..fieldNameEn = fieldNameEn ?? this.fieldNameEn
      ..unit = unit ?? this.unit
      ..sort = sort ?? this.sort
      ..value = value ?? this.value
      ..enValue = enValue ?? this.enValue;
  }
}

ComCardVoDefaultList $ComCardVoDefaultListFromJson(Map<String, dynamic> json) {
  final ComCardVoDefaultList comCardVoDefaultList = ComCardVoDefaultList();
  final String? fieldName = jsonConvert.convert<String>(json['fieldName']);
  if (fieldName != null) {
    comCardVoDefaultList.fieldName = fieldName;
  }
  final String? fieldNameCn = jsonConvert.convert<String>(json['fieldNameCn']);
  if (fieldNameCn != null) {
    comCardVoDefaultList.fieldNameCn = fieldNameCn;
  }
  final String? fieldNameEn = jsonConvert.convert<String>(json['fieldNameEn']);
  if (fieldNameEn != null) {
    comCardVoDefaultList.fieldNameEn = fieldNameEn;
  }
  final String? unit = jsonConvert.convert<String>(json['unit']);
  if (unit != null) {
    comCardVoDefaultList.unit = unit;
  }
  final int? sort = jsonConvert.convert<int>(json['sort']);
  if (sort != null) {
    comCardVoDefaultList.sort = sort;
  }
  final String? value = jsonConvert.convert<String>(json['value']);
  if (value != null) {
    comCardVoDefaultList.value = value;
  }
  final String? enValue = jsonConvert.convert<String>(json['enValue']);
  if (enValue != null) {
    comCardVoDefaultList.enValue = enValue;
  }
  return comCardVoDefaultList;
}

Map<String, dynamic> $ComCardVoDefaultListToJson(ComCardVoDefaultList entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['fieldName'] = entity.fieldName;
  data['fieldNameCn'] = entity.fieldNameCn;
  data['fieldNameEn'] = entity.fieldNameEn;
  data['unit'] = entity.unit;
  data['sort'] = entity.sort;
  data['value'] = entity.value;
  data['enValue'] = entity.enValue;
  return data;
}

extension ComCardVoDefaultListExtension on ComCardVoDefaultList {
  ComCardVoDefaultList copyWith({
    String? fieldName,
    String? fieldNameCn,
    String? fieldNameEn,
    String? unit,
    int? sort,
    String? value,
    String? enValue,
  }) {
    return ComCardVoDefaultList()
      ..fieldName = fieldName ?? this.fieldName
      ..fieldNameCn = fieldNameCn ?? this.fieldNameCn
      ..fieldNameEn = fieldNameEn ?? this.fieldNameEn
      ..unit = unit ?? this.unit
      ..sort = sort ?? this.sort
      ..value = value ?? this.value
      ..enValue = enValue ?? this.enValue;
  }
}