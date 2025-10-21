import 'package:cescpro/generated/json/base/json_convert_content.dart';
import 'package:cescpro/http/bean/statistic_record_entity.dart';

StatisticRecordEntity $StatisticRecordEntityFromJson(
  Map<String, dynamic> json,
) {
  final StatisticRecordEntity statisticRecordEntity = StatisticRecordEntity();
  final int? groupId = jsonConvert.convert<int>(json['groupId']);
  if (groupId != null) {
    statisticRecordEntity.groupId = groupId;
  }
  final String? groupName = jsonConvert.convert<String>(json['groupName']);
  if (groupName != null) {
    statisticRecordEntity.groupName = groupName;
  }
  final double? totalIncome = jsonConvert.convert<double>(json['totalIncome']);
  if (totalIncome != null) {
    statisticRecordEntity.totalIncome = totalIncome;
  }
  final double? totalPos = jsonConvert.convert<double>(json['totalPos']);
  if (totalPos != null) {
    statisticRecordEntity.totalPos = totalPos;
  }
  final double? totalNeg = jsonConvert.convert<double>(json['totalNeg']);
  if (totalNeg != null) {
    statisticRecordEntity.totalNeg = totalNeg;
  }
  final double? todayIncome = jsonConvert.convert<double>(json['todayIncome']);
  if (todayIncome != null) {
    statisticRecordEntity.todayIncome = todayIncome;
  }
  final double? todayTotalPos = jsonConvert.convert<double>(
    json['todayTotalPos'],
  );
  if (todayTotalPos != null) {
    statisticRecordEntity.todayTotalPos = todayTotalPos;
  }
  final double? todayTotalNeg = jsonConvert.convert<double>(
    json['todayTotalNeg'],
  );
  if (todayTotalNeg != null) {
    statisticRecordEntity.todayTotalNeg = todayTotalNeg;
  }
  final double? lastDayIncome = jsonConvert.convert<double>(
    json['lastDayIncome'],
  );
  if (lastDayIncome != null) {
    statisticRecordEntity.lastDayIncome = lastDayIncome;
  }
  final double? lastDayTotalPos = jsonConvert.convert<double>(
    json['lastDayTotalPos'],
  );
  if (lastDayTotalPos != null) {
    statisticRecordEntity.lastDayTotalPos = lastDayTotalPos;
  }
  final double? lastDayTotalNeg = jsonConvert.convert<double>(
    json['lastDayTotalNeg'],
  );
  if (lastDayTotalNeg != null) {
    statisticRecordEntity.lastDayTotalNeg = lastDayTotalNeg;
  }
  final double? currentMonthIncome = jsonConvert.convert<double>(
    json['currentMonthIncome'],
  );
  if (currentMonthIncome != null) {
    statisticRecordEntity.currentMonthIncome = currentMonthIncome;
  }
  final double? currentMonthTotalPos = jsonConvert.convert<double>(
    json['currentMonthTotalPos'],
  );
  if (currentMonthTotalPos != null) {
    statisticRecordEntity.currentMonthTotalPos = currentMonthTotalPos;
  }
  final double? currentMonthTotalNeg = jsonConvert.convert<double>(
    json['currentMonthTotalNeg'],
  );
  if (currentMonthTotalNeg != null) {
    statisticRecordEntity.currentMonthTotalNeg = currentMonthTotalNeg;
  }
  final double? currentYearIncome = jsonConvert.convert<double>(
    json['currentYearIncome'],
  );
  if (currentYearIncome != null) {
    statisticRecordEntity.currentYearIncome = currentYearIncome;
  }
  final double? currentYearTotalPos = jsonConvert.convert<double>(
    json['currentYearTotalPos'],
  );
  if (currentYearTotalPos != null) {
    statisticRecordEntity.currentYearTotalPos = currentYearTotalPos;
  }
  final double? currentYearTotalNeg = jsonConvert.convert<double>(
    json['currentYearTotalNeg'],
  );
  if (currentYearTotalNeg != null) {
    statisticRecordEntity.currentYearTotalNeg = currentYearTotalNeg;
  }
  final double? todayPvTotalNeg = jsonConvert.convert<double>(
    json['todayPvTotalNeg'],
  );
  if (todayPvTotalNeg != null) {
    statisticRecordEntity.todayPvTotalNeg = todayPvTotalNeg;
  }
  final double? totalPvTotalNeg = jsonConvert.convert<double>(
    json['totalPvTotalNeg'],
  );
  if (totalPvTotalNeg != null) {
    statisticRecordEntity.totalPvTotalNeg = totalPvTotalNeg;
  }
  final double? monthPvTotalNeg = jsonConvert.convert<double>(
    json['monthPvTotalNeg'],
  );
  if (monthPvTotalNeg != null) {
    statisticRecordEntity.monthPvTotalNeg = monthPvTotalNeg;
  }
  final double? lastDayPvTotalNeg = jsonConvert.convert<double>(
    json['lastDayPvTotalNeg'],
  );
  if (lastDayPvTotalNeg != null) {
    statisticRecordEntity.lastDayPvTotalNeg = lastDayPvTotalNeg;
  }
  final double? yearPvTotalNeg = jsonConvert.convert<double>(
    json['yearPvTotalNeg'],
  );
  if (yearPvTotalNeg != null) {
    statisticRecordEntity.yearPvTotalNeg = yearPvTotalNeg;
  }
  final int? deviceNum = jsonConvert.convert<int>(json['deviceNum']);
  if (deviceNum != null) {
    statisticRecordEntity.deviceNum = deviceNum;
  }
  final int? capacity = jsonConvert.convert<int>(json['capacity']);
  if (capacity != null) {
    statisticRecordEntity.capacity = capacity;
  }
  final int? power = jsonConvert.convert<int>(json['power']);
  if (power != null) {
    statisticRecordEntity.power = power;
  }
  final int? operationTime = jsonConvert.convert<int>(json['operationTime']);
  if (operationTime != null) {
    statisticRecordEntity.operationTime = operationTime;
  }
  final int? status = jsonConvert.convert<int>(json['status']);
  if (status != null) {
    statisticRecordEntity.status = status;
  }
  final List<StatisticRecordDailyStatisticVOList>? dailyStatisticVOList =
      (json['dailyStatisticVOList'] as List<dynamic>?)
          ?.map(
            (e) =>
                jsonConvert.convert<StatisticRecordDailyStatisticVOList>(e)
                    as StatisticRecordDailyStatisticVOList,
          )
          .toList();
  if (dailyStatisticVOList != null) {
    statisticRecordEntity.dailyStatisticVOList = dailyStatisticVOList;
  }
  return statisticRecordEntity;
}

