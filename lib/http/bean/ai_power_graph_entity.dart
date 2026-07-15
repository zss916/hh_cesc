import 'dart:convert';

import 'package:cescpro/generated/json/ai_power_graph_entity.g.dart';
import 'package:cescpro/generated/json/base/json_field.dart';

export 'package:cescpro/generated/json/ai_power_graph_entity.g.dart';

@JsonSerializable()
class AiPowerGraphEntity {
  String? currencyCode;
  List<AiPowerGraphData>? data;

  AiPowerGraphEntity();

  factory AiPowerGraphEntity.fromJson(Map<String, dynamic> json) =>
      $AiPowerGraphEntityFromJson(json);

  Map<String, dynamic> toJson() => $AiPowerGraphEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class AiPowerGraphData {
  int? timestamp;
  num? predictPower; //预测功率 (kW)
  num? actualPower; //实际功率 (kW)
  num? pvPredictPower; //预测光伏功率
  num? pvActualPower; //实际光伏功率
  num? loadPredictPower; //预测负载功率
  num? loadActualPower; //实际负载功率
  num? predictConsumptionPrice; //预测用电电价
  num? actualConsumptionPrice; //实际用电电价
  num? predictSellingPrice; //预测售电电价
  num? actualSellingPrice; //实际售电电价
  String? currencyCode;

  AiPowerGraphData();

  factory AiPowerGraphData.fromJson(Map<String, dynamic> json) =>
      $AiPowerGraphDataFromJson(json);

  Map<String, dynamic> toJson() => $AiPowerGraphDataToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}
