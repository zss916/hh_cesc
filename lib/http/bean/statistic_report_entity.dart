import 'dart:convert';

import 'package:cescpro/generated/json/base/json_field.dart';
import 'package:cescpro/generated/json/statistic_report_entity.g.dart';
import 'package:cescpro/page/station/revenue/index.dart';

export 'package:cescpro/generated/json/statistic_report_entity.g.dart';

@JsonSerializable()
class StatisticReportEntity {
  String? siteName;
  int? siteId;
  List<StatisticReportDailyElecIncomeDetail>? dailyElecIncomeDetail;
  double? totalVerPos; //正-尖合计
  double? totalEndVerPos;
  double? totalVerPosAmount;
  double? totalHigPos; //正-峰合计
  double? totalEndHigPos;
  double? totalHigPosAmount;
  double? totalMidPos; //正-平合计
  double? totalEndMidPos;
  double? totalMidPosAmount;
  double? totalLowPos; //正-谷合计
  double? totalEndLowPos;
  double? totalLowPosAmount;
  double? totalPos; //正-总合计
  double? totalEndPos;
  double? totalPosAmount;
  double? totalVerNeg; //反-尖合计
  double? totalEndVerNeg;
  double? totalVerNegAmount;
  double? totalHigNeg; //反-峰合计
  double? totalEndHigNeg;
  double? totalHigNegAmount;
  double? totalMidNeg; //反-平合计
  double? totalEndMidNeg;
  double? totalMidNegAmount;
  double? totalLowNeg; //反-谷合计
  double? totalEndLowNeg;
  double? totalLowNegAmount;
  double? totalNeg; //反-总合计
  double? totalEndNeg;
  double? totalNegAmount;
  double? totalIncome; //收益
  double? totalEfficiency;
  StatisticReportSubsidyDTO? subsidyDTO; //补贴

  StatisticReportEntity();

  factory StatisticReportEntity.fromJson(Map<String, dynamic> json) =>
      $StatisticReportEntityFromJson(json);

  Map<String, dynamic> toJson() => $StatisticReportEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class StatisticReportDailyElecIncomeDetail {
  int? devNo;
  String? dateTime;
  String? formatDate;
  double? verPosAmount;
  double? verPos;
  double? endVerPos;
  double? verPosPri;
  double? higPosAmount;
  double? higPos;
  double? endHigPos;
  double? higPosPri;
  double? midPosAmount;
  double? midPos;
  double? endMidPos;
  double? midPosPri;
  double? lowPosAmount;
  double? lowPos;
  double? endLowPos;
  double? lowPosPri;
  double? verNegAmount;
  double? verNeg;
  double? endVerNeg;
  double? verNegPri;
  double? higNegAmount;
  double? higNeg;
  double? endHigNeg;
  double? higNegPri;
  double? midNegAmount;
  double? midNeg;
  double? endMidNeg;
  double? midNegPri;
  double? lowNegAmount;
  double? lowNeg;
  double? endLowNeg;
  double? lowNegPri;
  double? totalPosAmount;
  double? batChargeWhSum;
  double? endBatChargeWhSum;
  double? totalNegAmount;
  double? batDisChargeWhSum;
  double? endBatDisChargeWhSum;
  double? totalElecIncome;
  double? efficiency;
  double? totalIncome;

  StatisticReportDailyElecIncomeDetail();

  factory StatisticReportDailyElecIncomeDetail.fromJson(
    Map<String, dynamic> json,
  ) => $StatisticReportDailyElecIncomeDetailFromJson(json);

  Map<String, dynamic> toJson() =>
      $StatisticReportDailyElecIncomeDetailToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }

  String showDate(QueryType type) {
    if (formatDate == null) {
      return "";
    } else {
      if (type == QueryType.daily) {
        List<String> list = formatDate!.split("-");
        return "${list[0]}\n${list[1]}-${list[2]}";
      } else if (type == QueryType.monthly) {
        List<String> list = formatDate!.split("-");
        return "${list[0]}\n${list[1]}";
      } else if (type == QueryType.yearly) {
        return formatDate ?? "";
      } else {
        return "";
      }
    }
  }
}

@JsonSerializable()
class StatisticReportSubsidyDTO {
  double? buildSubsidy; //建设补贴
  double? opSubsidy; //运营补贴
  double? opPri; //运营单价

  StatisticReportSubsidyDTO();

  factory StatisticReportSubsidyDTO.fromJson(Map<String, dynamic> json) =>
      $StatisticReportSubsidyDTOFromJson(json);

  Map<String, dynamic> toJson() => $StatisticReportSubsidyDTOToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}
