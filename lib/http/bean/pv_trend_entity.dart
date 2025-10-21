import 'dart:convert';

import 'package:cescpro/generated/json/base/json_field.dart';
import 'package:cescpro/generated/json/pv_trend_entity.g.dart';

export 'package:cescpro/generated/json/pv_trend_entity.g.dart';

@JsonSerializable()
class PvTrendEntity {
  String? dateTime; //汇总时间
  double? summaryValue; //汇总值

  PvTrendEntity();

  factory PvTrendEntity.fromJson(Map<String, dynamic> json) =>
      $PvTrendEntityFromJson(json);

  Map<String, dynamic> toJson() => $PvTrendEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}
