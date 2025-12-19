import 'package:cescpro/generated/json/base/json_convert_content.dart';
import 'package:cescpro/http/bean/statistic_report_entity.dart';
import 'package:cescpro/page/station/revenue/index.dart';


StatisticReportEntity $StatisticReportEntityFromJson(
    Map<String, dynamic> json) {
  final StatisticReportEntity statisticReportEntity = StatisticReportEntity();
  final String? siteName = jsonConvert.convert<String>(json['siteName']);
  if (siteName != null) {
    statisticReportEntity.siteName = siteName;
  }
  final int? siteId = jsonConvert.convert<int>(json['siteId']);
  if (siteId != null) {
    statisticReportEntity.siteId = siteId;
  }
  final List<
      StatisticReportDailyElecIncomeDetail>? dailyElecIncomeDetail = (json['dailyElecIncomeDetail'] as List<
      dynamic>?)?.map(
          (e) =>
      jsonConvert.convert<StatisticReportDailyElecIncomeDetail>(
          e) as StatisticReportDailyElecIncomeDetail).toList();
  if (dailyElecIncomeDetail != null) {
    statisticReportEntity.dailyElecIncomeDetail = dailyElecIncomeDetail;
  }
  final double? totalVerPos = jsonConvert.convert<double>(json['totalVerPos']);
  if (totalVerPos != null) {
    statisticReportEntity.totalVerPos = totalVerPos;
  }
  final double? totalEndVerPos = jsonConvert.convert<double>(
      json['totalEndVerPos']);
  if (totalEndVerPos != null) {
    statisticReportEntity.totalEndVerPos = totalEndVerPos;
  }
  final double? totalVerPosAmount = jsonConvert.convert<double>(
      json['totalVerPosAmount']);
  if (totalVerPosAmount != null) {
    statisticReportEntity.totalVerPosAmount = totalVerPosAmount;
  }
  final double? totalHigPos = jsonConvert.convert<double>(json['totalHigPos']);
  if (totalHigPos != null) {
    statisticReportEntity.totalHigPos = totalHigPos;
  }
  final double? totalEndHigPos = jsonConvert.convert<double>(
      json['totalEndHigPos']);
  if (totalEndHigPos != null) {
    statisticReportEntity.totalEndHigPos = totalEndHigPos;
  }
  final double? totalHigPosAmount = jsonConvert.convert<double>(
      json['totalHigPosAmount']);
  if (totalHigPosAmount != null) {
    statisticReportEntity.totalHigPosAmount = totalHigPosAmount;
  }
  final double? totalMidPos = jsonConvert.convert<double>(json['totalMidPos']);
  if (totalMidPos != null) {
    statisticReportEntity.totalMidPos = totalMidPos;
  }
  final double? totalEndMidPos = jsonConvert.convert<double>(
      json['totalEndMidPos']);
  if (totalEndMidPos != null) {
    statisticReportEntity.totalEndMidPos = totalEndMidPos;
  }
  final double? totalMidPosAmount = jsonConvert.convert<double>(
      json['totalMidPosAmount']);
  if (totalMidPosAmount != null) {
    statisticReportEntity.totalMidPosAmount = totalMidPosAmount;
  }
  final double? totalLowPos = jsonConvert.convert<double>(json['totalLowPos']);
  if (totalLowPos != null) {
    statisticReportEntity.totalLowPos = totalLowPos;
  }
  final double? totalEndLowPos = jsonConvert.convert<double>(
      json['totalEndLowPos']);
  if (totalEndLowPos != null) {
    statisticReportEntity.totalEndLowPos = totalEndLowPos;
  }
  final double? totalLowPosAmount = jsonConvert.convert<double>(
      json['totalLowPosAmount']);
  if (totalLowPosAmount != null) {
    statisticReportEntity.totalLowPosAmount = totalLowPosAmount;
  }
  final double? totalPos = jsonConvert.convert<double>(json['totalPos']);
  if (totalPos != null) {
    statisticReportEntity.totalPos = totalPos;
  }
  final double? totalEndPos = jsonConvert.convert<double>(json['totalEndPos']);
  if (totalEndPos != null) {
    statisticReportEntity.totalEndPos = totalEndPos;
  }
  final double? totalPosAmount = jsonConvert.convert<double>(
      json['totalPosAmount']);
  if (totalPosAmount != null) {
    statisticReportEntity.totalPosAmount = totalPosAmount;
  }
  final double? totalVerNeg = jsonConvert.convert<double>(json['totalVerNeg']);
  if (totalVerNeg != null) {
    statisticReportEntity.totalVerNeg = totalVerNeg;
  }
  final double? totalEndVerNeg = jsonConvert.convert<double>(
      json['totalEndVerNeg']);
  if (totalEndVerNeg != null) {
    statisticReportEntity.totalEndVerNeg = totalEndVerNeg;
  }
  final double? totalVerNegAmount = jsonConvert.convert<double>(
      json['totalVerNegAmount']);
  if (totalVerNegAmount != null) {
    statisticReportEntity.totalVerNegAmount = totalVerNegAmount;
  }
  final double? totalHigNeg = jsonConvert.convert<double>(json['totalHigNeg']);
  if (totalHigNeg != null) {
    statisticReportEntity.totalHigNeg = totalHigNeg;
  }
  final double? totalEndHigNeg = jsonConvert.convert<double>(
      json['totalEndHigNeg']);
  if (totalEndHigNeg != null) {
    statisticReportEntity.totalEndHigNeg = totalEndHigNeg;
  }
  final double? totalHigNegAmount = jsonConvert.convert<double>(
      json['totalHigNegAmount']);
  if (totalHigNegAmount != null) {
    statisticReportEntity.totalHigNegAmount = totalHigNegAmount;
  }
  final double? totalMidNeg = jsonConvert.convert<double>(json['totalMidNeg']);
  if (totalMidNeg != null) {
    statisticReportEntity.totalMidNeg = totalMidNeg;
  }
  final double? totalEndMidNeg = jsonConvert.convert<double>(
      json['totalEndMidNeg']);
  if (totalEndMidNeg != null) {
    statisticReportEntity.totalEndMidNeg = totalEndMidNeg;
  }
  final double? totalMidNegAmount = jsonConvert.convert<double>(
      json['totalMidNegAmount']);
  if (totalMidNegAmount != null) {
    statisticReportEntity.totalMidNegAmount = totalMidNegAmount;
  }
  final double? totalLowNeg = jsonConvert.convert<double>(json['totalLowNeg']);
  if (totalLowNeg != null) {
    statisticReportEntity.totalLowNeg = totalLowNeg;
  }
  final double? totalEndLowNeg = jsonConvert.convert<double>(
      json['totalEndLowNeg']);
  if (totalEndLowNeg != null) {
    statisticReportEntity.totalEndLowNeg = totalEndLowNeg;
  }
  final double? totalLowNegAmount = jsonConvert.convert<double>(
      json['totalLowNegAmount']);
  if (totalLowNegAmount != null) {
    statisticReportEntity.totalLowNegAmount = totalLowNegAmount;
  }
  final double? totalNeg = jsonConvert.convert<double>(json['totalNeg']);
  if (totalNeg != null) {
    statisticReportEntity.totalNeg = totalNeg;
  }
  final double? totalEndNeg = jsonConvert.convert<double>(json['totalEndNeg']);
  if (totalEndNeg != null) {
    statisticReportEntity.totalEndNeg = totalEndNeg;
  }
  final double? totalNegAmount = jsonConvert.convert<double>(
      json['totalNegAmount']);
  if (totalNegAmount != null) {
    statisticReportEntity.totalNegAmount = totalNegAmount;
  }
  final double? totalIncome = jsonConvert.convert<double>(json['totalIncome']);
  if (totalIncome != null) {
    statisticReportEntity.totalIncome = totalIncome;
  }
  final double? totalEfficiency = jsonConvert.convert<double>(
      json['totalEfficiency']);
  if (totalEfficiency != null) {
    statisticReportEntity.totalEfficiency = totalEfficiency;
  }
  final StatisticReportSubsidyDTO? subsidyDTO = jsonConvert.convert<
      StatisticReportSubsidyDTO>(json['subsidyDTO']);
  if (subsidyDTO != null) {
    statisticReportEntity.subsidyDTO = subsidyDTO;
  }
  return statisticReportEntity;
}

