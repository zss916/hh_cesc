/*
import 'package:objectbox/objectbox.dart';

///flutter pub run build_runner build

@Entity()
class Home {
  @Id()
  int id;

  /// 累计收益
  String totalIncome;

  /// 当日收益
  String todayIncome;

  /// 昨日收益
  String lastDayIncome;

  /// 设备数量
  int deviceNum;

  /// 站点数量
  int siteNum;

  /// 站点容量
  num capacity;

  /// 累计充电
  num totalPos;

  /// 累计放电
  num totalNeg;

  /// 累计光伏发电
  num totalPvNeg;

  /// CO2 减排
  num co2;

  /// 煤炭
  num coal;

  /// 正常站点数
  int normalNum;

  /// 故障站点数
  int faultNum;

  /// 告警站点数
  int alarmNum;

  /// 中断告警数
  int cutOffNum;

  Home({
    this.id = 0,

    this.totalIncome = "0.0",

    this.todayIncome = "0.0",

    this.lastDayIncome = "0.0",

    this.deviceNum = 0,

    this.siteNum = 0,

    this.capacity = 0.0,

    this.totalPos = 0.0,

    this.totalNeg = 0.0,

    this.totalPvNeg = 0.0,

    this.co2 = 0.0,

    this.coal = 0.0,

    this.normalNum = 0,

    this.faultNum = 0,

    this.alarmNum = 0,

    this.cutOffNum = 0,
  });

  Map<String, dynamic> toJson() {
    return {
      "id": id,

      "totalIncome": totalIncome,

      "todayIncome": todayIncome,

      "lastDayIncome": lastDayIncome,

      "deviceNum": deviceNum,

      "siteNum": siteNum,

      "capacity": capacity,

      "totalPos": totalPos,

      "totalNeg": totalNeg,

      "totalPvNeg": totalPvNeg,

      "co2": co2,

      "coal": coal,

      "normalNum": normalNum,

      "faultNum": faultNum,

      "alarmNum": alarmNum,

      "cutOffNum": cutOffNum,
    };
  }

  factory Home.fromJson(Map<String, dynamic> json) {
    return Home(
      totalIncome: json["totalIncome"]?.toString() ?? "0.0",

      todayIncome: json["todayIncome"]?.toString() ?? "0.0",

      lastDayIncome: json["lastDayIncome"]?.toString() ?? "0.0",

      deviceNum: json["deviceNum"] ?? 0,

      siteNum: json["siteNum"] ?? 0,

      capacity: (json["capacity"] ?? 0).toDouble(),

      totalPos: (json["totalPos"] ?? 0).toDouble(),

      totalNeg: (json["totalNeg"] ?? 0).toDouble(),

      totalPvNeg: (json["totalPvNeg"] ?? 0).toDouble(),

      co2: (json["co2"] ?? 0).toDouble(),

      coal: (json["coal"] ?? 0).toDouble(),

      normalNum: json["normalNum"] ?? 0,

      faultNum: json["faultNum"] ?? 0,

      alarmNum: json["alarmNum"] ?? 0,

      cutOffNum: json["cutOffNum"] ?? 0,
    );
  }
}
*/
