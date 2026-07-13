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
  final int? predictPower = jsonConvert.convert<int>(json['predictPower']);
  if (predictPower != null) {
    aiPowerGraphData.predictPower = predictPower;
  }
  final int? actualPower = jsonConvert.convert<int>(json['actualPower']);
  if (actualPower != null) {
    aiPowerGraphData.actualPower = actualPower;
  }
  final int? pvPredictPower = jsonConvert.convert<int>(json['pvPredictPower']);
  if (pvPredictPower != null) {
    aiPowerGraphData.pvPredictPower = pvPredictPower;
  }
  final int? pvActualPower = jsonConvert.convert<int>(json['pvActualPower']);
  if (pvActualPower != null) {
    aiPowerGraphData.pvActualPower = pvActualPower;
  }
  final int? loadPredictPower = jsonConvert.convert<int>(
    json['loadPredictPower'],
  );
  if (loadPredictPower != null) {
    aiPowerGraphData.loadPredictPower = loadPredictPower;
  }
  final int? loadActualPower = jsonConvert.convert<int>(
    json['loadActualPower'],
  );
  if (loadActualPower != null) {
    aiPowerGraphData.loadActualPower = loadActualPower;
  }
  final int? predictConsumptionPrice = jsonConvert.convert<int>(
    json['predictConsumptionPrice'],
  );
  if (predictConsumptionPrice != null) {
    aiPowerGraphData.predictConsumptionPrice = predictConsumptionPrice;
  }
  final int? actualConsumptionPrice = jsonConvert.convert<int>(
    json['actualConsumptionPrice'],
  );
  if (actualConsumptionPrice != null) {
    aiPowerGraphData.actualConsumptionPrice = actualConsumptionPrice;
  }
  final int? predictSellingPrice = jsonConvert.convert<int>(
    json['predictSellingPrice'],
  );
  if (predictSellingPrice != null) {
    aiPowerGraphData.predictSellingPrice = predictSellingPrice;
  }
  final int? actualSellingPrice = jsonConvert.convert<int>(
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
    int? predictPower,
    int? actualPower,
    int? pvPredictPower,
    int? pvActualPower,
    int? loadPredictPower,
    int? loadActualPower,
    int? predictConsumptionPrice,
    int? actualConsumptionPrice,
    int? predictSellingPrice,
    int? actualSellingPrice,
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
