import 'package:cescpro/core/translations/en.dart';
import 'package:cescpro/http/api/ai.dart';
import 'package:cescpro/http/bean/ai_power_graph_entity.dart';
import 'package:cescpro/http/bean/model_ctrl_entity.dart';
import 'package:cescpro/http/bean/site_entity.dart';
import 'package:cescpro/http/bean/strategy_protected_entity.dart';
import 'package:get/get.dart';

class StrategyPageLogic extends GetxController {
  SiteEntity? site;
  String get siteName => site?.name ?? "";
  String get siteInfo =>
      '${TKey.energyStorageInstalledPower.tr} ${site?.power ?? "0"}kW · ${TKey.photovoltaicInstalledCapacity.tr} ${site?.capacity ?? "0"}kWh';
  int? get id => site?.id;
  ModelCtrlEntity? modelCtrl;
  String get activeType => modelCtrl?.activeTypeText ?? "--";
  StrategyProtectedEntity? protected;

  @override
  void onInit() {
    super.onInit();
    SiteEntity? siteEntity =
        ((Get.arguments as Map<String, dynamic>)['site'] as SiteEntity?);
    if (siteEntity != null) {
      site = siteEntity;
      update();
    }
  }

  @override
  void onReady() {
    super.onReady();
    //fetchModelControl(siteId: '$id');
    //queryStrategyProtected(siteId: '$id');
  }

  @override
  void onClose() {
    super.onClose();
  }

  Future<void> fetchModelControl({required String siteId}) async {
    ModelCtrlEntity? value = await AIControlAPI.fetchModelControl(
      siteId: siteId,
    );
    modelCtrl = value;
    update();
  }

  Future<void> queryStrategyProtected({required String siteId}) async {
    StrategyProtectedEntity? value = await AIControlAPI.queryStrategyProtected(
      siteId: siteId,
    );
    protected = value;
    update();
  }

  Future<void> fetchAIData({required String siteId}) async {
    AiPowerGraphEntity? value = await AIControlAPI.fetchAIData(
      siteId: siteId,
      startTime: DateTime.now().microsecond,
      endTime: DateTime.now().microsecond,
    );
    // update();
  }
}
