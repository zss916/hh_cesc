import 'package:cescpro/core/storage/storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LanTools {
  static const String lanKey = "locale";

  static bool isZh() {
    Locale? locale = LanTools.getLocale() ?? Get.deviceLocale;
    debugPrint("locale ===>> ${locale?.languageCode}");
    return locale?.languageCode == "zh";
  }

  static Locale? getLocale() {
    String localeString = StorageService.to.getString(lanKey);
    if (localeString.isNotEmpty) {
      final localeList = localeString.split('_');
      return Locale(localeList[0], localeList.length > 1 ? localeList[1] : '');
    }
    return null;
  }

  static void setLocal() {
    var locale = Get.locale;
    if (locale != null) {
      StorageService.to.setString(lanKey, locale.toString());
    }
  }
}
