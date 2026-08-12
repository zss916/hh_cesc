/*
import 'package:cescpro/core/setting/app_setting.dart';
import 'package:cescpro/database/app_database.dart';
import 'package:cescpro/database/entity/home.dart';
import 'package:cescpro/http/api/home.dart';
import 'package:cescpro/http/api/mock/mock.dart';
import 'package:cescpro/http/bean/home_data2_entity.dart';
import 'package:cescpro/http/bean/home_statistic_entity.dart';
import 'package:flutter/material.dart';

class HomeRepository {
  ///请求
  static Stream<Home?> fetch() async* {
    final value = await AppDBService.to.homeDao.fetchData();
    if (value != null) {
      debugPrint("Home database => ${value.toJson()}");
      yield value;
    } else {
      yield null;
    }

    try {
      Home home = await _loadHomeAPI();
      debugPrint("Home api => ${home.toJson()}");
      final value = await AppDBService.to.homeDao.putAndGetAsync(home);
      debugPrint("Home api update=> ${value?.toJson()}");
      yield value;
    } catch (e) {
      yield null;
    }
  }

  ///加载API
  static Future<Home> _loadHomeAPI() async {
    if (Mock.isGuest) {
      Map<String, dynamic> json = {
        "totalIncome": 5000.0,
        "todayIncome": 100,
        "siteNum": 2,
        "deviceNum": 2,
        "capacity": 443,
        "totalPos": 12647082.507,
        "totalNeg": 11583229.005,
        "totalPvTotalNeg": 463073.2895,
        "co2": 8729.32,
        "coal": 1366.67,
        "normalNum": 2,
        "faultNum": 0,
        "alarmNum": 0,
        "cutOffNum": 0,
      };
      return Home.fromJson(json);
    }

    if (AppSetting.isOverseas) {
      HomeData2Entity? value = await HomeAPI.postStatisticRecord2();
      return Home(
        totalIncome: value?.totalIncome ?? "0.0",
        todayIncome: value?.todayIncome ?? "0.0",
        lastDayIncome: value?.lastDayIncome ?? "0.0",
        deviceNum: value?.containerCount ?? 0,
        siteNum: value?.siteNum ?? 0,
        capacity: value?.capacity ?? 0.0,
        totalPos: value?.totalPos ?? 0.0,
        totalNeg: value?.totalNeg ?? 0.0,
        totalPvNeg: value?.totalPvTotalNeg ?? 0.0,
        co2: value?.co2 ?? 0.0,
        coal: value?.coal ?? 0.0,
        normalNum: value?.normalNum ?? 0,
        faultNum: value?.faultNum ?? 0,
        alarmNum: value?.alarmNum ?? 0,
        cutOffNum: value?.cutOffNum ?? 0,
      );
    } else {
      HomeStatisticEntity? value = await HomeAPI.postStatisticRecord();
      return Home(
        totalIncome: value?.totalIncome ?? "0.0",
        todayIncome: value?.todayIncome ?? "0.0",
        lastDayIncome: value?.lastDayIncome ?? "0.0",
        deviceNum: value?.containerCount ?? 0,
        siteNum: value?.siteNum ?? 0,
        capacity: value?.capacity ?? 0.0,
        totalPos: value?.totalPos ?? 0.0,
        totalNeg: value?.totalNeg ?? 0.0,
        totalPvNeg: value?.totalPvNeg ?? 0.0,
        co2: value?.co2 ?? 0.0,
        coal: value?.coal ?? 0.0,
        normalNum: value?.normalNum ?? 0,
        faultNum: value?.faultNum ?? 0,
        alarmNum: value?.alarmNum ?? 0,
        cutOffNum: value?.cutOffNum ?? 0,
      );
    }
  }
}
*/
