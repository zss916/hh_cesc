import 'dart:convert';

import 'package:cescpro/core/model/country_entity.dart';
import 'package:cescpro/generated/assets.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:package_info_plus/package_info_plus.dart';

class AppInfoService extends GetxService {
  static AppInfoService get to => Get.find();

  Future<AppInfoService> init() async {
    return this;
  }

  List<CountryEntity> countryList = [];

  String? appName;
  String? appVersion;

  ///是否打开底部兼具
  bool isBottomPadding = false;

  @override
  void onReady() {
    super.onReady();
    getCountry();
    getPackageInfo();
    getDeviceInfo();
  }

  Future<List<CountryEntity>> getCountry() async {
    String value = await rootBundle.loadString(Assets.jsonCountryAndArea);
    List list = json.decode(value) as List;
    List<CountryEntity> lists = list
        .map((e) => CountryEntity.fromJson(e))
        .toList();
    countryList.assignAll(lists);
    return lists;
  }

  Future<(String? appName, String? version)> getPackageInfo() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    appName = packageInfo.appName;
    appVersion = packageInfo.version;
    String buildNumber = packageInfo.buildNumber;
    //debugPrint("appName:$appName,version:$appVersion");
    return (appName, appVersion);
  }

  Future<void> getDeviceInfo() async {
    if (GetPlatform.isAndroid) {
      DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
      AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
      debugPrint("sdkInt:${androidInfo.version.sdkInt}");

      ///ios 和 android 14- bottom 设置false, android 15+ 设置true
      isBottomPadding = androidInfo.version.sdkInt >= 35;
    }
  }
}