Map<String, dynamic> $StatisticReportEntityToJson(
    StatisticReportEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['siteName'] = entity.siteName;
  data['siteId'] = entity.siteId;
  data['dailyElecIncomeDetail'] =
      entity.dailyElecIncomeDetail?.map((v) => v.toJson()).toList();
  data['totalVerPos'] = entity.totalVerPos;
  data['totalEndVerPos'] = entity.totalEndVerPos;
  data['totalVerPosAmount'] = entity.totalVerPosAmount;
  data['totalHigPos'] = entity.totalHigPos;
  data['totalEndHigPos'] = entity.totalEndHigPos;
  data['totalHigPosAmount'] = entity.totalHigPosAmount;
  data['totalMidPos'] = entity.totalMidPos;
  data['totalEndMidPos'] = entity.totalEndMidPos;
  data['totalMidPosAmount'] = entity.totalMidPosAmount;
  data['totalLowPos'] = entity.totalLowPos;
  data['totalEndLowPos'] = entity.totalEndLowPos;
  data['totalLowPosAmount'] = entity.totalLowPosAmount;
  data['totalPos'] = entity.totalPos;
  data['totalEndPos'] = entity.totalEndPos;
  data['totalPosAmount'] = entity.totalPosAmount;
  data['totalVerNeg'] = entity.totalVerNeg;
  data['totalEndVerNeg'] = entity.totalEndVerNeg;
  data['totalVerNegAmount'] = entity.totalVerNegAmount;
  data['totalHigNeg'] = entity.totalHigNeg;
  data['totalEndHigNeg'] = entity.totalEndHigNeg;
  data['totalHigNegAmount'] = entity.totalHigNegAmount;
  data['totalMidNeg'] = entity.totalMidNeg;
  data['totalEndMidNeg'] = entity.totalEndMidNeg;
  data['totalMidNegAmount'] = entity.totalMidNegAmount;
  data['totalLowNeg'] = entity.totalLowNeg;
  data['totalEndLowNeg'] = entity.totalEndLowNeg;
  data['totalLowNegAmount'] = entity.totalLowNegAmount;
  data['totalNeg'] = entity.totalNeg;
  data['totalEndNeg'] = entity.totalEndNeg;
  data['totalNegAmount'] = entity.totalNegAmount;
  data['totalIncome'] = entity.totalIncome;
  data['totalEfficiency'] = entity.totalEfficiency;
  data['subsidyDTO'] = entity.subsidyDTO?.toJson();
  return data;
}

