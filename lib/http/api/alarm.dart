import 'dart:io';

import 'package:cescpro/core/setting/app_loading.dart';
import 'package:cescpro/http/bean/alarm_item_entity.dart';
import 'package:cescpro/http/bean/analysis_entity.dart';
import 'package:cescpro/http/http.dart';
import 'package:cescpro/http/path.dart';
import 'package:flutter/foundation.dart';

class AlarmAPI {
  ///实时告警数据
  static Future<(bool, List<AlarmItemEntity>)> postRealTimePage({
    required String siteId,
    int? pageNum = 1,
    int? pageSize = 10,
    int? alarmLevel,
    String? compType,
  }) async {
    Map<String, dynamic> params = {};
    params["siteId"] = siteId;
    if (pageNum != null) {
      params["pageNum"] = pageNum;
    }
    if (pageSize != null) {
      params["pageSize"] = pageSize;
    }
    //告警级别。1-一级告警，2-二级告警，3-三级告警
    if (alarmLevel != null) {
      params["alarmLevel"] = alarmLevel;
    }
    if (compType != null) {
      params["compType"] = compType;
    }
    try {
      var result = await Http.instance.post(
        ApiPath.postRealTimePage,
        data: params,
      );
      if (result["code"] == HttpStatus.ok) {
        List<AlarmItemEntity> value = await compute(
          (List<dynamic> jsonList) =>
              jsonList.map((e) => AlarmItemEntity.fromJson(e)).toList(),
          (result['data']['list'] as List),
        );
        return (true, value);
      } else {
        //AppLoading.toast(result["message"]);
        return (false, <AlarmItemEntity>[]);
      }
    } catch (error) {
      return (false, <AlarmItemEntity>[]);
    }
  }

  ///todo 告警列表，全量
  static Future<(bool, List<AlarmItemEntity>)> getListPageApp({
    int? pageNum = 1,
    int? pageSize = 10,
    int? status,
    int? alarmLevel,
    int? siteId,
    String? adcode,
    int? startTimeMill,
    int? endTimeMill,
  }) async {
    try {
      Map<String, dynamic> params = {};

      if (pageNum != null) {
        params["pageNum"] = pageNum;
      }
      if (pageSize != null) {
        params["pageSize"] = pageSize;
      }

      //状态。0-已结束，1-发生中
      if (status != null) {
        params["status"] = status;
      }
      //告警级别。1-一级告警，2-二级告警，3-三级告警
      if (alarmLevel != null) {
        params["alarmLevel"] = alarmLevel;
      }
      //站点(名称 -> id)
      if (siteId != null) {
        params["siteId"] = siteId;
      }
      //所属区域(USA)
      //https://ems.cescpower.com:9088/api/v1/business/alarm/listPage?adcode=USA&pre_adcode%5B0%5D=USA&pageSize=10&pageNum=1
      if (adcode != null) {
        params["adcode"] = adcode;
      }

      ///开始时间戳和结束时间戳
      if (startTimeMill != null) {
        params["startTimeMill"] = startTimeMill;
      }

      if (endTimeMill != null) {
        params["endTimeMill"] = endTimeMill;
      }

      ///告警开始时间 到结束时间
      ///https://ems.cescpower.com:9088/api/v1/business/alarm/listPage?startTimeMill=1761926400000&endTimeMill=1762012800000&pageSize=10&pageNum=1

      var result = await Http.instance.get(
        ApiPath.getListPageApp,
        query: params,
      );
      if (result["code"] == HttpStatus.ok) {
        List<AlarmItemEntity> value = await compute(
          (List<dynamic> jsonList) =>
              jsonList.map((e) => AlarmItemEntity.fromJson(e)).toList(),
          (result['data']['list'] as List),
        );
        return (true, value);
      } else {
        AppLoading.toast(result["message"]);
        return (false, <AlarmItemEntity>[]);
      }
    } catch (error) {
      return (false, <AlarmItemEntity>[]);
    }
  }

  ///实时告警数据分析
  static Future<AnalysisEntity?> getAnalysis({
    required String siteId,
    String? did,
  }) async {
    try {
      Map<String, dynamic> map = {};
      map["siteId"] = siteId;
      if (did != null) {
        map["did"] = did;
      }
      var result = await Http.instance.get(ApiPath.getAnalysis, query: map);
      if (result["code"] == HttpStatus.ok) {
        return AnalysisEntity.fromJson(result['data']);
      } else {
        AppLoading.toast(result["message"]);
        return null;
      }
    } catch (error) {
      return null;
    }
  }
}
