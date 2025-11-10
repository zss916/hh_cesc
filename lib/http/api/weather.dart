import 'dart:io';

import 'package:cescpro/core/setting/app_loading.dart';
import 'package:cescpro/http/bean/weather_entity.dart';
import 'package:cescpro/http/http.dart';
import 'package:cescpro/http/path.dart';

class WeatherAPI {
  ///天气信息
  static Future<WeatherEntity?> postForecastApp({
    int? siteId,
    String? date,
  }) async {
    Map<String, dynamic> map = {};
    if (siteId != null) {
      map["siteId"] = siteId;
    }
    //\d{4}-\d{2}-\d{2}
    if (date != null) {
      map["date"] = date;
    }
    try {
      var result = await Http.instance.post(ApiPath.postForecastApp, data: map);
      if (result["code"] == HttpStatus.ok) {
        return WeatherEntity.fromJson(result["data"]);
      } else {
        AppLoading.toast(result["message"]);
        return null;
      }
    } catch (error) {
      return null;
    }
  }
}
