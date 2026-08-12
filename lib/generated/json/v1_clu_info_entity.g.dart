import 'package:cescpro/generated/json/base/json_convert_content.dart';
import 'package:cescpro/http/bean/child_item_info.dart';
import 'package:cescpro/http/bean/v1_clu_info_entity.dart';

V1CluInfoEntity $V1CluInfoEntityFromJson(Map<String, dynamic> json) {
  final V1CluInfoEntity v1CluInfoEntity = V1CluInfoEntity();
  final bool? alarmStatus = jsonConvert.convert<bool>(json['alarmStatus']);
  if (alarmStatus != null) {
    v1CluInfoEntity.alarmStatus = alarmStatus;
  }
  final bool? communicationStatus = jsonConvert.convert<bool>(
    json['communicationStatus'],
  );
  if (communicationStatus != null) {
    v1CluInfoEntity.communicationStatus = communicationStatus;
  }
  final int? devStatus = jsonConvert.convert<int>(json['devStatus']);
  if (devStatus != null) {
    v1CluInfoEntity.devStatus = devStatus;
  }
  final String? statusNameDesc = jsonConvert.convert<String>(
    json['statusNameDesc'],
  );
  if (statusNameDesc != null) {
    v1CluInfoEntity.statusNameDesc = statusNameDesc;
  }
  final String? statusEnNameDesc = jsonConvert.convert<String>(
    json['statusEnNameDesc'],
  );
  if (statusEnNameDesc != null) {
    v1CluInfoEntity.statusEnNameDesc = statusEnNameDesc;
  }
  final int? statusUpdateTimeMill = jsonConvert.convert<int>(
    json['statusUpdateTimeMill'],
  );
  if (statusUpdateTimeMill != null) {
    v1CluInfoEntity.statusUpdateTimeMill = statusUpdateTimeMill;
  }
  final int? id = jsonConvert.convert<int>(json['id']);
  if (id != null) {
    v1CluInfoEntity.id = id;
  }
  final int? did = jsonConvert.convert<int>(json['did']);
  if (did != null) {
    v1CluInfoEntity.did = did;
  }
  final int? siteId = jsonConvert.convert<int>(json['siteId']);
  if (siteId != null) {
    v1CluInfoEntity.siteId = siteId;
  }
  final dynamic rawTimestamp = json['rawTimestamp'];
  if (rawTimestamp != null) {
    v1CluInfoEntity.rawTimestamp = rawTimestamp;
  }
  final int? arrNo = jsonConvert.convert<int>(json['arrNo']);
  if (arrNo != null) {
    v1CluInfoEntity.arrNo = arrNo;
  }
  final int? cluNo = jsonConvert.convert<int>(json['cluNo']);
  if (cluNo != null) {
    v1CluInfoEntity.cluNo = cluNo;
  }
  final int? cluStatus = jsonConvert.convert<int>(json['cluStatus']);
  if (cluStatus != null) {
    v1CluInfoEntity.cluStatus = cluStatus;
  }
  final int? bmsStatus = jsonConvert.convert<int>(json['bmsStatus']);
  if (bmsStatus != null) {
    v1CluInfoEntity.bmsStatus = bmsStatus;
  }
  final double? cluVol = jsonConvert.convert<double>(json['cluVol']);
  if (cluVol != null) {
    v1CluInfoEntity.cluVol = cluVol;
  }
  final double? cluCur = jsonConvert.convert<double>(json['cluCur']);
  if (cluCur != null) {
    v1CluInfoEntity.cluCur = cluCur;
  }
  final double? cluSoc = jsonConvert.convert<double>(json['cluSoc']);
  if (cluSoc != null) {
    v1CluInfoEntity.cluSoc = cluSoc;
  }
  final double? cluSoh = jsonConvert.convert<double>(json['cluSoh']);
  if (cluSoh != null) {
    v1CluInfoEntity.cluSoh = cluSoh;
  }
  final dynamic cluPosres = json['cluPosres'];
  if (cluPosres != null) {
    v1CluInfoEntity.cluPosres = cluPosres;
  }
  final dynamic cluNegres = json['cluNegres'];
  if (cluNegres != null) {
    v1CluInfoEntity.cluNegres = cluNegres;
  }
  final dynamic cluRechaElec = json['cluRechaElec'];
  if (cluRechaElec != null) {
    v1CluInfoEntity.cluRechaElec = cluRechaElec;
  }
  final dynamic cluRedischgElec = json['cluRedischgElec'];
  if (cluRedischgElec != null) {
    v1CluInfoEntity.cluRedischgElec = cluRedischgElec;
  }
  final dynamic lastSumsDischgElec = json['lastSumsDischgElec'];
  if (lastSumsDischgElec != null) {
    v1CluInfoEntity.lastSumsDischgElec = lastSumsDischgElec;
  }
  final dynamic cluSumsChaElec = json['cluSumsChaElec'];
  if (cluSumsChaElec != null) {
    v1CluInfoEntity.cluSumsChaElec = cluSumsChaElec;
  }
  final dynamic cluSumsDischgElec = json['cluSumsDischgElec'];
  if (cluSumsDischgElec != null) {
    v1CluInfoEntity.cluSumsDischgElec = cluSumsDischgElec;
  }
  final dynamic lastSumsChaElec = json['lastSumsChaElec'];
  if (lastSumsChaElec != null) {
    v1CluInfoEntity.lastSumsChaElec = lastSumsChaElec;
  }
  final dynamic maxCellVol = json['maxCellVol'];
  if (maxCellVol != null) {
    v1CluInfoEntity.maxCellVol = maxCellVol;
  }
  final dynamic minCellVol = json['minCellVol'];
  if (minCellVol != null) {
    v1CluInfoEntity.minCellVol = minCellVol;
  }
  final dynamic maxCellTem = json['maxCellTem'];
  if (maxCellTem != null) {
    v1CluInfoEntity.maxCellTem = maxCellTem;
  }
  final dynamic minCellTem = json['minCellTem'];
  if (minCellTem != null) {
    v1CluInfoEntity.minCellTem = minCellTem;
  }
  final dynamic maxCellSoc = json['maxCellSoc'];
  if (maxCellSoc != null) {
    v1CluInfoEntity.maxCellSoc = maxCellSoc;
  }
  final dynamic minCellSoc = json['minCellSoc'];
  if (minCellSoc != null) {
    v1CluInfoEntity.minCellSoc = minCellSoc;
  }
  final dynamic maxCellSoh = json['maxCellSoh'];
  if (maxCellSoh != null) {
    v1CluInfoEntity.maxCellSoh = maxCellSoh;
  }
  final dynamic minCellSoh = json['minCellSoh'];
  if (minCellSoh != null) {
    v1CluInfoEntity.minCellSoh = minCellSoh;
  }
  final dynamic maxCellVolCellNum = json['maxCellVolCellNum'];
  if (maxCellVolCellNum != null) {
    v1CluInfoEntity.maxCellVolCellNum = maxCellVolCellNum;
  }
  final dynamic minCellVolCellNum = json['minCellVolCellNum'];
  if (minCellVolCellNum != null) {
    v1CluInfoEntity.minCellVolCellNum = minCellVolCellNum;
  }
  final dynamic maxCellTemCellNum = json['maxCellTemCellNum'];
  if (maxCellTemCellNum != null) {
    v1CluInfoEntity.maxCellTemCellNum = maxCellTemCellNum;
  }
  final dynamic minCellTemCellNum = json['minCellTemCellNum'];
  if (minCellTemCellNum != null) {
    v1CluInfoEntity.minCellTemCellNum = minCellTemCellNum;
  }
  final dynamic cellVolTotalSum = json['cellVolTotalSum'];
  if (cellVolTotalSum != null) {
    v1CluInfoEntity.cellVolTotalSum = cellVolTotalSum;
  }
  final dynamic maxDischgArrCur = json['maxDischgArrCur'];
  if (maxDischgArrCur != null) {
    v1CluInfoEntity.maxDischgArrCur = maxDischgArrCur;
  }
  final dynamic cluRtPower = json['cluRtPower'];
  if (cluRtPower != null) {
    v1CluInfoEntity.cluRtPower = cluRtPower;
  }
  final dynamic cluPosContactPos = json['cluPosContactPos'];
  if (cluPosContactPos != null) {
    v1CluInfoEntity.cluPosContactPos = cluPosContactPos;
  }
  final dynamic cluNegContactPos = json['cluNegContactPos'];
  if (cluNegContactPos != null) {
    v1CluInfoEntity.cluNegContactPos = cluNegContactPos;
  }
  final dynamic cluPreChargeContactorPos = json['cluPreChargeContactorPos'];
  if (cluPreChargeContactorPos != null) {
    v1CluInfoEntity.cluPreChargeContactorPos = cluPreChargeContactorPos;
  }
  final dynamic cluPreserveSwitchPos = json['cluPreserveSwitchPos'];
  if (cluPreserveSwitchPos != null) {
    v1CluInfoEntity.cluPreserveSwitchPos = cluPreserveSwitchPos;
  }
  final dynamic cluFuseStatus = json['cluFuseStatus'];
  if (cluFuseStatus != null) {
    v1CluInfoEntity.cluFuseStatus = cluFuseStatus;
  }
  final dynamic deviceLock = json['deviceLock'];
  if (deviceLock != null) {
    v1CluInfoEntity.deviceLock = deviceLock;
  }
  final dynamic deviceAlert = json['deviceAlert'];
  if (deviceAlert != null) {
    v1CluInfoEntity.deviceAlert = deviceAlert;
  }
  final dynamic arrBanCharge = json['arrBanCharge'];
  if (arrBanCharge != null) {
    v1CluInfoEntity.arrBanCharge = arrBanCharge;
  }
  final dynamic arrBanDischarge = json['arrBanDischarge'];
  if (arrBanDischarge != null) {
    v1CluInfoEntity.arrBanDischarge = arrBanDischarge;
  }
  final List<V1CluInfoUnitList>? unitList = (json['unitList'] as List<dynamic>?)
      ?.map(
        (e) => jsonConvert.convert<V1CluInfoUnitList>(e) as V1CluInfoUnitList,
      )
      .toList();
  if (unitList != null) {
    v1CluInfoEntity.unitList = unitList;
  }
  return v1CluInfoEntity;
}

