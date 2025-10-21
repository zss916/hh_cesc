import 'package:cescpro/core/setting/app_loading.dart';
import 'package:cescpro/http/bean/alarm_item_entity.dart';
import 'package:cescpro/http/bean/analysis_entity.dart';
import 'package:cescpro/http/http.dart';
import 'package:cescpro/http/path.dart';
import 'package:flutter/foundation.dart';

class AlarmAPI {
  ///todo 实时告警数据
  static Future<(bool, List<AlarmItemEntity>)> postRealTimePage({
    required String siteId,
  }) async {
    Map<String, dynamic> map = {};
    map["siteId"] = siteId;
    try {
      var result = await Http.instance.post(
        ApiPath.postRealTimePage,
        data: map,
      );
      if (result["code"] == 0) {
        List<AlarmItemEntity> value = await compute(
          (List<dynamic> jsonList) =>
              jsonList.map((e) => AlarmItemEntity.fromJson(e)).toList(),
          (result['data'] as List),
        );
        return (false, value);
      } else {
        AppLoading.toast(result["message"]);
        return (false, <AlarmItemEntity>[]);
      }
    } catch (error) {
      return (false, <AlarmItemEntity>[]);
    }
  }

  ///todo 告警列表，全量
  static Future<(bool, List<AlarmItemEntity>)> getListPageApp({
    required String siteId,
  }) async {
    try {
      var result = await Http.instance.get(ApiPath.getListPageApp);
      if (result["code"] == 0) {
        List<AlarmItemEntity> value = await compute(
          (List<dynamic> jsonList) =>
              jsonList.map((e) => AlarmItemEntity.fromJson(e)).toList(),
          (result['data'] as List),
        );
        return (false, value);
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
      if (result["code"] == 0) {
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
