import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh_simple/pull_to_refresh_simple.dart';

import 'core/router/index.dart';
import 'core/setting/app_setting.dart';
import 'core/setting/global.dart';
import 'core/translations/lan_tools.dart';
import 'core/translations/language.dart';
//import 'firebase_options.dart';

Future<void> main() async {
  /*FlutterError.onError = (FlutterErrorDetails details) {
    debugPrint("details ==> ${details.toString()}");
  };*/

  await Global.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      enableScaleText: () => false,
      designSize: const Size(375, 812),
      builder: (context, child) => GetMaterialApp(
        title: AppSetting.appName,
        debugShowCheckedModeBanner: false,
        localizationsDelegates: [RefreshLocalizations.delegate],
        locale: LanTools.getLocale() ?? Get.deviceLocale,
        translations: AppTranslations(),
        fallbackLocale: const Locale("en"),
        getPages: APages.routes,
        navigatorObservers: [appRouteObserver],
        builder: (context, child) => MediaQuery.withNoTextScaling(
          child: EasyLoading.init()(context, child!),
        ),
        defaultTransition: Transition.cupertino,
        theme: ThemeData(
          // scaffoldBackgroundColor: Colors.white,
          ///处理中文w500,不加粗效果
          // fontFamily: "PingFang SC",
          ///最底层绘制颜色
          canvasColor: Color(0xFF23282E),
          visualDensity: VisualDensity.adaptivePlatformDensity,
          bottomNavigationBarTheme: const BottomNavigationBarThemeData(
            backgroundColor: Colors.transparent,
          ),
          tabBarTheme: TabBarThemeData(dividerColor: Colors.transparent),
        ),
        // themeMode: ThemeMode.dark,
        darkTheme: ThemeData(
          brightness: Brightness.dark,
          canvasColor: Color(0xFF23282E),
          visualDensity: VisualDensity.adaptivePlatformDensity,
          bottomNavigationBarTheme: const BottomNavigationBarThemeData(
            backgroundColor: Colors.transparent,
          ),
          tabBarTheme: TabBarThemeData(dividerColor: Colors.transparent),
        ),
        initialRoute: APages.splash,
      ),
    );
  }
}
