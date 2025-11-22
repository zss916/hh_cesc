import 'dart:io';

import 'package:cescpro/core/setting/app_loading.dart';
import 'package:cescpro/http/bean/alarm_graph_item_entity.dart';
import 'package:cescpro/http/bean/comp_tree_entity.dart';
import 'package:cescpro/http/bean/elec_graph_entity.dart';
import 'package:cescpro/http/bean/power_graph_entity.dart';
import 'package:cescpro/http/bean/pv_trend_entity.dart';
import 'package:cescpro/http/bean/site_detail_entity.dart';
import 'package:cescpro/http/bean/site_entity.dart';
import 'package:cescpro/http/bean/site_topology_entity.dart';
import 'package:cescpro/http/bean/statistic_record_entity.dart';
import 'package:cescpro/http/http.dart';
import 'package:cescpro/http/path.dart';
import 'package:flutter/foundation.dart';

class SiteAPI {
  ///用户站点列表
  static Future<(bool, List<SiteEntity>)> postPointList({String? name}) async {
    Map<String, dynamic> map = {};
    if (name != null) {
      map['name'] = name;
    }
    try {
      var result = await Http.instance.post(
        ApiPath.postPointList,
        queryParameters: map,
      );
      if (result["code"] == HttpStatus.ok) {
        List<SiteEntity> value = await compute(
          (List<dynamic> jsonList) =>
              jsonList.map((e) => SiteEntity.fromJson(e)).toList(),
          (result['data'] as List),
        );
        return (true, value);
      } else {
        AppLoading.toast(result["message"]);
        return (false, <SiteEntity>[]);
      }
    } catch (error) {
      return (false, <SiteEntity>[]);
    }
  }

  ///站点详情
  static Future<SiteDetailEntity?> getPointDetails({
    required int siteId,
  }) async {
    try {
      var result = await Http.instance.get(
        ApiPath.getPointDetails,
        query: {"siteId": siteId},
      );
      if (result["code"] == HttpStatus.ok) {
        return SiteDetailEntity.fromJson(result["data"]);
      } else {
        AppLoading.toast(result["message"]);
        return null;
      }
    } catch (error) {
      return null;
    }
  }

  ///站点列表
  static Future<(bool, List<SiteEntity>)> postSiteList({
    required int pageNum,
    int? cid,
    String? location,
    String? name,
    List<int>? siteIds,
    int? status,
    String? modifyTimeStart,
    String? modifyTimeEnd,
    int? groupId,
    String? adcode,
    int? total,
  }) async {
    try {
      Map<String, dynamic> map = {};
      map["pageNum"] = pageNum;
      map["pageSize"] = 10;
      if (cid != null) {
        map["cid"] = cid;
      }
      if (location != null) {
        map["location"] = location;
      }
      if (name != null) {
        map["name"] = name;
      }
      if (siteIds != null) {
        map["siteIds"] = siteIds;
      }
      if (status != null) {
        map["status"] = status;
      }
      if (modifyTimeStart != null) {
        map["modifyTimeStart"] = modifyTimeStart;
      }
      if (modifyTimeEnd != null) {
        map["modifyTimeEnd"] = modifyTimeEnd;
      }
      if (groupId != null) {
        map["groupId"] = groupId;
      }
      if (adcode != null) {
        map["adcode"] = adcode;
      }
      if (total != null) {
        map["total"] = total;
      }
      var result = await Http.instance.post(ApiPath.postSiteList, data: map);
      if (result["code"] == HttpStatus.ok) {
        List<SiteEntity> value = await compute(
          (List<dynamic> jsonList) =>
              jsonList.map((e) => SiteEntity.fromJson(e)).toList(),
          (result['data']['list'] as List),
        );
        return (true, value);
      } else {
        //AppLoading.toast(result["message"]);
        return (false, <SiteEntity>[]);
      }
    } catch (error) {
      return (false, <SiteEntity>[]);
    }
  }

  ///站点拓扑图
  static Future<SiteTopologyEntity?> getSiteTopology({
    required int siteId,
  }) async {
    try {
      var result = await Http.instance.get(
        ApiPath.getSiteTopology,
        query: {"siteId": siteId},
      );
      if (result["code"] == HttpStatus.ok) {
        return SiteTopologyEntity.fromJson(result["data"]);
      } else {
        AppLoading.toast(result["message"]);
        return null;
      }
    } catch (error) {
      return null;
    }
  }

  ///站点数据统计
  static Future<StatisticRecordEntity?> getSiteStatisticRecord({
    required int siteId,
  }) async {
    try {
      var result = await Http.instance.get(
        ApiPath.getSiteStatisticRecord,
        query: {"siteId": siteId},
      );
      if (result["code"] == HttpStatus.ok) {
        return StatisticRecordEntity.fromJson(result["data"]);
      } else {
        AppLoading.toast(result["message"]);
        return null;
      }
    } catch (error) {
      return null;
    }
  }

