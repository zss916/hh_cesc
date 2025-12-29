import 'package:cescpro/generated/json/base/json_convert_content.dart';
import 'package:cescpro/http/bean/elec_graph_entity.dart';

ElecGraphEntity $ElecGraphEntityFromJson(Map<String, dynamic> json) {
  final ElecGraphEntity elecGraphEntity = ElecGraphEntity();
  final String? dateTime = jsonConvert.convert<String>(json['dateTime']);
  if (dateTime != null) {
    elecGraphEntity.dateTime = dateTime;
  }
  final double? totalIncome = jsonConvert.convert<double>(json['totalIncome']);
  if (totalIncome != null) {
    elecGraphEntity.totalIncome = totalIncome;
  }
  final double? totalCharge = jsonConvert.convert<double>(json['totalCharge']);
  if (totalCharge != null) {
    elecGraphEntity.totalCharge = totalCharge;
  }
  final double? totalRecharge = jsonConvert.convert<double>(
      json['totalRecharge']);
  if (totalRecharge != null) {
    elecGraphEntity.totalRecharge = totalRecharge;
  }
  final double? efficiency = jsonConvert.convert<double>(json['efficiency']);
  if (efficiency != null) {
    elecGraphEntity.efficiency = efficiency;
  }
  final int? type = jsonConvert.convert<int>(json['type']);
  if (type != null) {
    elecGraphEntity.type = type;
  }
  final double? pvGeneration = jsonConvert.convert<double>(
      json['pvGeneration']);
  if (pvGeneration != null) {
    elecGraphEntity.pvGeneration = pvGeneration;
  }
  final double? gridFeed = jsonConvert.convert<double>(json['gridFeed']);
  if (gridFeed != null) {
    elecGraphEntity.gridFeed = gridFeed;
  }
  final double? storageProfit = jsonConvert.convert<double>(
      json['storageProfit']);
  if (storageProfit != null) {
    elecGraphEntity.storageProfit = storageProfit;
  }
  final double? pvSelfUse = jsonConvert.convert<double>(json['pvSelfUse']);
  if (pvSelfUse != null) {
    elecGraphEntity.pvSelfUse = pvSelfUse;
  }
  final double? pvSelfUseGain = jsonConvert.convert<double>(
      json['pvSelfUseGain']);
  if (pvSelfUseGain != null) {
    elecGraphEntity.pvSelfUseGain = pvSelfUseGain;
  }
  final double? pvProfit = jsonConvert.convert<double>(json['pvProfit']);
  if (pvProfit != null) {
    elecGraphEntity.pvProfit = pvProfit;
  }
  final double? gridFeedGain = jsonConvert.convert<double>(
      json['gridFeedGain']);
  if (gridFeedGain != null) {
    elecGraphEntity.gridFeedGain = gridFeedGain;
  }
  return elecGraphEntity;
}

Map<String, dynamic> $ElecGraphEntityToJson(ElecGraphEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['dateTime'] = entity.dateTime;
  data['totalIncome'] = entity.totalIncome;
  data['totalCharge'] = entity.totalCharge;
  data['totalRecharge'] = entity.totalRecharge;
  data['efficiency'] = entity.efficiency;
  data['type'] = entity.type;
  data['pvGeneration'] = entity.pvGeneration;
  data['gridFeed'] = entity.gridFeed;
  data['storageProfit'] = entity.storageProfit;
  data['pvSelfUse'] = entity.pvSelfUse;
  data['pvSelfUseGain'] = entity.pvSelfUseGain;
  data['pvProfit'] = entity.pvProfit;
  data['gridFeedGain'] = entity.gridFeedGain;
  return data;
}

extension ElecGraphEntityExtension on ElecGraphEntity {
  ElecGraphEntity copyWith({
    String? dateTime,
    double? totalIncome,
    double? totalCharge,
    double? totalRecharge,
    double? efficiency,
    int? type,
    double? pvGeneration,
    double? gridFeed,
    double? storageProfit,
    double? pvSelfUse,
    double? pvSelfUseGain,
    double? pvProfit,
    double? gridFeedGain,
  }) {
    return ElecGraphEntity()
      ..dateTime = dateTime ?? this.dateTime
      ..totalIncome = totalIncome ?? this.totalIncome
      ..totalCharge = totalCharge ?? this.totalCharge
      ..totalRecharge = totalRecharge ?? this.totalRecharge
      ..efficiency = efficiency ?? this.efficiency
      ..type = type ?? this.type
      ..pvGeneration = pvGeneration ?? this.pvGeneration
      ..gridFeed = gridFeed ?? this.gridFeed
      ..storageProfit = storageProfit ?? this.storageProfit
      ..pvSelfUse = pvSelfUse ?? this.pvSelfUse
      ..pvSelfUseGain = pvSelfUseGain ?? this.pvSelfUseGain
      ..pvProfit = pvProfit ?? this.pvProfit
      ..gridFeedGain = gridFeedGain ?? this.gridFeedGain;
  }
}