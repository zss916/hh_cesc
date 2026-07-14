import 'dart:io';

import 'package:cescpro/core/setting/app_loading.dart';
import 'package:cescpro/http/bean/ai_compare_data_entity.dart';
import 'package:cescpro/http/bean/ai_power_graph_entity.dart';
import 'package:cescpro/http/bean/check_ai_open_entity.dart';
import 'package:cescpro/http/bean/ctrl_model_entity.dart';
import 'package:cescpro/http/bean/strategy_history_entity.dart';
import 'package:cescpro/http/bean/strategy_power_item_entity.dart';
import 'package:cescpro/http/bean/strategy_protected_entity.dart';
import 'package:cescpro/http/http.dart';
import 'package:cescpro/http/path.dart';
import 'package:flutter/foundation.dart';

class AIControlAPI {
  ///查询模式控制
  static Future<CtrlModelEntity?> fetchModelControl({
    required String siteId,
  }) async {
    try {
      var result = await Http.instance.get(ApiPath.fetchModelControl + siteId);
      if (result["code"] == HttpStatus.ok) {
        CtrlModelEntity value = CtrlModelEntity.fromJson(result["data"]);
        return value;
      } else {
        AppLoading.toast(result["message"]);
        return null;
      }
    } catch (error) {
      return null;
    }
  }

  ///检查是否满足开启AI调度
  static Future<CheckAiOpenEntity?> checkOpenAI({String? siteId}) async {
    try {
      Map<String, dynamic> params = {};
      if (siteId != null) {
        params["siteId"] = siteId;
      }
      var result = await Http.instance.get(ApiPath.checkOpenAI, query: params);
      if (result["code"] == HttpStatus.ok) {
        CheckAiOpenEntity value = CheckAiOpenEntity.fromJson(result["data"]);
        return value;
      } else {
        AppLoading.toast(result["message"]);
        return null;
      }
    } catch (error) {
      return null;
    }
  }

  ///AI 功率曲线
  static Future<AiPowerGraphEntity?> fetchAIData({
    required String siteId,
    required int startTime,
    required int endTime,
  }) async {
    try {
      Map<String, dynamic> map = {};
      map["siteId"] = siteId;
      map["startTime"] = startTime;
      map["endTime"] = endTime;
      var result = await Http.instance.post(ApiPath.fetchAIData, data: map);
      if (result["code"] == HttpStatus.ok) {
        AiPowerGraphEntity value = AiPowerGraphEntity.fromJson(result["data"]);
        return value;
      } else {
        AppLoading.toast(result["message"]);
        return null;
      }
    } catch (error) {
      return null;
    }
  }

  ///AI预测收益与当前模式对比
  static Future<AiCompareDataEntity?> getAIDataCompare({
    required String siteId,
  }) async {
    try {
      Map<String, dynamic> params = {};
      params["siteId"] = siteId;
      var result = await Http.instance.get(
        ApiPath.aIDataCompare,
        query: params,
      );
      if (result["code"] == HttpStatus.ok) {
        AiCompareDataEntity value = AiCompareDataEntity.fromJson(
          result["data"],
        );
        return value;
      } else {
        AppLoading.toast(result["message"]);
        return null;
      }
    } catch (error) {
      return null;
    }
  }

  ///运行策略模式保护查询
  static Future<StrategyProtectedEntity?> queryStrategyProtected({
    required String siteId,
  }) async {
    try {
      Map<String, dynamic> params = {};
      params["siteId"] = siteId;
      var result = await Http.instance.get(
        ApiPath.queryStrategyProtected,
        query: params,
      );
      if (result["code"] == HttpStatus.ok) {
        StrategyProtectedEntity value = StrategyProtectedEntity.fromJson(
          result["data"],
        );
        return value;
      } else {
        AppLoading.toast(result["message"]);
        return null;
      }
    } catch (error) {
      return null;
    }
  }

  ///策略历史
  static Future<List<StrategyHistoryEntity>> fetchStrategyHistory({
    required String siteId,
  }) async {
    try {
      var result = await Http.instance.get(
        ApiPath.fetchStrategyHistory + siteId,
      );
      if (result["code"] == HttpStatus.ok) {
        List<StrategyHistoryEntity> value = await compute(
          (List<dynamic> jsonList) =>
              jsonList.map((e) => StrategyHistoryEntity.fromJson(e)).toList(),
          (result['data'] as List),
        );
        return value;
      } else {
        AppLoading.toast(result["message"]);
        return [];
      }
    } catch (error) {
      return [];
    }
  }

  ///获取策略曲线和实时功率曲线
  static Future<List<StrategyPowerItemEntity>> queryStrategyCurve({
    required String siteId,
  }) async {
    try {
      var result = await Http.instance.get(ApiPath.queryStrategyCurve + siteId);
      if (result["code"] == HttpStatus.ok) {
        List<StrategyPowerItemEntity> value = await compute(
          (List<dynamic> jsonList) =>
              jsonList.map((e) => StrategyPowerItemEntity.fromJson(e)).toList(),
          (result['data'] as List),
        );
        return value;
      } else {
        AppLoading.toast(result["message"]);
        return [];
      }
    } catch (error) {
      return [];
    }
  }
}
