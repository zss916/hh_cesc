import 'package:cescpro/generated/json/base/json_convert_content.dart';
import 'package:cescpro/http/bean/ai_power_graph_entity.dart';

AiPowerGraphEntity $AiPowerGraphEntityFromJson(Map<String, dynamic> json) {
  final AiPowerGraphEntity aiPowerGraphEntity = AiPowerGraphEntity();
  final String? currencyCode = jsonConvert.convert<String>(
    json['currencyCode'],
  );
  if (currencyCode != null) {
    aiPowerGraphEntity.currencyCode = currencyCode;
  }
  final List<AiPowerGraphData>? data = (json['data'] as List<dynamic>?)
      ?.map((e) => jsonConvert.convert<AiPowerGraphData>(e) as AiPowerGraphData)
      .toList();
  if (data != null) {
    aiPowerGraphEntity.data = data;
  }
  return aiPowerGraphEntity;
}

Map<String, dynamic> $AiPowerGraphEntityToJson(AiPowerGraphEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['currencyCode'] = entity.currencyCode;
  data['data'] = entity.data?.map((v) => v.toJson()).toList();
  return data;
}

extension AiPowerGraphEntityExtension on AiPowerGraphEntity {
  AiPowerGraphEntity copyWith({
    String? currencyCode,
    List<AiPowerGraphData>? data,
  }) {
    return AiPowerGraphEntity()
      ..currencyCode = currencyCode ?? this.currencyCode
      ..data = data ?? this.data;
  }
}

AiPowerGraphData $AiPowerGraphDataFromJson(Map<String, dynamic> json) {
  final AiPowerGraphData aiPowerGraphData = AiPowerGraphData();
  final int? timestamp = jsonConvert.convert<int>(json['timestamp']);
  if (timestamp != null) {
    aiPowerGraphData.timestamp = timestamp;
  }
  final num? predictPower = jsonConvert.convert<num>(json['predictPower']);
  if (predictPower != null) {
    aiPowerGraphData.predictPower = predictPower;
  }
  final num? actualPower = jsonConvert.convert<num>(json['actualPower']);
  if (actualPower != null) {
    aiPowerGraphData.actualPower = actualPower;
  }
  final num? pvPredictPower = jsonConvert.convert<num>(json['pvPredictPower']);
  if (pvPredictPower != null) {
    aiPowerGraphData.pvPredictPower = pvPredictPower;
  }
  final num? pvActualPower = jsonConvert.convert<num>(json['pvActualPower']);
  if (pvActualPower != null) {
    aiPowerGraphData.pvActualPower = pvActualPower;
  }
  final num? loadPredictPower = jsonConvert.convert<num>(
    json['loadPredictPower'],
  );
  if (loadPredictPower != null) {
    aiPowerGraphData.loadPredictPower = loadPredictPower;
  }
  final num? loadActualPower = jsonConvert.convert<num>(
    json['loadActualPower'],
  );
  if (loadActualPower != null) {
    aiPowerGraphData.loadActualPower = loadActualPower;
  }
  final num? predictConsumptionPrice = jsonConvert.convert<num>(
    json['predictConsumptionPrice'],
  );
  if (predictConsumptionPrice != null) {
    aiPowerGraphData.predictConsumptionPrice = predictConsumptionPrice;
  }
  final num? actualConsumptionPrice = jsonConvert.convert<num>(
    json['actualConsumptionPrice'],
  );
  if (actualConsumptionPrice != null) {
    aiPowerGraphData.actualConsumptionPrice = actualConsumptionPrice;
  }
  final num? predictSellingPrice = jsonConvert.convert<num>(
    json['predictSellingPrice'],
  );
  if (predictSellingPrice != null) {
    aiPowerGraphData.predictSellingPrice = predictSellingPrice;
  }
  final num? actualSellingPrice = jsonConvert.convert<num>(
    json['actualSellingPrice'],
  );
  if (actualSellingPrice != null) {
    aiPowerGraphData.actualSellingPrice = actualSellingPrice;
  }
  final String? currencyCode = jsonConvert.convert<String>(
    json['currencyCode'],
  );
  if (currencyCode != null) {
    aiPowerGraphData.currencyCode = currencyCode;
  }
  return aiPowerGraphData;
}

Map<String, dynamic> $AiPowerGraphDataToJson(AiPowerGraphData entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['timestamp'] = entity.timestamp;
  data['predictPower'] = entity.predictPower;
  data['actualPower'] = entity.actualPower;
  data['pvPredictPower'] = entity.pvPredictPower;
  data['pvActualPower'] = entity.pvActualPower;
  data['loadPredictPower'] = entity.loadPredictPower;
  data['loadActualPower'] = entity.loadActualPower;
  data['predictConsumptionPrice'] = entity.predictConsumptionPrice;
  data['actualConsumptionPrice'] = entity.actualConsumptionPrice;
  data['predictSellingPrice'] = entity.predictSellingPrice;
  data['actualSellingPrice'] = entity.actualSellingPrice;
  data['currencyCode'] = entity.currencyCode;
  return data;
}

extension AiPowerGraphDataExtension on AiPowerGraphData {
  AiPowerGraphData copyWith({
    int? timestamp,
    num? predictPower,
    num? actualPower,
    num? pvPredictPower,
    num? pvActualPower,
    num? loadPredictPower,
    num? loadActualPower,
    num? predictConsumptionPrice,
    num? actualConsumptionPrice,
    num? predictSellingPrice,
    num? actualSellingPrice,
    String? currencyCode,
  }) {
    return AiPowerGraphData()
      ..timestamp = timestamp ?? this.timestamp
      ..predictPower = predictPower ?? this.predictPower
      ..actualPower = actualPower ?? this.actualPower
      ..pvPredictPower = pvPredictPower ?? this.pvPredictPower
      ..pvActualPower = pvActualPower ?? this.pvActualPower
      ..loadPredictPower = loadPredictPower ?? this.loadPredictPower
      ..loadActualPower = loadActualPower ?? this.loadActualPower
      ..predictConsumptionPrice =
          predictConsumptionPrice ?? this.predictConsumptionPrice
      ..actualConsumptionPrice =
          actualConsumptionPrice ?? this.actualConsumptionPrice
      ..predictSellingPrice = predictSellingPrice ?? this.predictSellingPrice
      ..actualSellingPrice = actualSellingPrice ?? this.actualSellingPrice
      ..currencyCode = currencyCode ?? this.currencyCode;
  }
}
