class HomeStatisticsModel {
  //累计收益
  final String totalIncome;
  //当日收益
  final String todayIncome;
  //昨日收益
  final String lastDayIncome;
  //设备数量
  final int deviceNum;
  //站点数量
  final int siteNum;
  //站点容量
  final num capacity;
  //累计充电
  final num totalPos;
  //累计放电
  final num totalNeg;
  //累计光伏发电
  final num totalPvNeg;
  //co2 减排
  final num co2;
  //煤炭
  final num coal;
  //正常站点数
  final int normalNum;
  //故障站点数
  final int faultNum;
  //告警站点数
  final int alarmNum;
  //中断告警数
  final int cutOffNum;

  const HomeStatisticsModel({
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

  /// copyWith 复制对象，部分字段更新
  HomeStatisticsModel copyWith({
    String? totalIncome,
    String? todayIncome,
    String? lastDayIncome,
    int? deviceNum,
    int? siteNum,
    num? capacity,
    num? totalPos,
    num? totalNeg,
    num? totalPvNeg,
    num? co2,
    num? coal,
    int? normalNum,
    int? faultNum,
    int? alarmNum,
    int? cutOffNum,
  }) {
    return HomeStatisticsModel(
      totalIncome: totalIncome ?? this.totalIncome,
      todayIncome: todayIncome ?? this.todayIncome,
      lastDayIncome: lastDayIncome ?? this.lastDayIncome,
      deviceNum: deviceNum ?? this.deviceNum,
      siteNum: siteNum ?? this.siteNum,
      capacity: capacity ?? this.capacity,
      totalPos: totalPos ?? this.totalPos,
      totalNeg: totalNeg ?? this.totalNeg,
      totalPvNeg: totalPvNeg ?? this.totalPvNeg,
      co2: co2 ?? this.co2,
      coal: coal ?? this.coal,
      normalNum: normalNum ?? this.normalNum,
      faultNum: faultNum ?? this.faultNum,
      alarmNum: alarmNum ?? this.alarmNum,
      cutOffNum: cutOffNum ?? this.cutOffNum,
    );
  }

  /// json 反序列化
  factory HomeStatisticsModel.fromJson(Map<String, dynamic> json) {
    return HomeStatisticsModel(
      totalIncome: json["totalIncome"] ?? "0.0",
      todayIncome: json["todayIncome"] ?? "0.0",
      lastDayIncome: json["lastDayIncome"] ?? "0.0",
      deviceNum: json["deviceNum"] ?? 0,
      siteNum: json["siteNum"] ?? 0,
      capacity: json["capacity"] ?? 0.0,
      totalPos: json["totalPos"] ?? 0.0,
      totalNeg: json["totalNeg"] ?? 0.0,
      totalPvNeg: json["totalPvNeg"] ?? 0.0,
      co2: json["co2"] ?? 0.0,
      coal: json["coal"] ?? 0.0,
      normalNum: json["normalNum"] ?? 0,
      faultNum: json["faultNum"] ?? 0,
      alarmNum: json["alarmNum"] ?? 0,
      cutOffNum: json["cutOffNum"] ?? 0,
    );
  }

  ///转json
  Map<String, dynamic> toJson() {
    return {
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
}
