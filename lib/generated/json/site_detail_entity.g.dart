import 'package:cescpro/generated/json/base/json_convert_content.dart';
import 'package:cescpro/http/bean/site_detail_entity.dart';

SiteDetailEntity $SiteDetailEntityFromJson(Map<String, dynamic> json) {
  final SiteDetailEntity siteDetailEntity = SiteDetailEntity();
  final int? id = jsonConvert.convert<int>(json['id']);
  if (id != null) {
    siteDetailEntity.id = id;
  }
  final String? name = jsonConvert.convert<String>(json['name']);
  if (name != null) {
    siteDetailEntity.name = name;
  }
  final String? picture = jsonConvert.convert<String>(json['picture']);
  if (picture != null) {
    siteDetailEntity.picture = picture;
  }
  final String? location = jsonConvert.convert<String>(json['location']);
  if (location != null) {
    siteDetailEntity.location = location;
  }
  final double? lng = jsonConvert.convert<double>(json['lng']);
  if (lng != null) {
    siteDetailEntity.lng = lng;
  }
  final double? lat = jsonConvert.convert<double>(json['lat']);
  if (lat != null) {
    siteDetailEntity.lat = lat;
  }
  final String? remark = jsonConvert.convert<String>(json['remark']);
  if (remark != null) {
    siteDetailEntity.remark = remark;
  }
  final int? hasDevCount = jsonConvert.convert<int>(json['hasDevCount']);
  if (hasDevCount != null) {
    siteDetailEntity.hasDevCount = hasDevCount;
  }
  final int? operationTimeMill = jsonConvert.convert<int>(
    json['operationTimeMill'],
  );
  if (operationTimeMill != null) {
    siteDetailEntity.operationTimeMill = operationTimeMill;
  }
  final int? capacity = jsonConvert.convert<int>(json['capacity']);
  if (capacity != null) {
    siteDetailEntity.capacity = capacity;
  }
  final int? power = jsonConvert.convert<int>(json['power']);
  if (power != null) {
    siteDetailEntity.power = power;
  }
  final double? activePower = jsonConvert.convert<double>(json['activePower']);
  if (activePower != null) {
    siteDetailEntity.activePower = activePower;
  }
  final double? reactivePower = jsonConvert.convert<double>(
    json['reactivePower'],
  );
  if (reactivePower != null) {
    siteDetailEntity.reactivePower = reactivePower;
  }
  final int? alarmNum = jsonConvert.convert<int>(json['alarmNum']);
  if (alarmNum != null) {
    siteDetailEntity.alarmNum = alarmNum;
  }
  final int? status = jsonConvert.convert<int>(json['status']);
  if (status != null) {
    siteDetailEntity.status = status;
  }
  final double? soc = jsonConvert.convert<double>(json['soc']);
  if (soc != null) {
    siteDetailEntity.soc = soc;
  }
  final double? charge = jsonConvert.convert<double>(json['charge']);
  if (charge != null) {
    siteDetailEntity.charge = charge;
  }
  final double? recharge = jsonConvert.convert<double>(json['recharge']);
  if (recharge != null) {
    siteDetailEntity.recharge = recharge;
  }
  final double? efficiency = jsonConvert.convert<double>(json['efficiency']);
  if (efficiency != null) {
    siteDetailEntity.efficiency = efficiency;
  }
  final double? totalIncome = jsonConvert.convert<double>(json['totalIncome']);
  if (totalIncome != null) {
    siteDetailEntity.totalIncome = totalIncome;
  }
  final double? rechargeAvg = jsonConvert.convert<double>(json['rechargeAvg']);
  if (rechargeAvg != null) {
    siteDetailEntity.rechargeAvg = rechargeAvg;
  }
  final double? chargeAvg = jsonConvert.convert<double>(json['chargeAvg']);
  if (chargeAvg != null) {
    siteDetailEntity.chargeAvg = chargeAvg;
  }
  final int? cid = jsonConvert.convert<int>(json['cid']);
  if (cid != null) {
    siteDetailEntity.cid = cid;
  }
  final String? cname = jsonConvert.convert<String>(json['cname']);
  if (cname != null) {
    siteDetailEntity.cname = cname;
  }
  final int? elecVolLevel = jsonConvert.convert<int>(json['elecVolLevel']);
  if (elecVolLevel != null) {
    siteDetailEntity.elecVolLevel = elecVolLevel;
  }
  final int? elecSubType = jsonConvert.convert<int>(json['elecSubType']);
  if (elecSubType != null) {
    siteDetailEntity.elecSubType = elecSubType;
  }
  final int? protocolId = jsonConvert.convert<int>(json['protocolId']);
  if (protocolId != null) {
    siteDetailEntity.protocolId = protocolId;
  }
  final int? latestTimeMill = jsonConvert.convert<int>(json['latestTimeMill']);
  if (latestTimeMill != null) {
    siteDetailEntity.latestTimeMill = latestTimeMill;
  }
  final double? pvCapacity = jsonConvert.convert<double>(json['pvCapacity']);
  if (pvCapacity != null) {
    siteDetailEntity.pvCapacity = pvCapacity;
  }
  final double? pvPower = jsonConvert.convert<double>(json['pvPower']);
  if (pvPower != null) {
    siteDetailEntity.pvPower = pvPower;
  }
  final bool? hasPv = jsonConvert.convert<bool>(json['hasPv']);
  if (hasPv != null) {
    siteDetailEntity.hasPv = hasPv;
  }
  final String? protocolVersion = jsonConvert.convert<String>(
    json['protocolVersion'],
  );
  if (protocolVersion != null) {
    siteDetailEntity.protocolVersion = protocolVersion;
  }
  return siteDetailEntity;
}

