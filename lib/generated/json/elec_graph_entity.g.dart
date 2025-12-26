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
  }) {
    return ElecGraphEntity()
      ..dateTime = dateTime ?? this.dateTime
      ..totalIncome = totalIncome ?? this.totalIncome
      ..totalCharge = totalCharge ?? this.totalCharge
      ..totalRecharge = totalRecharge ?? this.totalRecharge
      ..efficiency = efficiency ?? this.efficiency
      ..type = type ?? this.type;
  }
}