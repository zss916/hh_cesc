import 'package:cescpro/generated/json/base/json_convert_content.dart';
import 'package:cescpro/http/bean/home_data2_entity.dart';

HomeData2Entity $HomeData2EntityFromJson(Map<String, dynamic> json) {
  final HomeData2Entity homeData2Entity = HomeData2Entity();
  final int? groupId = jsonConvert.convert<int>(json['groupId']);
  if (groupId != null) {
    homeData2Entity.groupId = groupId;
  }
  final String? groupName = jsonConvert.convert<String>(json['groupName']);
  if (groupName != null) {
    homeData2Entity.groupName = groupName;
  }
  final double? totalIncome = jsonConvert.convert<double>(json['totalIncome']);
  if (totalIncome != null) {
    homeData2Entity.totalIncome = totalIncome;
  }
  final double? totalPos = jsonConvert.convert<double>(json['totalPos']);
  if (totalPos != null) {
    homeData2Entity.totalPos = totalPos;
  }
  final double? totalNeg = jsonConvert.convert<double>(json['totalNeg']);
  if (totalNeg != null) {
    homeData2Entity.totalNeg = totalNeg;
  }
  final double? todayIncome = jsonConvert.convert<double>(json['todayIncome']);
  if (todayIncome != null) {
    homeData2Entity.todayIncome = todayIncome;
  }
  final double? todayTotalPos = jsonConvert.convert<double>(
      json['todayTotalPos']);
  if (todayTotalPos != null) {
    homeData2Entity.todayTotalPos = todayTotalPos;
  }
  final double? todayTotalNeg = jsonConvert.convert<double>(
      json['todayTotalNeg']);
  if (todayTotalNeg != null) {
    homeData2Entity.todayTotalNeg = todayTotalNeg;
  }
  final double? lastDayIncome = jsonConvert.convert<double>(
      json['lastDayIncome']);
  if (lastDayIncome != null) {
    homeData2Entity.lastDayIncome = lastDayIncome;
  }
  final double? lastDayTotalPos = jsonConvert.convert<double>(
      json['lastDayTotalPos']);
  if (lastDayTotalPos != null) {
    homeData2Entity.lastDayTotalPos = lastDayTotalPos;
  }
  final double? lastDayTotalNeg = jsonConvert.convert<double>(
      json['lastDayTotalNeg']);
  if (lastDayTotalNeg != null) {
    homeData2Entity.lastDayTotalNeg = lastDayTotalNeg;
  }
  final double? currentMonthIncome = jsonConvert.convert<double>(
      json['currentMonthIncome']);
  if (currentMonthIncome != null) {
    homeData2Entity.currentMonthIncome = currentMonthIncome;
  }
  final double? currentMonthTotalPos = jsonConvert.convert<double>(
      json['currentMonthTotalPos']);
  if (currentMonthTotalPos != null) {
    homeData2Entity.currentMonthTotalPos = currentMonthTotalPos;
  }
  final double? currentMonthTotalNeg = jsonConvert.convert<double>(
      json['currentMonthTotalNeg']);
  if (currentMonthTotalNeg != null) {
    homeData2Entity.currentMonthTotalNeg = currentMonthTotalNeg;
  }
  final double? currentYearIncome = jsonConvert.convert<double>(
      json['currentYearIncome']);
  if (currentYearIncome != null) {
    homeData2Entity.currentYearIncome = currentYearIncome;
  }
  final double? currentYearTotalPos = jsonConvert.convert<double>(
      json['currentYearTotalPos']);
  if (currentYearTotalPos != null) {
    homeData2Entity.currentYearTotalPos = currentYearTotalPos;
  }
  final double? currentYearTotalNeg = jsonConvert.convert<double>(
      json['currentYearTotalNeg']);
  if (currentYearTotalNeg != null) {
    homeData2Entity.currentYearTotalNeg = currentYearTotalNeg;
  }
  final double? todayPvTotalNeg = jsonConvert.convert<double>(
      json['todayPvTotalNeg']);
  if (todayPvTotalNeg != null) {
    homeData2Entity.todayPvTotalNeg = todayPvTotalNeg;
  }
  final double? totalPvTotalNeg = jsonConvert.convert<double>(
      json['totalPvTotalNeg']);
  if (totalPvTotalNeg != null) {
    homeData2Entity.totalPvTotalNeg = totalPvTotalNeg;
  }
  final double? monthPvTotalNeg = jsonConvert.convert<double>(
      json['monthPvTotalNeg']);
  if (monthPvTotalNeg != null) {
    homeData2Entity.monthPvTotalNeg = monthPvTotalNeg;
  }
  final double? lastDayPvTotalNeg = jsonConvert.convert<double>(
      json['lastDayPvTotalNeg']);
  if (lastDayPvTotalNeg != null) {
    homeData2Entity.lastDayPvTotalNeg = lastDayPvTotalNeg;
  }
  final double? yearPvTotalNeg = jsonConvert.convert<double>(
      json['yearPvTotalNeg']);
  if (yearPvTotalNeg != null) {
    homeData2Entity.yearPvTotalNeg = yearPvTotalNeg;
  }
  final int? deviceNum = jsonConvert.convert<int>(json['deviceNum']);
  if (deviceNum != null) {
    homeData2Entity.deviceNum = deviceNum;
  }
  final int? capacity = jsonConvert.convert<int>(json['capacity']);
  if (capacity != null) {
    homeData2Entity.capacity = capacity;
  }
  final int? power = jsonConvert.convert<int>(json['power']);
  if (power != null) {
    homeData2Entity.power = power;
  }
  final int? pvPower = jsonConvert.convert<int>(json['pvPower']);
  if (pvPower != null) {
    homeData2Entity.pvPower = pvPower;
  }
  final int? pvCapacity = jsonConvert.convert<int>(json['pvCapacity']);
  if (pvCapacity != null) {
    homeData2Entity.pvCapacity = pvCapacity;
  }
  final int? operationTime = jsonConvert.convert<int>(json['operationTime']);
  if (operationTime != null) {
    homeData2Entity.operationTime = operationTime;
  }
  final int? status = jsonConvert.convert<int>(json['status']);
  if (status != null) {
    homeData2Entity.status = status;
  }
  final List<
      HomeData2DailyStatisticVOList>? dailyStatisticVOList = (json['dailyStatisticVOList'] as List<
      dynamic>?)?.map(
          (e) =>
      jsonConvert.convert<HomeData2DailyStatisticVOList>(
          e) as HomeData2DailyStatisticVOList).toList();
  if (dailyStatisticVOList != null) {
    homeData2Entity.dailyStatisticVOList = dailyStatisticVOList;
  }
  final int? siteNum = jsonConvert.convert<int>(json['siteNum']);
  if (siteNum != null) {
    homeData2Entity.siteNum = siteNum;
  }
  final int? normalNum = jsonConvert.convert<int>(json['normalNum']);
  if (normalNum != null) {
    homeData2Entity.normalNum = normalNum;
  }
  final int? faultNum = jsonConvert.convert<int>(json['faultNum']);
  if (faultNum != null) {
    homeData2Entity.faultNum = faultNum;
  }
  final int? alarmNum = jsonConvert.convert<int>(json['alarmNum']);
  if (alarmNum != null) {
    homeData2Entity.alarmNum = alarmNum;
  }
  final int? cutOffNum = jsonConvert.convert<int>(json['cutOffNum']);
  if (cutOffNum != null) {
    homeData2Entity.cutOffNum = cutOffNum;
  }
  final double? co2 = jsonConvert.convert<double>(json['co2']);
  if (co2 != null) {
    homeData2Entity.co2 = co2;
  }
  final double? coal = jsonConvert.convert<double>(json['coal']);
  if (coal != null) {
    homeData2Entity.coal = coal;
  }
  return homeData2Entity;
}

