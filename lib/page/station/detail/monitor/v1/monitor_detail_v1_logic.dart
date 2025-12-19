import 'package:cescpro/core/setting/app_loading.dart';
import 'package:cescpro/core/translations/en.dart';
import 'package:cescpro/http/api/v1.dart';
import 'package:cescpro/http/bean/id_tree_entity.dart';
import 'package:cescpro/page/station/detail/monitor/monitor_logic.dart';
import 'package:cescpro/page/station/detail/monitor/v1/helper/arr_api_mixin.dart';
import 'package:cescpro/page/station/detail/monitor/v1/helper/cell_api_mixin.dart';
import 'package:cescpro/page/station/detail/monitor/v1/helper/clu_api_mixin.dart';
import 'package:cescpro/page/station/detail/monitor/v1/helper/device_view_enum.dart';
import 'package:cescpro/page/station/detail/monitor/v1/helper/dido_api_mixin.dart';
import 'package:cescpro/page/station/detail/monitor/v1/helper/fire_api_mixin.dart';
import 'package:cescpro/page/station/detail/monitor/v1/helper/meter_api_mixin.dart';
import 'package:cescpro/page/station/detail/monitor/v1/helper/pcs_api_mixin.dart';
import 'package:cescpro/page/station/detail/monitor/v1/helper/stats_meter_api_mixin.dart';
import 'package:cescpro/page/station/detail/monitor/v1/helper/temp_api_mixin.dart';
import 'package:get/get.dart';

class MonitorDetailV1Logic extends GetxController
    with
        ArrApiMixin,
        CluApiMixin,
        PcsApiMixin,
        MeterApiMixin,
        TempApiMixin,
        DidoApiMixin,
        CellApiMixin,
        StatsMeterApiMixin,
        FireApiMixin {
  String title = "";
  String? devType;
  String? siteId;
  int? did;
  int? id;
  int? childId;
  bool isV1 = false;
  String deviceName = "";
  List<IdTreeEntity> childDevices = [];

  @override
  void onInit() {
    super.onInit();
    if (Get.arguments != null) {
      siteId = Get.arguments["siteId"] as String?;
      MonitorModel? data = Get.arguments["data"] as MonitorModel?;
      devType = data?.type;
      title = data?.title ?? "";
      isV1 = data?.isV1 ?? false;
    }
  }

  @override
  void onReady() {
    super.onReady();
    loadData();
  }

  Future<void> loadData() async {
    //debugPrint("isV1:$isV1,title :$title,$devType");
    AppLoading.show();
    IdTreeEntity? value = await V1API.getIdsTree(siteId: siteId, type: devType);
    if (value != null) {
      if (devType == DeviceEnum.arr.value) {
        List<IdTreeEntity> childList = value.child ?? [];
        did = childList.first.didValue;
        id = childList.first.idValue;
        deviceName = "${childList.first.showLabel}/1# ${TKey.stack.tr}";
        childDevices.assignAll((value.child ?? []));
        update();
        await getArrInfo(
          siteId: siteId,
          did: did,
          arrId: id,
        ).whenComplete(() => AppLoading.dismiss());
      } else if (devType == DeviceEnum.clu.value) {
        List<IdTreeEntity> childList = value.child ?? [];
        did = childList.first.didValue;
        id = childList.first.idValue;
        childId = childList.first.child?.first.idValue;
        deviceName =
            "${childList.first.showLabel}/1# ${TKey.stack.tr}/1# ${TKey.cluster.tr}";
        childDevices.assignAll((value.child ?? []));
        update();
        await getCluInfo(
          siteId: siteId,
          did: did,
          arrId: id,
          cluId: childId,
        ).whenComplete(() => AppLoading.dismiss());
      } else if (devType == DeviceEnum.pcs.value) {
        List<IdTreeEntity> childList = value.child ?? [];
        did = childList.first.didValue;
        id = childList.first.idValue;
        deviceName = "${childList.first.showLabel}/1# PCS";
        childDevices.assignAll((value.child ?? []));
        update();
        await getPcsInfo(
          siteId: siteId,
          did: did,
          pcsId: id,
        ).whenComplete(() => AppLoading.dismiss());
      } else if (devType == DeviceEnum.airCool.value) {
        await getHotMg(siteId: siteId).whenComplete(() => AppLoading.dismiss());
      } else if (devType == DeviceEnum.meter.value) {
        List<IdTreeEntity> childList = value.child ?? [];
        did = childList.first.didValue;
        id = childList.first.idValue;
        deviceName = "${childList.first.showLabel}/1# ${TKey.demandMeter.tr}";
        childDevices.assignAll((value.child ?? []));
        update();
        await getMeterInfo(
          siteId: siteId,
          did: did,
          meterId: id,
        ).whenComplete(() => AppLoading.dismiss());
      } else if (devType == DeviceEnum.dido.value) {
        List<IdTreeEntity> childList = value.child ?? [];
        did = childList.first.didValue;
        id = childList.first.idValue;
        deviceName = "${childList.first.showLabel}/1# DIDO";
        childDevices.assignAll((value.child ?? []));
        update();
        await getDidoInfo(
          siteId: siteId,
          did: did,
          id: id,
        ).whenComplete(() => AppLoading.dismiss());
      } else if (devType == DeviceEnum.cell.value) {
        List<IdTreeEntity> childList = value.child ?? [];
        did = childList.first.didValue;
        id = childList.first.idValue;
        childId = childList.first.child?.first.idValue;
        deviceName =
            "${childList.first.showLabel}/1# ${TKey.stack.tr}/1# ${TKey.cluster.tr}";
        childDevices.assignAll((value.child ?? []));
        update();
        await getCellInfo(
          siteId: siteId,
          did: did,
          arrId: id,
          cluId: childId,
        ).whenComplete(() => AppLoading.dismiss());
      } else if (devType == DeviceEnum.statsMeter.value) {
        List<IdTreeEntity> childList = value.child ?? [];
        did = childList.first.didValue;
        id = childList.first.idValue;
        deviceName =
            "${childList.first.showLabel}/1# ${TKey.statisticsMeter.tr}/";
        childDevices.assignAll((value.child ?? []));
        update();
        await getStatsMeterInfo(
          siteId: siteId,
          did: did,
        ).whenComplete(() => AppLoading.dismiss());
      } else if (devType == DeviceEnum.fire.value) {
        List<IdTreeEntity> childList = value.child ?? [];
        did = childList.first.didValue;
        id = childList.first.idValue;
        childId = childList.first.child?.first.val;
        deviceName = "${childList.first.showLabel}/1# ${TKey.fire.tr}";
        childDevices.assignAll((value.child ?? []));
        update();
        await getFireInfo(
          siteId: siteId,
          did: did,
          fireId: childId,
        ).whenComplete(() => AppLoading.dismiss());
      }
    } else {
      AppLoading.dismiss();
    }
  }

  @override
  void onClose() {
    super.onClose();
    AppLoading.dismiss();
  }
}
