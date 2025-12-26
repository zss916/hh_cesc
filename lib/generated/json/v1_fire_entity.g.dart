import 'package:cescpro/generated/json/base/json_convert_content.dart';
import 'package:cescpro/http/bean/v1_fire_entity.dart';
import 'package:cescpro/core/helper/extension_helper.dart';

import 'package:cescpro/core/translations/en.dart';

import 'package:cescpro/http/bean/child_item_info.dart';

import 'package:get/get_core/src/get_main.dart' show Get;

import 'package:get/get_utils/src/extensions/internacionalization.dart';


V1FireEntity $V1FireEntityFromJson(Map<String, dynamic> json) {
  final V1FireEntity v1FireEntity = V1FireEntity();
  final bool? alarmStatus = jsonConvert.convert<bool>(json['alarmStatus']);
  if (alarmStatus != null) {
    v1FireEntity.alarmStatus = alarmStatus;
  }
  final bool? communicationStatus = jsonConvert.convert<bool>(
      json['communicationStatus']);
  if (communicationStatus != null) {
    v1FireEntity.communicationStatus = communicationStatus;
  }
  final dynamic devStatus = json['devStatus'];
  if (devStatus != null) {
    v1FireEntity.devStatus = devStatus;
  }
  final String? statusNameDesc = jsonConvert.convert<String>(
      json['statusNameDesc']);
  if (statusNameDesc != null) {
    v1FireEntity.statusNameDesc = statusNameDesc;
  }
  final String? statusEnNameDesc = jsonConvert.convert<String>(
      json['statusEnNameDesc']);
  if (statusEnNameDesc != null) {
    v1FireEntity.statusEnNameDesc = statusEnNameDesc;
  }
  final int? statusUpdateTimeMill = jsonConvert.convert<int>(
      json['statusUpdateTimeMill']);
  if (statusUpdateTimeMill != null) {
    v1FireEntity.statusUpdateTimeMill = statusUpdateTimeMill;
  }
  final int? id = jsonConvert.convert<int>(json['id']);
  if (id != null) {
    v1FireEntity.id = id;
  }
  final int? did = jsonConvert.convert<int>(json['did']);
  if (did != null) {
    v1FireEntity.did = did;
  }
  final int? siteId = jsonConvert.convert<int>(json['siteId']);
  if (siteId != null) {
    v1FireEntity.siteId = siteId;
  }
  final dynamic rawTimestamp = json['rawTimestamp'];
  if (rawTimestamp != null) {
    v1FireEntity.rawTimestamp = rawTimestamp;
  }
  final int? arrNo = jsonConvert.convert<int>(json['arrNo']);
  if (arrNo != null) {
    v1FireEntity.arrNo = arrNo;
  }
  final int? cluNo = jsonConvert.convert<int>(json['cluNo']);
  if (cluNo != null) {
    v1FireEntity.cluNo = cluNo;
  }
  final int? devNo = jsonConvert.convert<int>(json['devNo']);
  if (devNo != null) {
    v1FireEntity.devNo = devNo;
  }
  final dynamic batpackNo = json['batpackNo'];
  if (batpackNo != null) {
    v1FireEntity.batpackNo = batpackNo;
  }
  final dynamic sysPreAlarmLevel = json['sysPreAlarmLevel'];
  if (sysPreAlarmLevel != null) {
    v1FireEntity.sysPreAlarmLevel = sysPreAlarmLevel;
  }
  final int? startType = jsonConvert.convert<int>(json['startType']);
  if (startType != null) {
    v1FireEntity.startType = startType;
  }
  final int? coConcentration = jsonConvert.convert<int>(
      json['coConcentration']);
  if (coConcentration != null) {
    v1FireEntity.coConcentration = coConcentration;
  }
  final int? fireTemp = jsonConvert.convert<int>(json['fireTemp']);
  if (fireTemp != null) {
    v1FireEntity.fireTemp = fireTemp;
  }
  final List<ChildItemInfo>? list = (json['list'] as List<dynamic>?)
      ?.map(
          (e) => jsonConvert.convert<ChildItemInfo>(e) as ChildItemInfo)
      .toList();
  if (list != null) {
    v1FireEntity.list = list;
  }
  return v1FireEntity;
}

Map<String, dynamic> $V1FireEntityToJson(V1FireEntity entity) {
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
  data['batpackNo'] = entity.batpackNo;
  data['sysPreAlarmLevel'] = entity.sysPreAlarmLevel;
  data['startType'] = entity.startType;
  data['coConcentration'] = entity.coConcentration;
  data['fireTemp'] = entity.fireTemp;
  data['list'] = entity.list?.map((v) => v.toJson()).toList();
  return data;
}

extension V1FireEntityExtension on V1FireEntity {
  V1FireEntity copyWith({
    bool? alarmStatus,
    bool? communicationStatus,
    dynamic devStatus,
    String? statusNameDesc,
    String? statusEnNameDesc,
    int? statusUpdateTimeMill,
    int? id,
    int? did,
    int? siteId,
    dynamic rawTimestamp,
    int? arrNo,
    int? cluNo,
    int? devNo,
    dynamic batpackNo,
    dynamic sysPreAlarmLevel,
    int? startType,
    int? coConcentration,
    int? fireTemp,
    List<ChildItemInfo>? list,
  }) {
    return V1FireEntity()
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
      ..batpackNo = batpackNo ?? this.batpackNo
      ..sysPreAlarmLevel = sysPreAlarmLevel ?? this.sysPreAlarmLevel
      ..startType = startType ?? this.startType
      ..coConcentration = coConcentration ?? this.coConcentration
      ..fireTemp = fireTemp ?? this.fireTemp
      ..list = list ?? this.list;
  }
}