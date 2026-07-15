import 'dart:convert';

import 'package:cescpro/generated/json/ai_compare_data_entity.g.dart';
import 'package:cescpro/generated/json/base/json_field.dart';

export 'package:cescpro/generated/json/ai_compare_data_entity.g.dart';

@JsonSerializable()
class AiCompareDataEntity {
  int? yesterdayGridFeedGain; //昨天馈网收益
  int? yesterdayPvSelfUseGain; //昨天发电自用收益
  int? yesterdayStorageProfit; //昨天储能价差收益
  int? aiPredictGridFeedGain; //AI预测馈网收益
  int? aiPredictPvSelfUseGain; //AI预测发电自用收益
  int? aiPredictStorageProfit; //AI预测储能价差收益
  String? yesterdayTotalProfit; //昨天总收益 (馈网 + 储能价差 - 发电自用)
  String? aiPredictTotalProfit; //AI预测总收益 (馈网 + 储能价差 - 发电自用)
  String? profitGrowth; //收益增长额
  String? profitGrowthRate; //收益增长率
  String? predictDate; //标记预测使用的具体日期（今天/明天，如 "2026-07-08"）
  String? currency;

  AiCompareDataEntity();

  factory AiCompareDataEntity.fromJson(Map<String, dynamic> json) =>
      $AiCompareDataEntityFromJson(json);

  Map<String, dynamic> toJson() => $AiCompareDataEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}
