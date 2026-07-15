import 'package:cescpro/generated/json/base/json_convert_content.dart';
import 'package:cescpro/http/bean/ai_compare_data_entity.dart';

AiCompareDataEntity $AiCompareDataEntityFromJson(Map<String, dynamic> json) {
  final AiCompareDataEntity aiCompareDataEntity = AiCompareDataEntity();
  final int? yesterdayGridFeedGain = jsonConvert.convert<int>(
    json['yesterdayGridFeedGain'],
  );
  if (yesterdayGridFeedGain != null) {
    aiCompareDataEntity.yesterdayGridFeedGain = yesterdayGridFeedGain;
  }
  final int? yesterdayPvSelfUseGain = jsonConvert.convert<int>(
    json['yesterdayPvSelfUseGain'],
  );
  if (yesterdayPvSelfUseGain != null) {
    aiCompareDataEntity.yesterdayPvSelfUseGain = yesterdayPvSelfUseGain;
  }
  final int? yesterdayStorageProfit = jsonConvert.convert<int>(
    json['yesterdayStorageProfit'],
  );
  if (yesterdayStorageProfit != null) {
    aiCompareDataEntity.yesterdayStorageProfit = yesterdayStorageProfit;
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
  final String? yesterdayTotalProfit = jsonConvert.convert<String>(
    json['yesterdayTotalProfit'],
  );
  if (yesterdayTotalProfit != null) {
    aiCompareDataEntity.yesterdayTotalProfit = yesterdayTotalProfit;
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
  data['yesterdayGridFeedGain'] = entity.yesterdayGridFeedGain;
  data['yesterdayPvSelfUseGain'] = entity.yesterdayPvSelfUseGain;
  data['yesterdayStorageProfit'] = entity.yesterdayStorageProfit;
  data['aiPredictGridFeedGain'] = entity.aiPredictGridFeedGain;
  data['aiPredictPvSelfUseGain'] = entity.aiPredictPvSelfUseGain;
  data['aiPredictStorageProfit'] = entity.aiPredictStorageProfit;
  data['yesterdayTotalProfit'] = entity.yesterdayTotalProfit;
  data['aiPredictTotalProfit'] = entity.aiPredictTotalProfit;
  data['profitGrowth'] = entity.profitGrowth;
  data['profitGrowthRate'] = entity.profitGrowthRate;
  data['predictDate'] = entity.predictDate;
  data['currency'] = entity.currency;
  return data;
}

extension AiCompareDataEntityExtension on AiCompareDataEntity {
  AiCompareDataEntity copyWith({
    int? yesterdayGridFeedGain,
    int? yesterdayPvSelfUseGain,
    int? yesterdayStorageProfit,
    int? aiPredictGridFeedGain,
    int? aiPredictPvSelfUseGain,
    int? aiPredictStorageProfit,
    String? yesterdayTotalProfit,
    String? aiPredictTotalProfit,
    String? profitGrowth,
    String? profitGrowthRate,
    String? predictDate,
    String? currency,
  }) {
    return AiCompareDataEntity()
      ..yesterdayGridFeedGain =
          yesterdayGridFeedGain ?? this.yesterdayGridFeedGain
      ..yesterdayPvSelfUseGain =
          yesterdayPvSelfUseGain ?? this.yesterdayPvSelfUseGain
      ..yesterdayStorageProfit =
          yesterdayStorageProfit ?? this.yesterdayStorageProfit
      ..aiPredictGridFeedGain =
          aiPredictGridFeedGain ?? this.aiPredictGridFeedGain
      ..aiPredictPvSelfUseGain =
          aiPredictPvSelfUseGain ?? this.aiPredictPvSelfUseGain
      ..aiPredictStorageProfit =
          aiPredictStorageProfit ?? this.aiPredictStorageProfit
      ..yesterdayTotalProfit = yesterdayTotalProfit ?? this.yesterdayTotalProfit
      ..aiPredictTotalProfit = aiPredictTotalProfit ?? this.aiPredictTotalProfit
      ..profitGrowth = profitGrowth ?? this.profitGrowth
      ..profitGrowthRate = profitGrowthRate ?? this.profitGrowthRate
      ..predictDate = predictDate ?? this.predictDate
      ..currency = currency ?? this.currency;
  }
}
