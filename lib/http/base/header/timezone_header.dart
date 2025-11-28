import 'package:time_zone_plus/time_zone_plus.dart';

class TimezoneHeader {
  ///时区
  static String getTimezone() {
    return TimeZonePlus.getCurrentTimeZone() ?? "";
  }
}
