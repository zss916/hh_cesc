import 'package:cescpro/core/storage/storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LanTools {
  static const String lanKey = "locale";

  static Locale? getLocale() {
    String localeString = StorageService.to.getString(lanKey);
    if (localeString.isNotEmpty) {
      final localeList = localeString.split('_');
      return Locale(localeList[0], localeList.length > 1 ? localeList[1] : '');
    }
    return null;
  }

  static Future<void> setLocal() {
    var locale = Get.locale;
    if (locale != null) {
      return StorageService.to.setString(lanKey, locale.toString());
    } else {
      return Future.value(null);
    }
  }
}
