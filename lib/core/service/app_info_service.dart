import 'dart:convert';

import 'package:cescpro/core/model/country_entity.dart';
import 'package:cescpro/generated/assets.dart';
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

  @override
  void onReady() {
    super.onReady();
    getCountry();
    getPackageInfo();
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
}
