import 'dart:convert';

import 'package:cescpro/core/translations/en.dart';
import 'package:cescpro/generated/json/base/json_field.dart';
import 'package:cescpro/generated/json/strategy_history_entity.g.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:intl/intl.dart';

export 'package:cescpro/generated/json/strategy_history_entity.g.dart';

@JsonSerializable()
class StrategyHistoryEntity {
  double? id;
  double? siteId;
  String? cmdSn; //关联的指令流水号 (便于通过Kafka更新状态)
  String? operatorName; //操作人姓名 (EMS侧变更可填 "设备侧变更")
  int? actionType; //操作类型: 1-切换模式, 2-调整参数, 3-停用, 4-启用
  String? title; //标题
  String? content; //变更详情文本
  String? reason; //附加原因
  String? beforeSnapshot; //修改前快照JSON
  String? afterSnapshot; //修改后快照JSON
  double? status; //状态: 1-执行中, 2-成功, 3-失败
  String? createTime;
  String? modifyTime;

  int get actionTypeNum => actionType ?? 0;

  StrategyHistoryEntity();

  factory StrategyHistoryEntity.fromJson(Map<String, dynamic> json) =>
      $StrategyHistoryEntityFromJson(json);

  Map<String, dynamic> toJson() => $StrategyHistoryEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }

  // "reason": null,
  //"operatorName": "admin",

  ///转化时间
  String toTime() {
    if (createTime != null) {
      final dt = DateTime.parse(createTime ?? "");
      String time = DateFormat('yyyy-MM-dd HH:mm:ss').format(dt);
      return time;
    } else {
      return '';
    }
  }

  ///action 类型
  ActionType get actionTypeEnum {
    switch ((actionType ?? 0)) {
      case 0:
        return ActionType.none;
      case 1:
        return ActionType.switchMode;
      case 2:
        return ActionType.adjust;
      case 3:
        return ActionType.discontinue;
      case 4:
        return ActionType.open;
      default:
        return ActionType.none;
    }
  }
}

//操作类型: 1-切换模式, 2-调整参数, 3-停用, 4-启用
enum ActionType { none, switchMode, adjust, discontinue, open }

extension ActionTypeExtension on ActionType {
  int get value {
    switch (this) {
      case ActionType.none:
        return 0;
      case ActionType.switchMode:
        return 1;
      case ActionType.adjust:
        return 2;
      case ActionType.discontinue:
        return 3;
      case ActionType.open:
        return 4;
    }
  }

  String get title {
    switch (this) {
      case ActionType.none:
        return "";
      case ActionType.switchMode:
        return TKey.switchTab.tr;
      case ActionType.adjust:
        return TKey.adjustTab.tr;
      case ActionType.discontinue:
        return TKey.stopTab.tr;
      case ActionType.open:
        return TKey.openTab.tr;
    }
  }
}
