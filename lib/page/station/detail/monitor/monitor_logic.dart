import 'package:cescpro/core/enum/app_enum.dart';
import 'package:cescpro/core/setting/app_loading.dart';
import 'package:cescpro/core/translations/en.dart';
import 'package:cescpro/http/api/home.dart';
import 'package:cescpro/http/bean/site_entity.dart';
import 'package:get/get.dart';

class MonitorModel {
  String title;
  String type;
  MonitorModel({required this.title, required this.type});
}

class MonitorLogic extends GetxController {
  SiteEntity? site;
  int viewState = ViewStateEnum.common.index;

  List<MonitorModel> data = [];

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
    AppLoading.dismiss();
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
        for (var e in value) {
          if (e == "ARR" || e == "CLU") {
            bool isHas = data.any((e) => e.type == "ARR");
            if (!isHas) {
              data.add(MonitorModel(type: "ARR", title: TKey.batterySystem.tr));
            }
          } else if (e == "COOL") {
            data.add(MonitorModel(type: "COOL", title: TKey.liquidCooling.tr));
          } else if (e == "DRIER") {
            data.add(
              MonitorModel(
                type: "DRIER",
                title: TKey.temperatureAndHumidity.tr,
              ),
            );
          } else if (e == "METER") {
            data.add(
              MonitorModel(type: "METER", title: TKey.electricityMeter.tr),
            );
          } else {
            data.add(MonitorModel(type: e, title: e));
          }
        }

        viewState = data.isEmpty
            ? ViewStateEnum.empty.index
            : ViewStateEnum.common.index;
        update();
      }
    }
  }
}
