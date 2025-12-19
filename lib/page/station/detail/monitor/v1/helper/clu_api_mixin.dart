import 'package:cescpro/core/setting/app_loading.dart';
import 'package:cescpro/http/api/v1.dart';
import 'package:cescpro/http/bean/v1_clu_info_entity.dart';
import 'package:get/get.dart';

mixin CluApiMixin on GetxController {
  V1CluInfoEntity? cluValue;

  Future<void> getCluInfo({
    String? siteId,
    int? did,
    int? arrId,
    int? cluId,
  }) async {
    V1CluInfoEntity? value = await V1API
        .getCluInfo(siteId: siteId, did: did, arrId: arrId, cluId: cluId)
        .whenComplete(() => AppLoading.dismiss());
    cluValue = value;
    update();
  }
}
