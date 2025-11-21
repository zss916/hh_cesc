import 'dart:io';

import 'package:cescpro/core/setting/app_loading.dart';
import 'package:cescpro/http/bean/alarm_item_entity.dart';
import 'package:cescpro/http/http.dart';
import 'package:cescpro/http/path.dart';
import 'package:flutter/foundation.dart';

class SubscribeAPI {
  ///获取重要告警列表
  static Future<(bool, List<AlarmItemEntity>)> getImportantList({
    required int siteId,
  }) async {
    try {
      var result = await Http.instance.get(
        ApiPath.getImportantList,
        query: {"siteId": siteId},
      );
      if (result["code"] == HttpStatus.ok) {
        List<AlarmItemEntity> value = await compute(
          (List<dynamic> jsonList) =>
              jsonList.map((e) => AlarmItemEntity.fromJson(e)).toList(),
          (result['data'] as List),
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
}