Map<String, dynamic> $V1CluInfoEntityToJson(V1CluInfoEntity entity) {
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
  data['cluStatus'] = entity.cluStatus;
  data['bmsStatus'] = entity.bmsStatus;
  data['cluVol'] = entity.cluVol;
  data['cluCur'] = entity.cluCur;
  data['cluSoc'] = entity.cluSoc;
  data['cluSoh'] = entity.cluSoh;
  data['cluPosres'] = entity.cluPosres;
  data['cluNegres'] = entity.cluNegres;
  data['cluRechaElec'] = entity.cluRechaElec;
  data['cluRedischgElec'] = entity.cluRedischgElec;
  data['lastSumsDischgElec'] = entity.lastSumsDischgElec;
  data['cluSumsChaElec'] = entity.cluSumsChaElec;
  data['cluSumsDischgElec'] = entity.cluSumsDischgElec;
  data['lastSumsChaElec'] = entity.lastSumsChaElec;
  data['maxCellVol'] = entity.maxCellVol;
  data['minCellVol'] = entity.minCellVol;
  data['maxCellTem'] = entity.maxCellTem;
  data['minCellTem'] = entity.minCellTem;
  data['maxCellSoc'] = entity.maxCellSoc;
  data['minCellSoc'] = entity.minCellSoc;
  data['maxCellSoh'] = entity.maxCellSoh;
  data['minCellSoh'] = entity.minCellSoh;
  data['maxCellVolCellNum'] = entity.maxCellVolCellNum;
  data['minCellVolCellNum'] = entity.minCellVolCellNum;
  data['maxCellTemCellNum'] = entity.maxCellTemCellNum;
  data['minCellTemCellNum'] = entity.minCellTemCellNum;
  data['cellVolTotalSum'] = entity.cellVolTotalSum;
  data['maxDischgArrCur'] = entity.maxDischgArrCur;
  data['cluRtPower'] = entity.cluRtPower;
  data['cluPosContactPos'] = entity.cluPosContactPos;
  data['cluNegContactPos'] = entity.cluNegContactPos;
  data['cluPreChargeContactorPos'] = entity.cluPreChargeContactorPos;
  data['cluPreserveSwitchPos'] = entity.cluPreserveSwitchPos;
  data['cluFuseStatus'] = entity.cluFuseStatus;
  data['deviceLock'] = entity.deviceLock;
  data['deviceAlert'] = entity.deviceAlert;
  data['arrBanCharge'] = entity.arrBanCharge;
  data['arrBanDischarge'] = entity.arrBanDischarge;
  data['unitList'] = entity.unitList?.map((v) => v.toJson()).toList();
  return data;
}

