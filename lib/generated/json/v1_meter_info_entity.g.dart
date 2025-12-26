import 'package:cescpro/generated/json/base/json_convert_content.dart';
import 'package:cescpro/http/bean/v1_meter_info_entity.dart';
import 'package:cescpro/core/helper/extension_helper.dart';

import 'package:cescpro/core/translations/en.dart';

import 'package:cescpro/http/bean/child_item_info.dart';

import 'package:get/get_core/src/get_main.dart';

import 'package:get/get_utils/src/extensions/internacionalization.dart';


V1MeterInfoEntity $V1MeterInfoEntityFromJson(Map<String, dynamic> json) {
  final V1MeterInfoEntity v1MeterInfoEntity = V1MeterInfoEntity();
  final bool? alarmStatus = jsonConvert.convert<bool>(json['alarmStatus']);
  if (alarmStatus != null) {
    v1MeterInfoEntity.alarmStatus = alarmStatus;
  }
  final bool? communicationStatus = jsonConvert.convert<bool>(
      json['communicationStatus']);
  if (communicationStatus != null) {
    v1MeterInfoEntity.communicationStatus = communicationStatus;
  }
  final dynamic devStatus = json['devStatus'];
  if (devStatus != null) {
    v1MeterInfoEntity.devStatus = devStatus;
  }
  final String? statusNameDesc = jsonConvert.convert<String>(
      json['statusNameDesc']);
  if (statusNameDesc != null) {
    v1MeterInfoEntity.statusNameDesc = statusNameDesc;
  }
  final String? statusEnNameDesc = jsonConvert.convert<String>(
      json['statusEnNameDesc']);
  if (statusEnNameDesc != null) {
    v1MeterInfoEntity.statusEnNameDesc = statusEnNameDesc;
  }
  final int? statusUpdateTimeMill = jsonConvert.convert<int>(
      json['statusUpdateTimeMill']);
  if (statusUpdateTimeMill != null) {
    v1MeterInfoEntity.statusUpdateTimeMill = statusUpdateTimeMill;
  }
  final int? id = jsonConvert.convert<int>(json['id']);
  if (id != null) {
    v1MeterInfoEntity.id = id;
  }
  final int? did = jsonConvert.convert<int>(json['did']);
  if (did != null) {
    v1MeterInfoEntity.did = did;
  }
  final int? siteId = jsonConvert.convert<int>(json['siteId']);
  if (siteId != null) {
    v1MeterInfoEntity.siteId = siteId;
  }
  final dynamic rawTimestamp = json['rawTimestamp'];
  if (rawTimestamp != null) {
    v1MeterInfoEntity.rawTimestamp = rawTimestamp;
  }
  final int? arrNo = jsonConvert.convert<int>(json['arrNo']);
  if (arrNo != null) {
    v1MeterInfoEntity.arrNo = arrNo;
  }
  final int? cluNo = jsonConvert.convert<int>(json['cluNo']);
  if (cluNo != null) {
    v1MeterInfoEntity.cluNo = cluNo;
  }
  final int? devNo = jsonConvert.convert<int>(json['devNo']);
  if (devNo != null) {
    v1MeterInfoEntity.devNo = devNo;
  }
  final double? meterAVol = jsonConvert.convert<double>(json['meterAVol']);
  if (meterAVol != null) {
    v1MeterInfoEntity.meterAVol = meterAVol;
  }
  final double? meterBVol = jsonConvert.convert<double>(json['meterBVol']);
  if (meterBVol != null) {
    v1MeterInfoEntity.meterBVol = meterBVol;
  }
  final double? meterCVol = jsonConvert.convert<double>(json['meterCVol']);
  if (meterCVol != null) {
    v1MeterInfoEntity.meterCVol = meterCVol;
  }
  final double? meterACur = jsonConvert.convert<double>(json['meterACur']);
  if (meterACur != null) {
    v1MeterInfoEntity.meterACur = meterACur;
  }
  final double? meterBCur = jsonConvert.convert<double>(json['meterBCur']);
  if (meterBCur != null) {
    v1MeterInfoEntity.meterBCur = meterBCur;
  }
  final double? meterCCur = jsonConvert.convert<double>(json['meterCCur']);
  if (meterCCur != null) {
    v1MeterInfoEntity.meterCCur = meterCCur;
  }
  final double? meterAllPow = jsonConvert.convert<double>(json['meterAllPow']);
  if (meterAllPow != null) {
    v1MeterInfoEntity.meterAllPow = meterAllPow;
  }
  final double? meterTotPf = jsonConvert.convert<double>(json['meterTotPf']);
  if (meterTotPf != null) {
    v1MeterInfoEntity.meterTotPf = meterTotPf;
  }
  final double? meterF = jsonConvert.convert<double>(json['meterF']);
  if (meterF != null) {
    v1MeterInfoEntity.meterF = meterF;
  }
  final double? meterAddPos = jsonConvert.convert<double>(json['meterAddPos']);
  if (meterAddPos != null) {
    v1MeterInfoEntity.meterAddPos = meterAddPos;
  }
  final double? meterVerPos = jsonConvert.convert<double>(json['meterVerPos']);
  if (meterVerPos != null) {
    v1MeterInfoEntity.meterVerPos = meterVerPos;
  }
  final double? meterHigPos = jsonConvert.convert<double>(json['meterHigPos']);
  if (meterHigPos != null) {
    v1MeterInfoEntity.meterHigPos = meterHigPos;
  }
  final double? meterMidPos = jsonConvert.convert<double>(json['meterMidPos']);
  if (meterMidPos != null) {
    v1MeterInfoEntity.meterMidPos = meterMidPos;
  }
  final double? meterLowPos = jsonConvert.convert<double>(json['meterLowPos']);
  if (meterLowPos != null) {
    v1MeterInfoEntity.meterLowPos = meterLowPos;
  }
  final double? meterAddNeg = jsonConvert.convert<double>(json['meterAddNeg']);
  if (meterAddNeg != null) {
    v1MeterInfoEntity.meterAddNeg = meterAddNeg;
  }
  final double? meterVerNeg = jsonConvert.convert<double>(json['meterVerNeg']);
  if (meterVerNeg != null) {
    v1MeterInfoEntity.meterVerNeg = meterVerNeg;
  }
  final double? meterHigNeg = jsonConvert.convert<double>(json['meterHigNeg']);
  if (meterHigNeg != null) {
    v1MeterInfoEntity.meterHigNeg = meterHigNeg;
  }
  final double? meterMidNeg = jsonConvert.convert<double>(json['meterMidNeg']);
  if (meterMidNeg != null) {
    v1MeterInfoEntity.meterMidNeg = meterMidNeg;
  }
  final double? meterLowNeg = jsonConvert.convert<double>(json['meterLowNeg']);
  if (meterLowNeg != null) {
    v1MeterInfoEntity.meterLowNeg = meterLowNeg;
  }
  final List<ChildItemInfo>? list = (json['list'] as List<dynamic>?)
      ?.map(
          (e) => jsonConvert.convert<ChildItemInfo>(e) as ChildItemInfo)
      .toList();
  if (list != null) {
    v1MeterInfoEntity.list = list;
  }
  return v1MeterInfoEntity;
}

