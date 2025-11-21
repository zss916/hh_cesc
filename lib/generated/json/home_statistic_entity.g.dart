import 'package:cescpro/generated/json/base/json_convert_content.dart';
import 'package:cescpro/http/bean/home_statistic_entity.dart';

HomeStatisticEntity $HomeStatisticEntityFromJson(Map<String, dynamic> json) {
  final HomeStatisticEntity homeStatisticEntity = HomeStatisticEntity();
  final num? totalIncome = jsonConvert.convert<num>(json['totalIncome']);
  if (totalIncome != null) {
    homeStatisticEntity.totalIncome = totalIncome;
  }
  final num? todayIncome = jsonConvert.convert<num>(json['todayIncome']);
  if (todayIncome != null) {
    homeStatisticEntity.todayIncome = todayIncome;
  }
  final num? capacity = jsonConvert.convert<num>(json['capacity']);
  if (capacity != null) {
    homeStatisticEntity.capacity = capacity;
  }
  final num? totalPos = jsonConvert.convert<num>(json['totalPos']);
  if (totalPos != null) {
    homeStatisticEntity.totalPos = totalPos;
  }
  final num? totalNeg = jsonConvert.convert<num>(json['totalNeg']);
  if (totalNeg != null) {
    homeStatisticEntity.totalNeg = totalNeg;
  }
  final num? totalPvNeg = jsonConvert.convert<num>(json['totalPvNeg']);
  if (totalPvNeg != null) {
    homeStatisticEntity.totalPvNeg = totalPvNeg;
  }
  final int? deviceNum = jsonConvert.convert<int>(json['deviceNum']);
  if (deviceNum != null) {
    homeStatisticEntity.deviceNum = deviceNum;
  }
  final int? siteNum = jsonConvert.convert<int>(json['siteNum']);
  if (siteNum != null) {
    homeStatisticEntity.siteNum = siteNum;
  }
  final int? normalNum = jsonConvert.convert<int>(json['normalNum']);
  if (normalNum != null) {
    homeStatisticEntity.normalNum = normalNum;
  }
  final int? faultNum = jsonConvert.convert<int>(json['faultNum']);
  if (faultNum != null) {
    homeStatisticEntity.faultNum = faultNum;
  }
  final int? alarmNum = jsonConvert.convert<int>(json['alarmNum']);
  if (alarmNum != null) {
    homeStatisticEntity.alarmNum = alarmNum;
  }
  final int? cutOffNum = jsonConvert.convert<int>(json['cutOffNum']);
  if (cutOffNum != null) {
    homeStatisticEntity.cutOffNum = cutOffNum;
  }
  final num? co2 = jsonConvert.convert<num>(json['co2']);
  if (co2 != null) {
    homeStatisticEntity.co2 = co2;
  }
  final num? coal = jsonConvert.convert<num>(json['coal']);
  if (coal != null) {
    homeStatisticEntity.coal = coal;
  }
  return homeStatisticEntity;
}

Map<String, dynamic> $HomeStatisticEntityToJson(HomeStatisticEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['totalIncome'] = entity.totalIncome;
  data['todayIncome'] = entity.todayIncome;
  data['capacity'] = entity.capacity;
  data['totalPos'] = entity.totalPos;
  data['totalNeg'] = entity.totalNeg;
  data['totalPvNeg'] = entity.totalPvNeg;
  data['deviceNum'] = entity.deviceNum;
  data['siteNum'] = entity.siteNum;
  data['normalNum'] = entity.normalNum;
  data['faultNum'] = entity.faultNum;
  data['alarmNum'] = entity.alarmNum;
  data['cutOffNum'] = entity.cutOffNum;
  data['co2'] = entity.co2;
  data['coal'] = entity.coal;
  return data;
}

extension HomeStatisticEntityExtension on HomeStatisticEntity {
  HomeStatisticEntity copyWith({
    num? totalIncome,
    num? todayIncome,
    num? capacity,
    num? totalPos,
    num? totalNeg,
    num? totalPvNeg,
    int? deviceNum,
    int? siteNum,
    int? normalNum,
    int? faultNum,
    int? alarmNum,
    int? cutOffNum,
    num? co2,
    num? coal,
  }) {
    return HomeStatisticEntity()
      ..totalIncome = totalIncome ?? this.totalIncome
      ..todayIncome = todayIncome ?? this.todayIncome
      ..capacity = capacity ?? this.capacity
      ..totalPos = totalPos ?? this.totalPos
      ..totalNeg = totalNeg ?? this.totalNeg
      ..totalPvNeg = totalPvNeg ?? this.totalPvNeg
      ..deviceNum = deviceNum ?? this.deviceNum
      ..siteNum = siteNum ?? this.siteNum
      ..normalNum = normalNum ?? this.normalNum
      ..faultNum = faultNum ?? this.faultNum
      ..alarmNum = alarmNum ?? this.alarmNum
      ..cutOffNum = cutOffNum ?? this.cutOffNum
      ..co2 = co2 ?? this.co2
      ..coal = coal ?? this.coal;
  }
}
