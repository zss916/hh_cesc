import 'dart:convert';

import 'package:cescpro/generated/json/analysis_entity.g.dart';
import 'package:cescpro/generated/json/base/json_field.dart';

export 'package:cescpro/generated/json/analysis_entity.g.dart';

@JsonSerializable()
class AnalysisEntity {
  AnalysisTotalAlarmData? totalAlarmData;
  AnalysisHighestAlarmData? highestAlarmData;
  AnalysisAttentionAlarmData? attentionAlarmData;

  AnalysisEntity();

  factory AnalysisEntity.fromJson(Map<String, dynamic> json) =>
      $AnalysisEntityFromJson(json);

  Map<String, dynamic> toJson() => $AnalysisEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class AnalysisTotalAlarmData {
  int? totalCnt;
  int? firstCnt;
  int? secondCnt;
  int? thirdCnt;
  int? otherCnt;

  AnalysisTotalAlarmData();

  factory AnalysisTotalAlarmData.fromJson(Map<String, dynamic> json) =>
      $AnalysisTotalAlarmDataFromJson(json);

  Map<String, dynamic> toJson() => $AnalysisTotalAlarmDataToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class AnalysisHighestAlarmData {
  int? totalCnt;
  List<AnalysisHighestAlarmDataItems>? items;

  AnalysisHighestAlarmData();

  factory AnalysisHighestAlarmData.fromJson(Map<String, dynamic> json) =>
      $AnalysisHighestAlarmDataFromJson(json);

  Map<String, dynamic> toJson() => $AnalysisHighestAlarmDataToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class AnalysisHighestAlarmDataItems {
  String? type;
  int? cnt;

  AnalysisHighestAlarmDataItems();

  factory AnalysisHighestAlarmDataItems.fromJson(Map<String, dynamic> json) =>
      $AnalysisHighestAlarmDataItemsFromJson(json);

  Map<String, dynamic> toJson() => $AnalysisHighestAlarmDataItemsToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class AnalysisAttentionAlarmData {
  int? totalCnt;
  List<AnalysisAttentionAlarmDataItems>? items;

  AnalysisAttentionAlarmData();

  factory AnalysisAttentionAlarmData.fromJson(Map<String, dynamic> json) =>
      $AnalysisAttentionAlarmDataFromJson(json);

  Map<String, dynamic> toJson() => $AnalysisAttentionAlarmDataToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class AnalysisAttentionAlarmDataItems {
  String? type;
  int? cnt;

  AnalysisAttentionAlarmDataItems();

  factory AnalysisAttentionAlarmDataItems.fromJson(Map<String, dynamic> json) =>
      $AnalysisAttentionAlarmDataItemsFromJson(json);

  Map<String, dynamic> toJson() => $AnalysisAttentionAlarmDataItemsToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}
