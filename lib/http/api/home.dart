import 'dart:io';

import 'package:cescpro/core/setting/app_loading.dart';
import 'package:cescpro/http/bean/home_statistic_entity.dart';
import 'package:cescpro/http/bean/statistic_report_entity.dart';
import 'package:cescpro/http/http.dart';
import 'package:cescpro/http/path.dart';
import 'package:flutter/foundation.dart';

class HomeAPI {
  ///站点首页信息展信
  static Future<HomeStatisticEntity?> postStatisticRecord({
    String? siteId,
    String? adcode,
    String? name,
    String? groupId,
    bool? filter,
  }) async {
    Map<String, dynamic> map = {};
    if (siteId != null) {
      map["siteId"] = siteId;
    }
    if (adcode != null) {
      map["adcode"] = adcode;
    }
    if (name != null) {
      map["name"] = name;
    }
    if (groupId != null) {
      map["groupId"] = groupId;
    }
    if (filter != null) {
      map["filter"] = filter;
    }
    try {
      var result = await Http.instance.post(
        ApiPath.postStatisticRecord,
        data: map,
      );
      if (result["code"] == HttpStatus.ok) {
        return HomeStatisticEntity.fromJson(result["data"]);
      } else {
        AppLoading.toast(result["message"]);
        return null;
      }
    } catch (error) {
      return null;
    }
  }

  ///电量、止度、收益报表
  static Future<(bool, List<StatisticReportEntity>)> postStatisticReportApp({
    int? siteId,
    int? queryType,
    int? reportType,
    String? adcode,
    int? startTimeStamp,
    int? endTimeStamp,
    int? date,
  }) async {
    Map<String, dynamic> map = {};
    if (siteId != null) {
      map['siteId'] = siteId;
    }
    if (queryType != null) {
      map['queryType'] = queryType;
    }
    if (reportType != null) {
      map['reportType'] = reportType;
    }
    if (adcode != null) {
      map['adcode'] = adcode;
    }
    if (startTimeStamp != null) {
      map['startTimeStamp'] = startTimeStamp;
    }
    if (endTimeStamp != null) {
      map['endTimeStamp'] = endTimeStamp;
    }
    if (date != null) {
      map['date'] = date;
    }
    try {
      var result = await Http.instance.post(
        ApiPath.postStatisticReportApp,
        data: map,
      );
      if (result["code"] == HttpStatus.ok) {
        List<StatisticReportEntity> value = await compute(
          (List<dynamic> jsonList) =>
              jsonList.map((e) => StatisticReportEntity.fromJson(e)).toList(),
          (result['data'] as List),
        );
        return (true, value);
      } else {
        AppLoading.toast(result["message"]);
        return (false, <StatisticReportEntity>[]);
      }
    } catch (error) {
      return (false, <StatisticReportEntity>[]);
    }
  }

  ///获取协议支持的设备类型列表
  static Future<(bool, List<String>)> getSupportDevTypesV2({
    required int? siteId,
    required int? protocolId,
  }) async {
    try {
      Map<String, dynamic> map = {};
      if (siteId != null) {
        map["siteId"] = siteId;
      }
      if (protocolId != null) {
        map["protocolId"] = protocolId;
      }
      var result = await Http.instance.get(
        ApiPath.getSupportDevTypesV2,
        query: map,
      );
      if (result["code"] == HttpStatus.ok) {
        List<String> list = (result['data'] as List)
            .map((e) => e.toString())
            .toList();
        return (true, list);
      } else {
        AppLoading.toast(result["message"]);
        return (false, <String>[]);
      }
    } catch (error) {
      return (false, <String>[]);
    }
  }
}
