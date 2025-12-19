import 'package:cescpro/core/setting/app_loading.dart';
import 'package:cescpro/core/translations/en.dart';
import 'package:cescpro/http/api/v1.dart';
import 'package:cescpro/http/bean/id_tree_entity.dart';
import 'package:cescpro/http/bean/v1_arr_info_entity.dart';
import 'package:cescpro/http/bean/v1_cell_info_entity.dart';
import 'package:cescpro/http/bean/v1_clu_info_entity.dart';
import 'package:cescpro/http/bean/v1_dido_info_entity.dart';
import 'package:cescpro/http/bean/v1_hot_mg_entity.dart';
import 'package:cescpro/http/bean/v1_meter_info_entity.dart';
import 'package:cescpro/http/bean/v1_pcs_info_entity.dart';
import 'package:cescpro/page/station/detail/monitor/monitor_logic.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MonitorDetailV1Logic extends GetxController {
  String title = "";
  String? devType;
  String? siteId;
  int? did;
  int? id;
  int? childId;
  bool isV1 = false;
  String deviceName = "";
  List<IdTreeEntity> childDevices = [];
  V1ArrInfoEntity? arrValue;
  V1CluInfoEntity? cluValue;
  V1PcsInfoEntity? pcsValue;
  V1HotMgEntity? hotMgValue;
  V1MeterInfoEntity? meterValue;
  V1DidoInfoEntity? didoValue;
  V1CellInfoEntity? cellValue;

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
    debugPrint("isV1:$isV1,title :$title,$devType");
    AppLoading.show();
    IdTreeEntity? value = await V1API
        .getIdsTree(siteId: siteId, type: devType)
        .whenComplete(() => AppLoading.dismiss());
    if (value != null) {
      if (devType == "ARR") {
        List<IdTreeEntity> childList = value.child ?? [];
        did = childList.first.didValue;
        id = childList.first.idValue;
        deviceName = "${childList.first.showLabel}/1# ${TKey.stack.tr}";
        childDevices.assignAll((value.child ?? []));
        update();
        getArrInfo();
      } else if (devType == "CLU") {
        List<IdTreeEntity> childList = value.child ?? [];
        did = childList.first.didValue;
        id = childList.first.idValue;
        childId = childList.first.child?.first.idValue;
        deviceName =
            "${childList.first.showLabel}/1# ${TKey.stack.tr}/1# ${TKey.cluster.tr}";
        childDevices.assignAll((value.child ?? []));
        update();
        getCluInfo();
      } else if (devType == "PCS") {
        List<IdTreeEntity> childList = value.child ?? [];
        did = childList.first.didValue;
        id = childList.first.idValue;
        deviceName = "${childList.first.showLabel}/1# PCS";
        childDevices.assignAll((value.child ?? []));
        update();
        getPcsInfo();
      } else if (devType == "AIR_COOL") {
        getHotMg();
      } else if (devType == "METER") {
        List<IdTreeEntity> childList = value.child ?? [];
        did = childList.first.didValue;
        id = childList.first.idValue;
        deviceName = "${childList.first.showLabel}/1# ${TKey.demandMeter.tr}";
        childDevices.assignAll((value.child ?? []));
        update();
        getMeterInfo();
      } else if (devType == "DIDO") {
        List<IdTreeEntity> childList = value.child ?? [];
        did = childList.first.didValue;
        id = childList.first.idValue;
        deviceName = "${childList.first.showLabel}/1# DIDO";
        childDevices.assignAll((value.child ?? []));
        update();
        getDidoInfo();
      } else if (devType == "CELL") {
        List<IdTreeEntity> childList = value.child ?? [];
        did = childList.first.didValue;
        id = childList.first.idValue;
        childId = childList.first.child?.first.idValue;
        deviceName =
            "${childList.first.showLabel}/1# ${TKey.stack.tr}/1# ${TKey.cluster.tr}";
        childDevices.assignAll((value.child ?? []));
        update();
        getCellInfo();
      }
    }
  }

  @override
  void onClose() {
    super.onClose();
    AppLoading.dismiss();
  }

  Future<void> getArrInfo() async {
    V1ArrInfoEntity? value = await V1API
        .getArrInfo(siteId: siteId, did: did, arrId: id)
        .whenComplete(() => AppLoading.dismiss());
    arrValue = value;
    update();
  }

  Future<void> getCluInfo() async {
    V1CluInfoEntity? value = await V1API
        .getCluInfo(siteId: siteId, did: did, arrId: id, cluId: childId)
        .whenComplete(() => AppLoading.dismiss());
    cluValue = value;
    update();
  }

  Future<void> getPcsInfo() async {
    V1PcsInfoEntity? value = await V1API
        .getPcsInfo(siteId: siteId, did: did, pcsId: id)
        .whenComplete(() => AppLoading.dismiss());
    pcsValue = value;
    update();
  }

  Future<void> getHotMg() async {
    final (bool isSuccessful, List<V1HotMgEntity> value) = await V1API
        .getHotMg(siteId: siteId)
        .whenComplete(() => AppLoading.dismiss());
    if (isSuccessful) {
      hotMgValue = value.first;
      update();
    }
  }

  Future<void> getMeterInfo() async {
    V1MeterInfoEntity? value = await V1API
        .getMeterInfo(siteId: siteId, did: did, meterId: id)
        .whenComplete(() => AppLoading.dismiss());
    meterValue = value;
    update();
  }

  Future<void> getDidoInfo() async {
    V1DidoInfoEntity? value = await V1API
        .getDidoInfo(siteId: siteId, did: did, id: id)
        .whenComplete(() => AppLoading.dismiss());
    didoValue = value;
    update();
  }

  Future<void> getCellInfo() async {
    V1CellInfoEntity? value = await V1API
        .getCellInfo(siteId: siteId, did: did, arrId: id, cluId: childId)
        .whenComplete(() => AppLoading.dismiss());
    cellValue = value;
    update();
  }
}
