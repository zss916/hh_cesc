import 'package:cescpro/core/env/env.dart';
import 'package:intl/intl.dart';

class AppSetting {
  static const String appName = Environment.appName;

  ///是否是海外版本
  static const bool isOverseas = Environment.isOverseas;
}

extension NumExtension on int {
  String get formatted => NumberFormat('00').format(this);
}

extension DateTimeExtension on DateTime {
  String get yearFormatted => DateFormat('yyyy').format(this);

  String get monthFormatted => DateFormat('yyyy-MM').format(this);

  String get dateFormatted => DateFormat('yyyy-MM-dd').format(this);
}
