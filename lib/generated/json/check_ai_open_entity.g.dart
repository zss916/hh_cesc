import 'package:cescpro/generated/json/base/json_convert_content.dart';
import 'package:cescpro/http/bean/check_ai_open_entity.dart';

CheckAiOpenEntity $CheckAiOpenEntityFromJson(Map<String, dynamic> json) {
  final CheckAiOpenEntity checkAiOpenEntity = CheckAiOpenEntity();
  final bool? isDaysEnough = jsonConvert.convert<bool>(json['isDaysEnough']);
  if (isDaysEnough != null) {
    checkAiOpenEntity.isDaysEnough = isDaysEnough;
  }
  final int? runningDays = jsonConvert.convert<int>(json['runningDays']);
  if (runningDays != null) {
    checkAiOpenEntity.runningDays = runningDays;
  }
  final bool? hasBuyPrice = jsonConvert.convert<bool>(json['hasBuyPrice']);
  if (hasBuyPrice != null) {
    checkAiOpenEntity.hasBuyPrice = hasBuyPrice;
  }
  return checkAiOpenEntity;
}

Map<String, dynamic> $CheckAiOpenEntityToJson(CheckAiOpenEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['isDaysEnough'] = entity.isDaysEnough;
  data['runningDays'] = entity.runningDays;
  data['hasBuyPrice'] = entity.hasBuyPrice;
  return data;
}

extension CheckAiOpenEntityExtension on CheckAiOpenEntity {
  CheckAiOpenEntity copyWith({
    bool? isDaysEnough,
    int? runningDays,
    bool? hasBuyPrice,
  }) {
    return CheckAiOpenEntity()
      ..isDaysEnough = isDaysEnough ?? this.isDaysEnough
      ..runningDays = runningDays ?? this.runningDays
      ..hasBuyPrice = hasBuyPrice ?? this.hasBuyPrice;
  }
}