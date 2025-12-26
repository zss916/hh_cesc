import 'package:cescpro/generated/json/base/json_convert_content.dart';
import 'package:cescpro/http/bean/v1_hot_mg_entity.dart';
import 'package:cescpro/core/helper/extension_helper.dart';

import 'package:cescpro/core/translations/en.dart';

import 'package:cescpro/http/bean/child_item_info.dart';

import 'package:get/get.dart';


V1HotMgEntity $V1HotMgEntityFromJson(Map<String, dynamic> json) {
  final V1HotMgEntity v1HotMgEntity = V1HotMgEntity();
  final bool? alarmStatus = jsonConvert.convert<bool>(json['alarmStatus']);
  if (alarmStatus != null) {
    v1HotMgEntity.alarmStatus = alarmStatus;
  }
  final bool? communicationStatus = jsonConvert.convert<bool>(
      json['communicationStatus']);
  if (communicationStatus != null) {
    v1HotMgEntity.communicationStatus = communicationStatus;
  }
  final double? devStatus = jsonConvert.convert<double>(json['devStatus']);
  if (devStatus != null) {
    v1HotMgEntity.devStatus = devStatus;
  }
  final String? statusNameDesc = jsonConvert.convert<String>(
      json['statusNameDesc']);
  if (statusNameDesc != null) {
    v1HotMgEntity.statusNameDesc = statusNameDesc;
  }
  final String? statusEnNameDesc = jsonConvert.convert<String>(
      json['statusEnNameDesc']);
  if (statusEnNameDesc != null) {
    v1HotMgEntity.statusEnNameDesc = statusEnNameDesc;
  }
  final int? statusUpdateTimeMill = jsonConvert.convert<int>(
      json['statusUpdateTimeMill']);
  if (statusUpdateTimeMill != null) {
    v1HotMgEntity.statusUpdateTimeMill = statusUpdateTimeMill;
  }
  final String? name = jsonConvert.convert<String>(json['name']);
  if (name != null) {
    v1HotMgEntity.name = name;
  }
  final dynamic enName = json['enName'];
  if (enName != null) {
    v1HotMgEntity.enName = enName;
  }
  final double? did = jsonConvert.convert<double>(json['did']);
  if (did != null) {
    v1HotMgEntity.did = did;
  }
  final double? siteId = jsonConvert.convert<double>(json['siteId']);
  if (siteId != null) {
    v1HotMgEntity.siteId = siteId;
  }
  final dynamic rawTimestamp = json['rawTimestamp'];
  if (rawTimestamp != null) {
    v1HotMgEntity.rawTimestamp = rawTimestamp;
  }
  final double? arrNo = jsonConvert.convert<double>(json['arrNo']);
  if (arrNo != null) {
    v1HotMgEntity.arrNo = arrNo;
  }
  final double? cluNo = jsonConvert.convert<double>(json['cluNo']);
  if (cluNo != null) {
    v1HotMgEntity.cluNo = cluNo;
  }
  final double? devNo = jsonConvert.convert<double>(json['devNo']);
  if (devNo != null) {
    v1HotMgEntity.devNo = devNo;
  }
  final List<ChildItemInfo>? list = (json['list'] as List<dynamic>?)
      ?.map(
          (e) => jsonConvert.convert<ChildItemInfo>(e) as ChildItemInfo)
      .toList();
  if (list != null) {
    v1HotMgEntity.list = list;
  }
  return v1HotMgEntity;
}

Map<String, dynamic> $V1HotMgEntityToJson(V1HotMgEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['alarmStatus'] = entity.alarmStatus;
  data['communicationStatus'] = entity.communicationStatus;
  data['devStatus'] = entity.devStatus;
  data['statusNameDesc'] = entity.statusNameDesc;
  data['statusEnNameDesc'] = entity.statusEnNameDesc;
  data['statusUpdateTimeMill'] = entity.statusUpdateTimeMill;
  data['name'] = entity.name;
  data['enName'] = entity.enName;
  data['did'] = entity.did;
  data['siteId'] = entity.siteId;
  data['rawTimestamp'] = entity.rawTimestamp;
  data['arrNo'] = entity.arrNo;
  data['cluNo'] = entity.cluNo;
  data['devNo'] = entity.devNo;
  data['list'] = entity.list?.map((v) => v.toJson()).toList();
  return data;
}

extension V1HotMgEntityExtension on V1HotMgEntity {
  V1HotMgEntity copyWith({
    bool? alarmStatus,
    bool? communicationStatus,
    double? devStatus,
    String? statusNameDesc,
    String? statusEnNameDesc,
    int? statusUpdateTimeMill,
    String? name,
    dynamic enName,
    double? did,
    double? siteId,
    dynamic rawTimestamp,
    double? arrNo,
    double? cluNo,
    double? devNo,
    List<ChildItemInfo>? list,
  }) {
    return V1HotMgEntity()
      ..alarmStatus = alarmStatus ?? this.alarmStatus
      ..communicationStatus = communicationStatus ?? this.communicationStatus
      ..devStatus = devStatus ?? this.devStatus
      ..statusNameDesc = statusNameDesc ?? this.statusNameDesc
      ..statusEnNameDesc = statusEnNameDesc ?? this.statusEnNameDesc
      ..statusUpdateTimeMill = statusUpdateTimeMill ?? this.statusUpdateTimeMill
      ..name = name ?? this.name
      ..enName = enName ?? this.enName
      ..did = did ?? this.did
      ..siteId = siteId ?? this.siteId
      ..rawTimestamp = rawTimestamp ?? this.rawTimestamp
      ..arrNo = arrNo ?? this.arrNo
      ..cluNo = cluNo ?? this.cluNo
      ..devNo = devNo ?? this.devNo
      ..list = list ?? this.list;
  }
}