import 'package:cescpro/generated/json/base/json_convert_content.dart';
import 'package:cescpro/http/bean/analysis_entity.dart';

AnalysisEntity $AnalysisEntityFromJson(Map<String, dynamic> json) {
  final AnalysisEntity analysisEntity = AnalysisEntity();
  final AnalysisTotalAlarmData? totalAlarmData = jsonConvert
      .convert<AnalysisTotalAlarmData>(json['totalAlarmData']);
  if (totalAlarmData != null) {
    analysisEntity.totalAlarmData = totalAlarmData;
  }
  final AnalysisHighestAlarmData? highestAlarmData = jsonConvert
      .convert<AnalysisHighestAlarmData>(json['highestAlarmData']);
  if (highestAlarmData != null) {
    analysisEntity.highestAlarmData = highestAlarmData;
  }
  final AnalysisAttentionAlarmData? attentionAlarmData = jsonConvert
      .convert<AnalysisAttentionAlarmData>(json['attentionAlarmData']);
  if (attentionAlarmData != null) {
    analysisEntity.attentionAlarmData = attentionAlarmData;
  }
  return analysisEntity;
}

Map<String, dynamic> $AnalysisEntityToJson(AnalysisEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['totalAlarmData'] = entity.totalAlarmData?.toJson();
  data['highestAlarmData'] = entity.highestAlarmData?.toJson();
  data['attentionAlarmData'] = entity.attentionAlarmData?.toJson();
  return data;
}

extension AnalysisEntityExtension on AnalysisEntity {
  AnalysisEntity copyWith({
    AnalysisTotalAlarmData? totalAlarmData,
    AnalysisHighestAlarmData? highestAlarmData,
    AnalysisAttentionAlarmData? attentionAlarmData,
  }) {
    return AnalysisEntity()
      ..totalAlarmData = totalAlarmData ?? this.totalAlarmData
      ..highestAlarmData = highestAlarmData ?? this.highestAlarmData
      ..attentionAlarmData = attentionAlarmData ?? this.attentionAlarmData;
  }
}

AnalysisTotalAlarmData $AnalysisTotalAlarmDataFromJson(
  Map<String, dynamic> json,
) {
  final AnalysisTotalAlarmData analysisTotalAlarmData =
      AnalysisTotalAlarmData();
  final int? totalCnt = jsonConvert.convert<int>(json['totalCnt']);
  if (totalCnt != null) {
    analysisTotalAlarmData.totalCnt = totalCnt;
  }
  final int? firstCnt = jsonConvert.convert<int>(json['firstCnt']);
  if (firstCnt != null) {
    analysisTotalAlarmData.firstCnt = firstCnt;
  }
  final int? secondCnt = jsonConvert.convert<int>(json['secondCnt']);
  if (secondCnt != null) {
    analysisTotalAlarmData.secondCnt = secondCnt;
  }
  final int? thirdCnt = jsonConvert.convert<int>(json['thirdCnt']);
  if (thirdCnt != null) {
    analysisTotalAlarmData.thirdCnt = thirdCnt;
  }
  final int? otherCnt = jsonConvert.convert<int>(json['otherCnt']);
  if (otherCnt != null) {
    analysisTotalAlarmData.otherCnt = otherCnt;
  }
  return analysisTotalAlarmData;
}

Map<String, dynamic> $AnalysisTotalAlarmDataToJson(
  AnalysisTotalAlarmData entity,
) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['totalCnt'] = entity.totalCnt;
  data['firstCnt'] = entity.firstCnt;
  data['secondCnt'] = entity.secondCnt;
  data['thirdCnt'] = entity.thirdCnt;
  data['otherCnt'] = entity.otherCnt;
  return data;
}

extension AnalysisTotalAlarmDataExtension on AnalysisTotalAlarmData {
  AnalysisTotalAlarmData copyWith({
    int? totalCnt,
    int? firstCnt,
    int? secondCnt,
    int? thirdCnt,
    int? otherCnt,
  }) {
    return AnalysisTotalAlarmData()
      ..totalCnt = totalCnt ?? this.totalCnt
      ..firstCnt = firstCnt ?? this.firstCnt
      ..secondCnt = secondCnt ?? this.secondCnt
      ..thirdCnt = thirdCnt ?? this.thirdCnt
      ..otherCnt = otherCnt ?? this.otherCnt;
  }
}

AnalysisHighestAlarmData $AnalysisHighestAlarmDataFromJson(
  Map<String, dynamic> json,
) {
  final AnalysisHighestAlarmData analysisHighestAlarmData =
      AnalysisHighestAlarmData();
  final int? totalCnt = jsonConvert.convert<int>(json['totalCnt']);
  if (totalCnt != null) {
    analysisHighestAlarmData.totalCnt = totalCnt;
  }
  final List<AnalysisHighestAlarmDataItems>? items =
      (json['items'] as List<dynamic>?)
          ?.map(
            (e) =>
                jsonConvert.convert<AnalysisHighestAlarmDataItems>(e)
                    as AnalysisHighestAlarmDataItems,
          )
          .toList();
  if (items != null) {
    analysisHighestAlarmData.items = items;
  }
  return analysisHighestAlarmData;
}

