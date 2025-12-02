import 'dart:math';
import 'dart:ui';

import 'package:cescpro/core/translations/en.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

extension MoneyExtension on double {
  ///元 => 万元
  String get moneyFormatted {
    if (this >= 10000) {
      return (this / 10000).toStringAsFixed(2);
    } else {
      return toStringAsFixed(2);
    }
  }
}

extension TimesExtension on DateTime {
  String get timestampFormat => DateFormat('yyyy-MM-dd').format(this);
}

extension TimestampExtension on int {
  String get timestampFormat => DateFormat(
    'yyyy-MM-dd HH:mm:ss',
  ).format(DateTime.fromMillisecondsSinceEpoch(this));

  String get hms =>
      DateFormat('HH:mm:ss').format(DateTime.fromMillisecondsSinceEpoch(this));
}

extension CheckLancode on GetInterface {
  // bool get isZh => Get.locale?.languageCode == "zh";

  ///目前根据手机语言判断
  bool get isEn => Get.locale?.languageCode == "en";
}

S? safeFind<S>() {
  if (Get.isRegistered<S>() == true) {
    final s = Get.find<S>();
    return s;
  }
  return null;
}

extension RandomColor on int {
  Color get rColor {
    final Random random = Random();
    final int red = random.nextInt(256); // 生成0到255之间的随机数作为红色值
    final int green = random.nextInt(256); // 生成0到255之间的随机数作为绿色值
    final int blue = random.nextInt(256); // 生成0到255之间的随机数作为蓝色值
    final Color randomColor = Color.fromARGB(
      255,
      red,
      green,
      blue,
    ); // 创建Color对象

    return randomColor;
  }
}

///ARR和CLU要归到电池系统
///MERER 电表
///DRIER 温湿度
///COOL 液冷
//[ARR, CLU, PCS, AIR_COOL, DRIER, METER, DIDO]
extension TitleName on String {
  String getTitle() {
    return switch (this) {
      _ when (this == "ARR" || this == "CLU") => TKey.batterySystem.tr,
      _ when (this == "METER") => TKey.electricityMeter.tr,
      _ when (this == "DRIER") => TKey.temperatureAndHumidity.tr,
      _ when (this == "COOL") => TKey.liquidCooling.tr,
      _ => this,
    };
  }
}

extension AlarmLeveTime on int {
  String? getAlarmTitle() {
    return switch (this) {
      _ when (this == 1) => TKey.alarmLevel1.tr,
      _ when (this == 2) => TKey.alarmLevel2.tr,
      _ when (this == 3) => TKey.alarmLevel3.tr,
      _ => null,
    };
  }
}

extension AmountFormat on double {
  String formatAmount() {
    if ((this.toString().length - this.toString().lastIndexOf(".") - 1) < 2) {
      //小数点后有几位小数
      return this
          .toStringAsFixed(2)
          .substring(0, this.toString().lastIndexOf(".") + 2 + 1)
          .toString();
    } else {
      return this
          .toString()
          .substring(0, this.toString().lastIndexOf(".") + 2 + 1)
          .toString();
    }
  }
}