Map<String, dynamic> $HomeData2EntityToJson(HomeData2Entity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['groupId'] = entity.groupId;
  data['groupName'] = entity.groupName;
  data['totalIncome'] = entity.totalIncome;
  data['totalPos'] = entity.totalPos;
  data['totalNeg'] = entity.totalNeg;
  data['todayIncome'] = entity.todayIncome;
  data['todayTotalPos'] = entity.todayTotalPos;
  data['todayTotalNeg'] = entity.todayTotalNeg;
  data['lastDayIncome'] = entity.lastDayIncome;
  data['lastDayTotalPos'] = entity.lastDayTotalPos;
  data['lastDayTotalNeg'] = entity.lastDayTotalNeg;
  data['currentMonthIncome'] = entity.currentMonthIncome;
  data['currentMonthTotalPos'] = entity.currentMonthTotalPos;
  data['currentMonthTotalNeg'] = entity.currentMonthTotalNeg;
  data['currentYearIncome'] = entity.currentYearIncome;
  data['currentYearTotalPos'] = entity.currentYearTotalPos;
  data['currentYearTotalNeg'] = entity.currentYearTotalNeg;
  data['todayPvTotalNeg'] = entity.todayPvTotalNeg;
  data['totalPvTotalNeg'] = entity.totalPvTotalNeg;
  data['monthPvTotalNeg'] = entity.monthPvTotalNeg;
  data['lastDayPvTotalNeg'] = entity.lastDayPvTotalNeg;
  data['yearPvTotalNeg'] = entity.yearPvTotalNeg;
  data['deviceNum'] = entity.deviceNum;
  data['capacity'] = entity.capacity;
  data['power'] = entity.power;
  data['pvPower'] = entity.pvPower;
  data['pvCapacity'] = entity.pvCapacity;
  data['operationTime'] = entity.operationTime;
  data['status'] = entity.status;
  data['dailyStatisticVOList'] =
      entity.dailyStatisticVOList?.map((v) => v.toJson()).toList();
  data['siteNum'] = entity.siteNum;
  data['normalNum'] = entity.normalNum;
  data['faultNum'] = entity.faultNum;
  data['alarmNum'] = entity.alarmNum;
  data['cutOffNum'] = entity.cutOffNum;
  data['co2'] = entity.co2;
  data['coal'] = entity.coal;
  return data;
}

