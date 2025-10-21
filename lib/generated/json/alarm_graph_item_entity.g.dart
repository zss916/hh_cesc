import 'package:cescpro/generated/json/base/json_convert_content.dart';
import 'package:cescpro/http/bean/alarm_graph_item_entity.dart';

AlarmGraphItemEntity $AlarmGraphItemEntityFromJson(Map<String, dynamic> json) {
  final AlarmGraphItemEntity alarmGraphItemEntity = AlarmGraphItemEntity();
  final String? dateTime = jsonConvert.convert<String>(json['dateTime']);
  if (dateTime != null) {
    alarmGraphItemEntity.dateTime = dateTime;
  }
  final int? cnt = jsonConvert.convert<int>(json['cnt']);
  if (cnt != null) {
    alarmGraphItemEntity.cnt = cnt;
  }
  return alarmGraphItemEntity;
}

Map<String, dynamic> $AlarmGraphItemEntityToJson(AlarmGraphItemEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['dateTime'] = entity.dateTime;
  data['cnt'] = entity.cnt;
  return data;
}

extension AlarmGraphItemEntityExtension on AlarmGraphItemEntity {
  AlarmGraphItemEntity copyWith({String? dateTime, int? cnt}) {
    return AlarmGraphItemEntity()
      ..dateTime = dateTime ?? this.dateTime
      ..cnt = cnt ?? this.cnt;
  }
}
