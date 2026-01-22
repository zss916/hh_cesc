import 'package:cescpro/core/env/env.dart';
import 'package:cescpro/core/helper/extension_helper.dart';
import 'package:cescpro/generated/assets.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class AppSetting {
  static const String appName = Environment.appName;

  ///是否是海外版本
  static const bool isOverseas = Environment.isOverseas;

  ///用户协议
  static String policy = Environment.isPro
      ? (Get.isEn ? Assets.htmlUserPolicyEn2 : Assets.htmlUserPolicyZh2)
      : (Get.isEn ? Assets.htmlUserPolicyEn : Assets.htmlUserPolicyZh);
}

extension NumExtension on int {
  String get formatted => NumberFormat('00').format(this);
}

extension DateTimeExtension on DateTime {
  String get yearFormatted => DateFormat('yyyy').format(this);

  String get monthFormatted => DateFormat('yyyy-MM').format(this);

  String get dateFormatted => DateFormat('yyyy-MM-dd').format(this);
}
