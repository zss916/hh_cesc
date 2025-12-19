import 'package:cescpro/core/setting/app_loading.dart';
import 'package:cescpro/http/api/v1.dart';
import 'package:cescpro/http/bean/v1_stats_meter_entity.dart';
import 'package:get/get.dart';

mixin StatsMeterApiMixin on GetxController {
  V1StatsMeterEntity? statsMeterValue;

  Future<void> getStatsMeterInfo({String? siteId, int? did}) async {
    V1StatsMeterEntity? value = await V1API
        .getStatsMeterInfo(siteId: siteId, did: did)
        .whenComplete(() => AppLoading.dismiss());
    statsMeterValue = value;
    update();
  }
}