extension StatisticReportEntityExtension on StatisticReportEntity {
  StatisticReportEntity copyWith({
    String? siteName,
    int? siteId,
    List<StatisticReportDailyElecIncomeDetail>? dailyElecIncomeDetail,
    double? totalVerPos,
    double? totalEndVerPos,
    double? totalVerPosAmount,
    double? totalHigPos,
    double? totalEndHigPos,
    double? totalHigPosAmount,
    double? totalMidPos,
    double? totalEndMidPos,
    double? totalMidPosAmount,
    double? totalLowPos,
    double? totalEndLowPos,
    double? totalLowPosAmount,
    double? totalPos,
    double? totalEndPos,
    double? totalPosAmount,
    double? totalVerNeg,
    double? totalEndVerNeg,
    double? totalVerNegAmount,
    double? totalHigNeg,
    double? totalEndHigNeg,
    double? totalHigNegAmount,
    double? totalMidNeg,
    double? totalEndMidNeg,
    double? totalMidNegAmount,
    double? totalLowNeg,
    double? totalEndLowNeg,
    double? totalLowNegAmount,
    double? totalNeg,
    double? totalEndNeg,
    double? totalNegAmount,
    double? totalIncome,
    double? totalEfficiency,
    StatisticReportSubsidyDTO? subsidyDTO,
  }) {
    return StatisticReportEntity()
      ..siteName = siteName ?? this.siteName
      ..siteId = siteId ?? this.siteId
      ..dailyElecIncomeDetail = dailyElecIncomeDetail ??
          this.dailyElecIncomeDetail
      ..totalVerPos = totalVerPos ?? this.totalVerPos
      ..totalEndVerPos = totalEndVerPos ?? this.totalEndVerPos
      ..totalVerPosAmount = totalVerPosAmount ?? this.totalVerPosAmount
      ..totalHigPos = totalHigPos ?? this.totalHigPos
      ..totalEndHigPos = totalEndHigPos ?? this.totalEndHigPos
      ..totalHigPosAmount = totalHigPosAmount ?? this.totalHigPosAmount
      ..totalMidPos = totalMidPos ?? this.totalMidPos
      ..totalEndMidPos = totalEndMidPos ?? this.totalEndMidPos
      ..totalMidPosAmount = totalMidPosAmount ?? this.totalMidPosAmount
      ..totalLowPos = totalLowPos ?? this.totalLowPos
      ..totalEndLowPos = totalEndLowPos ?? this.totalEndLowPos
      ..totalLowPosAmount = totalLowPosAmount ?? this.totalLowPosAmount
      ..totalPos = totalPos ?? this.totalPos
      ..totalEndPos = totalEndPos ?? this.totalEndPos
      ..totalPosAmount = totalPosAmount ?? this.totalPosAmount
      ..totalVerNeg = totalVerNeg ?? this.totalVerNeg
      ..totalEndVerNeg = totalEndVerNeg ?? this.totalEndVerNeg
      ..totalVerNegAmount = totalVerNegAmount ?? this.totalVerNegAmount
      ..totalHigNeg = totalHigNeg ?? this.totalHigNeg
      ..totalEndHigNeg = totalEndHigNeg ?? this.totalEndHigNeg
      ..totalHigNegAmount = totalHigNegAmount ?? this.totalHigNegAmount
      ..totalMidNeg = totalMidNeg ?? this.totalMidNeg
      ..totalEndMidNeg = totalEndMidNeg ?? this.totalEndMidNeg
      ..totalMidNegAmount = totalMidNegAmount ?? this.totalMidNegAmount
      ..totalLowNeg = totalLowNeg ?? this.totalLowNeg
      ..totalEndLowNeg = totalEndLowNeg ?? this.totalEndLowNeg
      ..totalLowNegAmount = totalLowNegAmount ?? this.totalLowNegAmount
      ..totalNeg = totalNeg ?? this.totalNeg
      ..totalEndNeg = totalEndNeg ?? this.totalEndNeg
      ..totalNegAmount = totalNegAmount ?? this.totalNegAmount
      ..totalIncome = totalIncome ?? this.totalIncome
      ..totalEfficiency = totalEfficiency ?? this.totalEfficiency
      ..subsidyDTO = subsidyDTO ?? this.subsidyDTO;
  }
}

