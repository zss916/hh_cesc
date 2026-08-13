import 'package:cescpro/generated/json/base/json_convert_content.dart';
import 'package:cescpro/http/bean/v1_pcs_info_entity.dart';
import 'package:cescpro/core/helper/extension_helper.dart';

import 'package:cescpro/core/translations/en.dart';

import 'package:cescpro/http/bean/child_item_info.dart';

import 'package:get/get_core/src/get_main.dart';

import 'package:get/get_utils/src/extensions/internacionalization.dart';


V1PcsInfoEntity $V1PcsInfoEntityFromJson(Map<String, dynamic> json) {
  final V1PcsInfoEntity v1PcsInfoEntity = V1PcsInfoEntity();
  final bool? alarmStatus = jsonConvert.convert<bool>(json['alarmStatus']);
  if (alarmStatus != null) {
    v1PcsInfoEntity.alarmStatus = alarmStatus;
  }
  final bool? communicationStatus = jsonConvert.convert<bool>(
      json['communicationStatus']);
  if (communicationStatus != null) {
    v1PcsInfoEntity.communicationStatus = communicationStatus;
  }
  final int? devStatus = jsonConvert.convert<int>(json['devStatus']);
  if (devStatus != null) {
    v1PcsInfoEntity.devStatus = devStatus;
  }
  final String? statusNameDesc = jsonConvert.convert<String>(
      json['statusNameDesc']);
  if (statusNameDesc != null) {
    v1PcsInfoEntity.statusNameDesc = statusNameDesc;
  }
  final String? statusEnNameDesc = jsonConvert.convert<String>(
      json['statusEnNameDesc']);
  if (statusEnNameDesc != null) {
    v1PcsInfoEntity.statusEnNameDesc = statusEnNameDesc;
  }
  final int? statusUpdateTimeMill = jsonConvert.convert<int>(
      json['statusUpdateTimeMill']);
  if (statusUpdateTimeMill != null) {
    v1PcsInfoEntity.statusUpdateTimeMill = statusUpdateTimeMill;
  }
  final int? id = jsonConvert.convert<int>(json['id']);
  if (id != null) {
    v1PcsInfoEntity.id = id;
  }
  final int? did = jsonConvert.convert<int>(json['did']);
  if (did != null) {
    v1PcsInfoEntity.did = did;
  }
  final int? siteId = jsonConvert.convert<int>(json['siteId']);
  if (siteId != null) {
    v1PcsInfoEntity.siteId = siteId;
  }
  final dynamic rawTimestamp = json['rawTimestamp'];
  if (rawTimestamp != null) {
    v1PcsInfoEntity.rawTimestamp = rawTimestamp;
  }
  final int? arrNo = jsonConvert.convert<int>(json['arrNo']);
  if (arrNo != null) {
    v1PcsInfoEntity.arrNo = arrNo;
  }
  final int? cluNo = jsonConvert.convert<int>(json['cluNo']);
  if (cluNo != null) {
    v1PcsInfoEntity.cluNo = cluNo;
  }
  final int? devNo = jsonConvert.convert<int>(json['devNo']);
  if (devNo != null) {
    v1PcsInfoEntity.devNo = devNo;
  }
  final int? runSta = jsonConvert.convert<int>(json['runSta']);
  if (runSta != null) {
    v1PcsInfoEntity.runSta = runSta;
  }
  final int? offGrdSta = jsonConvert.convert<int>(json['offGrdSta']);
  if (offGrdSta != null) {
    v1PcsInfoEntity.offGrdSta = offGrdSta;
  }
  final dynamic powerInput = json['powerInput'];
  if (powerInput != null) {
    v1PcsInfoEntity.powerInput = powerInput;
  }
  final dynamic volInput = json['volInput'];
  if (volInput != null) {
    v1PcsInfoEntity.volInput = volInput;
  }
  final dynamic curInput = json['curInput'];
  if (curInput != null) {
    v1PcsInfoEntity.curInput = curInput;
  }
  final double? outPowP = jsonConvert.convert<double>(json['outPowP']);
  if (outPowP != null) {
    v1PcsInfoEntity.outPowP = outPowP;
  }
  final double? outPowQ = jsonConvert.convert<double>(json['outPowQ']);
  if (outPowQ != null) {
    v1PcsInfoEntity.outPowQ = outPowQ;
  }
  final dynamic outPowS = json['outPowS'];
  if (outPowS != null) {
    v1PcsInfoEntity.outPowS = outPowS;
  }
  final dynamic grdF = json['grdF'];
  if (grdF != null) {
    v1PcsInfoEntity.grdF = grdF;
  }
  final dynamic outPowPf = json['outPowPf'];
  if (outPowPf != null) {
    v1PcsInfoEntity.outPowPf = outPowPf;
  }
  final dynamic dissTemp = json['dissTemp'];
  if (dissTemp != null) {
    v1PcsInfoEntity.dissTemp = dissTemp;
  }
  final dynamic acAccChgCur = json['acAccChgCur'];
  if (acAccChgCur != null) {
    v1PcsInfoEntity.acAccChgCur = acAccChgCur;
  }
  final dynamic acAccDisCur = json['acAccDisCur'];
  if (acAccDisCur != null) {
    v1PcsInfoEntity.acAccDisCur = acAccDisCur;
  }
  final dynamic dcAccChgCur = json['dcAccChgCur'];
  if (dcAccChgCur != null) {
    v1PcsInfoEntity.dcAccChgCur = dcAccChgCur;
  }
  final dynamic dcAccDisCur = json['dcAccDisCur'];
  if (dcAccDisCur != null) {
    v1PcsInfoEntity.dcAccDisCur = dcAccDisCur;
  }
  final dynamic outUwVol = json['outUwVol'];
  if (outUwVol != null) {
    v1PcsInfoEntity.outUwVol = outUwVol;
  }
  final dynamic outVwVol = json['outVwVol'];
  if (outVwVol != null) {
    v1PcsInfoEntity.outVwVol = outVwVol;
  }
  final dynamic outWuVol = json['outWuVol'];
  if (outWuVol != null) {
    v1PcsInfoEntity.outWuVol = outWuVol;
  }
  final dynamic outUCur = json['outUCur'];
  if (outUCur != null) {
    v1PcsInfoEntity.outUCur = outUCur;
  }
  final dynamic outVCur = json['outVCur'];
  if (outVCur != null) {
    v1PcsInfoEntity.outVCur = outVCur;
  }
  final dynamic outWCur = json['outWCur'];
  if (outWCur != null) {
    v1PcsInfoEntity.outWCur = outWCur;
  }
  final dynamic acUPowPf = json['acUPowPf'];
  if (acUPowPf != null) {
    v1PcsInfoEntity.acUPowPf = acUPowPf;
  }
  final dynamic acVPowPf = json['acVPowPf'];
  if (acVPowPf != null) {
    v1PcsInfoEntity.acVPowPf = acVPowPf;
  }
  final dynamic acWPowPf = json['acWPowPf'];
  if (acWPowPf != null) {
    v1PcsInfoEntity.acWPowPf = acWPowPf;
  }
  final dynamic acUPowP = json['acUPowP'];
  if (acUPowP != null) {
    v1PcsInfoEntity.acUPowP = acUPowP;
  }
  final dynamic acVPowP = json['acVPowP'];
  if (acVPowP != null) {
    v1PcsInfoEntity.acVPowP = acVPowP;
  }
  final dynamic acWPowP = json['acWPowP'];
  if (acWPowP != null) {
    v1PcsInfoEntity.acWPowP = acWPowP;
  }
  final dynamic acUPowQ = json['acUPowQ'];
  if (acUPowQ != null) {
    v1PcsInfoEntity.acUPowQ = acUPowQ;
  }
  final dynamic acVPowQ = json['acVPowQ'];
  if (acVPowQ != null) {
    v1PcsInfoEntity.acVPowQ = acVPowQ;
  }
  final dynamic acWPowQ = json['acWPowQ'];
  if (acWPowQ != null) {
    v1PcsInfoEntity.acWPowQ = acWPowQ;
  }
  final dynamic acUPowS = json['acUPowS'];
  if (acUPowS != null) {
    v1PcsInfoEntity.acUPowS = acUPowS;
  }
  final dynamic acVPowS = json['acVPowS'];
  if (acVPowS != null) {
    v1PcsInfoEntity.acVPowS = acVPowS;
  }
  final dynamic acWPowS = json['acWPowS'];
  if (acWPowS != null) {
    v1PcsInfoEntity.acWPowS = acWPowS;
  }
  final List<ChildItemInfo>? list = (json['list'] as List<dynamic>?)
      ?.map(
          (e) => jsonConvert.convert<ChildItemInfo>(e) as ChildItemInfo)
      .toList();
  if (list != null) {
    v1PcsInfoEntity.list = list;
  }
  return v1PcsInfoEntity;
}

