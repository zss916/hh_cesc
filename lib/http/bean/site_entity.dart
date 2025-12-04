import 'dart:convert';

import 'package:cescpro/generated/json/base/json_field.dart';
import 'package:cescpro/generated/json/site_entity.g.dart';

export 'package:cescpro/generated/json/site_entity.g.dart';

@JsonSerializable()
class SiteEntity {
  int? cid;
  String? cname; //客户名称
  int? id; //站点id
  String? name; //站点名称
  List<int>? types; //1-纯储能；2-光储充；3-储能液冷; 4-光储
  String? picture; //设备照片（URL数组）
  String? location; //位置
  String? adcode; //地区code字符串（格式：省,市,区）
  double? lng;
  double? lat;
  String? remark; //备注信息
  int? hasDevCount; //站点下设备数
  int? operationTimeMill; //投运时间
  List<SiteDeviceDtoList>? deviceDtoList;
  int? capacity; //储能装机容量
  int? power; //储能装机功率
  double? pvCapacity; //PV容量
  double? pvPower; //PV功率
  double? activePower; //总有功功率
  double? reactivePower; //无功功率
  int? alarmNum; //告警数量
  int? status; //站点状态
  double? soc;
  double? charge; //充电
  double? recharge; //放电
  double? efficiency; //系统效率
  int? protocolId; //协议id
  int? elecVolLevel; //电压等级
  int? elecSettleType; //结算分类。1-需量 2-容量
  double? elecCapacity; //报装容量。kVA
  int? elecType; //用电核算分类。1-单一制 2-两部制
  int? elecSubType; //用电分类。1-大工业 2-一般工商业
  List<SiteGroupInfos>? groupInfos;
  double? yesterdayCharge;
  double? yesterdayRecharge;
  String? modifyTime;
  String? modifiedByName;
  String? provinceCode;
  List<SiteSiteGridDTOList>? siteGridDTOList;
  String? simpleLocation; //详情地址，用户输入的地址
  String? zoneId; //时区(默认为服务器的时区)
  int? latestTimeMill; //最新数据时间戳
  String? cityCode;
  String? areaCode;
  String? protocolVersion; //协议版本

  SiteEntity();

  factory SiteEntity.fromJson(Map<String, dynamic> json) =>
      $SiteEntityFromJson(json);

  Map<String, dynamic> toJson() => $SiteEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }

  ///站点名称
  String get showSiteName => (name ?? "");

  ///储能装机功率
  String get showPower => "${power ?? 0}kw";

  ///soc
  String get showSoc => "${soc ?? 0}%";

  ///光伏功率
  String get showPvPower => "${pvPower ?? 0}kw";

  ///今日充放电
  String get chargeAndRecharge =>
      "${((charge ?? 0) / 1000).toStringAsFixed(2)}MKW/${((recharge ?? 0) / 1000).toStringAsFixed(2)}MKW";
}

@JsonSerializable()
class SiteDeviceDtoList {
  int? siteId;
  String? siteName;
  int? siteGridId;
  String? siteGridName;
  int? did;
  int? cid;
  String? sysNo;
  String? sn;
  String? name;
  int? cluCount;
  int? power;
  int? capacity;
  int? arrCount;
  int? packCount;
  int? cellCount;
  int? tempCount;
  String? remark;
  String? operationTime;
  String? createTime;
  String? modifiedTime;
  String? createdByName;
  String? modifiedByName;
  int? createdId;
  int? modifiedId;
  int? protocolId;
  String? zoneId;
  String? emsConnectAddr;

  SiteDeviceDtoList();

  factory SiteDeviceDtoList.fromJson(Map<String, dynamic> json) =>
      $SiteDeviceDtoListFromJson(json);

  Map<String, dynamic> toJson() => $SiteDeviceDtoListToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class SiteGroupInfos {
  int? id;
  int? cid;
  String? groupLabel;
  int? groupType;
  int? ownerId;
  String? ownerName;
  String? createTime;
  String? createdByName;
  String? modifyTime;
  String? modifiedByName;
  List<int>? ownerIds;
  List<int>? siteIds;

  SiteGroupInfos();

  factory SiteGroupInfos.fromJson(Map<String, dynamic> json) =>
      $SiteGroupInfosFromJson(json);

  Map<String, dynamic> toJson() => $SiteGroupInfosToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class SiteSiteGridDTOList {
  int? id;
  int? siteId;
  String? name;
  int? createdId;
  int? modifiedId;
  String? createTime;
  String? modifyTime;

  SiteSiteGridDTOList();

  factory SiteSiteGridDTOList.fromJson(Map<String, dynamic> json) =>
      $SiteSiteGridDTOListFromJson(json);

  Map<String, dynamic> toJson() => $SiteSiteGridDTOListToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}
