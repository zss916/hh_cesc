import 'package:cescpro/generated/json/base/json_convert_content.dart';
import 'package:cescpro/http/bean/site_entity.dart';

SiteEntity $SiteEntityFromJson(Map<String, dynamic> json) {
  final SiteEntity siteEntity = SiteEntity();
  final int? cid = jsonConvert.convert<int>(json['cid']);
  if (cid != null) {
    siteEntity.cid = cid;
  }
  final String? cname = jsonConvert.convert<String>(json['cname']);
  if (cname != null) {
    siteEntity.cname = cname;
  }
  final int? id = jsonConvert.convert<int>(json['id']);
  if (id != null) {
    siteEntity.id = id;
  }
  final String? name = jsonConvert.convert<String>(json['name']);
  if (name != null) {
    siteEntity.name = name;
  }
  final List<int>? types = (json['types'] as List<dynamic>?)
      ?.map((e) => jsonConvert.convert<int>(e) as int)
      .toList();
  if (types != null) {
    siteEntity.types = types;
  }
  final String? picture = jsonConvert.convert<String>(json['picture']);
  if (picture != null) {
    siteEntity.picture = picture;
  }
  final String? location = jsonConvert.convert<String>(json['location']);
  if (location != null) {
    siteEntity.location = location;
  }
  final String? adcode = jsonConvert.convert<String>(json['adcode']);
  if (adcode != null) {
    siteEntity.adcode = adcode;
  }
  final double? lng = jsonConvert.convert<double>(json['lng']);
  if (lng != null) {
    siteEntity.lng = lng;
  }
  final double? lat = jsonConvert.convert<double>(json['lat']);
  if (lat != null) {
    siteEntity.lat = lat;
  }
  final String? remark = jsonConvert.convert<String>(json['remark']);
  if (remark != null) {
    siteEntity.remark = remark;
  }
  final int? hasDevCount = jsonConvert.convert<int>(json['hasDevCount']);
  if (hasDevCount != null) {
    siteEntity.hasDevCount = hasDevCount;
  }
  final int? operationTimeMill = jsonConvert.convert<int>(
    json['operationTimeMill'],
  );
  if (operationTimeMill != null) {
    siteEntity.operationTimeMill = operationTimeMill;
  }
  final List<SiteDeviceDtoList>? deviceDtoList =
      (json['deviceDtoList'] as List<dynamic>?)
          ?.map(
            (e) =>
                jsonConvert.convert<SiteDeviceDtoList>(e) as SiteDeviceDtoList,
          )
          .toList();
  if (deviceDtoList != null) {
    siteEntity.deviceDtoList = deviceDtoList;
  }
  final int? capacity = jsonConvert.convert<int>(json['capacity']);
  if (capacity != null) {
    siteEntity.capacity = capacity;
  }
  final int? power = jsonConvert.convert<int>(json['power']);
  if (power != null) {
    siteEntity.power = power;
  }
  final double? pvCapacity = jsonConvert.convert<double>(json['pvCapacity']);
  if (pvCapacity != null) {
    siteEntity.pvCapacity = pvCapacity;
  }
  final double? pvPower = jsonConvert.convert<double>(json['pvPower']);
  if (pvPower != null) {
    siteEntity.pvPower = pvPower;
  }
  final double? activePower = jsonConvert.convert<double>(json['activePower']);
  if (activePower != null) {
    siteEntity.activePower = activePower;
  }
  final double? reactivePower = jsonConvert.convert<double>(
    json['reactivePower'],
  );
  if (reactivePower != null) {
    siteEntity.reactivePower = reactivePower;
  }
  final int? alarmNum = jsonConvert.convert<int>(json['alarmNum']);
  if (alarmNum != null) {
    siteEntity.alarmNum = alarmNum;
  }
  final int? status = jsonConvert.convert<int>(json['status']);
  if (status != null) {
    siteEntity.status = status;
  }
  final double? soc = jsonConvert.convert<double>(json['soc']);
  if (soc != null) {
    siteEntity.soc = soc;
  }
  final double? charge = jsonConvert.convert<double>(json['charge']);
  if (charge != null) {
    siteEntity.charge = charge;
  }
  final double? recharge = jsonConvert.convert<double>(json['recharge']);
  if (recharge != null) {
    siteEntity.recharge = recharge;
  }
  final double? efficiency = jsonConvert.convert<double>(json['efficiency']);
  if (efficiency != null) {
    siteEntity.efficiency = efficiency;
  }
  final int? protocolId = jsonConvert.convert<int>(json['protocolId']);
  if (protocolId != null) {
    siteEntity.protocolId = protocolId;
  }
  final int? elecVolLevel = jsonConvert.convert<int>(json['elecVolLevel']);
  if (elecVolLevel != null) {
    siteEntity.elecVolLevel = elecVolLevel;
  }
  final int? elecSettleType = jsonConvert.convert<int>(json['elecSettleType']);
  if (elecSettleType != null) {
    siteEntity.elecSettleType = elecSettleType;
  }
  final double? elecCapacity = jsonConvert.convert<double>(
    json['elecCapacity'],
  );
  if (elecCapacity != null) {
    siteEntity.elecCapacity = elecCapacity;
  }
  final int? elecType = jsonConvert.convert<int>(json['elecType']);
  if (elecType != null) {
    siteEntity.elecType = elecType;
  }
  final int? elecSubType = jsonConvert.convert<int>(json['elecSubType']);
  if (elecSubType != null) {
    siteEntity.elecSubType = elecSubType;
  }
  final List<SiteGroupInfos>? groupInfos =
      (json['groupInfos'] as List<dynamic>?)
          ?.map((e) => jsonConvert.convert<SiteGroupInfos>(e) as SiteGroupInfos)
          .toList();
  if (groupInfos != null) {
    siteEntity.groupInfos = groupInfos;
  }
  final double? yesterdayCharge = jsonConvert.convert<double>(
    json['yesterdayCharge'],
  );
  if (yesterdayCharge != null) {
    siteEntity.yesterdayCharge = yesterdayCharge;
  }
  final double? yesterdayRecharge = jsonConvert.convert<double>(
    json['yesterdayRecharge'],
  );
  if (yesterdayRecharge != null) {
    siteEntity.yesterdayRecharge = yesterdayRecharge;
  }
  final String? modifyTime = jsonConvert.convert<String>(json['modifyTime']);
  if (modifyTime != null) {
    siteEntity.modifyTime = modifyTime;
  }
  final String? modifiedByName = jsonConvert.convert<String>(
    json['modifiedByName'],
  );
  if (modifiedByName != null) {
    siteEntity.modifiedByName = modifiedByName;
  }
  final String? provinceCode = jsonConvert.convert<String>(
    json['provinceCode'],
  );
  if (provinceCode != null) {
    siteEntity.provinceCode = provinceCode;
  }
  final List<SiteSiteGridDTOList>? siteGridDTOList =
      (json['siteGridDTOList'] as List<dynamic>?)
          ?.map(
            (e) =>
                jsonConvert.convert<SiteSiteGridDTOList>(e)
                    as SiteSiteGridDTOList,
          )
          .toList();
  if (siteGridDTOList != null) {
    siteEntity.siteGridDTOList = siteGridDTOList;
  }
  final String? simpleLocation = jsonConvert.convert<String>(
    json['simpleLocation'],
  );
  if (simpleLocation != null) {
    siteEntity.simpleLocation = simpleLocation;
  }
  final String? zoneId = jsonConvert.convert<String>(json['zoneId']);
  if (zoneId != null) {
    siteEntity.zoneId = zoneId;
  }
  final int? latestTimeMill = jsonConvert.convert<int>(json['latestTimeMill']);
  if (latestTimeMill != null) {
    siteEntity.latestTimeMill = latestTimeMill;
  }
  final String? cityCode = jsonConvert.convert<String>(json['cityCode']);
  if (cityCode != null) {
    siteEntity.cityCode = cityCode;
  }
  final String? areaCode = jsonConvert.convert<String>(json['areaCode']);
  if (areaCode != null) {
    siteEntity.areaCode = areaCode;
  }
  final String? protocolVersion = jsonConvert.convert<String>(
    json['protocolVersion'],
  );
  if (protocolVersion != null) {
    siteEntity.protocolVersion = protocolVersion;
  }
  return siteEntity;
}

