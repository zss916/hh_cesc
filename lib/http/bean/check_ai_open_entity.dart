import 'dart:convert';

import 'package:cescpro/generated/json/base/json_field.dart';
import 'package:cescpro/generated/json/check_ai_open_entity.g.dart';

export 'package:cescpro/generated/json/check_ai_open_entity.g.dart';

@JsonSerializable()
class CheckAiOpenEntity {
  bool? isDaysEnough; //是否满足运行天数（>=7天）
  int? runningDays; //实际运行天数（向下取整）
  bool? hasBuyPrice; //是否配置了买电电价

  CheckAiOpenEntity();

  factory CheckAiOpenEntity.fromJson(Map<String, dynamic> json) =>
      $CheckAiOpenEntityFromJson(json);

  Map<String, dynamic> toJson() => $CheckAiOpenEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}
