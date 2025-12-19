import 'package:cescpro/core/setting/app_loading.dart';
import 'package:cescpro/http/api/v1.dart';
import 'package:cescpro/http/bean/v1_meter_info_entity.dart';
import 'package:get/get.dart';

mixin MeterApiMixin on GetxController {
  V1MeterInfoEntity? meterValue;

  Future<void> getMeterInfo({String? siteId, int? did, int? meterId}) async {
    V1MeterInfoEntity? value = await V1API
        .getMeterInfo(siteId: siteId, did: did, meterId: meterId)
        .whenComplete(() => AppLoading.dismiss());
    meterValue = value;
    update();
  }
}