Map<String, dynamic> $SiteEntityToJson(SiteEntity entity) {
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
  data['groupInfos'] = entity.groupInfos?.map((v) => v.toJson()).toList();
  data['yesterdayCharge'] = entity.yesterdayCharge;
  data['yesterdayRecharge'] = entity.yesterdayRecharge;
  data['modifyTime'] = entity.modifyTime;
  data['modifiedByName'] = entity.modifiedByName;
  data['provinceCode'] = entity.provinceCode;
  data['siteGridDTOList'] = entity.siteGridDTOList
      ?.map((v) => v.toJson())
      .toList();
  data['simpleLocation'] = entity.simpleLocation;
  data['zoneId'] = entity.zoneId;
  data['latestTimeMill'] = entity.latestTimeMill;
  data['cityCode'] = entity.cityCode;
  data['areaCode'] = entity.areaCode;
  data['protocolVersion'] = entity.protocolVersion;
  return data;
}

extension SiteEntityExtension on SiteEntity {
  SiteEntity copyWith({
    int? cid,
    String? cname,
    int? id,
    String? name,
    List<int>? types,
    String? picture,
    String? location,
    String? adcode,
    double? lng,
    double? lat,
    String? remark,
    int? hasDevCount,
    int? operationTimeMill,
    List<SiteDeviceDtoList>? deviceDtoList,
    int? capacity,
    int? power,
    double? pvCapacity,
    double? pvPower,
    double? activePower,
    double? reactivePower,
    int? alarmNum,
    int? status,
    double? soc,
    double? charge,
    double? recharge,
    double? efficiency,
    int? protocolId,
    int? elecVolLevel,
    int? elecSettleType,
    double? elecCapacity,
    int? elecType,
    int? elecSubType,
    List<SiteGroupInfos>? groupInfos,
    double? yesterdayCharge,
    double? yesterdayRecharge,
    String? modifyTime,
    String? modifiedByName,
    String? provinceCode,
    List<SiteSiteGridDTOList>? siteGridDTOList,
    String? simpleLocation,
    String? zoneId,
    int? latestTimeMill,
    String? cityCode,
    String? areaCode,
    String? protocolVersion,
  }) {
    return SiteEntity()
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
      ..protocolVersion = protocolVersion ?? this.protocolVersion;
  }
}