extension HomeData2EntityExtension on HomeData2Entity {
  HomeData2Entity copyWith({
    int? groupId,
    String? groupName,
    double? totalIncome,
    double? totalPos,
    double? totalNeg,
    double? todayIncome,
    double? todayTotalPos,
    double? todayTotalNeg,
    double? lastDayIncome,
    double? lastDayTotalPos,
    double? lastDayTotalNeg,
    double? currentMonthIncome,
    double? currentMonthTotalPos,
    double? currentMonthTotalNeg,
    double? currentYearIncome,
    double? currentYearTotalPos,
    double? currentYearTotalNeg,
    double? todayPvTotalNeg,
    double? totalPvTotalNeg,
    double? monthPvTotalNeg,
    double? lastDayPvTotalNeg,
    double? yearPvTotalNeg,
    int? deviceNum,
    int? capacity,
    int? power,
    int? pvPower,
    int? pvCapacity,
    int? operationTime,
    int? status,
    List<HomeData2DailyStatisticVOList>? dailyStatisticVOList,
    int? siteNum,
    int? normalNum,
    int? faultNum,
    int? alarmNum,
    int? cutOffNum,
    double? co2,
    double? coal,
  }) {
    return HomeData2Entity()
      ..groupId = groupId ?? this.groupId
      ..groupName = groupName ?? this.groupName
      ..totalIncome = totalIncome ?? this.totalIncome
      ..totalPos = totalPos ?? this.totalPos
      ..totalNeg = totalNeg ?? this.totalNeg
      ..todayIncome = todayIncome ?? this.todayIncome
      ..todayTotalPos = todayTotalPos ?? this.todayTotalPos
      ..todayTotalNeg = todayTotalNeg ?? this.todayTotalNeg
      ..lastDayIncome = lastDayIncome ?? this.lastDayIncome
      ..lastDayTotalPos = lastDayTotalPos ?? this.lastDayTotalPos
      ..lastDayTotalNeg = lastDayTotalNeg ?? this.lastDayTotalNeg
      ..currentMonthIncome = currentMonthIncome ?? this.currentMonthIncome
      ..currentMonthTotalPos = currentMonthTotalPos ?? this.currentMonthTotalPos
      ..currentMonthTotalNeg = currentMonthTotalNeg ?? this.currentMonthTotalNeg
      ..currentYearIncome = currentYearIncome ?? this.currentYearIncome
      ..currentYearTotalPos = currentYearTotalPos ?? this.currentYearTotalPos
      ..currentYearTotalNeg = currentYearTotalNeg ?? this.currentYearTotalNeg
      ..todayPvTotalNeg = todayPvTotalNeg ?? this.todayPvTotalNeg
      ..totalPvTotalNeg = totalPvTotalNeg ?? this.totalPvTotalNeg
      ..monthPvTotalNeg = monthPvTotalNeg ?? this.monthPvTotalNeg
      ..lastDayPvTotalNeg = lastDayPvTotalNeg ?? this.lastDayPvTotalNeg
      ..yearPvTotalNeg = yearPvTotalNeg ?? this.yearPvTotalNeg
      ..deviceNum = deviceNum ?? this.deviceNum
      ..capacity = capacity ?? this.capacity
      ..power = power ?? this.power
      ..pvPower = pvPower ?? this.pvPower
      ..pvCapacity = pvCapacity ?? this.pvCapacity
      ..operationTime = operationTime ?? this.operationTime
      ..status = status ?? this.status
      ..dailyStatisticVOList = dailyStatisticVOList ?? this.dailyStatisticVOList
      ..siteNum = siteNum ?? this.siteNum
      ..normalNum = normalNum ?? this.normalNum
      ..faultNum = faultNum ?? this.faultNum
      ..alarmNum = alarmNum ?? this.alarmNum
      ..cutOffNum = cutOffNum ?? this.cutOffNum
      ..co2 = co2 ?? this.co2
      ..coal = coal ?? this.coal;
  }
}

