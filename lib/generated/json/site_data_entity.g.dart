import 'package:cescpro/generated/json/base/json_convert_content.dart';
import 'package:cescpro/http/bean/site_data_entity.dart';

SiteDataEntity $SiteDataEntityFromJson(Map<String, dynamic> json) {
  final SiteDataEntity siteDataEntity = SiteDataEntity();
  final int? cid = jsonConvert.convert<int>(json['cid']);
  if (cid != null) {
    siteDataEntity.cid = cid;
  }
  final String? cname = jsonConvert.convert<String>(json['cname']);
  if (cname != null) {
    siteDataEntity.cname = cname;
  }
  final int? id = jsonConvert.convert<int>(json['id']);
  if (id != null) {
    siteDataEntity.id = id;
  }
  final String? name = jsonConvert.convert<String>(json['name']);
  if (name != null) {
    siteDataEntity.name = name;
  }
  final dynamic types = json['types'];
  if (types != null) {
    siteDataEntity.types = types;
  }
  final String? picture = jsonConvert.convert<String>(json['picture']);
  if (picture != null) {
    siteDataEntity.picture = picture;
  }
  final String? location = jsonConvert.convert<String>(json['location']);
  if (location != null) {
    siteDataEntity.location = location;
  }
  final String? adcode = jsonConvert.convert<String>(json['adcode']);
  if (adcode != null) {
    siteDataEntity.adcode = adcode;
  }
  final dynamic lng = json['lng'];
  if (lng != null) {
    siteDataEntity.lng = lng;
  }
  final dynamic lat = json['lat'];
  if (lat != null) {
    siteDataEntity.lat = lat;
  }
  final dynamic remark = json['remark'];
  if (remark != null) {
    siteDataEntity.remark = remark;
  }
  final int? hasDevCount = jsonConvert.convert<int>(json['hasDevCount']);
  if (hasDevCount != null) {
    siteDataEntity.hasDevCount = hasDevCount;
  }
  final int? operationTimeMill = jsonConvert.convert<int>(
      json['operationTimeMill']);
  if (operationTimeMill != null) {
    siteDataEntity.operationTimeMill = operationTimeMill;
  }
  final List<
      SiteDataDeviceDtoList>? deviceDtoList = (json['deviceDtoList'] as List<
      dynamic>?)
      ?.map(
          (e) =>
      jsonConvert.convert<SiteDataDeviceDtoList>(e) as SiteDataDeviceDtoList)
      .toList();
  if (deviceDtoList != null) {
    siteDataEntity.deviceDtoList = deviceDtoList;
  }
  final int? capacity = jsonConvert.convert<int>(json['capacity']);
  if (capacity != null) {
    siteDataEntity.capacity = capacity;
  }
  final int? power = jsonConvert.convert<int>(json['power']);
  if (power != null) {
    siteDataEntity.power = power;
  }
  final dynamic pvCapacity = json['pvCapacity'];
  if (pvCapacity != null) {
    siteDataEntity.pvCapacity = pvCapacity;
  }
  final double? pvPower = jsonConvert.convert<double>(json['pvPower']);
  if (pvPower != null) {
    siteDataEntity.pvPower = pvPower;
  }
  final dynamic activePower = json['activePower'];
  if (activePower != null) {
    siteDataEntity.activePower = activePower;
  }
  final dynamic reactivePower = json['reactivePower'];
  if (reactivePower != null) {
    siteDataEntity.reactivePower = reactivePower;
  }
  final dynamic alarmNum = json['alarmNum'];
  if (alarmNum != null) {
    siteDataEntity.alarmNum = alarmNum;
  }
  final dynamic status = json['status'];
  if (status != null) {
    siteDataEntity.status = status;
  }
  final dynamic soc = json['soc'];
  if (soc != null) {
    siteDataEntity.soc = soc;
  }
  final dynamic charge = json['charge'];
  if (charge != null) {
    siteDataEntity.charge = charge;
  }
  final dynamic recharge = json['recharge'];
  if (recharge != null) {
    siteDataEntity.recharge = recharge;
  }
  final dynamic efficiency = json['efficiency'];
  if (efficiency != null) {
    siteDataEntity.efficiency = efficiency;
  }
  final int? protocolId = jsonConvert.convert<int>(json['protocolId']);
  if (protocolId != null) {
    siteDataEntity.protocolId = protocolId;
  }
  final int? elecVolLevel = jsonConvert.convert<int>(json['elecVolLevel']);
  if (elecVolLevel != null) {
    siteDataEntity.elecVolLevel = elecVolLevel;
  }
  final int? elecSettleType = jsonConvert.convert<int>(json['elecSettleType']);
  if (elecSettleType != null) {
    siteDataEntity.elecSettleType = elecSettleType;
  }
  final double? elecCapacity = jsonConvert.convert<double>(
      json['elecCapacity']);
  if (elecCapacity != null) {
    siteDataEntity.elecCapacity = elecCapacity;
  }
  final int? elecType = jsonConvert.convert<int>(json['elecType']);
  if (elecType != null) {
    siteDataEntity.elecType = elecType;
  }
  final int? elecSubType = jsonConvert.convert<int>(json['elecSubType']);
  if (elecSubType != null) {
    siteDataEntity.elecSubType = elecSubType;
  }
  final dynamic groupInfos = json['groupInfos'];
  if (groupInfos != null) {
    siteDataEntity.groupInfos = groupInfos;
  }
  final dynamic yesterdayCharge = json['yesterdayCharge'];
  if (yesterdayCharge != null) {
    siteDataEntity.yesterdayCharge = yesterdayCharge;
  }
  final dynamic yesterdayRecharge = json['yesterdayRecharge'];
  if (yesterdayRecharge != null) {
    siteDataEntity.yesterdayRecharge = yesterdayRecharge;
  }
  final String? modifyTime = jsonConvert.convert<String>(json['modifyTime']);
  if (modifyTime != null) {
    siteDataEntity.modifyTime = modifyTime;
  }
  final String? modifiedByName = jsonConvert.convert<String>(
      json['modifiedByName']);
  if (modifiedByName != null) {
    siteDataEntity.modifiedByName = modifiedByName;
  }
  final dynamic provinceCode = json['provinceCode'];
  if (provinceCode != null) {
    siteDataEntity.provinceCode = provinceCode;
  }
  final dynamic siteGridDTOList = json['siteGridDTOList'];
  if (siteGridDTOList != null) {
    siteDataEntity.siteGridDTOList = siteGridDTOList;
  }
  final String? simpleLocation = jsonConvert.convert<String>(
      json['simpleLocation']);
  if (simpleLocation != null) {
    siteDataEntity.simpleLocation = simpleLocation;
  }
  final String? zoneId = jsonConvert.convert<String>(json['zoneId']);
  if (zoneId != null) {
    siteDataEntity.zoneId = zoneId;
  }
  final dynamic latestTimeMill = json['latestTimeMill'];
  if (latestTimeMill != null) {
    siteDataEntity.latestTimeMill = latestTimeMill;
  }
  final dynamic cityCode = json['cityCode'];
  if (cityCode != null) {
    siteDataEntity.cityCode = cityCode;
  }
  final dynamic areaCode = json['areaCode'];
  if (areaCode != null) {
    siteDataEntity.areaCode = areaCode;
  }
  final String? protocolVersion = jsonConvert.convert<String>(
      json['protocolVersion']);
  if (protocolVersion != null) {
    siteDataEntity.protocolVersion = protocolVersion;
  }
  final int? isGrid = jsonConvert.convert<int>(json['isGrid']);
  if (isGrid != null) {
    siteDataEntity.isGrid = isGrid;
  }
  return siteDataEntity;
}

