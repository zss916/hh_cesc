import 'package:cescpro/generated/json/base/json_convert_content.dart';
import 'package:cescpro/http/bean/child_item_info.dart';
import 'package:cescpro/http/bean/v1_arr_info_entity.dart';

V1ArrInfoEntity $V1ArrInfoEntityFromJson(Map<String, dynamic> json) {
  final V1ArrInfoEntity v1ArrInfoEntity = V1ArrInfoEntity();
  final bool? alarmStatus = jsonConvert.convert<bool>(json['alarmStatus']);
  if (alarmStatus != null) {
    v1ArrInfoEntity.alarmStatus = alarmStatus;
  }
  final bool? communicationStatus = jsonConvert.convert<bool>(
    json['communicationStatus'],
  );
  if (communicationStatus != null) {
    v1ArrInfoEntity.communicationStatus = communicationStatus;
  }
  final int? devStatus = jsonConvert.convert<int>(json['devStatus']);
  if (devStatus != null) {
    v1ArrInfoEntity.devStatus = devStatus;
  }
  final String? statusNameDesc = jsonConvert.convert<String>(
    json['statusNameDesc'],
  );
  if (statusNameDesc != null) {
    v1ArrInfoEntity.statusNameDesc = statusNameDesc;
  }
  final String? statusEnNameDesc = jsonConvert.convert<String>(
    json['statusEnNameDesc'],
  );
  if (statusEnNameDesc != null) {
    v1ArrInfoEntity.statusEnNameDesc = statusEnNameDesc;
  }
  final int? statusUpdateTimeMill = jsonConvert.convert<int>(
    json['statusUpdateTimeMill'],
  );
  if (statusUpdateTimeMill != null) {
    v1ArrInfoEntity.statusUpdateTimeMill = statusUpdateTimeMill;
  }
  final int? id = jsonConvert.convert<int>(json['id']);
  if (id != null) {
    v1ArrInfoEntity.id = id;
  }
  final int? did = jsonConvert.convert<int>(json['did']);
  if (did != null) {
    v1ArrInfoEntity.did = did;
  }
  final int? siteId = jsonConvert.convert<int>(json['siteId']);
  if (siteId != null) {
    v1ArrInfoEntity.siteId = siteId;
  }
  final int? arrNo = jsonConvert.convert<int>(json['arrNo']);
  if (arrNo != null) {
    v1ArrInfoEntity.arrNo = arrNo;
  }
  final int? arrStatus = jsonConvert.convert<int>(json['arrStatus']);
  if (arrStatus != null) {
    v1ArrInfoEntity.arrStatus = arrStatus;
  }
  final int? bmsStatus = jsonConvert.convert<int>(json['bmsStatus']);
  if (bmsStatus != null) {
    v1ArrInfoEntity.bmsStatus = bmsStatus;
  }
  final double? arrVol = jsonConvert.convert<double>(json['arrVol']);
  if (arrVol != null) {
    v1ArrInfoEntity.arrVol = arrVol;
  }
  final double? arrCur = jsonConvert.convert<double>(json['arrCur']);
  if (arrCur != null) {
    v1ArrInfoEntity.arrCur = arrCur;
  }
  final double? arrSoc = jsonConvert.convert<double>(json['arrSoc']);
  if (arrSoc != null) {
    v1ArrInfoEntity.arrSoc = arrSoc;
  }
  final List<V1ArrInfoUnitList>? unitList = (json['unitList'] as List<dynamic>?)
      ?.map(
        (e) => jsonConvert.convert<V1ArrInfoUnitList>(e) as V1ArrInfoUnitList,
      )
      .toList();
  if (unitList != null) {
    v1ArrInfoEntity.unitList = unitList;
  }
  return v1ArrInfoEntity;
}

Map<String, dynamic> $V1ArrInfoEntityToJson(V1ArrInfoEntity entity) {
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
  data['arrNo'] = entity.arrNo;
  data['arrStatus'] = entity.arrStatus;
  data['bmsStatus'] = entity.bmsStatus;
  data['arrVol'] = entity.arrVol;
  data['arrCur'] = entity.arrCur;
  data['arrSoc'] = entity.arrSoc;
  data['unitList'] = entity.unitList?.map((v) => v.toJson()).toList();
  return data;
}

extension V1ArrInfoEntityExtension on V1ArrInfoEntity {
  V1ArrInfoEntity copyWith({
    bool? alarmStatus,
    bool? communicationStatus,
    int? devStatus,
    String? statusNameDesc,
    String? statusEnNameDesc,
    int? statusUpdateTimeMill,
    int? id,
    int? did,
    int? siteId,
    int? arrNo,
    int? arrStatus,
    int? bmsStatus,
    double? arrVol,
    double? arrCur,
    double? arrSoc,
    List<V1ArrInfoUnitList>? unitList,
  }) {
    return V1ArrInfoEntity()
      ..alarmStatus = alarmStatus ?? this.alarmStatus
      ..communicationStatus = communicationStatus ?? this.communicationStatus
      ..devStatus = devStatus ?? this.devStatus
      ..statusNameDesc = statusNameDesc ?? this.statusNameDesc
      ..statusEnNameDesc = statusEnNameDesc ?? this.statusEnNameDesc
      ..statusUpdateTimeMill = statusUpdateTimeMill ?? this.statusUpdateTimeMill
      ..id = id ?? this.id
      ..did = did ?? this.did
      ..siteId = siteId ?? this.siteId
      ..arrNo = arrNo ?? this.arrNo
      ..arrStatus = arrStatus ?? this.arrStatus
      ..bmsStatus = bmsStatus ?? this.bmsStatus
      ..arrVol = arrVol ?? this.arrVol
      ..arrCur = arrCur ?? this.arrCur
      ..arrSoc = arrSoc ?? this.arrSoc
      ..unitList = unitList ?? this.unitList;
  }
}

V1ArrInfoUnitList $V1ArrInfoUnitListFromJson(Map<String, dynamic> json) {
  final V1ArrInfoUnitList v1ArrInfoUnitList = V1ArrInfoUnitList();
  final String? name = jsonConvert.convert<String>(json['name']);
  if (name != null) {
    v1ArrInfoUnitList.name = name;
  }
  final int? sort = jsonConvert.convert<int>(json['sort']);
  if (sort != null) {
    v1ArrInfoUnitList.sort = sort;
  }
  final List<ChildItemInfo>? list = (json['list'] as List<dynamic>?)
      ?.map((e) => jsonConvert.convert<ChildItemInfo>(e) as ChildItemInfo)
      .toList();
  if (list != null) {
    v1ArrInfoUnitList.list = list;
  }
  return v1ArrInfoUnitList;
}

Map<String, dynamic> $V1ArrInfoUnitListToJson(V1ArrInfoUnitList entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['name'] = entity.name;
  data['sort'] = entity.sort;
  data['list'] = entity.list?.map((v) => v.toJson()).toList();
  return data;
}

extension V1ArrInfoUnitListExtension on V1ArrInfoUnitList {
  V1ArrInfoUnitList copyWith({
    String? name,
    int? sort,
    List<ChildItemInfo>? list,
  }) {
    return V1ArrInfoUnitList()
      ..name = name ?? this.name
      ..sort = sort ?? this.sort
      ..list = list ?? this.list;
  }
}