HomeData2DailyStatisticVOList $HomeData2DailyStatisticVOListFromJson(
    Map<String, dynamic> json) {
  final HomeData2DailyStatisticVOList homeData2DailyStatisticVOList = HomeData2DailyStatisticVOList();
  final int? siteId = jsonConvert.convert<int>(json['siteId']);
  if (siteId != null) {
    homeData2DailyStatisticVOList.siteId = siteId;
  }
  final String? siteName = jsonConvert.convert<String>(json['siteName']);
  if (siteName != null) {
    homeData2DailyStatisticVOList.siteName = siteName;
  }
  final double? totalIncome = jsonConvert.convert<double>(json['totalIncome']);
  if (totalIncome != null) {
    homeData2DailyStatisticVOList.totalIncome = totalIncome;
  }
  final double? totalPos = jsonConvert.convert<double>(json['totalPos']);
  if (totalPos != null) {
    homeData2DailyStatisticVOList.totalPos = totalPos;
  }
  final double? totalNeg = jsonConvert.convert<double>(json['totalNeg']);
  if (totalNeg != null) {
    homeData2DailyStatisticVOList.totalNeg = totalNeg;
  }
  final double? todayIncome = jsonConvert.convert<double>(json['todayIncome']);
  if (todayIncome != null) {
    homeData2DailyStatisticVOList.todayIncome = todayIncome;
  }
  final double? todayTotalPos = jsonConvert.convert<double>(
      json['todayTotalPos']);
  if (todayTotalPos != null) {
    homeData2DailyStatisticVOList.todayTotalPos = todayTotalPos;
  }
  final double? todayTotalNeg = jsonConvert.convert<double>(
      json['todayTotalNeg']);
  if (todayTotalNeg != null) {
    homeData2DailyStatisticVOList.todayTotalNeg = todayTotalNeg;
  }
  final double? lastDayIncome = jsonConvert.convert<double>(
      json['lastDayIncome']);
  if (lastDayIncome != null) {
    homeData2DailyStatisticVOList.lastDayIncome = lastDayIncome;
  }
  final double? lastDayTotalPos = jsonConvert.convert<double>(
      json['lastDayTotalPos']);
  if (lastDayTotalPos != null) {
    homeData2DailyStatisticVOList.lastDayTotalPos = lastDayTotalPos;
  }
  final double? lastDayTotalNeg = jsonConvert.convert<double>(
      json['lastDayTotalNeg']);
  if (lastDayTotalNeg != null) {
    homeData2DailyStatisticVOList.lastDayTotalNeg = lastDayTotalNeg;
  }
  final double? currentMonthIncome = jsonConvert.convert<double>(
      json['currentMonthIncome']);
  if (currentMonthIncome != null) {
    homeData2DailyStatisticVOList.currentMonthIncome = currentMonthIncome;
  }
  final double? currentMonthTotalPos = jsonConvert.convert<double>(
      json['currentMonthTotalPos']);
  if (currentMonthTotalPos != null) {
    homeData2DailyStatisticVOList.currentMonthTotalPos = currentMonthTotalPos;
  }
  final double? currentMonthTotalNeg = jsonConvert.convert<double>(
      json['currentMonthTotalNeg']);
  if (currentMonthTotalNeg != null) {
    homeData2DailyStatisticVOList.currentMonthTotalNeg = currentMonthTotalNeg;
  }
  final double? currentYearIncome = jsonConvert.convert<double>(
      json['currentYearIncome']);
  if (currentYearIncome != null) {
    homeData2DailyStatisticVOList.currentYearIncome = currentYearIncome;
  }
  final double? currentYearTotalPos = jsonConvert.convert<double>(
      json['currentYearTotalPos']);
  if (currentYearTotalPos != null) {
    homeData2DailyStatisticVOList.currentYearTotalPos = currentYearTotalPos;
  }
  final double? currentYearTotalNeg = jsonConvert.convert<double>(
      json['currentYearTotalNeg']);
  if (currentYearTotalNeg != null) {
    homeData2DailyStatisticVOList.currentYearTotalNeg = currentYearTotalNeg;
  }
  final int? deviceNum = jsonConvert.convert<int>(json['deviceNum']);
  if (deviceNum != null) {
    homeData2DailyStatisticVOList.deviceNum = deviceNum;
  }
  final int? capacity = jsonConvert.convert<int>(json['capacity']);
  if (capacity != null) {
    homeData2DailyStatisticVOList.capacity = capacity;
  }
  final int? power = jsonConvert.convert<int>(json['power']);
  if (power != null) {
    homeData2DailyStatisticVOList.power = power;
  }
  final int? operationTime = jsonConvert.convert<int>(json['operationTime']);
  if (operationTime != null) {
    homeData2DailyStatisticVOList.operationTime = operationTime;
  }
  final int? status = jsonConvert.convert<int>(json['status']);
  if (status != null) {
    homeData2DailyStatisticVOList.status = status;
  }
  final List<
      HomeData2DailyStatisticVOListDeviceList>? deviceList = (json['deviceList'] as List<
      dynamic>?)?.map(
          (e) =>
      jsonConvert.convert<HomeData2DailyStatisticVOListDeviceList>(
          e) as HomeData2DailyStatisticVOListDeviceList).toList();
  if (deviceList != null) {
    homeData2DailyStatisticVOList.deviceList = deviceList;
  }
  return homeData2DailyStatisticVOList;
}