StatisticReportDailyElecIncomeDetail $StatisticReportDailyElecIncomeDetailFromJson(
    Map<String, dynamic> json) {
  final StatisticReportDailyElecIncomeDetail statisticReportDailyElecIncomeDetail = StatisticReportDailyElecIncomeDetail();
  final int? devNo = jsonConvert.convert<int>(json['devNo']);
  if (devNo != null) {
    statisticReportDailyElecIncomeDetail.devNo = devNo;
  }
  final String? dateTime = jsonConvert.convert<String>(json['dateTime']);
  if (dateTime != null) {
    statisticReportDailyElecIncomeDetail.dateTime = dateTime;
  }
  final String? formatDate = jsonConvert.convert<String>(json['formatDate']);
  if (formatDate != null) {
    statisticReportDailyElecIncomeDetail.formatDate = formatDate;
  }
  final double? verPosAmount = jsonConvert.convert<double>(
      json['verPosAmount']);
  if (verPosAmount != null) {
    statisticReportDailyElecIncomeDetail.verPosAmount = verPosAmount;
  }
  final double? verPos = jsonConvert.convert<double>(json['verPos']);
  if (verPos != null) {
    statisticReportDailyElecIncomeDetail.verPos = verPos;
  }
  final double? endVerPos = jsonConvert.convert<double>(json['endVerPos']);
  if (endVerPos != null) {
    statisticReportDailyElecIncomeDetail.endVerPos = endVerPos;
  }
  final double? verPosPri = jsonConvert.convert<double>(json['verPosPri']);
  if (verPosPri != null) {
    statisticReportDailyElecIncomeDetail.verPosPri = verPosPri;
  }
  final double? higPosAmount = jsonConvert.convert<double>(
      json['higPosAmount']);
  if (higPosAmount != null) {
    statisticReportDailyElecIncomeDetail.higPosAmount = higPosAmount;
  }
  final double? higPos = jsonConvert.convert<double>(json['higPos']);
  if (higPos != null) {
    statisticReportDailyElecIncomeDetail.higPos = higPos;
  }
  final double? endHigPos = jsonConvert.convert<double>(json['endHigPos']);
  if (endHigPos != null) {
    statisticReportDailyElecIncomeDetail.endHigPos = endHigPos;
  }
  final double? higPosPri = jsonConvert.convert<double>(json['higPosPri']);
  if (higPosPri != null) {
    statisticReportDailyElecIncomeDetail.higPosPri = higPosPri;
  }
  final double? midPosAmount = jsonConvert.convert<double>(
      json['midPosAmount']);
  if (midPosAmount != null) {
    statisticReportDailyElecIncomeDetail.midPosAmount = midPosAmount;
  }
  final double? midPos = jsonConvert.convert<double>(json['midPos']);
  if (midPos != null) {
    statisticReportDailyElecIncomeDetail.midPos = midPos;
  }
  final double? endMidPos = jsonConvert.convert<double>(json['endMidPos']);
  if (endMidPos != null) {
    statisticReportDailyElecIncomeDetail.endMidPos = endMidPos;
  }
  final double? midPosPri = jsonConvert.convert<double>(json['midPosPri']);
  if (midPosPri != null) {
    statisticReportDailyElecIncomeDetail.midPosPri = midPosPri;
  }
  final double? lowPosAmount = jsonConvert.convert<double>(
      json['lowPosAmount']);
  if (lowPosAmount != null) {
    statisticReportDailyElecIncomeDetail.lowPosAmount = lowPosAmount;
  }
  final double? lowPos = jsonConvert.convert<double>(json['lowPos']);
  if (lowPos != null) {
    statisticReportDailyElecIncomeDetail.lowPos = lowPos;
  }
  final double? endLowPos = jsonConvert.convert<double>(json['endLowPos']);
  if (endLowPos != null) {
    statisticReportDailyElecIncomeDetail.endLowPos = endLowPos;
  }
  final double? lowPosPri = jsonConvert.convert<double>(json['lowPosPri']);
  if (lowPosPri != null) {
    statisticReportDailyElecIncomeDetail.lowPosPri = lowPosPri;
  }
  final double? verNegAmount = jsonConvert.convert<double>(
      json['verNegAmount']);
  if (verNegAmount != null) {
    statisticReportDailyElecIncomeDetail.verNegAmount = verNegAmount;
  }
  final double? verNeg = jsonConvert.convert<double>(json['verNeg']);
  if (verNeg != null) {
    statisticReportDailyElecIncomeDetail.verNeg = verNeg;
  }
  final double? endVerNeg = jsonConvert.convert<double>(json['endVerNeg']);
  if (endVerNeg != null) {
    statisticReportDailyElecIncomeDetail.endVerNeg = endVerNeg;
  }
  final double? verNegPri = jsonConvert.convert<double>(json['verNegPri']);
  if (verNegPri != null) {
    statisticReportDailyElecIncomeDetail.verNegPri = verNegPri;
  }
  final double? higNegAmount = jsonConvert.convert<double>(
      json['higNegAmount']);
  if (higNegAmount != null) {
    statisticReportDailyElecIncomeDetail.higNegAmount = higNegAmount;
  }
  final double? higNeg = jsonConvert.convert<double>(json['higNeg']);
  if (higNeg != null) {
    statisticReportDailyElecIncomeDetail.higNeg = higNeg;
  }
  final double? endHigNeg = jsonConvert.convert<double>(json['endHigNeg']);
  if (endHigNeg != null) {
    statisticReportDailyElecIncomeDetail.endHigNeg = endHigNeg;
  }
  final double? higNegPri = jsonConvert.convert<double>(json['higNegPri']);
  if (higNegPri != null) {
    statisticReportDailyElecIncomeDetail.higNegPri = higNegPri;
  }
  final double? midNegAmount = jsonConvert.convert<double>(
      json['midNegAmount']);
  if (midNegAmount != null) {
    statisticReportDailyElecIncomeDetail.midNegAmount = midNegAmount;
  }
  final double? midNeg = jsonConvert.convert<double>(json['midNeg']);
  if (midNeg != null) {
    statisticReportDailyElecIncomeDetail.midNeg = midNeg;
  }
  final double? endMidNeg = jsonConvert.convert<double>(json['endMidNeg']);
  if (endMidNeg != null) {
    statisticReportDailyElecIncomeDetail.endMidNeg = endMidNeg;
  }
  final double? midNegPri = jsonConvert.convert<double>(json['midNegPri']);
  if (midNegPri != null) {
    statisticReportDailyElecIncomeDetail.midNegPri = midNegPri;
  }
  final double? lowNegAmount = jsonConvert.convert<double>(
      json['lowNegAmount']);
  if (lowNegAmount != null) {
    statisticReportDailyElecIncomeDetail.lowNegAmount = lowNegAmount;
  }
  final double? lowNeg = jsonConvert.convert<double>(json['lowNeg']);
  if (lowNeg != null) {
    statisticReportDailyElecIncomeDetail.lowNeg = lowNeg;
  }
  final double? endLowNeg = jsonConvert.convert<double>(json['endLowNeg']);
  if (endLowNeg != null) {
    statisticReportDailyElecIncomeDetail.endLowNeg = endLowNeg;
  }
  final double? lowNegPri = jsonConvert.convert<double>(json['lowNegPri']);
  if (lowNegPri != null) {
    statisticReportDailyElecIncomeDetail.lowNegPri = lowNegPri;
  }
  final double? totalPosAmount = jsonConvert.convert<double>(
      json['totalPosAmount']);
  if (totalPosAmount != null) {
    statisticReportDailyElecIncomeDetail.totalPosAmount = totalPosAmount;
  }
  final double? batChargeWhSum = jsonConvert.convert<double>(
      json['batChargeWhSum']);
  if (batChargeWhSum != null) {
    statisticReportDailyElecIncomeDetail.batChargeWhSum = batChargeWhSum;
  }
  final double? endBatChargeWhSum = jsonConvert.convert<double>(
      json['endBatChargeWhSum']);
  if (endBatChargeWhSum != null) {
    statisticReportDailyElecIncomeDetail.endBatChargeWhSum = endBatChargeWhSum;
  }
  final double? totalNegAmount = jsonConvert.convert<double>(
      json['totalNegAmount']);
  if (totalNegAmount != null) {
    statisticReportDailyElecIncomeDetail.totalNegAmount = totalNegAmount;
  }
  final double? batDisChargeWhSum = jsonConvert.convert<double>(
      json['batDisChargeWhSum']);
  if (batDisChargeWhSum != null) {
    statisticReportDailyElecIncomeDetail.batDisChargeWhSum = batDisChargeWhSum;
  }
  final double? endBatDisChargeWhSum = jsonConvert.convert<double>(
      json['endBatDisChargeWhSum']);
  if (endBatDisChargeWhSum != null) {
    statisticReportDailyElecIncomeDetail.endBatDisChargeWhSum =
        endBatDisChargeWhSum;
  }
  final double? totalElecIncome = jsonConvert.convert<double>(
      json['totalElecIncome']);
  if (totalElecIncome != null) {
    statisticReportDailyElecIncomeDetail.totalElecIncome = totalElecIncome;
  }
  final double? efficiency = jsonConvert.convert<double>(json['efficiency']);
  if (efficiency != null) {
    statisticReportDailyElecIncomeDetail.efficiency = efficiency;
  }
  final double? totalIncome = jsonConvert.convert<double>(json['totalIncome']);
  if (totalIncome != null) {
    statisticReportDailyElecIncomeDetail.totalIncome = totalIncome;
  }
  return statisticReportDailyElecIncomeDetail;
}

