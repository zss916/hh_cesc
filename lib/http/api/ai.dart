import 'dart:io';

import 'package:cescpro/core/setting/app_loading.dart';
import 'package:cescpro/http/bean/check_ai_open_entity.dart';
import 'package:cescpro/http/bean/model_ctrl_entity.dart';
import 'package:cescpro/http/http.dart';
import 'package:cescpro/http/path.dart';

class AIControlAPI {
  ///查询模式控制
  static Future<ModelCtrlEntity?> fetchModelControl({
    required String siteId,
  }) async {
    try {
      var result = await Http.instance.get(ApiPath.fetchModelControl + siteId);
      if (result["code"] == HttpStatus.ok) {
        ModelCtrlEntity value = ModelCtrlEntity.fromJson(result["data"]);
        return value;
      } else {
        AppLoading.toast(result["message"]);
        return null;
      }
    } catch (error) {
      return null;
    }
  }

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
}
