import 'package:cescpro/core/setting/app_loading.dart';
import 'package:cescpro/core/storage/storage.dart';
import 'package:cescpro/core/user/user.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class Global {
  static Future<void> init() async {
    WidgetsFlutterBinding.ensureInitialized();
    setSystemUi();
    await Future.wait([
      Get.put<StorageService>(StorageService()).init(),
    ]).whenComplete(() async {
      AppLoading();
    });

    await Get.putAsync<User>(() => User().init());
  }

  static void setSystemUi() {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    SystemUiOverlayStyle systemUiOverlayStyle = const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarBrightness: Brightness.light,
      statusBarIconBrightness: Brightness.light,
      systemNavigationBarDividerColor: Colors.transparent,
      systemNavigationBarColor: Colors.transparent,
      systemNavigationBarIconBrightness: Brightness.light,
    );
    SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
  }
}

SystemUiOverlayStyle barStyle = const SystemUiOverlayStyle(
  statusBarColor: Colors.transparent,
  // iOS配置
  statusBarIconBrightness: Brightness.light,
  systemNavigationBarDividerColor: Colors.transparent,
  // Android配置
  statusBarBrightness: Brightness.dark,
  systemNavigationBarColor: Colors.transparent,
  systemNavigationBarIconBrightness: Brightness.dark,
);