Map<String, dynamic> $AnalysisHighestAlarmDataToJson(
  AnalysisHighestAlarmData entity,
) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['totalCnt'] = entity.totalCnt;
  data['items'] = entity.items?.map((v) => v.toJson()).toList();
  return data;
}

extension AnalysisHighestAlarmDataExtension on AnalysisHighestAlarmData {
  AnalysisHighestAlarmData copyWith({
    int? totalCnt,
    List<AnalysisHighestAlarmDataItems>? items,
  }) {
    return AnalysisHighestAlarmData()
      ..totalCnt = totalCnt ?? this.totalCnt
      ..items = items ?? this.items;
  }
}

AnalysisHighestAlarmDataItems $AnalysisHighestAlarmDataItemsFromJson(
  Map<String, dynamic> json,
) {
  final AnalysisHighestAlarmDataItems analysisHighestAlarmDataItems =
      AnalysisHighestAlarmDataItems();
  final String? type = jsonConvert.convert<String>(json['type']);
  if (type != null) {
    analysisHighestAlarmDataItems.type = type;
  }
  final int? cnt = jsonConvert.convert<int>(json['cnt']);
  if (cnt != null) {
    analysisHighestAlarmDataItems.cnt = cnt;
  }
  return analysisHighestAlarmDataItems;
}

Map<String, dynamic> $AnalysisHighestAlarmDataItemsToJson(
  AnalysisHighestAlarmDataItems entity,
) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['type'] = entity.type;
  data['cnt'] = entity.cnt;
  return data;
}

extension AnalysisHighestAlarmDataItemsExtension
    on AnalysisHighestAlarmDataItems {
  AnalysisHighestAlarmDataItems copyWith({String? type, int? cnt}) {
    return AnalysisHighestAlarmDataItems()
      ..type = type ?? this.type
      ..cnt = cnt ?? this.cnt;
  }
}

AnalysisAttentionAlarmData $AnalysisAttentionAlarmDataFromJson(
  Map<String, dynamic> json,
) {
  final AnalysisAttentionAlarmData analysisAttentionAlarmData =
      AnalysisAttentionAlarmData();
  final int? totalCnt = jsonConvert.convert<int>(json['totalCnt']);
  if (totalCnt != null) {
    analysisAttentionAlarmData.totalCnt = totalCnt;
  }
  final List<AnalysisAttentionAlarmDataItems>? items =
      (json['items'] as List<dynamic>?)
          ?.map(
            (e) =>
                jsonConvert.convert<AnalysisAttentionAlarmDataItems>(e)
                    as AnalysisAttentionAlarmDataItems,
          )
          .toList();
  if (items != null) {
    analysisAttentionAlarmData.items = items;
  }
  return analysisAttentionAlarmData;
}

Map<String, dynamic> $AnalysisAttentionAlarmDataToJson(
  AnalysisAttentionAlarmData entity,
) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['totalCnt'] = entity.totalCnt;
  data['items'] = entity.items?.map((v) => v.toJson()).toList();
  return data;
}

extension AnalysisAttentionAlarmDataExtension on AnalysisAttentionAlarmData {
  AnalysisAttentionAlarmData copyWith({
    int? totalCnt,
    List<AnalysisAttentionAlarmDataItems>? items,
  }) {
    return AnalysisAttentionAlarmData()
      ..totalCnt = totalCnt ?? this.totalCnt
      ..items = items ?? this.items;
  }
}

AnalysisAttentionAlarmDataItems $AnalysisAttentionAlarmDataItemsFromJson(
  Map<String, dynamic> json,
) {
  final AnalysisAttentionAlarmDataItems analysisAttentionAlarmDataItems =
      AnalysisAttentionAlarmDataItems();
  final String? type = jsonConvert.convert<String>(json['type']);
  if (type != null) {
    analysisAttentionAlarmDataItems.type = type;
  }
  final int? cnt = jsonConvert.convert<int>(json['cnt']);
  if (cnt != null) {
    analysisAttentionAlarmDataItems.cnt = cnt;
  }
  return analysisAttentionAlarmDataItems;
}

Map<String, dynamic> $AnalysisAttentionAlarmDataItemsToJson(
  AnalysisAttentionAlarmDataItems entity,
) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['type'] = entity.type;
  data['cnt'] = entity.cnt;
  return data;
}

extension AnalysisAttentionAlarmDataItemsExtension
    on AnalysisAttentionAlarmDataItems {
  AnalysisAttentionAlarmDataItems copyWith({String? type, int? cnt}) {
    return AnalysisAttentionAlarmDataItems()
      ..type = type ?? this.type
      ..cnt = cnt ?? this.cnt;
  }
}