Map<String, dynamic> $SiteDataEntityToJson(SiteDataEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['cid'] = entity.cid;
  data['cname'] = entity.cname;
  data['id'] = entity.id;
  data['name'] = entity.name;
  data['types'] = entity.types;
  data['picture'] = entity.picture;
  data['location'] = entity.location;
  data['adcode'] = entity.adcode;
  data['lng'] = entity.lng;
  data['lat'] = entity.lat;
  data['remark'] = entity.remark;
  data['hasDevCount'] = entity.hasDevCount;
  data['operationTimeMill'] = entity.operationTimeMill;
  data['deviceDtoList'] = entity.deviceDtoList?.map((v) => v.toJson()).toList();
  data['capacity'] = entity.capacity;
  data['power'] = entity.power;
  data['pvCapacity'] = entity.pvCapacity;
  data['pvPower'] = entity.pvPower;
  data['activePower'] = entity.activePower;
  data['reactivePower'] = entity.reactivePower;
  data['alarmNum'] = entity.alarmNum;
  data['status'] = entity.status;
  data['soc'] = entity.soc;
  data['charge'] = entity.charge;
  data['recharge'] = entity.recharge;
  data['efficiency'] = entity.efficiency;
  data['protocolId'] = entity.protocolId;
  data['elecVolLevel'] = entity.elecVolLevel;
  data['elecSettleType'] = entity.elecSettleType;
  data['elecCapacity'] = entity.elecCapacity;
  data['elecType'] = entity.elecType;
  data['elecSubType'] = entity.elecSubType;
  data['groupInfos'] = entity.groupInfos;
  data['yesterdayCharge'] = entity.yesterdayCharge;
  data['yesterdayRecharge'] = entity.yesterdayRecharge;
  data['modifyTime'] = entity.modifyTime;
  data['modifiedByName'] = entity.modifiedByName;
  data['provinceCode'] = entity.provinceCode;
  data['siteGridDTOList'] = entity.siteGridDTOList;
  data['simpleLocation'] = entity.simpleLocation;
  data['zoneId'] = entity.zoneId;
  data['latestTimeMill'] = entity.latestTimeMill;
  data['cityCode'] = entity.cityCode;
  data['areaCode'] = entity.areaCode;
  data['protocolVersion'] = entity.protocolVersion;
  data['isGrid'] = entity.isGrid;
  return data;
}

