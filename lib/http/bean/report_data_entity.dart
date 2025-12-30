import 'dart:convert';

import 'package:cescpro/core/helper/extension_helper.dart';
import 'package:cescpro/generated/json/base/json_field.dart';
import 'package:cescpro/generated/json/report_data_entity.g.dart';

export 'package:cescpro/generated/json/report_data_entity.g.dart';

@JsonSerializable()
class ReportDataEntity {
  dynamic id;
  int? siteId;
  String? siteName;
  String? dayDate;
  double? pvGeneration;
  double? gridFeed;
  double? pos;
  double? neg;
  double? storageProfit;
  double? gridFeedGain;
  double? pvSelfUseGain;

  ///1-纯储能；2-光储充；3-储能液冷; 4-光储
  List<int>? types;

  ///是否并网 （0-否 1-是）
  int? isGrid;

  ///是否有光伏
  bool get isHasPV => ((types ?? []).contains(2) || (types ?? []).contains(4));

  ///并网和光储充或者光储 才会显示上网电量/馈网收益
  bool get isShow =>
      (isGrid == 1) && ((types ?? []).contains(2) || (types ?? []).contains(4));

  ReportDataEntity();

  factory ReportDataEntity.fromJson(Map<String, dynamic> json) =>
      $ReportDataEntityFromJson(json);

  Map<String, dynamic> toJson() => $ReportDataEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }

  String get allRevenue =>
      ((storageProfit ?? 0.00) +
              (isShow ? (gridFeedGain ?? 0.00) : 0) +
              (pvSelfUseGain ?? 0.00))
          .formatAmount();
}
