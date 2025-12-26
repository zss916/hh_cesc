import 'package:cescpro/generated/json/base/json_convert_content.dart';
import 'package:cescpro/http/bean/v1_stats_meter_entity.dart';
import 'package:cescpro/core/helper/extension_helper.dart';

import 'package:cescpro/core/translations/en.dart';

import 'package:cescpro/http/bean/child_item_info.dart';

import 'package:get/get_core/src/get_main.dart';

import 'package:get/get_utils/src/extensions/internacionalization.dart';


V1StatsMeterEntity $V1StatsMeterEntityFromJson(Map<String, dynamic> json) {
  final V1StatsMeterEntity v1StatsMeterEntity = V1StatsMeterEntity();
  final bool? alarmStatus = jsonConvert.convert<bool>(json['alarmStatus']);
  if (alarmStatus != null) {
    v1StatsMeterEntity.alarmStatus = alarmStatus;
  }
  final bool? communicationStatus = jsonConvert.convert<bool>(
      json['communicationStatus']);
  if (communicationStatus != null) {
    v1StatsMeterEntity.communicationStatus = communicationStatus;
  }
  final dynamic devStatus = json['devStatus'];
  if (devStatus != null) {
    v1StatsMeterEntity.devStatus = devStatus;
  }
  final String? statusNameDesc = jsonConvert.convert<String>(
      json['statusNameDesc']);
  if (statusNameDesc != null) {
    v1StatsMeterEntity.statusNameDesc = statusNameDesc;
  }
  final String? statusEnNameDesc = jsonConvert.convert<String>(
      json['statusEnNameDesc']);
  if (statusEnNameDesc != null) {
    v1StatsMeterEntity.statusEnNameDesc = statusEnNameDesc;
  }
  final int? statusUpdateTimeMill = jsonConvert.convert<int>(
      json['statusUpdateTimeMill']);
  if (statusUpdateTimeMill != null) {
    v1StatsMeterEntity.statusUpdateTimeMill = statusUpdateTimeMill;
  }
  final int? did = jsonConvert.convert<int>(json['did']);
  if (did != null) {
    v1StatsMeterEntity.did = did;
  }
  final int? siteId = jsonConvert.convert<int>(json['siteId']);
  if (siteId != null) {
    v1StatsMeterEntity.siteId = siteId;
  }
  final dynamic rawTimestamp = json['rawTimestamp'];
  if (rawTimestamp != null) {
    v1StatsMeterEntity.rawTimestamp = rawTimestamp;
  }
  final int? arrNo = jsonConvert.convert<int>(json['arrNo']);
  if (arrNo != null) {
    v1StatsMeterEntity.arrNo = arrNo;
  }
  final int? cluNo = jsonConvert.convert<int>(json['cluNo']);
  if (cluNo != null) {
    v1StatsMeterEntity.cluNo = cluNo;
  }
  final int? devNo = jsonConvert.convert<int>(json['devNo']);
  if (devNo != null) {
    v1StatsMeterEntity.devNo = devNo;
  }
  final List<ChildItemInfo>? list = (json['list'] as List<dynamic>?)
      ?.map(
          (e) => jsonConvert.convert<ChildItemInfo>(e) as ChildItemInfo)
      .toList();
  if (list != null) {
    v1StatsMeterEntity.list = list;
  }
  return v1StatsMeterEntity;
}

Map<String, dynamic> $V1StatsMeterEntityToJson(V1StatsMeterEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['alarmStatus'] = entity.alarmStatus;
  data['communicationStatus'] = entity.communicationStatus;
  data['devStatus'] = entity.devStatus;
  data['statusNameDesc'] = entity.statusNameDesc;
  data['statusEnNameDesc'] = entity.statusEnNameDesc;
  data['statusUpdateTimeMill'] = entity.statusUpdateTimeMill;
  data['did'] = entity.did;
  data['siteId'] = entity.siteId;
  data['rawTimestamp'] = entity.rawTimestamp;
  data['arrNo'] = entity.arrNo;
  data['cluNo'] = entity.cluNo;
  data['devNo'] = entity.devNo;
  data['list'] = entity.list?.map((v) => v.toJson()).toList();
  return data;
}

extension V1StatsMeterEntityExtension on V1StatsMeterEntity {
  V1StatsMeterEntity copyWith({
    bool? alarmStatus,
    bool? communicationStatus,
    dynamic devStatus,
    String? statusNameDesc,
    String? statusEnNameDesc,
    int? statusUpdateTimeMill,
    int? did,
    int? siteId,
    dynamic rawTimestamp,
    int? arrNo,
    int? cluNo,
    int? devNo,
    List<ChildItemInfo>? list,
  }) {
    return V1StatsMeterEntity()
      ..alarmStatus = alarmStatus ?? this.alarmStatus
      ..communicationStatus = communicationStatus ?? this.communicationStatus
      ..devStatus = devStatus ?? this.devStatus
      ..statusNameDesc = statusNameDesc ?? this.statusNameDesc
      ..statusEnNameDesc = statusEnNameDesc ?? this.statusEnNameDesc
      ..statusUpdateTimeMill = statusUpdateTimeMill ?? this.statusUpdateTimeMill
      ..did = did ?? this.did
      ..siteId = siteId ?? this.siteId
      ..rawTimestamp = rawTimestamp ?? this.rawTimestamp
      ..arrNo = arrNo ?? this.arrNo
      ..cluNo = cluNo ?? this.cluNo
      ..devNo = devNo ?? this.devNo
      ..list = list ?? this.list;
  }
}