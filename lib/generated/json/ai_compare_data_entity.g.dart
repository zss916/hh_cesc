import 'package:cescpro/generated/json/base/json_convert_content.dart';
import 'package:cescpro/http/bean/ai_compare_data_entity.dart';

AiCompareDataEntity $AiCompareDataEntityFromJson(Map<String, dynamic> json) {
  final AiCompareDataEntity aiCompareDataEntity = AiCompareDataEntity();
  final int? actualGridFeedGain = jsonConvert.convert<int>(
    json['actualGridFeedGain'],
  );
  if (actualGridFeedGain != null) {
    aiCompareDataEntity.actualGridFeedGain = actualGridFeedGain;
  }
  final int? actualPvSelfUseGain = jsonConvert.convert<int>(
    json['actualPvSelfUseGain'],
  );
  if (actualPvSelfUseGain != null) {
    aiCompareDataEntity.actualPvSelfUseGain = actualPvSelfUseGain;
  }
  final int? actualStorageProfit = jsonConvert.convert<int>(
    json['actualStorageProfit'],
  );
  if (actualStorageProfit != null) {
    aiCompareDataEntity.actualStorageProfit = actualStorageProfit;
  }
  final int? aiPredictGridFeedGain = jsonConvert.convert<int>(
    json['aiPredictGridFeedGain'],
  );
  if (aiPredictGridFeedGain != null) {
    aiCompareDataEntity.aiPredictGridFeedGain = aiPredictGridFeedGain;
  }
  final int? aiPredictPvSelfUseGain = jsonConvert.convert<int>(
    json['aiPredictPvSelfUseGain'],
  );
  if (aiPredictPvSelfUseGain != null) {
    aiCompareDataEntity.aiPredictPvSelfUseGain = aiPredictPvSelfUseGain;
  }
  final int? aiPredictStorageProfit = jsonConvert.convert<int>(
    json['aiPredictStorageProfit'],
  );
  if (aiPredictStorageProfit != null) {
    aiCompareDataEntity.aiPredictStorageProfit = aiPredictStorageProfit;
  }
  final String? actualTotalProfit = jsonConvert.convert<String>(
    json['actualTotalProfit'],
  );
  if (actualTotalProfit != null) {
    aiCompareDataEntity.actualTotalProfit = actualTotalProfit;
  }
  final String? aiPredictTotalProfit = jsonConvert.convert<String>(
    json['aiPredictTotalProfit'],
  );
  if (aiPredictTotalProfit != null) {
    aiCompareDataEntity.aiPredictTotalProfit = aiPredictTotalProfit;
  }
  final String? profitGrowth = jsonConvert.convert<String>(
    json['profitGrowth'],
  );
  if (profitGrowth != null) {
    aiCompareDataEntity.profitGrowth = profitGrowth;
  }
  final String? profitGrowthRate = jsonConvert.convert<String>(
    json['profitGrowthRate'],
  );
  if (profitGrowthRate != null) {
    aiCompareDataEntity.profitGrowthRate = profitGrowthRate;
  }
  final String? predictDate = jsonConvert.convert<String>(json['predictDate']);
  if (predictDate != null) {
    aiCompareDataEntity.predictDate = predictDate;
  }
  final String? currency = jsonConvert.convert<String>(json['currency']);
  if (currency != null) {
    aiCompareDataEntity.currency = currency;
  }
  return aiCompareDataEntity;
}

Map<String, dynamic> $AiCompareDataEntityToJson(AiCompareDataEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['actualGridFeedGain'] = entity.actualGridFeedGain;
  data['actualPvSelfUseGain'] = entity.actualPvSelfUseGain;
  data['actualStorageProfit'] = entity.actualStorageProfit;
  data['aiPredictGridFeedGain'] = entity.aiPredictGridFeedGain;
  data['aiPredictPvSelfUseGain'] = entity.aiPredictPvSelfUseGain;
  data['aiPredictStorageProfit'] = entity.aiPredictStorageProfit;
  data['actualTotalProfit'] = entity.actualTotalProfit;
  data['aiPredictTotalProfit'] = entity.aiPredictTotalProfit;
  data['profitGrowth'] = entity.profitGrowth;
  data['profitGrowthRate'] = entity.profitGrowthRate;
  data['predictDate'] = entity.predictDate;
  data['currency'] = entity.currency;
  return data;
}

extension AiCompareDataEntityExtension on AiCompareDataEntity {
  AiCompareDataEntity copyWith({
    int? actualGridFeedGain,
    int? actualPvSelfUseGain,
    int? actualStorageProfit,
    int? aiPredictGridFeedGain,
    int? aiPredictPvSelfUseGain,
    int? aiPredictStorageProfit,
    String? actualTotalProfit,
    String? aiPredictTotalProfit,
    String? profitGrowth,
    String? profitGrowthRate,
    String? predictDate,
    String? currency,
  }) {
    return AiCompareDataEntity()
      ..actualGridFeedGain = actualGridFeedGain ?? this.actualGridFeedGain
      ..actualPvSelfUseGain = actualPvSelfUseGain ?? this.actualPvSelfUseGain
      ..actualStorageProfit = actualStorageProfit ?? this.actualStorageProfit
      ..aiPredictGridFeedGain =
          aiPredictGridFeedGain ?? this.aiPredictGridFeedGain
      ..aiPredictPvSelfUseGain =
          aiPredictPvSelfUseGain ?? this.aiPredictPvSelfUseGain
      ..aiPredictStorageProfit =
          aiPredictStorageProfit ?? this.aiPredictStorageProfit
      ..actualTotalProfit = actualTotalProfit ?? this.actualTotalProfit
      ..aiPredictTotalProfit = aiPredictTotalProfit ?? this.aiPredictTotalProfit
      ..profitGrowth = profitGrowth ?? this.profitGrowth
      ..profitGrowthRate = profitGrowthRate ?? this.profitGrowthRate
      ..predictDate = predictDate ?? this.predictDate
      ..currency = currency ?? this.currency;
  }
}