SiteDeviceDtoList $SiteDeviceDtoListFromJson(Map<String, dynamic> json) {
  final SiteDeviceDtoList siteDeviceDtoList = SiteDeviceDtoList();
  final int? siteId = jsonConvert.convert<int>(json['siteId']);
  if (siteId != null) {
    siteDeviceDtoList.siteId = siteId;
  }
  final String? siteName = jsonConvert.convert<String>(json['siteName']);
  if (siteName != null) {
    siteDeviceDtoList.siteName = siteName;
  }
  final int? siteGridId = jsonConvert.convert<int>(json['siteGridId']);
  if (siteGridId != null) {
    siteDeviceDtoList.siteGridId = siteGridId;
  }
  final String? siteGridName = jsonConvert.convert<String>(
    json['siteGridName'],
  );
  if (siteGridName != null) {
    siteDeviceDtoList.siteGridName = siteGridName;
  }
  final int? did = jsonConvert.convert<int>(json['did']);
  if (did != null) {
    siteDeviceDtoList.did = did;
  }
  final int? cid = jsonConvert.convert<int>(json['cid']);
  if (cid != null) {
    siteDeviceDtoList.cid = cid;
  }
  final String? sysNo = jsonConvert.convert<String>(json['sysNo']);
  if (sysNo != null) {
    siteDeviceDtoList.sysNo = sysNo;
  }
  final String? sn = jsonConvert.convert<String>(json['sn']);
  if (sn != null) {
    siteDeviceDtoList.sn = sn;
  }
  final String? name = jsonConvert.convert<String>(json['name']);
  if (name != null) {
    siteDeviceDtoList.name = name;
  }
  final int? cluCount = jsonConvert.convert<int>(json['cluCount']);
  if (cluCount != null) {
    siteDeviceDtoList.cluCount = cluCount;
  }
  final int? power = jsonConvert.convert<int>(json['power']);
  if (power != null) {
    siteDeviceDtoList.power = power;
  }
  final int? capacity = jsonConvert.convert<int>(json['capacity']);
  if (capacity != null) {
    siteDeviceDtoList.capacity = capacity;
  }
  final int? arrCount = jsonConvert.convert<int>(json['arrCount']);
  if (arrCount != null) {
    siteDeviceDtoList.arrCount = arrCount;
  }
  final int? packCount = jsonConvert.convert<int>(json['packCount']);
  if (packCount != null) {
    siteDeviceDtoList.packCount = packCount;
  }
  final int? cellCount = jsonConvert.convert<int>(json['cellCount']);
  if (cellCount != null) {
    siteDeviceDtoList.cellCount = cellCount;
  }
  final int? tempCount = jsonConvert.convert<int>(json['tempCount']);
  if (tempCount != null) {
    siteDeviceDtoList.tempCount = tempCount;
  }
  final String? remark = jsonConvert.convert<String>(json['remark']);
  if (remark != null) {
    siteDeviceDtoList.remark = remark;
  }
  final String? operationTime = jsonConvert.convert<String>(
    json['operationTime'],
  );
  if (operationTime != null) {
    siteDeviceDtoList.operationTime = operationTime;
  }
  final String? createTime = jsonConvert.convert<String>(json['createTime']);
  if (createTime != null) {
    siteDeviceDtoList.createTime = createTime;
  }
  final String? modifiedTime = jsonConvert.convert<String>(
    json['modifiedTime'],
  );
  if (modifiedTime != null) {
    siteDeviceDtoList.modifiedTime = modifiedTime;
  }
  final String? createdByName = jsonConvert.convert<String>(
    json['createdByName'],
  );
  if (createdByName != null) {
    siteDeviceDtoList.createdByName = createdByName;
  }
  final String? modifiedByName = jsonConvert.convert<String>(
    json['modifiedByName'],
  );
  if (modifiedByName != null) {
    siteDeviceDtoList.modifiedByName = modifiedByName;
  }
  final int? createdId = jsonConvert.convert<int>(json['createdId']);
  if (createdId != null) {
    siteDeviceDtoList.createdId = createdId;
  }
  final int? modifiedId = jsonConvert.convert<int>(json['modifiedId']);
  if (modifiedId != null) {
    siteDeviceDtoList.modifiedId = modifiedId;
  }
  final int? protocolId = jsonConvert.convert<int>(json['protocolId']);
  if (protocolId != null) {
    siteDeviceDtoList.protocolId = protocolId;
  }
  final String? zoneId = jsonConvert.convert<String>(json['zoneId']);
  if (zoneId != null) {
    siteDeviceDtoList.zoneId = zoneId;
  }
  final String? emsConnectAddr = jsonConvert.convert<String>(
    json['emsConnectAddr'],
  );
  if (emsConnectAddr != null) {
    siteDeviceDtoList.emsConnectAddr = emsConnectAddr;
  }
  return siteDeviceDtoList;
}

