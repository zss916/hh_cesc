import 'package:cescpro/core/setting/app_loading.dart';
import 'package:cescpro/http/api/v1.dart';
import 'package:cescpro/http/bean/v1_pcs_info_entity.dart';
import 'package:get/get.dart';

mixin PcsApiMixin on GetxController {
  V1PcsInfoEntity? pcsValue;

  Future<void> getPcsInfo({String? siteId, int? did, int? pcsId}) async {
    V1PcsInfoEntity? value = await V1API
        .getPcsInfo(siteId: siteId, did: did, pcsId: pcsId)
        .whenComplete(() => AppLoading.dismiss());
    pcsValue = value;
    update();
  }
}