Map<String, dynamic> $HomeData2DailyStatisticVOListToJson(
    HomeData2DailyStatisticVOList entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['siteId'] = entity.siteId;
  data['siteName'] = entity.siteName;
  data['totalIncome'] = entity.totalIncome;
  data['totalPos'] = entity.totalPos;
  data['totalNeg'] = entity.totalNeg;
  data['todayIncome'] = entity.todayIncome;
  data['todayTotalPos'] = entity.todayTotalPos;
  data['todayTotalNeg'] = entity.todayTotalNeg;
  data['lastDayIncome'] = entity.lastDayIncome;
  data['lastDayTotalPos'] = entity.lastDayTotalPos;
  data['lastDayTotalNeg'] = entity.lastDayTotalNeg;
  data['currentMonthIncome'] = entity.currentMonthIncome;
  data['currentMonthTotalPos'] = entity.currentMonthTotalPos;
  data['currentMonthTotalNeg'] = entity.currentMonthTotalNeg;
  data['currentYearIncome'] = entity.currentYearIncome;
  data['currentYearTotalPos'] = entity.currentYearTotalPos;
  data['currentYearTotalNeg'] = entity.currentYearTotalNeg;
  data['deviceNum'] = entity.deviceNum;
  data['capacity'] = entity.capacity;
  data['power'] = entity.power;
  data['operationTime'] = entity.operationTime;
  data['status'] = entity.status;
  data['deviceList'] = entity.deviceList?.map((v) => v.toJson()).toList();
  return data;
}

