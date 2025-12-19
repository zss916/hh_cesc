import 'package:cescpro/core/setting/app_loading.dart';
import 'package:cescpro/http/api/v1.dart';
import 'package:cescpro/http/bean/v1_dido_info_entity.dart';
import 'package:get/get.dart';

mixin DidoApiMixin on GetxController {
  V1DidoInfoEntity? didoValue;

  Future<void> getDidoInfo({String? siteId, int? did, int? id}) async {
    V1DidoInfoEntity? value = await V1API
        .getDidoInfo(siteId: siteId, did: did, id: id)
        .whenComplete(() => AppLoading.dismiss());
    didoValue = value;
    update();
  }
}