Map<String, dynamic> $StatisticRecordEntityToJson(
  StatisticRecordEntity entity,
) {
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
  data['operationTime'] = entity.operationTime;
  data['status'] = entity.status;
  data['dailyStatisticVOList'] = entity.dailyStatisticVOList
      ?.map((v) => v.toJson())
      .toList();
  return data;
}

extension StatisticRecordEntityExtension on StatisticRecordEntity {
  StatisticRecordEntity copyWith({
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
    int? operationTime,
    int? status,
    List<StatisticRecordDailyStatisticVOList>? dailyStatisticVOList,
  }) {
    return StatisticRecordEntity()
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
      ..operationTime = operationTime ?? this.operationTime
      ..status = status ?? this.status
      ..dailyStatisticVOList =
          dailyStatisticVOList ?? this.dailyStatisticVOList;
  }
}

StatisticRecordDailyStatisticVOList
$StatisticRecordDailyStatisticVOListFromJson(Map<String, dynamic> json) {
  final StatisticRecordDailyStatisticVOList
  statisticRecordDailyStatisticVOList = StatisticRecordDailyStatisticVOList();
  final int? siteId = jsonConvert.convert<int>(json['siteId']);
  if (siteId != null) {
    statisticRecordDailyStatisticVOList.siteId = siteId;
  }
  final String? siteName = jsonConvert.convert<String>(json['siteName']);
  if (siteName != null) {
    statisticRecordDailyStatisticVOList.siteName = siteName;
  }
  final double? totalIncome = jsonConvert.convert<double>(json['totalIncome']);
  if (totalIncome != null) {
    statisticRecordDailyStatisticVOList.totalIncome = totalIncome;
  }
  final double? totalPos = jsonConvert.convert<double>(json['totalPos']);
  if (totalPos != null) {
    statisticRecordDailyStatisticVOList.totalPos = totalPos;
  }
  final double? totalNeg = jsonConvert.convert<double>(json['totalNeg']);
  if (totalNeg != null) {
    statisticRecordDailyStatisticVOList.totalNeg = totalNeg;
  }
  final double? todayIncome = jsonConvert.convert<double>(json['todayIncome']);
  if (todayIncome != null) {
    statisticRecordDailyStatisticVOList.todayIncome = todayIncome;
  }
  final double? todayTotalPos = jsonConvert.convert<double>(
    json['todayTotalPos'],
  );
  if (todayTotalPos != null) {
    statisticRecordDailyStatisticVOList.todayTotalPos = todayTotalPos;
  }
  final double? todayTotalNeg = jsonConvert.convert<double>(
    json['todayTotalNeg'],
  );
  if (todayTotalNeg != null) {
    statisticRecordDailyStatisticVOList.todayTotalNeg = todayTotalNeg;
  }
  final double? lastDayIncome = jsonConvert.convert<double>(
    json['lastDayIncome'],
  );
  if (lastDayIncome != null) {
    statisticRecordDailyStatisticVOList.lastDayIncome = lastDayIncome;
  }
  final double? lastDayTotalPos = jsonConvert.convert<double>(
    json['lastDayTotalPos'],
  );
  if (lastDayTotalPos != null) {
    statisticRecordDailyStatisticVOList.lastDayTotalPos = lastDayTotalPos;
  }
  final double? lastDayTotalNeg = jsonConvert.convert<double>(
    json['lastDayTotalNeg'],
  );
  if (lastDayTotalNeg != null) {
    statisticRecordDailyStatisticVOList.lastDayTotalNeg = lastDayTotalNeg;
  }
  final double? currentMonthIncome = jsonConvert.convert<double>(
    json['currentMonthIncome'],
  );
  if (currentMonthIncome != null) {
    statisticRecordDailyStatisticVOList.currentMonthIncome = currentMonthIncome;
  }
  final double? currentMonthTotalPos = jsonConvert.convert<double>(
    json['currentMonthTotalPos'],
  );
  if (currentMonthTotalPos != null) {
    statisticRecordDailyStatisticVOList.currentMonthTotalPos =
        currentMonthTotalPos;
  }
  final double? currentMonthTotalNeg = jsonConvert.convert<double>(
    json['currentMonthTotalNeg'],
  );
  if (currentMonthTotalNeg != null) {
    statisticRecordDailyStatisticVOList.currentMonthTotalNeg =
        currentMonthTotalNeg;
  }
  final double? currentYearIncome = jsonConvert.convert<double>(
    json['currentYearIncome'],
  );
  if (currentYearIncome != null) {
    statisticRecordDailyStatisticVOList.currentYearIncome = currentYearIncome;
  }
  final double? currentYearTotalPos = jsonConvert.convert<double>(
    json['currentYearTotalPos'],
  );
  if (currentYearTotalPos != null) {
    statisticRecordDailyStatisticVOList.currentYearTotalPos =
        currentYearTotalPos;
  }
  final double? currentYearTotalNeg = jsonConvert.convert<double>(
    json['currentYearTotalNeg'],
  );
  if (currentYearTotalNeg != null) {
    statisticRecordDailyStatisticVOList.currentYearTotalNeg =
        currentYearTotalNeg;
  }
  final int? deviceNum = jsonConvert.convert<int>(json['deviceNum']);
  if (deviceNum != null) {
    statisticRecordDailyStatisticVOList.deviceNum = deviceNum;
  }
  final int? capacity = jsonConvert.convert<int>(json['capacity']);
  if (capacity != null) {
    statisticRecordDailyStatisticVOList.capacity = capacity;
  }
  final int? power = jsonConvert.convert<int>(json['power']);
  if (power != null) {
    statisticRecordDailyStatisticVOList.power = power;
  }
  final int? operationTime = jsonConvert.convert<int>(json['operationTime']);
  if (operationTime != null) {
    statisticRecordDailyStatisticVOList.operationTime = operationTime;
  }
  final int? status = jsonConvert.convert<int>(json['status']);
  if (status != null) {
    statisticRecordDailyStatisticVOList.status = status;
  }
  final List<StatisticRecordDailyStatisticVOListDeviceList>? deviceList =
      (json['deviceList'] as List<dynamic>?)
          ?.map(
            (e) =>
                jsonConvert
                        .convert<StatisticRecordDailyStatisticVOListDeviceList>(
                          e,
                        )
                    as StatisticRecordDailyStatisticVOListDeviceList,
          )
          .toList();
  if (deviceList != null) {
    statisticRecordDailyStatisticVOList.deviceList = deviceList;
  }
  return statisticRecordDailyStatisticVOList;
}

