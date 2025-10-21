import 'package:cescpro/page/main/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'core/router/index.dart';
import 'core/setting/app_setting.dart';
import 'core/setting/global.dart';
import 'core/translations/language.dart';

Future<void> main() async {
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
        debugShowCheckedModeBanner: true,
        locale: Get.deviceLocale,
        translations: AppTranslations(),
        fallbackLocale: const Locale("en"),
        getPages: APages.routes,
        navigatorObservers: [appRouteObserver],
        builder: (context, child) => MediaQuery.withNoTextScaling(
          child: EasyLoading.init()(context, child!),
        ),
        defaultTransition: Transition.cupertino,
        theme: ThemeData(
          visualDensity: VisualDensity.adaptivePlatformDensity,
          bottomNavigationBarTheme: const BottomNavigationBarThemeData(
            backgroundColor: Colors.transparent,
          ),
          tabBarTheme: TabBarThemeData(dividerColor: Colors.transparent),
        ),
        //initialRoute: APages.splash,
        // home: TableWidget(),
        //home: LineChartWidget(),
        //home: BarChartWidget(),
        // home: SplashPage(),
        home: MainPage(),
        /*home: StatusPieChart(
          total: 10,
          normal: 5,
          interrupted: 2,
          warning: 3,
          fault: 1,
        ),*/
      ),
    );
  }
}
