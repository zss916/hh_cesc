import 'package:cescpro/generated/json/base/json_convert_content.dart';
import 'package:cescpro/http/bean/v1_cell_info_entity.dart';

V1CellInfoEntity $V1CellInfoEntityFromJson(Map<String, dynamic> json) {
  final V1CellInfoEntity v1CellInfoEntity = V1CellInfoEntity();
  final bool? alarmStatus = jsonConvert.convert<bool>(json['alarmStatus']);
  if (alarmStatus != null) {
    v1CellInfoEntity.alarmStatus = alarmStatus;
  }
  final bool? communicationStatus = jsonConvert.convert<bool>(
    json['communicationStatus'],
  );
  if (communicationStatus != null) {
    v1CellInfoEntity.communicationStatus = communicationStatus;
  }
  final int? devStatus = jsonConvert.convert<int>(json['devStatus']);
  if (devStatus != null) {
    v1CellInfoEntity.devStatus = devStatus;
  }
  final String? statusNameDesc = jsonConvert.convert<String>(
    json['statusNameDesc'],
  );
  if (statusNameDesc != null) {
    v1CellInfoEntity.statusNameDesc = statusNameDesc;
  }
  final String? statusEnNameDesc = jsonConvert.convert<String>(
    json['statusEnNameDesc'],
  );
  if (statusEnNameDesc != null) {
    v1CellInfoEntity.statusEnNameDesc = statusEnNameDesc;
  }
  final int? statusUpdateTimeMill = jsonConvert.convert<int>(
    json['statusUpdateTimeMill'],
  );
  if (statusUpdateTimeMill != null) {
    v1CellInfoEntity.statusUpdateTimeMill = statusUpdateTimeMill;
  }
  final List<V1CellInfoList>? list = (json['list'] as List<dynamic>?)
      ?.map((e) => jsonConvert.convert<V1CellInfoList>(e) as V1CellInfoList)
      .toList();
  if (list != null) {
    v1CellInfoEntity.list = list;
  }
  return v1CellInfoEntity;
}

Map<String, dynamic> $V1CellInfoEntityToJson(V1CellInfoEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['alarmStatus'] = entity.alarmStatus;
  data['communicationStatus'] = entity.communicationStatus;
  data['devStatus'] = entity.devStatus;
  data['statusNameDesc'] = entity.statusNameDesc;
  data['statusEnNameDesc'] = entity.statusEnNameDesc;
  data['statusUpdateTimeMill'] = entity.statusUpdateTimeMill;
  data['list'] = entity.list?.map((v) => v.toJson()).toList();
  return data;
}

extension V1CellInfoEntityExtension on V1CellInfoEntity {
  V1CellInfoEntity copyWith({
    bool? alarmStatus,
    bool? communicationStatus,
    int? devStatus,
    String? statusNameDesc,
    String? statusEnNameDesc,
    int? statusUpdateTimeMill,
    List<V1CellInfoList>? list,
  }) {
    return V1CellInfoEntity()
      ..alarmStatus = alarmStatus ?? this.alarmStatus
      ..communicationStatus = communicationStatus ?? this.communicationStatus
      ..devStatus = devStatus ?? this.devStatus
      ..statusNameDesc = statusNameDesc ?? this.statusNameDesc
      ..statusEnNameDesc = statusEnNameDesc ?? this.statusEnNameDesc
      ..statusUpdateTimeMill = statusUpdateTimeMill ?? this.statusUpdateTimeMill
      ..list = list ?? this.list;
  }
}