Map<String, dynamic> $SiteDeviceDtoListToJson(SiteDeviceDtoList entity) {
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
  return data;
}

extension SiteDeviceDtoListExtension on SiteDeviceDtoList {
  SiteDeviceDtoList copyWith({
    int? siteId,
    String? siteName,
    int? siteGridId,
    String? siteGridName,
    int? did,
    int? cid,
    String? sysNo,
    String? sn,
    String? name,
    int? cluCount,
    int? power,
    int? capacity,
    int? arrCount,
    int? packCount,
    int? cellCount,
    int? tempCount,
    String? remark,
    String? operationTime,
    String? createTime,
    String? modifiedTime,
    String? createdByName,
    String? modifiedByName,
    int? createdId,
    int? modifiedId,
    int? protocolId,
    String? zoneId,
    String? emsConnectAddr,
  }) {
    return SiteDeviceDtoList()
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
      ..emsConnectAddr = emsConnectAddr ?? this.emsConnectAddr;
  }
}

SiteGroupInfos $SiteGroupInfosFromJson(Map<String, dynamic> json) {
  final SiteGroupInfos siteGroupInfos = SiteGroupInfos();
  final int? id = jsonConvert.convert<int>(json['id']);
  if (id != null) {
    siteGroupInfos.id = id;
  }
  final int? cid = jsonConvert.convert<int>(json['cid']);
  if (cid != null) {
    siteGroupInfos.cid = cid;
  }
  final String? groupLabel = jsonConvert.convert<String>(json['groupLabel']);
  if (groupLabel != null) {
    siteGroupInfos.groupLabel = groupLabel;
  }
  final int? groupType = jsonConvert.convert<int>(json['groupType']);
  if (groupType != null) {
    siteGroupInfos.groupType = groupType;
  }
  final int? ownerId = jsonConvert.convert<int>(json['ownerId']);
  if (ownerId != null) {
    siteGroupInfos.ownerId = ownerId;
  }
  final String? ownerName = jsonConvert.convert<String>(json['ownerName']);
  if (ownerName != null) {
    siteGroupInfos.ownerName = ownerName;
  }
  final String? createTime = jsonConvert.convert<String>(json['createTime']);
  if (createTime != null) {
    siteGroupInfos.createTime = createTime;
  }
  final String? createdByName = jsonConvert.convert<String>(
    json['createdByName'],
  );
  if (createdByName != null) {
    siteGroupInfos.createdByName = createdByName;
  }
  final String? modifyTime = jsonConvert.convert<String>(json['modifyTime']);
  if (modifyTime != null) {
    siteGroupInfos.modifyTime = modifyTime;
  }
  final String? modifiedByName = jsonConvert.convert<String>(
    json['modifiedByName'],
  );
  if (modifiedByName != null) {
    siteGroupInfos.modifiedByName = modifiedByName;
  }
  final List<int>? ownerIds = (json['ownerIds'] as List<dynamic>?)
      ?.map((e) => jsonConvert.convert<int>(e) as int)
      .toList();
  if (ownerIds != null) {
    siteGroupInfos.ownerIds = ownerIds;
  }
  final List<int>? siteIds = (json['siteIds'] as List<dynamic>?)
      ?.map((e) => jsonConvert.convert<int>(e) as int)
      .toList();
  if (siteIds != null) {
    siteGroupInfos.siteIds = siteIds;
  }
  return siteGroupInfos;
}

