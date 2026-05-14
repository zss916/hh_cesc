import 'package:cescpro/core/translations/en.dart';
import 'package:cescpro/core/user/user.dart';
import 'package:cescpro/http/bean/alarm_item_entity.dart';
import 'package:cescpro/http/bean/home_data2_entity.dart';
import 'package:cescpro/http/bean/home_statistic_entity.dart';
import 'package:cescpro/http/bean/site_detail_entity.dart';
import 'package:cescpro/http/bean/site_entity.dart';
import 'package:cescpro/http/bean/site_topology_entity.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';

class Mock {
  ///是否是游客
  static bool get isGuest => User.to.getIsGuest();

  ///首页数据
  static (HomeStatisticEntity?, HomeData2Entity?) homeData() {
    Map<String, dynamic> json = {
      "totalIncome": 1000.0,
      "todayIncome": 20,
      "siteNum": 2,
      "deviceNum": 2,
      "capacity": 3029,
      "totalPos": 12647082.507,
      "totalNeg": 11583229.005,
      "totalPvTotalNeg": 463073.2895,
      "co2": 8729.32,
      "coal": 1366.67,
      "normalNum": 2,
      "faultNum": 0,
      "alarmNum": 0,
      "cutOffNum": 0,
    };
    HomeStatisticEntity data = HomeStatisticEntity.fromJson(json);
    HomeData2Entity data2 = HomeData2Entity.fromJson(json);
    return (data, data2);
  }

  /// 账户名称
  static String accountName(String name) => isGuest
      ? TKey.accountCode.trArgs(["Guest"])
      : TKey.accountCode.trArgs([name]);

  ///账户头像
  static String avatarUrl(String url) => User.to.getIsGuest() ? "" : url;

  ///站点
  static List<SiteEntity> site(bool isRefresh) {
    Map<String, dynamic> json = {
      "cid": 1190,
      "cname": null,
      "id": 479,
      "name": "Site A",
      "types": [4],
      "picture": null,
      "location": "Israel 12",
      "adcode": "ISR",
      "lng": null,
      "lat": null,
      "remark": null,
      "hasDevCount": 2,
      "operationTimeMill": 1755914841000,
      "deviceDtoList": null,
      "capacity": 466,
      "power": 466,
      "pvCapacity": null,
      "pvPower": 233.0,
      "activePower": -50.1,
      "reactivePower": 0.0,
      "alarmNum": 0,
      "status": 1,
      "soc": 29.0,
      "charge": 87880.3,
      "recharge": 79114.8,
      "efficiency": 90.0,
      "protocolId": 231,
      "elecVolLevel": 1,
      "elecSettleType": 2,
      "elecCapacity": null,
      "elecType": 2,
      "elecSubType": 1,
      "groupInfos": null,
      "yesterdayCharge": null,
      "yesterdayRecharge": null,
      "modifyTime": "2025-12-16 06:14:04",
      "modifiedByName": "ysladmin",
      "siteGridDTOList": null,
      "simpleLocation": "12",
      "zoneId": "Asia/Jerusalem",
      "latestTimeMill": null,
      "protocolVersion": null,
      "isGrid": 0,
      "countryCode": null,
      "provinceCode": null,
      "cityCode": "",
      "areaCode": "",
      "isTimeSlot": 1,
      "calculateRevenue": true,
    };
    Map<String, dynamic> json2 = {
      "cid": 1191,
      "cname": null,
      "id": 480,
      "name": "Site B",
      "types": [1],
      "picture": null,
      "location": "Israel 12",
      "adcode": "ISR",
      "lng": null,
      "lat": null,
      "remark": null,
      "hasDevCount": 1,
      "operationTimeMill": 1755843006000,
      "deviceDtoList": null,
      "capacity": 233,
      "power": 233,
      "pvCapacity": null,
      "pvPower": null,
      "activePower": -20.0,
      "reactivePower": 0.0,
      "alarmNum": 0,
      "status": 1,
      "soc": 17.0,
      "charge": 45953.1,
      "recharge": 41385.9,
      "efficiency": 90.1,
      "protocolId": 231,
      "elecVolLevel": 1,
      "elecSettleType": 1,
      "elecCapacity": null,
      "elecType": 1,
      "elecSubType": 1,
      "groupInfos": null,
      "yesterdayCharge": null,
      "yesterdayRecharge": null,
      "modifyTime": "2025-09-11 00:33:59",
      "modifiedByName": "admin",
      "siteGridDTOList": null,
      "simpleLocation": "12",
      "zoneId": "Asia/Jerusalem",
      "latestTimeMill": null,
      "protocolVersion": null,
      "isGrid": 0,
      "countryCode": null,
      "provinceCode": null,
      "cityCode": "",
      "areaCode": "",
      "isTimeSlot": 1,
      "calculateRevenue": true,
    };
    if (isRefresh) {
      return [SiteEntity.fromJson(json), SiteEntity.fromJson(json2)];
    } else {
      return [];
    }
  }

