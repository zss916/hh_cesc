import 'package:cescpro/core/translations/de.dart';
import 'package:cescpro/core/translations/en.dart';
import 'package:cescpro/core/translations/es.dart';
import 'package:cescpro/core/translations/zh.dart';
import 'package:get/get_navigation/src/root/internacionalization.dart';

class AppTranslations extends Translations {
  @override
  Map<String, Map<String, String>> get keys {
    return {"en": en, "zh": zh, "de": de, "es": es};
  }
}
