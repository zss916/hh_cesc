import 'package:intl/intl.dart';

class AppSetting {
  static const String appName = 'Test';
}

extension NumExtension on int {
  String get formatted => NumberFormat('00').format(this);
}
