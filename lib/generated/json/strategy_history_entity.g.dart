import 'package:cescpro/generated/json/base/json_convert_content.dart';
import 'package:cescpro/http/bean/strategy_history_entity.dart';
import 'package:cescpro/core/translations/en.dart';

import 'package:get/get_utils/src/extensions/internacionalization.dart';

import 'package:intl/intl.dart';


StrategyHistoryEntity $StrategyHistoryEntityFromJson(
    Map<String, dynamic> json) {
  final StrategyHistoryEntity strategyHistoryEntity = StrategyHistoryEntity();
  final double? id = jsonConvert.convert<double>(json['id']);
  if (id != null) {
    strategyHistoryEntity.id = id;
  }
  final double? siteId = jsonConvert.convert<double>(json['siteId']);
  if (siteId != null) {
    strategyHistoryEntity.siteId = siteId;
  }
  final String? cmdSn = jsonConvert.convert<String>(json['cmdSn']);
  if (cmdSn != null) {
    strategyHistoryEntity.cmdSn = cmdSn;
  }
  final String? operatorName = jsonConvert.convert<String>(
      json['operatorName']);
  if (operatorName != null) {
    strategyHistoryEntity.operatorName = operatorName;
  }
  final int? actionType = jsonConvert.convert<int>(json['actionType']);
  if (actionType != null) {
    strategyHistoryEntity.actionType = actionType;
  }
  final String? title = jsonConvert.convert<String>(json['title']);
  if (title != null) {
    strategyHistoryEntity.title = title;
  }
  final String? content = jsonConvert.convert<String>(json['content']);
  if (content != null) {
    strategyHistoryEntity.content = content;
  }
  final String? reason = jsonConvert.convert<String>(json['reason']);
  if (reason != null) {
    strategyHistoryEntity.reason = reason;
  }
  final String? beforeSnapshot = jsonConvert.convert<String>(
      json['beforeSnapshot']);
  if (beforeSnapshot != null) {
    strategyHistoryEntity.beforeSnapshot = beforeSnapshot;
  }
  final String? afterSnapshot = jsonConvert.convert<String>(
      json['afterSnapshot']);
  if (afterSnapshot != null) {
    strategyHistoryEntity.afterSnapshot = afterSnapshot;
  }
  final double? status = jsonConvert.convert<double>(json['status']);
  if (status != null) {
    strategyHistoryEntity.status = status;
  }
  final String? createTime = jsonConvert.convert<String>(json['createTime']);
  if (createTime != null) {
    strategyHistoryEntity.createTime = createTime;
  }
  final String? modifyTime = jsonConvert.convert<String>(json['modifyTime']);
  if (modifyTime != null) {
    strategyHistoryEntity.modifyTime = modifyTime;
  }
  return strategyHistoryEntity;
}

Map<String, dynamic> $StrategyHistoryEntityToJson(
    StrategyHistoryEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['id'] = entity.id;
  data['siteId'] = entity.siteId;
  data['cmdSn'] = entity.cmdSn;
  data['operatorName'] = entity.operatorName;
  data['actionType'] = entity.actionType;
  data['title'] = entity.title;
  data['content'] = entity.content;
  data['reason'] = entity.reason;
  data['beforeSnapshot'] = entity.beforeSnapshot;
  data['afterSnapshot'] = entity.afterSnapshot;
  data['status'] = entity.status;
  data['createTime'] = entity.createTime;
  data['modifyTime'] = entity.modifyTime;
  return data;
}

extension StrategyHistoryEntityExtension on StrategyHistoryEntity {
  StrategyHistoryEntity copyWith({
    double? id,
    double? siteId,
    String? cmdSn,
    String? operatorName,
    int? actionType,
    String? title,
    String? content,
    String? reason,
    String? beforeSnapshot,
    String? afterSnapshot,
    double? status,
    String? createTime,
    String? modifyTime,
  }) {
    return StrategyHistoryEntity()
      ..id = id ?? this.id
      ..siteId = siteId ?? this.siteId
      ..cmdSn = cmdSn ?? this.cmdSn
      ..operatorName = operatorName ?? this.operatorName
      ..actionType = actionType ?? this.actionType
      ..title = title ?? this.title
      ..content = content ?? this.content
      ..reason = reason ?? this.reason
      ..beforeSnapshot = beforeSnapshot ?? this.beforeSnapshot
      ..afterSnapshot = afterSnapshot ?? this.afterSnapshot
      ..status = status ?? this.status
      ..createTime = createTime ?? this.createTime
      ..modifyTime = modifyTime ?? this.modifyTime;
  }
}