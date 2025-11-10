import 'package:country_state_city/country_state_city.dart';
import 'package:flutter/material.dart';

Future<void> getCountry() async {
  final countries = await getAllCountries();
  //adcode
  // :
  // "CHN,11,1101"
  for (var value in countries) {
    debugPrint("getCountry ===>> ${value.toJson()}");
  }

  /*final states = await getStateByCode("CHN");
  for (var value in states) {
    debugPrint("getStates ===>> ${value.toJson()}");
  }*/
}
