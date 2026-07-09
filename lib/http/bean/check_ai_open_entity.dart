import 'dart:convert';

import 'package:cescpro/generated/json/base/json_field.dart';
import 'package:cescpro/generated/json/check_ai_open_entity.g.dart';

export 'package:cescpro/generated/json/check_ai_open_entity.g.dart';

@JsonSerializable()
class CheckAiOpenEntity {
  bool? isDaysEnough;
  int? runningDays;
  bool? hasBuyPrice;

  CheckAiOpenEntity();

  factory CheckAiOpenEntity.fromJson(Map<String, dynamic> json) =>
      $CheckAiOpenEntityFromJson(json);

  Map<String, dynamic> toJson() => $CheckAiOpenEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}