Map<String, dynamic> $V1PcsInfoEntityToJson(V1PcsInfoEntity entity) {
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
  data['runSta'] = entity.runSta;
  data['offGrdSta'] = entity.offGrdSta;
  data['powerInput'] = entity.powerInput;
  data['volInput'] = entity.volInput;
  data['curInput'] = entity.curInput;
  data['outPowP'] = entity.outPowP;
  data['outPowQ'] = entity.outPowQ;
  data['outPowS'] = entity.outPowS;
  data['grdF'] = entity.grdF;
  data['outPowPf'] = entity.outPowPf;
  data['dissTemp'] = entity.dissTemp;
  data['acAccChgCur'] = entity.acAccChgCur;
  data['acAccDisCur'] = entity.acAccDisCur;
  data['dcAccChgCur'] = entity.dcAccChgCur;
  data['dcAccDisCur'] = entity.dcAccDisCur;
  data['outUwVol'] = entity.outUwVol;
  data['outVwVol'] = entity.outVwVol;
  data['outWuVol'] = entity.outWuVol;
  data['outUCur'] = entity.outUCur;
  data['outVCur'] = entity.outVCur;
  data['outWCur'] = entity.outWCur;
  data['acUPowPf'] = entity.acUPowPf;
  data['acVPowPf'] = entity.acVPowPf;
  data['acWPowPf'] = entity.acWPowPf;
  data['acUPowP'] = entity.acUPowP;
  data['acVPowP'] = entity.acVPowP;
  data['acWPowP'] = entity.acWPowP;
  data['acUPowQ'] = entity.acUPowQ;
  data['acVPowQ'] = entity.acVPowQ;
  data['acWPowQ'] = entity.acWPowQ;
  data['acUPowS'] = entity.acUPowS;
  data['acVPowS'] = entity.acVPowS;
  data['acWPowS'] = entity.acWPowS;
  data['list'] = entity.list?.map((v) => v.toJson()).toList();
  return data;
}