extension HomeData2DailyStatisticVOListExtension on HomeData2DailyStatisticVOList {
  HomeData2DailyStatisticVOList copyWith({
    int? siteId,
    String? siteName,
    double? totalIncome,
    double? totalPos,
    double? totalNeg,
    double? todayIncome,
    double? todayTotalPos,
    double? todayTotalNeg,
    double? lastDayIncome,
    double? lastDayTotalPos,
    double? lastDayTotalNeg,
    double? currentMonthIncome,
    double? currentMonthTotalPos,
    double? currentMonthTotalNeg,
    double? currentYearIncome,
    double? currentYearTotalPos,
    double? currentYearTotalNeg,
    int? deviceNum,
    int? capacity,
    int? power,
    int? operationTime,
    int? status,
    List<HomeData2DailyStatisticVOListDeviceList>? deviceList,
  }) {
    return HomeData2DailyStatisticVOList()
      ..siteId = siteId ?? this.siteId
      ..siteName = siteName ?? this.siteName
      ..totalIncome = totalIncome ?? this.totalIncome
      ..totalPos = totalPos ?? this.totalPos
      ..totalNeg = totalNeg ?? this.totalNeg
      ..todayIncome = todayIncome ?? this.todayIncome
      ..todayTotalPos = todayTotalPos ?? this.todayTotalPos
      ..todayTotalNeg = todayTotalNeg ?? this.todayTotalNeg
      ..lastDayIncome = lastDayIncome ?? this.lastDayIncome
      ..lastDayTotalPos = lastDayTotalPos ?? this.lastDayTotalPos
      ..lastDayTotalNeg = lastDayTotalNeg ?? this.lastDayTotalNeg
      ..currentMonthIncome = currentMonthIncome ?? this.currentMonthIncome
      ..currentMonthTotalPos = currentMonthTotalPos ?? this.currentMonthTotalPos
      ..currentMonthTotalNeg = currentMonthTotalNeg ?? this.currentMonthTotalNeg
      ..currentYearIncome = currentYearIncome ?? this.currentYearIncome
      ..currentYearTotalPos = currentYearTotalPos ?? this.currentYearTotalPos
      ..currentYearTotalNeg = currentYearTotalNeg ?? this.currentYearTotalNeg
      ..deviceNum = deviceNum ?? this.deviceNum
      ..capacity = capacity ?? this.capacity
      ..power = power ?? this.power
      ..operationTime = operationTime ?? this.operationTime
      ..status = status ?? this.status
      ..deviceList = deviceList ?? this.deviceList;
  }
}