Map<String, dynamic> $StatisticRecordDailyStatisticVOListToJson(
  StatisticRecordDailyStatisticVOList entity,
) {
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

extension StatisticRecordDailyStatisticVOListExtension
    on StatisticRecordDailyStatisticVOList {
  StatisticRecordDailyStatisticVOList copyWith({
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
    List<StatisticRecordDailyStatisticVOListDeviceList>? deviceList,
  }) {
    return StatisticRecordDailyStatisticVOList()
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

StatisticRecordDailyStatisticVOListDeviceList
$StatisticRecordDailyStatisticVOListDeviceListFromJson(
  Map<String, dynamic> json,
) {
  final StatisticRecordDailyStatisticVOListDeviceList
  statisticRecordDailyStatisticVOListDeviceList =
      StatisticRecordDailyStatisticVOListDeviceList();
  final int? devNo = jsonConvert.convert<int>(json['devNo']);
  if (devNo != null) {
    statisticRecordDailyStatisticVOListDeviceList.devNo = devNo;
  }
  final double? totalIncome = jsonConvert.convert<double>(json['totalIncome']);
  if (totalIncome != null) {
    statisticRecordDailyStatisticVOListDeviceList.totalIncome = totalIncome;
  }
  final double? totalPos = jsonConvert.convert<double>(json['totalPos']);
  if (totalPos != null) {
    statisticRecordDailyStatisticVOListDeviceList.totalPos = totalPos;
  }
  final double? totalNeg = jsonConvert.convert<double>(json['totalNeg']);
  if (totalNeg != null) {
    statisticRecordDailyStatisticVOListDeviceList.totalNeg = totalNeg;
  }
  final double? todayIncome = jsonConvert.convert<double>(json['todayIncome']);
  if (todayIncome != null) {
    statisticRecordDailyStatisticVOListDeviceList.todayIncome = todayIncome;
  }
  final double? todayTotalPos = jsonConvert.convert<double>(
    json['todayTotalPos'],
  );
  if (todayTotalPos != null) {
    statisticRecordDailyStatisticVOListDeviceList.todayTotalPos = todayTotalPos;
  }
  final double? todayTotalNeg = jsonConvert.convert<double>(
    json['todayTotalNeg'],
  );
  if (todayTotalNeg != null) {
    statisticRecordDailyStatisticVOListDeviceList.todayTotalNeg = todayTotalNeg;
  }
  final double? lastDayIncome = jsonConvert.convert<double>(
    json['lastDayIncome'],
  );
  if (lastDayIncome != null) {
    statisticRecordDailyStatisticVOListDeviceList.lastDayIncome = lastDayIncome;
  }
  final double? lastDayTotalPos = jsonConvert.convert<double>(
    json['lastDayTotalPos'],
  );
  if (lastDayTotalPos != null) {
    statisticRecordDailyStatisticVOListDeviceList.lastDayTotalPos =
        lastDayTotalPos;
  }
  final double? lastDayTotalNeg = jsonConvert.convert<double>(
    json['lastDayTotalNeg'],
  );
  if (lastDayTotalNeg != null) {
    statisticRecordDailyStatisticVOListDeviceList.lastDayTotalNeg =
        lastDayTotalNeg;
  }
  final double? currentMonthIncome = jsonConvert.convert<double>(
    json['currentMonthIncome'],
  );
  if (currentMonthIncome != null) {
    statisticRecordDailyStatisticVOListDeviceList.currentMonthIncome =
        currentMonthIncome;
  }
  final double? currentMonthTotalPos = jsonConvert.convert<double>(
    json['currentMonthTotalPos'],
  );
  if (currentMonthTotalPos != null) {
    statisticRecordDailyStatisticVOListDeviceList.currentMonthTotalPos =
        currentMonthTotalPos;
  }
  final double? currentMonthTotalNeg = jsonConvert.convert<double>(
    json['currentMonthTotalNeg'],
  );
  if (currentMonthTotalNeg != null) {
    statisticRecordDailyStatisticVOListDeviceList.currentMonthTotalNeg =
        currentMonthTotalNeg;
  }
  final double? currentYearIncome = jsonConvert.convert<double>(
    json['currentYearIncome'],
  );
  if (currentYearIncome != null) {
    statisticRecordDailyStatisticVOListDeviceList.currentYearIncome =
        currentYearIncome;
  }
  final double? currentYearTotalPos = jsonConvert.convert<double>(
    json['currentYearTotalPos'],
  );
  if (currentYearTotalPos != null) {
    statisticRecordDailyStatisticVOListDeviceList.currentYearTotalPos =
        currentYearTotalPos;
  }
  final double? currentYearTotalNeg = jsonConvert.convert<double>(
    json['currentYearTotalNeg'],
  );
  if (currentYearTotalNeg != null) {
    statisticRecordDailyStatisticVOListDeviceList.currentYearTotalNeg =
        currentYearTotalNeg;
  }
  return statisticRecordDailyStatisticVOListDeviceList;
}

Map<String, dynamic> $StatisticRecordDailyStatisticVOListDeviceListToJson(
  StatisticRecordDailyStatisticVOListDeviceList entity,
) {
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

extension StatisticRecordDailyStatisticVOListDeviceListExtension
    on StatisticRecordDailyStatisticVOListDeviceList {
  StatisticRecordDailyStatisticVOListDeviceList copyWith({
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
    return StatisticRecordDailyStatisticVOListDeviceList()
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