extension V1PcsInfoEntityExtension on V1PcsInfoEntity {
  V1PcsInfoEntity copyWith({
    bool? alarmStatus,
    bool? communicationStatus,
    int? devStatus,
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
    int? runSta,
    int? offGrdSta,
    dynamic powerInput,
    dynamic volInput,
    dynamic curInput,
    double? outPowP,
    double? outPowQ,
    dynamic outPowS,
    dynamic grdF,
    dynamic outPowPf,
    dynamic dissTemp,
    dynamic acAccChgCur,
    dynamic acAccDisCur,
    dynamic dcAccChgCur,
    dynamic dcAccDisCur,
    dynamic outUwVol,
    dynamic outVwVol,
    dynamic outWuVol,
    dynamic outUCur,
    dynamic outVCur,
    dynamic outWCur,
    dynamic acUPowPf,
    dynamic acVPowPf,
    dynamic acWPowPf,
    dynamic acUPowP,
    dynamic acVPowP,
    dynamic acWPowP,
    dynamic acUPowQ,
    dynamic acVPowQ,
    dynamic acWPowQ,
    dynamic acUPowS,
    dynamic acVPowS,
    dynamic acWPowS,
    List<ChildItemInfo>? list,
  }) {
    return V1PcsInfoEntity()
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
      ..runSta = runSta ?? this.runSta
      ..offGrdSta = offGrdSta ?? this.offGrdSta
      ..powerInput = powerInput ?? this.powerInput
      ..volInput = volInput ?? this.volInput
      ..curInput = curInput ?? this.curInput
      ..outPowP = outPowP ?? this.outPowP
      ..outPowQ = outPowQ ?? this.outPowQ
      ..outPowS = outPowS ?? this.outPowS
      ..grdF = grdF ?? this.grdF
      ..outPowPf = outPowPf ?? this.outPowPf
      ..dissTemp = dissTemp ?? this.dissTemp
      ..acAccChgCur = acAccChgCur ?? this.acAccChgCur
      ..acAccDisCur = acAccDisCur ?? this.acAccDisCur
      ..dcAccChgCur = dcAccChgCur ?? this.dcAccChgCur
      ..dcAccDisCur = dcAccDisCur ?? this.dcAccDisCur
      ..outUwVol = outUwVol ?? this.outUwVol
      ..outVwVol = outVwVol ?? this.outVwVol
      ..outWuVol = outWuVol ?? this.outWuVol
      ..outUCur = outUCur ?? this.outUCur
      ..outVCur = outVCur ?? this.outVCur
      ..outWCur = outWCur ?? this.outWCur
      ..acUPowPf = acUPowPf ?? this.acUPowPf
      ..acVPowPf = acVPowPf ?? this.acVPowPf
      ..acWPowPf = acWPowPf ?? this.acWPowPf
      ..acUPowP = acUPowP ?? this.acUPowP
      ..acVPowP = acVPowP ?? this.acVPowP
      ..acWPowP = acWPowP ?? this.acWPowP
      ..acUPowQ = acUPowQ ?? this.acUPowQ
      ..acVPowQ = acVPowQ ?? this.acVPowQ
      ..acWPowQ = acWPowQ ?? this.acWPowQ
      ..acUPowS = acUPowS ?? this.acUPowS
      ..acVPowS = acVPowS ?? this.acVPowS
      ..acWPowS = acWPowS ?? this.acWPowS
      ..list = list ?? this.list;
  }
}