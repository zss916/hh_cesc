import 'dart:convert';

import 'package:cescpro/generated/json/base/json_field.dart';
import 'package:cescpro/generated/json/site_data_entity.g.dart';

export 'package:cescpro/generated/json/site_data_entity.g.dart';

@JsonSerializable()
class SiteDataEntity {
  int? cid;
  String? cname;
  int? id;
  String? name;
  dynamic types;
  String? picture;
  String? location;
  String? adcode;
  dynamic lng;
  dynamic lat;
  dynamic remark;
  int? hasDevCount;
  int? operationTimeMill;
  List<SiteDataDeviceDtoList>? deviceDtoList;
  int? capacity;
  int? power;
  dynamic pvCapacity;
  double? pvPower;
  dynamic activePower;
  dynamic reactivePower;
  dynamic alarmNum;
  dynamic status;
  dynamic soc;
  dynamic charge;
  dynamic recharge;
  dynamic efficiency;
  int? protocolId;
  int? elecVolLevel;
  int? elecSettleType;
  double? elecCapacity;
  int? elecType;
  int? elecSubType;
  dynamic groupInfos;
  dynamic yesterdayCharge;
  dynamic yesterdayRecharge;
  String? modifyTime;
  String? modifiedByName;
  dynamic provinceCode;
  dynamic siteGridDTOList;
  String? simpleLocation;
  String? zoneId;
  dynamic latestTimeMill;
  dynamic cityCode;
  dynamic areaCode;
  String? protocolVersion;
  int? isGrid;

  SiteDataEntity();

  factory SiteDataEntity.fromJson(Map<String, dynamic> json) =>
      $SiteDataEntityFromJson(json);

  Map<String, dynamic> toJson() => $SiteDataEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class SiteDataDeviceDtoList {
  int? siteId;
  dynamic siteName;
  int? siteGridId;
  dynamic siteGridName;
  int? did;
  dynamic cid;
  String? sysNo;
  String? sn;
  String? name;
  int? cluCount;
  int? power;
  int? capacity;
  dynamic arrCount;
  int? packCount;
  int? cellCount;
  int? tempCount;
  dynamic remark;
  String? operationTime;
  String? createTime;
  dynamic modifiedTime;
  String? createdByName;
  String? modifiedByName;
  int? createdId;
  int? modifiedId;
  dynamic protocolId;
  dynamic zoneId;
  dynamic emsConnectAddr;
  int? operationTimeMill;

  SiteDataDeviceDtoList();

  factory SiteDataDeviceDtoList.fromJson(Map<String, dynamic> json) =>
      $SiteDataDeviceDtoListFromJson(json);

  Map<String, dynamic> toJson() => $SiteDataDeviceDtoListToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}
