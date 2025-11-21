import 'package:cescpro/core/enum/app_enum.dart';
import 'package:cescpro/http/api/home.dart';
import 'package:cescpro/http/bean/site_entity.dart';
import 'package:get/get.dart';

class MonitorLogic extends GetxController {
  SiteEntity? site;
  int viewState = ViewStateEnum.common.index;

  List<String> data = [];

  @override
  void onInit() {
    super.onInit();
    if (Get.arguments != null) {
      Map<String, dynamic> map = Get.arguments as Map<String, dynamic>;
      site = map['site'] as SiteEntity?;
    }
    viewState = ViewStateEnum.loading.index;
    update();
  }

  @override
  void onReady() {
    super.onReady();
    loadData();
  }

  @override
  void onClose() {
    super.onClose();
  }

  Future<void> loadData() async {
    if (site != null) {
      final ((
        bool isSuccessful,
        List<String> value,
      )) = await HomeAPI.getSupportDevTypesV2(
        siteId: site?.id,
        protocolId: site?.protocolId,
      );
      if (isSuccessful) {
        //[ARR, CLU, PCS, AIR_COOL, DRIER, METER, DIDO]
        data.assignAll(value);
      }
      viewState = data.isEmpty
          ? ViewStateEnum.empty.index
          : ViewStateEnum.common.index;
      update();
    }
  }
}
