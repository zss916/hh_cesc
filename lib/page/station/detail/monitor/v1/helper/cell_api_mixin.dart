import 'package:cescpro/core/setting/app_loading.dart';
import 'package:cescpro/http/api/v1.dart';
import 'package:cescpro/http/bean/v1_cell_info_entity.dart';
import 'package:get/get.dart';

mixin CellApiMixin on GetxController {
  V1CellInfoEntity? cellValue;

  Future<void> getCellInfo({
    String? siteId,
    int? did,
    int? arrId,
    int? cluId,
  }) async {
    V1CellInfoEntity? value = await V1API
        .getCellInfo(siteId: siteId, did: did, arrId: arrId, cluId: cluId)
        .whenComplete(() => AppLoading.dismiss());
    cellValue = value;
    update();
  }
}