Map<String, dynamic> $SiteGroupInfosToJson(SiteGroupInfos entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['id'] = entity.id;
  data['cid'] = entity.cid;
  data['groupLabel'] = entity.groupLabel;
  data['groupType'] = entity.groupType;
  data['ownerId'] = entity.ownerId;
  data['ownerName'] = entity.ownerName;
  data['createTime'] = entity.createTime;
  data['createdByName'] = entity.createdByName;
  data['modifyTime'] = entity.modifyTime;
  data['modifiedByName'] = entity.modifiedByName;
  data['ownerIds'] = entity.ownerIds;
  data['siteIds'] = entity.siteIds;
  return data;
}

extension SiteGroupInfosExtension on SiteGroupInfos {
  SiteGroupInfos copyWith({
    int? id,
    int? cid,
    String? groupLabel,
    int? groupType,
    int? ownerId,
    String? ownerName,
    String? createTime,
    String? createdByName,
    String? modifyTime,
    String? modifiedByName,
    List<int>? ownerIds,
    List<int>? siteIds,
  }) {
    return SiteGroupInfos()
      ..id = id ?? this.id
      ..cid = cid ?? this.cid
      ..groupLabel = groupLabel ?? this.groupLabel
      ..groupType = groupType ?? this.groupType
      ..ownerId = ownerId ?? this.ownerId
      ..ownerName = ownerName ?? this.ownerName
      ..createTime = createTime ?? this.createTime
      ..createdByName = createdByName ?? this.createdByName
      ..modifyTime = modifyTime ?? this.modifyTime
      ..modifiedByName = modifiedByName ?? this.modifiedByName
      ..ownerIds = ownerIds ?? this.ownerIds
      ..siteIds = siteIds ?? this.siteIds;
  }
}

