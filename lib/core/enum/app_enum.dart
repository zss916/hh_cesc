/// 运行状态
enum RunStatus {
  //99.正常 (0:停止1:充电2:放电3:待机) 4: 故障，-3:中断 -2:告警
  normal(value: 99, symbol: 'normal'),
  normalStop(value: 0, symbol: 'stop'),
  normalCharge(value: 1, symbol: 'charge'),
  normalDischarge(value: 2, symbol: 'discharge'),
  normalStandby(value: 3, symbol: 'standby'),
  fault(value: 4, symbol: 'fault'),
  interrupt(value: -3, symbol: 'interrupt'),
  alarm(value: -2, symbol: 'alarm');

  final int value;
  final String symbol;

  const RunStatus({required this.value, required this.symbol});

  static String getSymbol(int value) =>
      RunStatus.values.firstWhere((e) => e.value == value).symbol;
}

/// 站点类型
enum SiteType {
  //1-纯储能；2-光储充；3-储能液冷; 4-光储
  pureEnergyStorage(value: 1, symbol: 'Pure Energy Storage'),
  pVStorageCharging(value: 2, symbol: 'PV-storage-charging'),
  energyStorageLiquidCooling(value: 3, symbol: 'Energy storage liquid cooling'),
  pVStorage(value: 4, symbol: 'PV + storage');

  final int value;
  final String symbol;

  const SiteType({required this.value, required this.symbol});

  static String getSymbol(int value) =>
      SiteType.values.firstWhere((e) => e.value == value).symbol;
}

///电压等级
enum ElecVol {
  //电压等级 1：不满1千伏；2：1-10（20）千伏；3：35千伏；4：110千伏；5：220千伏及以上
  level1(value: 1, symbol: '不满1千伏'),
  level2(value: 2, symbol: '1-10（20）千伏'),
  level3(value: 3, symbol: '35千伏'),
  level4(value: 4, symbol: '110千伏'),
  level5(value: 5, symbol: '220千伏及以上');

  final int value;
  final String symbol;

  const ElecVol({required this.value, required this.symbol});

  static String getSymbol(int value) =>
      ElecVol.values.firstWhere((e) => e.value == value).symbol;
}

/// 类型
enum CompType {
  arr(value: 1, symbol: 'ARR'),
  clu(value: 2, symbol: 'CLU'),
  pcs(value: 3, symbol: 'PCS'),
  meter(value: 4, symbol: 'METER'),
  cool(value: 5, symbol: 'COOL'),
  airCool(value: 6, symbol: 'AIR_COOL'),
  drier(value: 7, symbol: 'DRIER'),
  waterLogging(value: 8, symbol: 'WATER_LOGGING'),
  fire(value: 9, symbol: 'FIRE'),
  dido(value: 10, symbol: 'DIDO'),
  dcdc(value: 11, symbol: 'DCDC'),
  sts(value: 12, symbol: 'STS'),
  pv(value: 13, symbol: 'PV');

  final int value;
  final String symbol;

  const CompType({required this.value, required this.symbol});

  static String getSymbol(int value) =>
      CompType.values.firstWhere((e) => e.value == value).symbol;
}

/// 消息类型
enum MessageType {
  //1-系统用户发送；2-设备告警；3-工单信息变更
  systemUserSend(value: 1, symbol: '系统用户发送'),
  deviceAlarm(value: 2, symbol: '设备告警'),
  changeOfWorkOrderInfo(value: 3, symbol: '工单信息变更');

  final int value;
  final String symbol;

  const MessageType({required this.value, required this.symbol});

  static String getSymbol(int value) =>
      MessageType.values.firstWhere((e) => e.value == value).symbol;
}

/// 功率类型
enum PowerType {
  //1 电池功率 2 电网功率 3 光伏功率
  batteryPower(value: 1, symbol: '电池功率'),
  gridPower(value: 2, symbol: '电网功率'),
  photovoltaicPower(value: 3, symbol: '光伏功率');

  final int value;
  final String symbol;

  const PowerType({required this.value, required this.symbol});

  static String getSymbol(int value) =>
      PowerType.values.firstWhere((e) => e.value == value).symbol;
}

///告警等级
enum Alarm { level1, level2, level3 }

///告警状态
enum AlarmSatusEnum { ended, progressing }

extension AlarmExtension on Alarm {
  int get value {
    switch (this) {
      case Alarm.level1:
        return 1;
      case Alarm.level2:
        return 2;
      case Alarm.level3:
        return 3;
    }
  }
}

enum ViewStateEnum { common, empty, loading }

enum DrawerTypeEnum { site, alarm }
