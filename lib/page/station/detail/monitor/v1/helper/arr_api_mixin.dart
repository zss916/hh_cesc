import 'package:cescpro/core/setting/app_loading.dart';
import 'package:cescpro/http/api/v1.dart';
import 'package:cescpro/http/bean/v1_arr_info_entity.dart';
import 'package:get/get.dart';

mixin ArrApiMixin on GetxController {
  V1ArrInfoEntity? arrValue;

  Future<void> getArrInfo({String? siteId, int? did, int? arrId}) async {
    V1ArrInfoEntity? value = await V1API
        .getArrInfo(siteId: siteId, did: did, arrId: arrId)
        .whenComplete(() => AppLoading.dismiss());
    arrValue = value;
    update();
  }
}
