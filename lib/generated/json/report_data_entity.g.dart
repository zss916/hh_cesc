import 'package:cescpro/generated/json/base/json_convert_content.dart';
import 'package:cescpro/http/bean/report_data_entity.dart';

ReportDataEntity $ReportDataEntityFromJson(Map<String, dynamic> json) {
  final ReportDataEntity reportDataEntity = ReportDataEntity();
  final dynamic id = json['id'];
  if (id != null) {
    reportDataEntity.id = id;
  }
  final int? siteId = jsonConvert.convert<int>(json['siteId']);
  if (siteId != null) {
    reportDataEntity.siteId = siteId;
  }
  final String? siteName = jsonConvert.convert<String>(json['siteName']);
  if (siteName != null) {
    reportDataEntity.siteName = siteName;
  }
  final String? dayDate = jsonConvert.convert<String>(json['dayDate']);
  if (dayDate != null) {
    reportDataEntity.dayDate = dayDate;
  }
  final double? pvGeneration = jsonConvert.convert<double>(
    json['pvGeneration'],
  );
  if (pvGeneration != null) {
    reportDataEntity.pvGeneration = pvGeneration;
  }
  final double? gridFeed = jsonConvert.convert<double>(json['gridFeed']);
  if (gridFeed != null) {
    reportDataEntity.gridFeed = gridFeed;
  }
  final double? pos = jsonConvert.convert<double>(json['pos']);
  if (pos != null) {
    reportDataEntity.pos = pos;
  }
  final double? neg = jsonConvert.convert<double>(json['neg']);
  if (neg != null) {
    reportDataEntity.neg = neg;
  }
  final double? storageProfit = jsonConvert.convert<double>(
    json['storageProfit'],
  );
  if (storageProfit != null) {
    reportDataEntity.storageProfit = storageProfit;
  }
  final double? gridFeedGain = jsonConvert.convert<double>(
    json['gridFeedGain'],
  );
  if (gridFeedGain != null) {
    reportDataEntity.gridFeedGain = gridFeedGain;
  }
  final double? pvSelfUseGain = jsonConvert.convert<double>(
    json['pvSelfUseGain'],
  );
  if (pvSelfUseGain != null) {
    reportDataEntity.pvSelfUseGain = pvSelfUseGain;
  }
  final List<int>? types = (json['types'] as List<dynamic>?)
      ?.map((e) => jsonConvert.convert<int>(e) as int)
      .toList();
  if (types != null) {
    reportDataEntity.types = types;
  }
  final int? isGrid = jsonConvert.convert<int>(json['isGrid']);
  if (isGrid != null) {
    reportDataEntity.isGrid = isGrid;
  }
  return reportDataEntity;
}

Map<String, dynamic> $ReportDataEntityToJson(ReportDataEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['id'] = entity.id;
  data['siteId'] = entity.siteId;
  data['siteName'] = entity.siteName;
  data['dayDate'] = entity.dayDate;
  data['pvGeneration'] = entity.pvGeneration;
  data['gridFeed'] = entity.gridFeed;
  data['pos'] = entity.pos;
  data['neg'] = entity.neg;
  data['storageProfit'] = entity.storageProfit;
  data['gridFeedGain'] = entity.gridFeedGain;
  data['pvSelfUseGain'] = entity.pvSelfUseGain;
  data['types'] = entity.types;
  data['isGrid'] = entity.isGrid;
  return data;
}

extension ReportDataEntityExtension on ReportDataEntity {
  ReportDataEntity copyWith({
    dynamic id,
    int? siteId,
    String? siteName,
    String? dayDate,
    double? pvGeneration,
    double? gridFeed,
    double? pos,
    double? neg,
    double? storageProfit,
    double? gridFeedGain,
    double? pvSelfUseGain,
    List<int>? types,
    int? isGrid,
  }) {
    return ReportDataEntity()
      ..id = id ?? this.id
      ..siteId = siteId ?? this.siteId
      ..siteName = siteName ?? this.siteName
      ..dayDate = dayDate ?? this.dayDate
      ..pvGeneration = pvGeneration ?? this.pvGeneration
      ..gridFeed = gridFeed ?? this.gridFeed
      ..pos = pos ?? this.pos
      ..neg = neg ?? this.neg
      ..storageProfit = storageProfit ?? this.storageProfit
      ..gridFeedGain = gridFeedGain ?? this.gridFeedGain
      ..pvSelfUseGain = pvSelfUseGain ?? this.pvSelfUseGain
      ..types = types ?? this.types
      ..isGrid = isGrid ?? this.isGrid;
  }
}
