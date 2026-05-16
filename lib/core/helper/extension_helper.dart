import 'dart:math';
import 'dart:ui';

import 'package:cescpro/core/translations/en.dart';
import 'package:cescpro/core/translations/lan_tools.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker_plus/flutter_datetime_picker_plus.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

extension MoneyExtension on double {
  ///元 => 万元
  String get moneyFormatted {
    if (this >= 10000) {
      return (this / 10000).formatAmount();
    } else {
      return formatAmount();
    }
  }
}

extension YAxis on num {
  String get titleL {
    if (this >= 1000000000) {
      return '${(this / 1000000000).toStringAsFixed(1)}B';
    } else if (this >= 1000000) {
      return '${(this / 1000000).toStringAsFixed(1)}M';
    } else if (this >= 10000) {
      return Get.isZH
          ? '${(this / 10000).toStringAsFixed(1)}W'
          : '${(this / 1000).toStringAsFixed(1)}K';
    } else if (this >= 1000) {
      return '${(this / 1000).toStringAsFixed(1)}K';
    } else if (this <= -1000) {
      return '${(this / 1000).toStringAsFixed(1)}K';
    } else if (this <= -10000) {
      return Get.isZH
          ? '${(this / 10000).toStringAsFixed(1)}W'
          : '${(this / 1000).toStringAsFixed(1)}K';
    } else if (this <= -1000000) {
      return '${(this / 1000000).toStringAsFixed(1)}M';
    }
    if (this <= -1000000000) {
      return '${(this / 1000000000).toStringAsFixed(1)}B';
    } else {
      return toStringAsFixed(1).toString();
    }
  }
}

extension TimesExtension on DateTime {
  String get timestampFormat => DateFormat('yyyy-MM-dd').format(this);

  String get timesFormat => DateFormat('yyyy-MM-dd HH:mm:ss').format(this);
}

extension TimestampExtension on int {
  String get timestampFormat => DateFormat(
    'yyyy-MM-dd HH:mm:ss',
  ).format(DateTime.fromMillisecondsSinceEpoch(this));

  String get hms =>
      DateFormat('HH:mm:ss').format(DateTime.fromMillisecondsSinceEpoch(this));

  String get hm => DateFormat(
    'HH:mm',
  ).format(DateTime.fromMillisecondsSinceEpoch(this * 1000));

  String get hm2 =>
      DateFormat('HH:mm').format(DateTime.fromMillisecondsSinceEpoch(this));

  String get mDHm => DateFormat(
    'MM-dd HH:mm',
  ).format(DateTime.fromMillisecondsSinceEpoch(this));
}

///目前根据手机语言判断
extension CheckLancode on GetInterface {
  bool get isZh => Get.locale?.languageCode == "zh";

  bool get isEn => Get.locale?.languageCode == "en";

  bool get isDe => Get.locale?.languageCode == "de";

  bool get isEs => Get.locale?.languageCode == "es";

  bool get isZH => LanTools.isZh();
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

extension AmountFormat on num {
  ///截取小数点后一位
  String formatNum() {
    if ((this.toString().length - this.toString().lastIndexOf(".") - 1) < 1) {
      //小数点后有几位小数
      return this
          .toStringAsFixed(1)
          .substring(0, this.toString().lastIndexOf(".") + 1 + 1)
          .toString();
    } else {
      return this
          .toString()
          .substring(0, this.toString().lastIndexOf(".") + 1 + 1)
          .toString();
    }
  }

  ///截取小数点后两位
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

  ///匹配mwh
  String formatMWh() {
    if ((this.toString().length - this.toString().lastIndexOf(".") - 1) < 3) {
      //小数点后有几位小数
      return this
          .toStringAsFixed(3)
          .substring(0, this.toString().lastIndexOf(".") + 3 + 1)
          .toString();
    } else {
      return this
          .toString()
          .substring(0, this.toString().lastIndexOf(".") + 3 + 1)
          .toString();
    }
  }

  ///匹配kwh
  String formatKWh() {
    if ((this.toString().length - this.toString().lastIndexOf(".") - 1) < 3) {
      //小数点后有几位小数
      return this
          .toStringAsFixed(3)
          .substring(0, this.toString().lastIndexOf(".") + 3 + 1)
          .toString();
    } else {
      return this
          .toString()
          .substring(0, this.toString().lastIndexOf(".") + 3 + 1)
          .toString();
    }
  }

  ///功率值
  String formatPowerValue() {
    if (this >= 10000) {
      num mValue = this / 1000;
      if (mValue >= 10000) {
        ///gwh
        return (mValue / 1000).toStringAsFixed(3);
      } else {
        ///mwh
        return mValue.toStringAsFixed(3);
      }
    } else if (this <= -10000) {
      num mValue = this / 1000;
      if (mValue <= -10000) {
        ///gwh
        return (mValue / 1000).toStringAsFixed(3);
      } else {
        ///mwh
        return mValue.toStringAsFixed(3);
      }
    } else {
      ///kwh
      return toStringAsFixed(2);
    }
  }

