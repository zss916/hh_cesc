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
      "totalIncome": 5000.0,
      "todayIncome": 100,
      "siteNum": 2,
      "deviceNum": 2,
      "capacity": 443,
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
  static List<SiteEntity> site(bool isRefresh, int? status) {
    Map<String, dynamic> json = {
      "cid": 1190,
      "cname": null,
      "id": 479,
      "name": "Site A",
      "types": [4],
      "picture": null,
      "location": "*****srael",
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
      "activePower": -49.9,
      "reactivePower": 0.0,
      "alarmNum": 0,
      "status": 1,
      "soc": 72.0,
      "charge": 90656.4,
      "recharge": 81427.5,
      "efficiency": 89.8,
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
      "modifiedByName": "",
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
      "soc": 28.0,
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
      "calculateRevenue": false,
    };
    if (isRefresh) {
      if (status == 1 || status == null || status == 99) {
        return [SiteEntity.fromJson(json), SiteEntity.fromJson(json2)];
      } else {
        return [];
      }
    } else {
      return [];
    }
  }

  ///告警
  static List<AlarmItemEntity> alarm(bool isRefresh, int? alarmLevel) {
    List<AlarmItemEntity> data = [
      AlarmItemEntity()
        ..sn = "****0001"
        ..alarmLevel = 1
        ..status = 0
        ..siteName = "Site A"
        ..name = "Device 1"
        ..enName = "Device 1"
        ..content = "fault"
        ..startTimeMill = DateTime.now().millisecondsSinceEpoch,
      AlarmItemEntity()
        ..sn = "****0002"
        ..alarmLevel = 3
        ..status = 0
        ..siteName = "Site B"
        ..name = "Device 2"
        ..enName = "Device 2"
        ..content = "fault"
        ..startTimeMill = DateTime.now().millisecondsSinceEpoch,
    ];

    if (isRefresh) {
      if (alarmLevel == null) {
        return data;
      } else {
        return data.where((e) => e.alarmLevel == alarmLevel).toList();
      }
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
      "location": "*****srael",
      "lng": null,
      "lat": null,
      "remark": null,
      "hasDevCount": 1,
      "operationTimeMill": 1755914841000,
      "capacity": 210,
      "power": 466,
      "activePower": null,
      "reactivePower": null,
      "alarmNum": 0,
      "status": 5,
      "soc": null,
      "charge": 90657.7,
      "recharge": 81427.5,
      "efficiency": 89.82,
      "totalIncome": 0.0,
      "rechargeAvg": 0.2,
      "chargeAvg": 299.1,
      "cid": 1190,
      "cname": "Customer A",
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
      "cname": "Customer B",
      "elecVolLevel": 1,
      "elecSubType": 1,
      "protocolId": 231,
      "latestTimeMill": null,
      "pvCapacity": null,
      "pvPower": 233.0,
      "hasPv": true,
      "protocolVersion": "v2",
      "isTimeSlot": 1,
      "calculateRevenue": false,
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
      "pv": {"power": 206.7, "code": "PV", "soc": null},
      "storage": {"power": 1.70, "code": "STORAGE", "soc": 72},
      "load": {"power": 200.0, "code": "LOAD", "soc": null},
      "pcs": null,
      "grid": {"power": -5.0, "code": "GRID", "soc": null},
      "line": [
        {"from": "PV", "to": "STORAGE"},
        {"from": "PV", "to": "GRID"},
        {"from": "PV", "to": "LOAD"},
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
      "hasPv": true,
    };
    SiteTopologyEntity entity = SiteTopologyEntity.fromJson(json);
    SiteTopologyEntity entity2 = SiteTopologyEntity.fromJson(json2);
    if (json["siteId"] == siteId) {
      return entity;
    } else {
      return entity2;
    }
  }

  ///compTree
  /* static Future<(bool, List<CompTreeEntity>)> compTree({String? siteId}) async {
    List<Map<String, dynamic>> json = [
      {
        "label": "DEV",
        "key": "did",
        "val": 484,
        "type": null,
        "labelVal": null,
        "labelCn": "1-1",
        "labelEn": "1-1",
        "child": [
          {
            "label": "NODE_NO",
            "key": "nodeNo",
            "val": 4,
            "type": "ARR",
            "labelVal": null,
            "labelCn": "1#并网点",
            "labelEn": "1#PCC",
            "child": [
              {
                "label": null,
                "key": "devNo",
                "val": 2,
                "type": "ARR",
                "labelVal": null,
                "labelCn": "1#堆",
                "labelEn": "1#STACK",
                "child": null,
              },
            ],
          },
          {
            "label": "NODE_NO",
            "key": "nodeNo",
            "val": 5,
            "type": "ARR",
            "labelVal": null,
            "labelCn": "2#并网点",
            "labelEn": "2#PCC",
            "child": [
              {
                "label": null,
                "key": "devNo",
                "val": 12,
                "type": "ARR",
                "labelVal": null,
                "labelCn": "1#堆",
                "labelEn": "1#STACK",
                "child": null,
              },
            ],
          },
        ],
      },
    ];
    List<Map<String, dynamic>> json2 = [
      {
        "label": "DEV",
        "key": "did",
        "val": 480,
        "type": null,
        "labelVal": null,
        "labelCn": "2-1",
        "labelEn": "2-1",
        "child": [
          {
            "label": "NODE_NO",
            "key": "nodeNo",
            "val": 4,
            "type": "ARR",
            "labelVal": null,
            "labelCn": "1#并网点",
            "labelEn": "1#PCC",
            "child": [
              {
                "label": null,
                "key": "devNo",
                "val": 2,
                "type": "ARR",
                "labelVal": null,
                "labelCn": "1#堆",
                "labelEn": "1#STACK",
                "child": null,
              },
            ],
          },
        ],
      },
    ];
    List<CompTreeEntity> list = await getList(json);
    List<CompTreeEntity> list2 = await getList(json2);
    if (siteId == json.first['val']) {
      return (true, list);
    } else {
      return (true, list2);
    }
  }

  static Future<List<CompTreeEntity>> getList(
    List<Map<String, dynamic>> value,
  ) async {
    return await compute(
      (List<dynamic> jsonList) =>
          jsonList.map((e) => CompTreeEntity.fromJson(e)).toList(),
      (value as List),
    );
  }*/

  ///设备类型
  /*static List<String> supportDevTypesV2() {
    return ["ARR", "CLU", "PCS", "METER", "COOL", "DRIER", "DIDO"];
  }*/
}