extension SiteDataEntityExtension on SiteDataEntity {
  SiteDataEntity copyWith({
    int? cid,
    String? cname,
    int? id,
    String? name,
    dynamic types,
    String? picture,
    String? location,
    String? adcode,
    dynamic lng,
    dynamic lat,
    dynamic remark,
    int? hasDevCount,
    int? operationTimeMill,
    List<SiteDataDeviceDtoList>? deviceDtoList,
    int? capacity,
    int? power,
    dynamic pvCapacity,
    double? pvPower,
    dynamic activePower,
    dynamic reactivePower,
    dynamic alarmNum,
    dynamic status,
    dynamic soc,
    dynamic charge,
    dynamic recharge,
    dynamic efficiency,
    int? protocolId,
    int? elecVolLevel,
    int? elecSettleType,
    double? elecCapacity,
    int? elecType,
    int? elecSubType,
    dynamic groupInfos,
    dynamic yesterdayCharge,
    dynamic yesterdayRecharge,
    String? modifyTime,
    String? modifiedByName,
    dynamic provinceCode,
    dynamic siteGridDTOList,
    String? simpleLocation,
    String? zoneId,
    dynamic latestTimeMill,
    dynamic cityCode,
    dynamic areaCode,
    String? protocolVersion,
    int? isGrid,
  }) {
    return SiteDataEntity()
      ..cid = cid ?? this.cid
      ..cname = cname ?? this.cname
      ..id = id ?? this.id
      ..name = name ?? this.name
      ..types = types ?? this.types
      ..picture = picture ?? this.picture
      ..location = location ?? this.location
      ..adcode = adcode ?? this.adcode
      ..lng = lng ?? this.lng
      ..lat = lat ?? this.lat
      ..remark = remark ?? this.remark
      ..hasDevCount = hasDevCount ?? this.hasDevCount
      ..operationTimeMill = operationTimeMill ?? this.operationTimeMill
      ..deviceDtoList = deviceDtoList ?? this.deviceDtoList
      ..capacity = capacity ?? this.capacity
      ..power = power ?? this.power
      ..pvCapacity = pvCapacity ?? this.pvCapacity
      ..pvPower = pvPower ?? this.pvPower
      ..activePower = activePower ?? this.activePower
      ..reactivePower = reactivePower ?? this.reactivePower
      ..alarmNum = alarmNum ?? this.alarmNum
      ..status = status ?? this.status
      ..soc = soc ?? this.soc
      ..charge = charge ?? this.charge
      ..recharge = recharge ?? this.recharge
      ..efficiency = efficiency ?? this.efficiency
      ..protocolId = protocolId ?? this.protocolId
      ..elecVolLevel = elecVolLevel ?? this.elecVolLevel
      ..elecSettleType = elecSettleType ?? this.elecSettleType
      ..elecCapacity = elecCapacity ?? this.elecCapacity
      ..elecType = elecType ?? this.elecType
      ..elecSubType = elecSubType ?? this.elecSubType
      ..groupInfos = groupInfos ?? this.groupInfos
      ..yesterdayCharge = yesterdayCharge ?? this.yesterdayCharge
      ..yesterdayRecharge = yesterdayRecharge ?? this.yesterdayRecharge
      ..modifyTime = modifyTime ?? this.modifyTime
      ..modifiedByName = modifiedByName ?? this.modifiedByName
      ..provinceCode = provinceCode ?? this.provinceCode
      ..siteGridDTOList = siteGridDTOList ?? this.siteGridDTOList
      ..simpleLocation = simpleLocation ?? this.simpleLocation
      ..zoneId = zoneId ?? this.zoneId
      ..latestTimeMill = latestTimeMill ?? this.latestTimeMill
      ..cityCode = cityCode ?? this.cityCode
      ..areaCode = areaCode ?? this.areaCode
      ..protocolVersion = protocolVersion ?? this.protocolVersion
      ..isGrid = isGrid ?? this.isGrid;
  }
}