Map<String, dynamic> $V1MeterInfoEntityToJson(V1MeterInfoEntity entity) {
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
  data['meterAVol'] = entity.meterAVol;
  data['meterBVol'] = entity.meterBVol;
  data['meterCVol'] = entity.meterCVol;
  data['meterACur'] = entity.meterACur;
  data['meterBCur'] = entity.meterBCur;
  data['meterCCur'] = entity.meterCCur;
  data['meterAllPow'] = entity.meterAllPow;
  data['meterTotPf'] = entity.meterTotPf;
  data['meterF'] = entity.meterF;
  data['meterAddPos'] = entity.meterAddPos;
  data['meterVerPos'] = entity.meterVerPos;
  data['meterHigPos'] = entity.meterHigPos;
  data['meterMidPos'] = entity.meterMidPos;
  data['meterLowPos'] = entity.meterLowPos;
  data['meterAddNeg'] = entity.meterAddNeg;
  data['meterVerNeg'] = entity.meterVerNeg;
  data['meterHigNeg'] = entity.meterHigNeg;
  data['meterMidNeg'] = entity.meterMidNeg;
  data['meterLowNeg'] = entity.meterLowNeg;
  data['list'] = entity.list?.map((v) => v.toJson()).toList();
  return data;
}

extension V1MeterInfoEntityExtension on V1MeterInfoEntity {
  V1MeterInfoEntity copyWith({
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
    double? meterAVol,
    double? meterBVol,
    double? meterCVol,
    double? meterACur,
    double? meterBCur,
    double? meterCCur,
    double? meterAllPow,
    double? meterTotPf,
    double? meterF,
    double? meterAddPos,
    double? meterVerPos,
    double? meterHigPos,
    double? meterMidPos,
    double? meterLowPos,
    double? meterAddNeg,
    double? meterVerNeg,
    double? meterHigNeg,
    double? meterMidNeg,
    double? meterLowNeg,
    List<ChildItemInfo>? list,
  }) {
    return V1MeterInfoEntity()
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
      ..meterAVol = meterAVol ?? this.meterAVol
      ..meterBVol = meterBVol ?? this.meterBVol
      ..meterCVol = meterCVol ?? this.meterCVol
      ..meterACur = meterACur ?? this.meterACur
      ..meterBCur = meterBCur ?? this.meterBCur
      ..meterCCur = meterCCur ?? this.meterCCur
      ..meterAllPow = meterAllPow ?? this.meterAllPow
      ..meterTotPf = meterTotPf ?? this.meterTotPf
      ..meterF = meterF ?? this.meterF
      ..meterAddPos = meterAddPos ?? this.meterAddPos
      ..meterVerPos = meterVerPos ?? this.meterVerPos
      ..meterHigPos = meterHigPos ?? this.meterHigPos
      ..meterMidPos = meterMidPos ?? this.meterMidPos
      ..meterLowPos = meterLowPos ?? this.meterLowPos
      ..meterAddNeg = meterAddNeg ?? this.meterAddNeg
      ..meterVerNeg = meterVerNeg ?? this.meterVerNeg
      ..meterHigNeg = meterHigNeg ?? this.meterHigNeg
      ..meterMidNeg = meterMidNeg ?? this.meterMidNeg
      ..meterLowNeg = meterLowNeg ?? this.meterLowNeg
      ..list = list ?? this.list;
  }
}