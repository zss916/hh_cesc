import 'package:cescpro/core/setting/app_loading.dart';
import 'package:cescpro/http/api/v1.dart';
import 'package:cescpro/http/bean/v1_fire_entity.dart';
import 'package:get/get.dart';

mixin FireApiMixin on GetxController {
  V1FireEntity? fireValue;

  Future<void> getFireInfo({String? siteId, int? did, int? fireId}) async {
    V1FireEntity? value = await V1API
        .getFireInfo(siteId: siteId, did: did, fireId: fireId)
        .whenComplete(() => AppLoading.dismiss());
    fireValue = value;
    update();
  }
}