SiteDataDeviceDtoList $SiteDataDeviceDtoListFromJson(
    Map<String, dynamic> json) {
  final SiteDataDeviceDtoList siteDataDeviceDtoList = SiteDataDeviceDtoList();
  final int? siteId = jsonConvert.convert<int>(json['siteId']);
  if (siteId != null) {
    siteDataDeviceDtoList.siteId = siteId;
  }
  final dynamic siteName = json['siteName'];
  if (siteName != null) {
    siteDataDeviceDtoList.siteName = siteName;
  }
  final int? siteGridId = jsonConvert.convert<int>(json['siteGridId']);
  if (siteGridId != null) {
    siteDataDeviceDtoList.siteGridId = siteGridId;
  }
  final dynamic siteGridName = json['siteGridName'];
  if (siteGridName != null) {
    siteDataDeviceDtoList.siteGridName = siteGridName;
  }
  final int? did = jsonConvert.convert<int>(json['did']);
  if (did != null) {
    siteDataDeviceDtoList.did = did;
  }
  final dynamic cid = json['cid'];
  if (cid != null) {
    siteDataDeviceDtoList.cid = cid;
  }
  final String? sysNo = jsonConvert.convert<String>(json['sysNo']);
  if (sysNo != null) {
    siteDataDeviceDtoList.sysNo = sysNo;
  }
  final String? sn = jsonConvert.convert<String>(json['sn']);
  if (sn != null) {
    siteDataDeviceDtoList.sn = sn;
  }
  final String? name = jsonConvert.convert<String>(json['name']);
  if (name != null) {
    siteDataDeviceDtoList.name = name;
  }
  final int? cluCount = jsonConvert.convert<int>(json['cluCount']);
  if (cluCount != null) {
    siteDataDeviceDtoList.cluCount = cluCount;
  }
  final int? power = jsonConvert.convert<int>(json['power']);
  if (power != null) {
    siteDataDeviceDtoList.power = power;
  }
  final int? capacity = jsonConvert.convert<int>(json['capacity']);
  if (capacity != null) {
    siteDataDeviceDtoList.capacity = capacity;
  }
  final dynamic arrCount = json['arrCount'];
  if (arrCount != null) {
    siteDataDeviceDtoList.arrCount = arrCount;
  }
  final int? packCount = jsonConvert.convert<int>(json['packCount']);
  if (packCount != null) {
    siteDataDeviceDtoList.packCount = packCount;
  }
  final int? cellCount = jsonConvert.convert<int>(json['cellCount']);
  if (cellCount != null) {
    siteDataDeviceDtoList.cellCount = cellCount;
  }
  final int? tempCount = jsonConvert.convert<int>(json['tempCount']);
  if (tempCount != null) {
    siteDataDeviceDtoList.tempCount = tempCount;
  }
  final dynamic remark = json['remark'];
  if (remark != null) {
    siteDataDeviceDtoList.remark = remark;
  }
  final String? operationTime = jsonConvert.convert<String>(
      json['operationTime']);
  if (operationTime != null) {
    siteDataDeviceDtoList.operationTime = operationTime;
  }
  final String? createTime = jsonConvert.convert<String>(json['createTime']);
  if (createTime != null) {
    siteDataDeviceDtoList.createTime = createTime;
  }
  final dynamic modifiedTime = json['modifiedTime'];
  if (modifiedTime != null) {
    siteDataDeviceDtoList.modifiedTime = modifiedTime;
  }
  final String? createdByName = jsonConvert.convert<String>(
      json['createdByName']);
  if (createdByName != null) {
    siteDataDeviceDtoList.createdByName = createdByName;
  }
  final String? modifiedByName = jsonConvert.convert<String>(
      json['modifiedByName']);
  if (modifiedByName != null) {
    siteDataDeviceDtoList.modifiedByName = modifiedByName;
  }
  final int? createdId = jsonConvert.convert<int>(json['createdId']);
  if (createdId != null) {
    siteDataDeviceDtoList.createdId = createdId;
  }
  final int? modifiedId = jsonConvert.convert<int>(json['modifiedId']);
  if (modifiedId != null) {
    siteDataDeviceDtoList.modifiedId = modifiedId;
  }
  final dynamic protocolId = json['protocolId'];
  if (protocolId != null) {
    siteDataDeviceDtoList.protocolId = protocolId;
  }
  final dynamic zoneId = json['zoneId'];
  if (zoneId != null) {
    siteDataDeviceDtoList.zoneId = zoneId;
  }
  final dynamic emsConnectAddr = json['emsConnectAddr'];
  if (emsConnectAddr != null) {
    siteDataDeviceDtoList.emsConnectAddr = emsConnectAddr;
  }
  final int? operationTimeMill = jsonConvert.convert<int>(
      json['operationTimeMill']);
  if (operationTimeMill != null) {
    siteDataDeviceDtoList.operationTimeMill = operationTimeMill;
  }
  return siteDataDeviceDtoList;
}