  ///告警
  static List<AlarmItemEntity> alarm(bool isRefresh) {
    if (isRefresh) {
      return [
        AlarmItemEntity()
          ..sn = "****0001"
          ..alarmLevel = 1
          ..status = 0
          ..siteName = "***Site A"
          ..name = "Device 1"
          ..enName = "Device 1"
          ..content = "fault"
          ..startTimeMill = DateTime.now().millisecondsSinceEpoch,
        AlarmItemEntity()
          ..sn = "****0002"
          ..alarmLevel = 3
          ..status = 0
          ..siteName = "***Site B"
          ..name = "Device 2"
          ..enName = "Device 2"
          ..content = "fault"
          ..startTimeMill = DateTime.now().millisecondsSinceEpoch,
      ];
    } else {
      return [];
    }
  }

  ///详情
  static SiteDetailEntity siteDetail(int siteId) {
    Map<String, dynamic> json = {
      "id": 479,
      "name": "Site A",
      "picture": null,
      "location": "Israel 12",
      "lng": null,
      "lat": null,
      "remark": null,
      "hasDevCount": 2,
      "operationTimeMill": 1755914841000,
      "capacity": 466,
      "power": 466,
      "activePower": null,
      "reactivePower": null,
      "alarmNum": 0,
      "status": 5,
      "soc": null,
      "charge": 87910.1,
      "recharge": 79114.8,
      "efficiency": 90.0,
      "totalIncome": 0.0,
      "rechargeAvg": 0.2,
      "chargeAvg": 116.8,
      "cid": 1190,
      "cname": "*************",
      "elecVolLevel": 1,
      "elecSubType": 1,
      "protocolId": 231,
      "latestTimeMill": null,
      "pvCapacity": null,
      "pvPower": 233.0,
      "hasPv": true,
      "protocolVersion": "v2",
      "isTimeSlot": 1,
      "calculateRevenue": true,
    };
    Map<String, dynamic> json2 = {
      "id": 480,
      "name": "Site B",
      "picture": null,
      "location": "Israel 12",
      "lng": null,
      "lat": null,
      "remark": null,
      "hasDevCount": 1,
      "operationTimeMill": 1755843006000,
      "capacity": 233,
      "power": 233,
      "activePower": null,
      "reactivePower": null,
      "alarmNum": 0,
      "status": 5,
      "soc": null,
      "charge": 45975.6,
      "recharge": 41385.9,
      "efficiency": 90.02,
      "totalIncome": 0.0,
      "rechargeAvg": 0.1,
      "chargeAvg": 37.4,
      "cid": 1191,
      "cname": "**********",
      "elecVolLevel": 1,
      "elecSubType": 1,
      "protocolId": 231,
      "latestTimeMill": null,
      "pvCapacity": null,
      "pvPower": null,
      "hasPv": false,
      "protocolVersion": "v2",
      "isTimeSlot": 1,
      "calculateRevenue": true,
    };
    SiteDetailEntity entity = SiteDetailEntity.fromJson(json);
    SiteDetailEntity entity2 = SiteDetailEntity.fromJson(json2);
    if (json["id"] == siteId) {
      return entity;
    } else {
      return entity2;
    }
  }

  ///拓扑图
  static SiteTopologyEntity topology(int siteId) {
    Map<String, dynamic> json = {
      "pv": {"power": 76.4, "code": "PV", "soc": null},
      "storage": {"power": 49.6, "code": "STORAGE", "soc": 39.0},
      "load": {"power": 0.0, "code": "LOAD", "soc": null},
      "pcs": null,
      "grid": {"power": -105.0, "code": "GRID", "soc": null},
      "line": [
        {"from": "PV", "to": "STORAGE"},
        {"from": "PV", "to": "GRID"},
      ],
      "siteId": 479,
      "did": null,
      "hasPv": true,
    };
    Map<String, dynamic> json2 = {
      "pv": {"power": 68.4, "code": "PV", "soc": null},
      "storage": {"power": 29.9, "code": "STORAGE", "soc": 28.0},
      "load": {"power": 0.8, "code": "LOAD", "soc": null},
      "pcs": null,
      "grid": {"power": -37.7, "code": "GRID", "soc": null},
      "line": [
        {"from": "PV", "to": "LOAD"},
        {"from": "PV", "to": "STORAGE"},
        {"from": "PV", "to": "GRID"},
      ],
      "siteId": 480,
      "did": null,
      "hasPv": false,
    };
    SiteTopologyEntity entity = SiteTopologyEntity.fromJson(json);
    SiteTopologyEntity entity2 = SiteTopologyEntity.fromJson(json2);
    if (json["siteId"] == siteId) {
      return entity;
    } else {
      return entity2;
    }
  }
}
