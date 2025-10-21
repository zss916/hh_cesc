import 'dart:ui';

import 'package:get/get.dart' as GetX;

class LocaleHeader {
  static String getLocal() {
    var locale = GetX.Get.locale;
    var language = '';
    if (locale != null) {
      if (locale == const Locale('en', 'US')) {
        language = 'en-US';
      }
      if (locale == const Locale('de', 'DE')) {
        language = 'de-DE';
      }
      if (locale == const Locale('fr', 'FR')) {
        language = 'fr-FR';
      }
      if (locale == const Locale('it', 'IT')) {
        language = 'it-IT';
      }
      if (locale == const Locale('es', 'ES')) {
        language = 'es-ES';
      }
      if (locale.languageCode == 'zh' && locale.countryCode == 'CN') {
        language = 'zh-CN';
      }
    }
    return language;
  }
}