Map<String, dynamic> $SiteDataDeviceDtoListToJson(
    SiteDataDeviceDtoList entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['siteId'] = entity.siteId;
  data['siteName'] = entity.siteName;
  data['siteGridId'] = entity.siteGridId;
  data['siteGridName'] = entity.siteGridName;
  data['did'] = entity.did;
  data['cid'] = entity.cid;
  data['sysNo'] = entity.sysNo;
  data['sn'] = entity.sn;
  data['name'] = entity.name;
  data['cluCount'] = entity.cluCount;
  data['power'] = entity.power;
  data['capacity'] = entity.capacity;
  data['arrCount'] = entity.arrCount;
  data['packCount'] = entity.packCount;
  data['cellCount'] = entity.cellCount;
  data['tempCount'] = entity.tempCount;
  data['remark'] = entity.remark;
  data['operationTime'] = entity.operationTime;
  data['createTime'] = entity.createTime;
  data['modifiedTime'] = entity.modifiedTime;
  data['createdByName'] = entity.createdByName;
  data['modifiedByName'] = entity.modifiedByName;
  data['createdId'] = entity.createdId;
  data['modifiedId'] = entity.modifiedId;
  data['protocolId'] = entity.protocolId;
  data['zoneId'] = entity.zoneId;
  data['emsConnectAddr'] = entity.emsConnectAddr;
  data['operationTimeMill'] = entity.operationTimeMill;
  return data;
}

extension SiteDataDeviceDtoListExtension on SiteDataDeviceDtoList {
  SiteDataDeviceDtoList copyWith({
    int? siteId,
    dynamic siteName,
    int? siteGridId,
    dynamic siteGridName,
    int? did,
    dynamic cid,
    String? sysNo,
    String? sn,
    String? name,
    int? cluCount,
    int? power,
    int? capacity,
    dynamic arrCount,
    int? packCount,
    int? cellCount,
    int? tempCount,
    dynamic remark,
    String? operationTime,
    String? createTime,
    dynamic modifiedTime,
    String? createdByName,
    String? modifiedByName,
    int? createdId,
    int? modifiedId,
    dynamic protocolId,
    dynamic zoneId,
    dynamic emsConnectAddr,
    int? operationTimeMill,
  }) {
    return SiteDataDeviceDtoList()
      ..siteId = siteId ?? this.siteId
      ..siteName = siteName ?? this.siteName
      ..siteGridId = siteGridId ?? this.siteGridId
      ..siteGridName = siteGridName ?? this.siteGridName
      ..did = did ?? this.did
      ..cid = cid ?? this.cid
      ..sysNo = sysNo ?? this.sysNo
      ..sn = sn ?? this.sn
      ..name = name ?? this.name
      ..cluCount = cluCount ?? this.cluCount
      ..power = power ?? this.power
      ..capacity = capacity ?? this.capacity
      ..arrCount = arrCount ?? this.arrCount
      ..packCount = packCount ?? this.packCount
      ..cellCount = cellCount ?? this.cellCount
      ..tempCount = tempCount ?? this.tempCount
      ..remark = remark ?? this.remark
      ..operationTime = operationTime ?? this.operationTime
      ..createTime = createTime ?? this.createTime
      ..modifiedTime = modifiedTime ?? this.modifiedTime
      ..createdByName = createdByName ?? this.createdByName
      ..modifiedByName = modifiedByName ?? this.modifiedByName
      ..createdId = createdId ?? this.createdId
      ..modifiedId = modifiedId ?? this.modifiedId
      ..protocolId = protocolId ?? this.protocolId
      ..zoneId = zoneId ?? this.zoneId
      ..emsConnectAddr = emsConnectAddr ?? this.emsConnectAddr
      ..operationTimeMill = operationTimeMill ?? this.operationTimeMill;
  }
}