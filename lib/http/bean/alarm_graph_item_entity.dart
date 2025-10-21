import 'dart:convert';

import 'package:cescpro/generated/json/alarm_graph_item_entity.g.dart';
import 'package:cescpro/generated/json/base/json_field.dart';

export 'package:cescpro/generated/json/alarm_graph_item_entity.g.dart';

@JsonSerializable()
class AlarmGraphItemEntity {
  String? dateTime;
  int? cnt;

  AlarmGraphItemEntity();

  factory AlarmGraphItemEntity.fromJson(Map<String, dynamic> json) =>
      $AlarmGraphItemEntityFromJson(json);

  Map<String, dynamic> toJson() => $AlarmGraphItemEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}