extension V1CluInfoEntityExtension on V1CluInfoEntity {
  V1CluInfoEntity copyWith({
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
    int? cluStatus,
    int? bmsStatus,
    double? cluVol,
    double? cluCur,
    double? cluSoc,
    double? cluSoh,
    dynamic cluPosres,
    dynamic cluNegres,
    dynamic cluRechaElec,
    dynamic cluRedischgElec,
    dynamic lastSumsDischgElec,
    dynamic cluSumsChaElec,
    dynamic cluSumsDischgElec,
    dynamic lastSumsChaElec,
    dynamic maxCellVol,
    dynamic minCellVol,
    dynamic maxCellTem,
    dynamic minCellTem,
    dynamic maxCellSoc,
    dynamic minCellSoc,
    dynamic maxCellSoh,
    dynamic minCellSoh,
    dynamic maxCellVolCellNum,
    dynamic minCellVolCellNum,
    dynamic maxCellTemCellNum,
    dynamic minCellTemCellNum,
    dynamic cellVolTotalSum,
    dynamic maxDischgArrCur,
    dynamic cluRtPower,
    dynamic cluPosContactPos,
    dynamic cluNegContactPos,
    dynamic cluPreChargeContactorPos,
    dynamic cluPreserveSwitchPos,
    dynamic cluFuseStatus,
    dynamic deviceLock,
    dynamic deviceAlert,
    dynamic arrBanCharge,
    dynamic arrBanDischarge,
    List<V1CluInfoUnitList>? unitList,
  }) {
    return V1CluInfoEntity()
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
      ..cluStatus = cluStatus ?? this.cluStatus
      ..bmsStatus = bmsStatus ?? this.bmsStatus
      ..cluVol = cluVol ?? this.cluVol
      ..cluCur = cluCur ?? this.cluCur
      ..cluSoc = cluSoc ?? this.cluSoc
      ..cluSoh = cluSoh ?? this.cluSoh
      ..cluPosres = cluPosres ?? this.cluPosres
      ..cluNegres = cluNegres ?? this.cluNegres
      ..cluRechaElec = cluRechaElec ?? this.cluRechaElec
      ..cluRedischgElec = cluRedischgElec ?? this.cluRedischgElec
      ..lastSumsDischgElec = lastSumsDischgElec ?? this.lastSumsDischgElec
      ..cluSumsChaElec = cluSumsChaElec ?? this.cluSumsChaElec
      ..cluSumsDischgElec = cluSumsDischgElec ?? this.cluSumsDischgElec
      ..lastSumsChaElec = lastSumsChaElec ?? this.lastSumsChaElec
      ..maxCellVol = maxCellVol ?? this.maxCellVol
      ..minCellVol = minCellVol ?? this.minCellVol
      ..maxCellTem = maxCellTem ?? this.maxCellTem
      ..minCellTem = minCellTem ?? this.minCellTem
      ..maxCellSoc = maxCellSoc ?? this.maxCellSoc
      ..minCellSoc = minCellSoc ?? this.minCellSoc
      ..maxCellSoh = maxCellSoh ?? this.maxCellSoh
      ..minCellSoh = minCellSoh ?? this.minCellSoh
      ..maxCellVolCellNum = maxCellVolCellNum ?? this.maxCellVolCellNum
      ..minCellVolCellNum = minCellVolCellNum ?? this.minCellVolCellNum
      ..maxCellTemCellNum = maxCellTemCellNum ?? this.maxCellTemCellNum
      ..minCellTemCellNum = minCellTemCellNum ?? this.minCellTemCellNum
      ..cellVolTotalSum = cellVolTotalSum ?? this.cellVolTotalSum
      ..maxDischgArrCur = maxDischgArrCur ?? this.maxDischgArrCur
      ..cluRtPower = cluRtPower ?? this.cluRtPower
      ..cluPosContactPos = cluPosContactPos ?? this.cluPosContactPos
      ..cluNegContactPos = cluNegContactPos ?? this.cluNegContactPos
      ..cluPreChargeContactorPos =
          cluPreChargeContactorPos ?? this.cluPreChargeContactorPos
      ..cluPreserveSwitchPos = cluPreserveSwitchPos ?? this.cluPreserveSwitchPos
      ..cluFuseStatus = cluFuseStatus ?? this.cluFuseStatus
      ..deviceLock = deviceLock ?? this.deviceLock
      ..deviceAlert = deviceAlert ?? this.deviceAlert
      ..arrBanCharge = arrBanCharge ?? this.arrBanCharge
      ..arrBanDischarge = arrBanDischarge ?? this.arrBanDischarge
      ..unitList = unitList ?? this.unitList;
  }
}