  ///功率单位
  String formatPowerValueUnit() {
    if (this >= 10000) {
      num mValue = this / 1000;
      if (mValue >= 10000) {
        ///gwh
        return "GWh";
      } else {
        ///mwh
        return "MWh";
      }
    } else if (this <= -10000) {
      num mValue = this / 1000;
      if (mValue <= -10000) {
        return "GWh";
      } else {
        return "MWh";
      }
    } else {
      ///kwh
      return "kWh";
    }
  }

  String formatPowerValueAndUnit() {
    if (this >= 10000) {
      num mValue = this / 1000;
      if (mValue >= 10000) {
        ///gwh
        return "${(mValue / 1000).toStringAsFixed(3)}GWh";
      } else {
        ///mwh
        return "${mValue.toStringAsFixed(3)}MWh";
      }
    } else {
      ///kwh
      return "${toStringAsFixed(2)}kWh";
    }
  }

  ///排量等单位
  String get weightUnit => (this >= 1000) ? " t" : " kg";
}

class LocaleUtils {
  static LocaleType fromLanguageCode(String? languageCode) {
    switch (languageCode) {
      case 'en':
        return LocaleType.en;
      case 'de':
        return LocaleType.de;
      case 'es':
        return LocaleType.es;
      case 'zh':
        return LocaleType.zh;
      default:
        return LocaleType.en;
    }
  }
}

/*extension AmountFormatString on String {
  String get moneyFormatSimple => NumberFormat.compactCurrency(
    symbol: "",
    decimalDigits: 1,
  ).format((num.tryParse(this ?? '0.0') ?? 0));

  String get moneyFormatFull => (num.tryParse(this ?? '0.0') ?? 0).toString();

  String get moneyFormat {
    num value = (num.tryParse(this ?? '0.0') ?? 0);
    if (value >= 1000000000) {
      return '${dynamicDecimal(value / 1000000000)}B';
    } else if (value >= 1000000) {
      return '${dynamicDecimal(value / 1000000)}M';
    } else if (value >= 10000) {
      return Get.isZH
          ? '${dynamicDecimal(value / 10000)}W'
          : '${dynamicDecimal(value / 1000)}K';
    } else if (value >= 1000) {
      return '${dynamicDecimal(value / 1000)}K';
    } else {
      return dynamicDecimal(value);
    }
  }

  ///截取小数点后2位
  String truncateMoney(num value) =>
      ((value * 100).truncate() / 100).toStringAsFixed(2);

  String dynamicDecimal(num value) {
    final truncated = ((value * 100).truncate() / 100);

    if (truncated % 1 == 0) {
      return truncated.toStringAsFixed(0);
    }

    if ((truncated * 10) % 1 == 0) {
      return truncated.toStringAsFixed(1);
    }

    return truncated.toStringAsFixed(2);
  }
}*/

extension MoneyExt on String? {
  String moneyFormat({String? locale}) {
    final value = num.tryParse(this ?? '0') ?? 0;

    final currentLocale = locale ?? Get.locale?.languageCode ?? 'en';

    // 中文
    if (currentLocale.startsWith('zh')) {
      if (value >= 100000000) {
        return '${_dynamicDecimal(value / 100000000, currentLocale)}亿';
      }

      if (value >= 10000) {
        return '${_dynamicDecimal(value / 10000, currentLocale)}万';
      }

      return _dynamicDecimal(value, currentLocale);
    }

    // 德语
    if (currentLocale.startsWith('de')) {
      if (value >= 1000000000) {
        return '${_dynamicDecimal(value / 1000000000, currentLocale)} Mrd';
      }

      if (value >= 1000000) {
        return '${_dynamicDecimal(value / 1000000, currentLocale)} Mio';
      }

      if (value >= 1000) {
        return '${_dynamicDecimal(value / 1000, currentLocale)} Tsd';
      }

      return _dynamicDecimal(value, currentLocale);
    }

    // 默认国际化（英语/西班牙语等）
    if (value >= 1000000000) {
      return '${_dynamicDecimal(value / 1000000000, currentLocale)}B';
    }

    if (value >= 1000000) {
      return '${_dynamicDecimal(value / 1000000, currentLocale)}M';
    }

    if (value >= 1000) {
      return '${_dynamicDecimal(value / 1000, currentLocale)}K';
    }

    return _dynamicDecimal(value, currentLocale);
  }
}

String _dynamicDecimal(num value, String locale) {
  final truncated = ((value * 100).truncate() / 100);

  int digits;

  if (truncated % 1 == 0) {
    digits = 0;
  } else if ((truncated * 10) % 1 == 0) {
    digits = 1;
  } else {
    digits = 2;
  }

  return NumberFormat.decimalPatternDigits(
    locale: locale,
    decimalDigits: digits,
  ).format(truncated);
}
