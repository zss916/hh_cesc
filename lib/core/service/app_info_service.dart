import 'dart:convert';

import 'package:cescpro/core/model/country_entity.dart';
import 'package:cescpro/generated/assets.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class AppInfoService extends GetxService {
  static AppInfoService get to => Get.find();

  Future<AppInfoService> init() async {
    return this;
  }

  List<CountryEntity> countryList = [];

  @override
  void onReady() {
    super.onReady();
    getCountry();
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
}