  ///获取光伏发电趋势数据
  static Future<(bool, List<PvTrendEntity>)> postPvTrend({
    required int siteId,
    required int startTimeStamp,
    required int endTimeStamp,
    required int queryType,
  }) async {
    try {
      //1.月 2.年 0.日(间隔15分钟，仅电量)
      var result = await Http.instance.post(
        ApiPath.postPvTrend,
        data: {
          "siteId": siteId,
          "startTimeStamp": startTimeStamp,
          "endTimeStamp": endTimeStamp,
          "queryType": queryType,
        },
      );
      if (result["code"] == HttpStatus.ok) {
        List<PvTrendEntity> value = await compute(
          (List<dynamic> jsonList) =>
              jsonList.map((e) => PvTrendEntity.fromJson(e)).toList(),
          (result['data'] as List),
        );
        return (true, value);
      } else {
        AppLoading.toast(result["message"]);
        return (false, <PvTrendEntity>[]);
      }
    } catch (error) {
      return (false, <PvTrendEntity>[]);
    }
  }

  ///查询收益，充放电统计以及效率
  static Future<(bool, List<ElecGraphEntity>)> postElecGraph({
    required int siteId,
    int? startTimeStamp,
    int? endTimeStamp,
    int? queryType,
  }) async {
    try {
      var result = await Http.instance.post(
        ApiPath.postElecGraph,
        data: {
          "siteId": siteId,
          "startTimeStamp": startTimeStamp ?? 0,
          "endTimeStamp": endTimeStamp ?? 0,
          "queryType": queryType ?? 0,
        },
      );
      if (result["code"] == HttpStatus.ok) {
        List<ElecGraphEntity> value = await compute(
          (List<dynamic> jsonList) =>
              jsonList.map((e) => ElecGraphEntity.fromJson(e)).toList(),
          (result['data'] as List),
        );
        return (true, value);
      } else {
        AppLoading.toast(result["message"]);
        return (false, <ElecGraphEntity>[]);
      }
    } catch (error) {
      return (false, <ElecGraphEntity>[]);
    }
  }

  ///功率分析
  static Future<(bool, List<PowerGraphEntity>)> postPowerGraph({
    required int siteId,
    int? startTimeStamp,
    int? endTimeStamp,
    int? queryType,
  }) async {
    try {
      Map<String, dynamic> map = {};
      map['siteId'] = siteId;
      if (startTimeStamp != null) {
        map['startTimeStamp'] = startTimeStamp;
      }
      if (endTimeStamp != null) {
        map['endTimeStamp'] = endTimeStamp;
      }
      if (queryType != null) {
        map['queryType'] = queryType;
      }
      var result = await Http.instance.post(ApiPath.postPowerGraph, data: map);
      if (result["code"] == HttpStatus.ok) {
        List<PowerGraphEntity> value = await compute(
          (List<dynamic> jsonList) =>
              jsonList.map((e) => PowerGraphEntity.fromJson(e)).toList(),
          (result['data'] as List),
        );
        return (true, value);
      } else {
        AppLoading.toast(result["message"]);
        return (false, <PowerGraphEntity>[]);
      }
    } catch (error) {
      return (false, <PowerGraphEntity>[]);
    }
  }

  ///查询告警图
  static Future<(bool, List<AlarmGraphItemEntity>)> postAlarmGraph({
    required String siteId,
    required int startTimeStamp,
    required int endTimeStamp,
    required int queryType, //1.月 2.年 0.日(间隔15分钟，仅电量)
  }) async {
    try {
      var result = await Http.instance.post(
        ApiPath.postAlarmGraph,
        data: {
          "siteId": siteId,
          "startTimeStamp": 0,
          "endTimeStamp": 0,
          "queryType": 0,
        },
      );
      if (result["code"] == HttpStatus.ok) {
        List<AlarmGraphItemEntity> value = await compute(
          (List<dynamic> jsonList) =>
              jsonList.map((e) => AlarmGraphItemEntity.fromJson(e)).toList(),
          (result['data'] as List),
        );
        return (true, value);
      } else {
        AppLoading.toast(result["message"]);
        return (false, <AlarmGraphItemEntity>[]);
      }
    } catch (error) {
      return (false, <AlarmGraphItemEntity>[]);
    }
  }

  ///获取组件树
  static Future<(bool, List<CompTreeEntity>)> getCompTree({
    String? siteId,
    String? did,
    String? type,
  }) async {
    try {
      Map<String, dynamic> map = {};
      if (siteId != null) {
        map["siteId"] = siteId;
      }
      if (did != null) {
        map["did"] = did;
      }
      if (type != null) {
        map["type"] = type;
      }
      var result = await Http.instance.get(ApiPath.getCompTree, query: map);
      if (result["code"] == HttpStatus.ok) {
        List<CompTreeEntity> value = await compute(
          (List<dynamic> jsonList) =>
              jsonList.map((e) => CompTreeEntity.fromJson(e)).toList(),
          (result['data'] as List),
        );
        return (true, value);
      } else {
        AppLoading.toast(result["message"]);
        return (false, <CompTreeEntity>[]);
      }
    } catch (error) {
      return (false, <CompTreeEntity>[]);
    }
  }
}
