import 'package:cescpro/generated/json/base/json_convert_content.dart';
import 'package:cescpro/http/bean/v1_dido_info_entity.dart';
import 'package:cescpro/core/helper/extension_helper.dart';

import 'package:cescpro/core/translations/en.dart';

import 'package:cescpro/http/bean/child_item_info.dart';

import 'package:get/get_core/src/get_main.dart';

import 'package:get/get_utils/src/extensions/internacionalization.dart';


V1DidoInfoEntity $V1DidoInfoEntityFromJson(Map<String, dynamic> json) {
  final V1DidoInfoEntity v1DidoInfoEntity = V1DidoInfoEntity();
  final bool? alarmStatus = jsonConvert.convert<bool>(json['alarmStatus']);
  if (alarmStatus != null) {
    v1DidoInfoEntity.alarmStatus = alarmStatus;
  }
  final bool? communicationStatus = jsonConvert.convert<bool>(
      json['communicationStatus']);
  if (communicationStatus != null) {
    v1DidoInfoEntity.communicationStatus = communicationStatus;
  }
  final dynamic devStatus = json['devStatus'];
  if (devStatus != null) {
    v1DidoInfoEntity.devStatus = devStatus;
  }
  final String? statusNameDesc = jsonConvert.convert<String>(
      json['statusNameDesc']);
  if (statusNameDesc != null) {
    v1DidoInfoEntity.statusNameDesc = statusNameDesc;
  }
  final String? statusEnNameDesc = jsonConvert.convert<String>(
      json['statusEnNameDesc']);
  if (statusEnNameDesc != null) {
    v1DidoInfoEntity.statusEnNameDesc = statusEnNameDesc;
  }
  final int? statusUpdateTimeMill = jsonConvert.convert<int>(
      json['statusUpdateTimeMill']);
  if (statusUpdateTimeMill != null) {
    v1DidoInfoEntity.statusUpdateTimeMill = statusUpdateTimeMill;
  }
  final int? id = jsonConvert.convert<int>(json['id']);
  if (id != null) {
    v1DidoInfoEntity.id = id;
  }
  final int? did = jsonConvert.convert<int>(json['did']);
  if (did != null) {
    v1DidoInfoEntity.did = did;
  }
  final int? siteId = jsonConvert.convert<int>(json['siteId']);
  if (siteId != null) {
    v1DidoInfoEntity.siteId = siteId;
  }
  final int? rawTimestamp = jsonConvert.convert<int>(json['rawTimestamp']);
  if (rawTimestamp != null) {
    v1DidoInfoEntity.rawTimestamp = rawTimestamp;
  }
  final int? arrNo = jsonConvert.convert<int>(json['arrNo']);
  if (arrNo != null) {
    v1DidoInfoEntity.arrNo = arrNo;
  }
  final int? cluNo = jsonConvert.convert<int>(json['cluNo']);
  if (cluNo != null) {
    v1DidoInfoEntity.cluNo = cluNo;
  }
  final int? devNo = jsonConvert.convert<int>(json['devNo']);
  if (devNo != null) {
    v1DidoInfoEntity.devNo = devNo;
  }
  final List<ChildItemInfo>? diList = (json['diList'] as List<dynamic>?)
      ?.map(
          (e) => jsonConvert.convert<ChildItemInfo>(e) as ChildItemInfo)
      .toList();
  if (diList != null) {
    v1DidoInfoEntity.diList = diList;
  }
  final List<ChildItemInfo>? doList = (json['doList'] as List<dynamic>?)
      ?.map(
          (e) => jsonConvert.convert<ChildItemInfo>(e) as ChildItemInfo)
      .toList();
  if (doList != null) {
    v1DidoInfoEntity.doList = doList;
  }
  return v1DidoInfoEntity;
}

Map<String, dynamic> $V1DidoInfoEntityToJson(V1DidoInfoEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['alarmStatus'] = entity.alarmStatus;
  data['communicationStatus'] = entity.communicationStatus;
  data['devStatus'] = entity.devStatus;
  data['statusNameDesc'] = entity.statusNameDesc;
  data['statusEnNameDesc'] = entity.statusEnNameDesc;
  data['statusUpdateTimeMill'] = entity.statusUpdateTimeMill;
  data['id'] = entity.id;
  data['did'] = entity.did;
  data['siteId'] = entity.siteId;
  data['rawTimestamp'] = entity.rawTimestamp;
  data['arrNo'] = entity.arrNo;
  data['cluNo'] = entity.cluNo;
  data['devNo'] = entity.devNo;
  data['diList'] = entity.diList?.map((v) => v.toJson()).toList();
  data['doList'] = entity.doList?.map((v) => v.toJson()).toList();
  return data;
}

extension V1DidoInfoEntityExtension on V1DidoInfoEntity {
  V1DidoInfoEntity copyWith({
    bool? alarmStatus,
    bool? communicationStatus,
    dynamic devStatus,
    String? statusNameDesc,
    String? statusEnNameDesc,
    int? statusUpdateTimeMill,
    int? id,
    int? did,
    int? siteId,
    int? rawTimestamp,
    int? arrNo,
    int? cluNo,
    int? devNo,
    List<ChildItemInfo>? diList,
    List<ChildItemInfo>? doList,
  }) {
    return V1DidoInfoEntity()
      ..alarmStatus = alarmStatus ?? this.alarmStatus
      ..communicationStatus = communicationStatus ?? this.communicationStatus
      ..devStatus = devStatus ?? this.devStatus
      ..statusNameDesc = statusNameDesc ?? this.statusNameDesc
      ..statusEnNameDesc = statusEnNameDesc ?? this.statusEnNameDesc
      ..statusUpdateTimeMill = statusUpdateTimeMill ?? this.statusUpdateTimeMill
      ..id = id ?? this.id
      ..did = did ?? this.did
      ..siteId = siteId ?? this.siteId
      ..rawTimestamp = rawTimestamp ?? this.rawTimestamp
      ..arrNo = arrNo ?? this.arrNo
      ..cluNo = cluNo ?? this.cluNo
      ..devNo = devNo ?? this.devNo
      ..diList = diList ?? this.diList
      ..doList = doList ?? this.doList;
  }
}