HomeData2DailyStatisticVOListDeviceList $HomeData2DailyStatisticVOListDeviceListFromJson(
    Map<String, dynamic> json) {
  final HomeData2DailyStatisticVOListDeviceList homeData2DailyStatisticVOListDeviceList = HomeData2DailyStatisticVOListDeviceList();
  final int? devNo = jsonConvert.convert<int>(json['devNo']);
  if (devNo != null) {
    homeData2DailyStatisticVOListDeviceList.devNo = devNo;
  }
  final double? totalIncome = jsonConvert.convert<double>(json['totalIncome']);
  if (totalIncome != null) {
    homeData2DailyStatisticVOListDeviceList.totalIncome = totalIncome;
  }
  final double? totalPos = jsonConvert.convert<double>(json['totalPos']);
  if (totalPos != null) {
    homeData2DailyStatisticVOListDeviceList.totalPos = totalPos;
  }
  final double? totalNeg = jsonConvert.convert<double>(json['totalNeg']);
  if (totalNeg != null) {
    homeData2DailyStatisticVOListDeviceList.totalNeg = totalNeg;
  }
  final double? todayIncome = jsonConvert.convert<double>(json['todayIncome']);
  if (todayIncome != null) {
    homeData2DailyStatisticVOListDeviceList.todayIncome = todayIncome;
  }
  final double? todayTotalPos = jsonConvert.convert<double>(
      json['todayTotalPos']);
  if (todayTotalPos != null) {
    homeData2DailyStatisticVOListDeviceList.todayTotalPos = todayTotalPos;
  }
  final double? todayTotalNeg = jsonConvert.convert<double>(
      json['todayTotalNeg']);
  if (todayTotalNeg != null) {
    homeData2DailyStatisticVOListDeviceList.todayTotalNeg = todayTotalNeg;
  }
  final double? lastDayIncome = jsonConvert.convert<double>(
      json['lastDayIncome']);
  if (lastDayIncome != null) {
    homeData2DailyStatisticVOListDeviceList.lastDayIncome = lastDayIncome;
  }
  final double? lastDayTotalPos = jsonConvert.convert<double>(
      json['lastDayTotalPos']);
  if (lastDayTotalPos != null) {
    homeData2DailyStatisticVOListDeviceList.lastDayTotalPos = lastDayTotalPos;
  }
  final double? lastDayTotalNeg = jsonConvert.convert<double>(
      json['lastDayTotalNeg']);
  if (lastDayTotalNeg != null) {
    homeData2DailyStatisticVOListDeviceList.lastDayTotalNeg = lastDayTotalNeg;
  }
  final double? currentMonthIncome = jsonConvert.convert<double>(
      json['currentMonthIncome']);
  if (currentMonthIncome != null) {
    homeData2DailyStatisticVOListDeviceList.currentMonthIncome =
        currentMonthIncome;
  }
  final double? currentMonthTotalPos = jsonConvert.convert<double>(
      json['currentMonthTotalPos']);
  if (currentMonthTotalPos != null) {
    homeData2DailyStatisticVOListDeviceList.currentMonthTotalPos =
        currentMonthTotalPos;
  }
  final double? currentMonthTotalNeg = jsonConvert.convert<double>(
      json['currentMonthTotalNeg']);
  if (currentMonthTotalNeg != null) {
    homeData2DailyStatisticVOListDeviceList.currentMonthTotalNeg =
        currentMonthTotalNeg;
  }
  final double? currentYearIncome = jsonConvert.convert<double>(
      json['currentYearIncome']);
  if (currentYearIncome != null) {
    homeData2DailyStatisticVOListDeviceList.currentYearIncome =
        currentYearIncome;
  }
  final double? currentYearTotalPos = jsonConvert.convert<double>(
      json['currentYearTotalPos']);
  if (currentYearTotalPos != null) {
    homeData2DailyStatisticVOListDeviceList.currentYearTotalPos =
        currentYearTotalPos;
  }
  final double? currentYearTotalNeg = jsonConvert.convert<double>(
      json['currentYearTotalNeg']);
  if (currentYearTotalNeg != null) {
    homeData2DailyStatisticVOListDeviceList.currentYearTotalNeg =
        currentYearTotalNeg;
  }
  return homeData2DailyStatisticVOListDeviceList;
}

