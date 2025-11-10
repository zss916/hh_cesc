import 'dart:io';

import 'package:cescpro/core/setting/app_loading.dart';
import 'package:cescpro/http/bean/message_item_entity.dart';
import 'package:cescpro/http/http.dart';
import 'package:cescpro/http/path.dart';
import 'package:flutter/foundation.dart';

class MessageAPI {
  /// 查询用户消息列表
  static Future<(bool, List<MessageItemEntity>)> postQueryMessage({
    int? pageNum,
    String? sendTimeStart,
    String? sendTimeEnd,
  }) async {
    Map<String, dynamic> map = {};
    map["channelType"] = 1;
    if (sendTimeStart != null) {
      map["sendTimeStart"] = sendTimeStart;
    }
    if (sendTimeEnd != null) {
      map["sendTimeEnd"] = sendTimeEnd;
    }
    try {
      var result = await Http.instance.post(
        ApiPath.postQueryMessage,
        data: map,
      );
      if (result["code"] == HttpStatus.ok) {
        List<MessageItemEntity> value = await compute(
          (List<dynamic> jsonList) =>
              jsonList.map((e) => MessageItemEntity.fromJson(e)).toList(),
          (result['data']['list'] as List),
        );
        return (true, value);
      } else {
        AppLoading.toast(result["message"]);
        return (false, <MessageItemEntity>[]);
      }
    } catch (error) {
      return (false, <MessageItemEntity>[]);
    }
  }

  ///查询用户某个渠道的指定位置的未读消息
  static Future<int> getUnreadNum() async {
    try {
      var result = await Http.instance.get(ApiPath.getUnreadNum);
      if (result["code"] == HttpStatus.ok) {
        return (result["data"] as int?) ?? 0;
      } else {
        AppLoading.toast(result["message"]);
        return 0;
      }
    } catch (error) {
      return 0;
    }
  }
}