Map<String, dynamic> $StatisticReportDailyElecIncomeDetailToJson(
    StatisticReportDailyElecIncomeDetail entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['devNo'] = entity.devNo;
  data['dateTime'] = entity.dateTime;
  data['formatDate'] = entity.formatDate;
  data['verPosAmount'] = entity.verPosAmount;
  data['verPos'] = entity.verPos;
  data['endVerPos'] = entity.endVerPos;
  data['verPosPri'] = entity.verPosPri;
  data['higPosAmount'] = entity.higPosAmount;
  data['higPos'] = entity.higPos;
  data['endHigPos'] = entity.endHigPos;
  data['higPosPri'] = entity.higPosPri;
  data['midPosAmount'] = entity.midPosAmount;
  data['midPos'] = entity.midPos;
  data['endMidPos'] = entity.endMidPos;
  data['midPosPri'] = entity.midPosPri;
  data['lowPosAmount'] = entity.lowPosAmount;
  data['lowPos'] = entity.lowPos;
  data['endLowPos'] = entity.endLowPos;
  data['lowPosPri'] = entity.lowPosPri;
  data['verNegAmount'] = entity.verNegAmount;
  data['verNeg'] = entity.verNeg;
  data['endVerNeg'] = entity.endVerNeg;
  data['verNegPri'] = entity.verNegPri;
  data['higNegAmount'] = entity.higNegAmount;
  data['higNeg'] = entity.higNeg;
  data['endHigNeg'] = entity.endHigNeg;
  data['higNegPri'] = entity.higNegPri;
  data['midNegAmount'] = entity.midNegAmount;
  data['midNeg'] = entity.midNeg;
  data['endMidNeg'] = entity.endMidNeg;
  data['midNegPri'] = entity.midNegPri;
  data['lowNegAmount'] = entity.lowNegAmount;
  data['lowNeg'] = entity.lowNeg;
  data['endLowNeg'] = entity.endLowNeg;
  data['lowNegPri'] = entity.lowNegPri;
  data['totalPosAmount'] = entity.totalPosAmount;
  data['batChargeWhSum'] = entity.batChargeWhSum;
  data['endBatChargeWhSum'] = entity.endBatChargeWhSum;
  data['totalNegAmount'] = entity.totalNegAmount;
  data['batDisChargeWhSum'] = entity.batDisChargeWhSum;
  data['endBatDisChargeWhSum'] = entity.endBatDisChargeWhSum;
  data['totalElecIncome'] = entity.totalElecIncome;
  data['efficiency'] = entity.efficiency;
  data['totalIncome'] = entity.totalIncome;
  return data;
}

