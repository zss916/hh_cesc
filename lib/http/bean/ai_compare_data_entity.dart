import 'dart:convert';

import 'package:cescpro/generated/json/ai_compare_data_entity.g.dart';
import 'package:cescpro/generated/json/base/json_field.dart';
import 'package:decimal/decimal.dart';

export 'package:cescpro/generated/json/ai_compare_data_entity.g.dart';

@JsonSerializable()
class AiCompareDataEntity {
  int? actualGridFeedGain; //馈网收益
  int? actualPvSelfUseGain; //发电自用收益
  int? actualStorageProfit; //储能价差收益
  int? aiPredictGridFeedGain; //AI预测馈网收益
  int? aiPredictPvSelfUseGain; //AI预测发电自用收益
  int? aiPredictStorageProfit; //AI预测储能价差收益
  String? actualTotalProfit; //昨天总收益 (馈网 + 储能价差 - 发电自用)
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

  ///是否负
  bool isNegative(String? input) {
    double? number = double.tryParse(input ?? "0");
    bool isNegative = number != null && number < 0;
    return isNegative;
  }

  String? showAiPredictTotalProfit() {
    return isNegative(aiPredictTotalProfit)
        ? aiPredictTotalProfit
        : "+$aiPredictTotalProfit";
  }

  String get aiAllRevenueMonth {
    DateTime now = DateTime.now();
    int day = (DateTime(now.year, now.month + 1, 0).day);
    Decimal price = Decimal.parse((aiPredictTotalProfit ?? "0"));
    Decimal total = price * Decimal.fromInt(day);
    bool isNegative = total < Decimal.zero;
    return isNegative ? total.toString() : "+$total";
  }
}