Map<String, dynamic> $SiteDetailEntityToJson(SiteDetailEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['id'] = entity.id;
  data['name'] = entity.name;
  data['picture'] = entity.picture;
  data['location'] = entity.location;
  data['lng'] = entity.lng;
  data['lat'] = entity.lat;
  data['remark'] = entity.remark;
  data['hasDevCount'] = entity.hasDevCount;
  data['operationTimeMill'] = entity.operationTimeMill;
  data['capacity'] = entity.capacity;
  data['power'] = entity.power;
  data['activePower'] = entity.activePower;
  data['reactivePower'] = entity.reactivePower;
  data['alarmNum'] = entity.alarmNum;
  data['status'] = entity.status;
  data['soc'] = entity.soc;
  data['charge'] = entity.charge;
  data['recharge'] = entity.recharge;
  data['efficiency'] = entity.efficiency;
  data['totalIncome'] = entity.totalIncome;
  data['rechargeAvg'] = entity.rechargeAvg;
  data['chargeAvg'] = entity.chargeAvg;
  data['cid'] = entity.cid;
  data['cname'] = entity.cname;
  data['elecVolLevel'] = entity.elecVolLevel;
  data['elecSubType'] = entity.elecSubType;
  data['protocolId'] = entity.protocolId;
  data['latestTimeMill'] = entity.latestTimeMill;
  data['pvCapacity'] = entity.pvCapacity;
  data['pvPower'] = entity.pvPower;
  data['hasPv'] = entity.hasPv;
  data['protocolVersion'] = entity.protocolVersion;
  return data;
}

extension SiteDetailEntityExtension on SiteDetailEntity {
  SiteDetailEntity copyWith({
    int? id,
    String? name,
    String? picture,
    String? location,
    double? lng,
    double? lat,
    String? remark,
    int? hasDevCount,
    int? operationTimeMill,
    int? capacity,
    int? power,
    double? activePower,
    double? reactivePower,
    int? alarmNum,
    int? status,
    double? soc,
    double? charge,
    double? recharge,
    double? efficiency,
    double? totalIncome,
    double? rechargeAvg,
    double? chargeAvg,
    int? cid,
    String? cname,
    int? elecVolLevel,
    int? elecSubType,
    int? protocolId,
    int? latestTimeMill,
    double? pvCapacity,
    double? pvPower,
    bool? hasPv,
    String? protocolVersion,
  }) {
    return SiteDetailEntity()
      ..id = id ?? this.id
      ..name = name ?? this.name
      ..picture = picture ?? this.picture
      ..location = location ?? this.location
      ..lng = lng ?? this.lng
      ..lat = lat ?? this.lat
      ..remark = remark ?? this.remark
      ..hasDevCount = hasDevCount ?? this.hasDevCount
      ..operationTimeMill = operationTimeMill ?? this.operationTimeMill
      ..capacity = capacity ?? this.capacity
      ..power = power ?? this.power
      ..activePower = activePower ?? this.activePower
      ..reactivePower = reactivePower ?? this.reactivePower
      ..alarmNum = alarmNum ?? this.alarmNum
      ..status = status ?? this.status
      ..soc = soc ?? this.soc
      ..charge = charge ?? this.charge
      ..recharge = recharge ?? this.recharge
      ..efficiency = efficiency ?? this.efficiency
      ..totalIncome = totalIncome ?? this.totalIncome
      ..rechargeAvg = rechargeAvg ?? this.rechargeAvg
      ..chargeAvg = chargeAvg ?? this.chargeAvg
      ..cid = cid ?? this.cid
      ..cname = cname ?? this.cname
      ..elecVolLevel = elecVolLevel ?? this.elecVolLevel
      ..elecSubType = elecSubType ?? this.elecSubType
      ..protocolId = protocolId ?? this.protocolId
      ..latestTimeMill = latestTimeMill ?? this.latestTimeMill
      ..pvCapacity = pvCapacity ?? this.pvCapacity
      ..pvPower = pvPower ?? this.pvPower
      ..hasPv = hasPv ?? this.hasPv
      ..protocolVersion = protocolVersion ?? this.protocolVersion;
  }
}