V1CellInfoList $V1CellInfoListFromJson(Map<String, dynamic> json) {
  final V1CellInfoList v1CellInfoList = V1CellInfoList();
  final dynamic id = json['id'];
  if (id != null) {
    v1CellInfoList.id = id;
  }
  final int? did = jsonConvert.convert<int>(json['did']);
  if (did != null) {
    v1CellInfoList.did = did;
  }
  final int? siteId = jsonConvert.convert<int>(json['siteId']);
  if (siteId != null) {
    v1CellInfoList.siteId = siteId;
  }
  final dynamic rawTimestamp = json['rawTimestamp'];
  if (rawTimestamp != null) {
    v1CellInfoList.rawTimestamp = rawTimestamp;
  }
  final String? sn = jsonConvert.convert<String>(json['sn']);
  if (sn != null) {
    v1CellInfoList.sn = sn;
  }
  final int? arrNo = jsonConvert.convert<int>(json['arrNo']);
  if (arrNo != null) {
    v1CellInfoList.arrNo = arrNo;
  }
  final int? cluNo = jsonConvert.convert<int>(json['cluNo']);
  if (cluNo != null) {
    v1CellInfoList.cluNo = cluNo;
  }
  final dynamic packNo = json['packNo'];
  if (packNo != null) {
    v1CellInfoList.packNo = packNo;
  }
  final int? cellNo = jsonConvert.convert<int>(json['cellNo']);
  if (cellNo != null) {
    v1CellInfoList.cellNo = cellNo;
  }
  final double? cellVol = jsonConvert.convert<double>(json['cellVol']);
  if (cellVol != null) {
    v1CellInfoList.cellVol = cellVol;
  }
  final dynamic cellCur = json['cellCur'];
  if (cellCur != null) {
    v1CellInfoList.cellCur = cellCur;
  }
  final double? cellTemp = jsonConvert.convert<double>(json['cellTemp']);
  if (cellTemp != null) {
    v1CellInfoList.cellTemp = cellTemp;
  }
  final double? cellSoc = jsonConvert.convert<double>(json['cellSoc']);
  if (cellSoc != null) {
    v1CellInfoList.cellSoc = cellSoc;
  }
  final dynamic cellSoh = json['cellSoh'];
  if (cellSoh != null) {
    v1CellInfoList.cellSoh = cellSoh;
  }
  final dynamic cellR = json['cellR'];
  if (cellR != null) {
    v1CellInfoList.cellR = cellR;
  }
  final dynamic cellBla = json['cellBla'];
  if (cellBla != null) {
    v1CellInfoList.cellBla = cellBla;
  }
  final dynamic cellCu = json['cellCu'];
  if (cellCu != null) {
    v1CellInfoList.cellCu = cellCu;
  }
  final dynamic cellCmd = json['cellCmd'];
  if (cellCmd != null) {
    v1CellInfoList.cellCmd = cellCmd;
  }
  final dynamic cellStus = json['cellStus'];
  if (cellStus != null) {
    v1CellInfoList.cellStus = cellStus;
  }
  final dynamic createTime = json['createTime'];
  if (createTime != null) {
    v1CellInfoList.createTime = createTime;
  }
  return v1CellInfoList;
}

Map<String, dynamic> $V1CellInfoListToJson(V1CellInfoList entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['id'] = entity.id;
  data['did'] = entity.did;
  data['siteId'] = entity.siteId;
  data['rawTimestamp'] = entity.rawTimestamp;
  data['sn'] = entity.sn;
  data['arrNo'] = entity.arrNo;
  data['cluNo'] = entity.cluNo;
  data['packNo'] = entity.packNo;
  data['cellNo'] = entity.cellNo;
  data['cellVol'] = entity.cellVol;
  data['cellCur'] = entity.cellCur;
  data['cellTemp'] = entity.cellTemp;
  data['cellSoc'] = entity.cellSoc;
  data['cellSoh'] = entity.cellSoh;
  data['cellR'] = entity.cellR;
  data['cellBla'] = entity.cellBla;
  data['cellCu'] = entity.cellCu;
  data['cellCmd'] = entity.cellCmd;
  data['cellStus'] = entity.cellStus;
  data['createTime'] = entity.createTime;
  return data;
}

extension V1CellInfoListExtension on V1CellInfoList {
  V1CellInfoList copyWith({
    dynamic id,
    int? did,
    int? siteId,
    dynamic rawTimestamp,
    String? sn,
    int? arrNo,
    int? cluNo,
    dynamic packNo,
    int? cellNo,
    double? cellVol,
    dynamic cellCur,
    double? cellTemp,
    double? cellSoc,
    dynamic cellSoh,
    dynamic cellR,
    dynamic cellBla,
    dynamic cellCu,
    dynamic cellCmd,
    dynamic cellStus,
    dynamic createTime,
  }) {
    return V1CellInfoList()
      ..id = id ?? this.id
      ..did = did ?? this.did
      ..siteId = siteId ?? this.siteId
      ..rawTimestamp = rawTimestamp ?? this.rawTimestamp
      ..sn = sn ?? this.sn
      ..arrNo = arrNo ?? this.arrNo
      ..cluNo = cluNo ?? this.cluNo
      ..packNo = packNo ?? this.packNo
      ..cellNo = cellNo ?? this.cellNo
      ..cellVol = cellVol ?? this.cellVol
      ..cellCur = cellCur ?? this.cellCur
      ..cellTemp = cellTemp ?? this.cellTemp
      ..cellSoc = cellSoc ?? this.cellSoc
      ..cellSoh = cellSoh ?? this.cellSoh
      ..cellR = cellR ?? this.cellR
      ..cellBla = cellBla ?? this.cellBla
      ..cellCu = cellCu ?? this.cellCu
      ..cellCmd = cellCmd ?? this.cellCmd
      ..cellStus = cellStus ?? this.cellStus
      ..createTime = createTime ?? this.createTime;
  }
}
