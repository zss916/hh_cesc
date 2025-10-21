import 'package:cescpro/generated/json/base/json_convert_content.dart';
import 'package:cescpro/http/bean/pv_trend_entity.dart';

PvTrendEntity $PvTrendEntityFromJson(Map<String, dynamic> json) {
  final PvTrendEntity pvTrendEntity = PvTrendEntity();
  final String? dateTime = jsonConvert.convert<String>(json['dateTime']);
  if (dateTime != null) {
    pvTrendEntity.dateTime = dateTime;
  }
  final double? summaryValue = jsonConvert.convert<double>(
    json['summaryValue'],
  );
  if (summaryValue != null) {
    pvTrendEntity.summaryValue = summaryValue;
  }
  return pvTrendEntity;
}

Map<String, dynamic> $PvTrendEntityToJson(PvTrendEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['dateTime'] = entity.dateTime;
  data['summaryValue'] = entity.summaryValue;
  return data;
}

extension PvTrendEntityExtension on PvTrendEntity {
  PvTrendEntity copyWith({String? dateTime, double? summaryValue}) {
    return PvTrendEntity()
      ..dateTime = dateTime ?? this.dateTime
      ..summaryValue = summaryValue ?? this.summaryValue;
  }
}