extension StatisticReportDailyElecIncomeDetailExtension on StatisticReportDailyElecIncomeDetail {
  StatisticReportDailyElecIncomeDetail copyWith({
    int? devNo,
    String? dateTime,
    String? formatDate,
    double? verPosAmount,
    double? verPos,
    double? endVerPos,
    double? verPosPri,
    double? higPosAmount,
    double? higPos,
    double? endHigPos,
    double? higPosPri,
    double? midPosAmount,
    double? midPos,
    double? endMidPos,
    double? midPosPri,
    double? lowPosAmount,
    double? lowPos,
    double? endLowPos,
    double? lowPosPri,
    double? verNegAmount,
    double? verNeg,
    double? endVerNeg,
    double? verNegPri,
    double? higNegAmount,
    double? higNeg,
    double? endHigNeg,
    double? higNegPri,
    double? midNegAmount,
    double? midNeg,
    double? endMidNeg,
    double? midNegPri,
    double? lowNegAmount,
    double? lowNeg,
    double? endLowNeg,
    double? lowNegPri,
    double? totalPosAmount,
    double? batChargeWhSum,
    double? endBatChargeWhSum,
    double? totalNegAmount,
    double? batDisChargeWhSum,
    double? endBatDisChargeWhSum,
    double? totalElecIncome,
    double? efficiency,
    double? totalIncome,
  }) {
    return StatisticReportDailyElecIncomeDetail()
      ..devNo = devNo ?? this.devNo
      ..dateTime = dateTime ?? this.dateTime
      ..formatDate = formatDate ?? this.formatDate
      ..verPosAmount = verPosAmount ?? this.verPosAmount
      ..verPos = verPos ?? this.verPos
      ..endVerPos = endVerPos ?? this.endVerPos
      ..verPosPri = verPosPri ?? this.verPosPri
      ..higPosAmount = higPosAmount ?? this.higPosAmount
      ..higPos = higPos ?? this.higPos
      ..endHigPos = endHigPos ?? this.endHigPos
      ..higPosPri = higPosPri ?? this.higPosPri
      ..midPosAmount = midPosAmount ?? this.midPosAmount
      ..midPos = midPos ?? this.midPos
      ..endMidPos = endMidPos ?? this.endMidPos
      ..midPosPri = midPosPri ?? this.midPosPri
      ..lowPosAmount = lowPosAmount ?? this.lowPosAmount
      ..lowPos = lowPos ?? this.lowPos
      ..endLowPos = endLowPos ?? this.endLowPos
      ..lowPosPri = lowPosPri ?? this.lowPosPri
      ..verNegAmount = verNegAmount ?? this.verNegAmount
      ..verNeg = verNeg ?? this.verNeg
      ..endVerNeg = endVerNeg ?? this.endVerNeg
      ..verNegPri = verNegPri ?? this.verNegPri
      ..higNegAmount = higNegAmount ?? this.higNegAmount
      ..higNeg = higNeg ?? this.higNeg
      ..endHigNeg = endHigNeg ?? this.endHigNeg
      ..higNegPri = higNegPri ?? this.higNegPri
      ..midNegAmount = midNegAmount ?? this.midNegAmount
      ..midNeg = midNeg ?? this.midNeg
      ..endMidNeg = endMidNeg ?? this.endMidNeg
      ..midNegPri = midNegPri ?? this.midNegPri
      ..lowNegAmount = lowNegAmount ?? this.lowNegAmount
      ..lowNeg = lowNeg ?? this.lowNeg
      ..endLowNeg = endLowNeg ?? this.endLowNeg
      ..lowNegPri = lowNegPri ?? this.lowNegPri
      ..totalPosAmount = totalPosAmount ?? this.totalPosAmount
      ..batChargeWhSum = batChargeWhSum ?? this.batChargeWhSum
      ..endBatChargeWhSum = endBatChargeWhSum ?? this.endBatChargeWhSum
      ..totalNegAmount = totalNegAmount ?? this.totalNegAmount
      ..batDisChargeWhSum = batDisChargeWhSum ?? this.batDisChargeWhSum
      ..endBatDisChargeWhSum = endBatDisChargeWhSum ?? this.endBatDisChargeWhSum
      ..totalElecIncome = totalElecIncome ?? this.totalElecIncome
      ..efficiency = efficiency ?? this.efficiency
      ..totalIncome = totalIncome ?? this.totalIncome;
  }
}