SiteSiteGridDTOList $SiteSiteGridDTOListFromJson(Map<String, dynamic> json) {
  final SiteSiteGridDTOList siteSiteGridDTOList = SiteSiteGridDTOList();
  final int? id = jsonConvert.convert<int>(json['id']);
  if (id != null) {
    siteSiteGridDTOList.id = id;
  }
  final int? siteId = jsonConvert.convert<int>(json['siteId']);
  if (siteId != null) {
    siteSiteGridDTOList.siteId = siteId;
  }
  final String? name = jsonConvert.convert<String>(json['name']);
  if (name != null) {
    siteSiteGridDTOList.name = name;
  }
  final int? createdId = jsonConvert.convert<int>(json['createdId']);
  if (createdId != null) {
    siteSiteGridDTOList.createdId = createdId;
  }
  final int? modifiedId = jsonConvert.convert<int>(json['modifiedId']);
  if (modifiedId != null) {
    siteSiteGridDTOList.modifiedId = modifiedId;
  }
  final String? createTime = jsonConvert.convert<String>(json['createTime']);
  if (createTime != null) {
    siteSiteGridDTOList.createTime = createTime;
  }
  final String? modifyTime = jsonConvert.convert<String>(json['modifyTime']);
  if (modifyTime != null) {
    siteSiteGridDTOList.modifyTime = modifyTime;
  }
  return siteSiteGridDTOList;
}

Map<String, dynamic> $SiteSiteGridDTOListToJson(SiteSiteGridDTOList entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['id'] = entity.id;
  data['siteId'] = entity.siteId;
  data['name'] = entity.name;
  data['createdId'] = entity.createdId;
  data['modifiedId'] = entity.modifiedId;
  data['createTime'] = entity.createTime;
  data['modifyTime'] = entity.modifyTime;
  return data;
}

extension SiteSiteGridDTOListExtension on SiteSiteGridDTOList {
  SiteSiteGridDTOList copyWith({
    int? id,
    int? siteId,
    String? name,
    int? createdId,
    int? modifiedId,
    String? createTime,
    String? modifyTime,
  }) {
    return SiteSiteGridDTOList()
      ..id = id ?? this.id
      ..siteId = siteId ?? this.siteId
      ..name = name ?? this.name
      ..createdId = createdId ?? this.createdId
      ..modifiedId = modifiedId ?? this.modifiedId
      ..createTime = createTime ?? this.createTime
      ..modifyTime = modifyTime ?? this.modifyTime;
  }
}