Map<String, dynamic> $HomeData2DailyStatisticVOListDeviceListToJson(
    HomeData2DailyStatisticVOListDeviceList entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['devNo'] = entity.devNo;
  data['totalIncome'] = entity.totalIncome;
  data['totalPos'] = entity.totalPos;
  data['totalNeg'] = entity.totalNeg;
  data['todayIncome'] = entity.todayIncome;
  data['todayTotalPos'] = entity.todayTotalPos;
  data['todayTotalNeg'] = entity.todayTotalNeg;
  data['lastDayIncome'] = entity.lastDayIncome;
  data['lastDayTotalPos'] = entity.lastDayTotalPos;
  data['lastDayTotalNeg'] = entity.lastDayTotalNeg;
  data['currentMonthIncome'] = entity.currentMonthIncome;
  data['currentMonthTotalPos'] = entity.currentMonthTotalPos;
  data['currentMonthTotalNeg'] = entity.currentMonthTotalNeg;
  data['currentYearIncome'] = entity.currentYearIncome;
  data['currentYearTotalPos'] = entity.currentYearTotalPos;
  data['currentYearTotalNeg'] = entity.currentYearTotalNeg;
  return data;
}

extension HomeData2DailyStatisticVOListDeviceListExtension on HomeData2DailyStatisticVOListDeviceList {
  HomeData2DailyStatisticVOListDeviceList copyWith({
    int? devNo,
    double? totalIncome,
    double? totalPos,
    double? totalNeg,
    double? todayIncome,
    double? todayTotalPos,
    double? todayTotalNeg,
    double? lastDayIncome,
    double? lastDayTotalPos,
    double? lastDayTotalNeg,
    double? currentMonthIncome,
    double? currentMonthTotalPos,
    double? currentMonthTotalNeg,
    double? currentYearIncome,
    double? currentYearTotalPos,
    double? currentYearTotalNeg,
  }) {
    return HomeData2DailyStatisticVOListDeviceList()
      ..devNo = devNo ?? this.devNo
      ..totalIncome = totalIncome ?? this.totalIncome
      ..totalPos = totalPos ?? this.totalPos
      ..totalNeg = totalNeg ?? this.totalNeg
      ..todayIncome = todayIncome ?? this.todayIncome
      ..todayTotalPos = todayTotalPos ?? this.todayTotalPos
      ..todayTotalNeg = todayTotalNeg ?? this.todayTotalNeg
      ..lastDayIncome = lastDayIncome ?? this.lastDayIncome
      ..lastDayTotalPos = lastDayTotalPos ?? this.lastDayTotalPos
      ..lastDayTotalNeg = lastDayTotalNeg ?? this.lastDayTotalNeg
      ..currentMonthIncome = currentMonthIncome ?? this.currentMonthIncome
      ..currentMonthTotalPos = currentMonthTotalPos ?? this.currentMonthTotalPos
      ..currentMonthTotalNeg = currentMonthTotalNeg ?? this.currentMonthTotalNeg
      ..currentYearIncome = currentYearIncome ?? this.currentYearIncome
      ..currentYearTotalPos = currentYearTotalPos ?? this.currentYearTotalPos
      ..currentYearTotalNeg = currentYearTotalNeg ?? this.currentYearTotalNeg;
  }
}