StatisticReportSubsidyDTO $StatisticReportSubsidyDTOFromJson(
    Map<String, dynamic> json) {
  final StatisticReportSubsidyDTO statisticReportSubsidyDTO = StatisticReportSubsidyDTO();
  final double? buildSubsidy = jsonConvert.convert<double>(
      json['buildSubsidy']);
  if (buildSubsidy != null) {
    statisticReportSubsidyDTO.buildSubsidy = buildSubsidy;
  }
  final double? opSubsidy = jsonConvert.convert<double>(json['opSubsidy']);
  if (opSubsidy != null) {
    statisticReportSubsidyDTO.opSubsidy = opSubsidy;
  }
  final double? opPri = jsonConvert.convert<double>(json['opPri']);
  if (opPri != null) {
    statisticReportSubsidyDTO.opPri = opPri;
  }
  return statisticReportSubsidyDTO;
}

Map<String, dynamic> $StatisticReportSubsidyDTOToJson(
    StatisticReportSubsidyDTO entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['buildSubsidy'] = entity.buildSubsidy;
  data['opSubsidy'] = entity.opSubsidy;
  data['opPri'] = entity.opPri;
  return data;
}

extension StatisticReportSubsidyDTOExtension on StatisticReportSubsidyDTO {
  StatisticReportSubsidyDTO copyWith({
    double? buildSubsidy,
    double? opSubsidy,
    double? opPri,
  }) {
    return StatisticReportSubsidyDTO()
      ..buildSubsidy = buildSubsidy ?? this.buildSubsidy
      ..opSubsidy = opSubsidy ?? this.opSubsidy
      ..opPri = opPri ?? this.opPri;
  }
}