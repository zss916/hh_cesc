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

extension TimestampExtension on int {
  String get timestampFormat => DateFormat(
    'yyyy-MM-dd HH:mm:ss',
  ).format(DateTime.fromMillisecondsSinceEpoch(this));
}

extension CheckLancode on GetInterface {
  bool get isZh => Get.locale?.languageCode == "zh";

  bool get isEn => Get.locale?.languageCode == "en";
}
