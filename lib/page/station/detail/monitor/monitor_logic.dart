import 'package:cescpro/core/enum/app_enum.dart';
import 'package:cescpro/core/router/index.dart';
import 'package:cescpro/core/setting/app_loading.dart';
import 'package:cescpro/core/translations/en.dart';
import 'package:cescpro/http/api/home.dart';
import 'package:cescpro/http/api/site.dart';
import 'package:cescpro/http/bean/site_detail_entity.dart';
import 'package:cescpro/http/bean/site_entity.dart';
import 'package:cescpro/page/station/detail/monitor/v1/helper/device_view_enum.dart';
import 'package:get/get.dart';

class MonitorModel {
  String title;
  String type;
  bool isV1;
  MonitorModel({required this.title, required this.type, required this.isV1});
}

class MonitorLogic extends GetxController {
  SiteEntity? site;
  int viewState = ViewStateEnum.common.index;

  List<MonitorModel> data = [];
  bool? isV1;

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
    //loadData(isV1: false);
    getPointDetails();
  }

  @override
  void onClose() {
    super.onClose();
    AppLoading.dismiss();
  }

  ///isV1
  Future<void> getPointDetails() async {
    SiteDetailEntity? value = await SiteAPI.getPointDetails(
      siteId: site?.id ?? 0,
    );
    isV1 = (value?.isV1);
    if (value != null) {
      if (value.isV1 == true) {
        ///v1
        loadDataV1(isV1: true);
      } else {
        ///v2
        loadData(isV1: false);
      }
    } else {
      AppLoading.toast("data is null");
    }
  }

  Future<void> loadData({required bool isV1}) async {
    if (site != null) {
      data.clear();
      final ((
        bool isSuccessful,
        List<String> value,
      )) = await HomeAPI.getSupportDevTypesV2(
        siteId: site?.id,
        protocolId: site?.protocolId,
      );
      if (isSuccessful) {
        for (var e in value) {
          if (e == DeviceEnum.arr.value || e == DeviceEnum.clu.value) {
            bool isHas = data.any((e) => e.type == DeviceEnum.arr.value);
            if (!isHas) {
              data.add(
                MonitorModel(
                  type: DeviceEnum.arr.value,
                  title: TKey.batterySystem.tr,
                  isV1: isV1,
                ),
              );
            }
          } else if (e == DeviceEnum.cool.value) {
            data.add(
              MonitorModel(
                type: DeviceEnum.cool.value,
                title: TKey.liquidCooling.tr,
                isV1: isV1,
              ),
            );
          } else if (e == DeviceEnum.drier.value) {
            data.add(
              MonitorModel(
                type: DeviceEnum.drier.value,
                title: TKey.temperatureAndHumidity.tr,
                isV1: isV1,
              ),
            );
          } else if (e == DeviceEnum.meter.value) {
            data.add(
              MonitorModel(
                type: DeviceEnum.meter.value,
                title: TKey.electricityMeter.tr,
                isV1: isV1,
              ),
            );
          } else {
            data.add(MonitorModel(type: e, title: e, isV1: isV1));
          }
        }

        viewState = data.isEmpty
            ? ViewStateEnum.empty.index
            : ViewStateEnum.common.index;
        update();
      }
    }
  }

  Future<void> loadDataV1({required bool isV1}) async {
    if (site != null) {
      data.clear();
      final ((
        bool isSuccessful,
        List<String> value,
      )) = await HomeAPI.getSupportDevTypesV1(
        siteId: site?.id,
        protocolId: site?.protocolId,
      );
      if (isSuccessful) {
        //["ARR", "CLU", "PCS", "AIR_COOL", "METER", "DIDO", "CELL"]
        for (var e in value) {
          if (e == DeviceEnum.arr.value) {
            data.add(
              MonitorModel(type: e, title: TKey.stackInfo.tr, isV1: isV1),
            );
          } else if (e == DeviceEnum.clu.value) {
            data.add(MonitorModel(type: e, title: TKey.cluInfo.tr, isV1: isV1));
          } else if (e == DeviceEnum.pcs.value) {
            data.add(MonitorModel(type: e, title: TKey.pcsInfo.tr, isV1: isV1));
          } else if (e == DeviceEnum.airCool.value) {
            data.add(MonitorModel(type: e, title: TKey.hotInfo.tr, isV1: isV1));
          } else if (e == DeviceEnum.meter.value) {
            data.add(
              MonitorModel(type: e, title: TKey.meterInfo.tr, isV1: isV1),
            );
          } else if (e == DeviceEnum.dido.value) {
            data.add(
              MonitorModel(type: e, title: TKey.didoInfo.tr, isV1: isV1),
            );
          } else if (e == DeviceEnum.cell.value) {
            data.add(
              MonitorModel(type: e, title: TKey.singleInfo.tr, isV1: isV1),
            );
          } else if (e == DeviceEnum.statsMeter.value) {
            data.add(
              MonitorModel(type: e, title: TKey.statisticsMeter.tr, isV1: isV1),
            );
          } else if (e == DeviceEnum.fire.value) {
            data.add(
              MonitorModel(
                type: e,
                title: TKey.fireProtectionInfo.tr,
                isV1: isV1,
              ),
            );
          } else {
            data.add(MonitorModel(type: e, title: e, isV1: isV1));
          }
        }
        viewState = data.isEmpty
            ? ViewStateEnum.empty.index
            : ViewStateEnum.common.index;
        update();
      }
    }
  }

  void toDetail(int index) {
    // debugPrint("isV1:${data[index].isV1}");
    if (isV1 != null) {
      if (data[index].isV1 == true) {
        PageTools.toMonitorDetailV1(siteId: "${site?.id}", data: data[index]);
      } else {
        PageTools.toMonitorDetail(siteId: "${site?.id}", data: data[index]);
      }
    } else {
      PageTools.toMonitorDetail(siteId: "${site?.id}", data: data[index]);
    }
  }
}