V1CluInfoUnitList $V1CluInfoUnitListFromJson(Map<String, dynamic> json) {
  final V1CluInfoUnitList v1CluInfoUnitList = V1CluInfoUnitList();
  final String? name = jsonConvert.convert<String>(json['name']);
  if (name != null) {
    v1CluInfoUnitList.name = name;
  }
  final int? sort = jsonConvert.convert<int>(json['sort']);
  if (sort != null) {
    v1CluInfoUnitList.sort = sort;
  }
  final List<ChildItemInfo>? list = (json['list'] as List<dynamic>?)
      ?.map((e) => jsonConvert.convert<ChildItemInfo>(e) as ChildItemInfo)
      .toList();
  if (list != null) {
    v1CluInfoUnitList.list = list;
  }
  return v1CluInfoUnitList;
}

Map<String, dynamic> $V1CluInfoUnitListToJson(V1CluInfoUnitList entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['name'] = entity.name;
  data['sort'] = entity.sort;
  data['list'] = entity.list?.map((v) => v.toJson()).toList();
  return data;
}

extension V1CluInfoUnitListExtension on V1CluInfoUnitList {
  V1CluInfoUnitList copyWith({
    String? name,
    int? sort,
    List<ChildItemInfo>? list,
  }) {
    return V1CluInfoUnitList()
      ..name = name ?? this.name
      ..sort = sort ?? this.sort
      ..list = list ?? this.list;
  }
}
