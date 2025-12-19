import 'package:cescpro/core/setting/app_loading.dart';
import 'package:cescpro/http/api/v1.dart';
import 'package:cescpro/http/bean/v1_hot_mg_entity.dart';
import 'package:get/get.dart';

mixin TempApiMixin on GetxController {
  V1HotMgEntity? hotMgValue;

  Future<void> getHotMg({String? siteId}) async {
    final (bool isSuccessful, List<V1HotMgEntity> value) = await V1API
        .getHotMg(siteId: siteId)
        .whenComplete(() => AppLoading.dismiss());
    if (isSuccessful) {
      hotMgValue = value.first;
      update();
    }
  }
}
