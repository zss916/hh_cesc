import 'package:cescpro/core/translations/en.dart';
import 'package:cescpro/http/api/ai.dart';
import 'package:cescpro/http/bean/check_ai_open_entity.dart';
import 'package:cescpro/http/bean/model_ctrl_entity.dart';
import 'package:cescpro/http/bean/site_entity.dart';
import 'package:cescpro/http/bean/strategy_power_item_entity.dart';
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
  CheckAiOpenEntity? checkAiOpen;
  bool get isFullDay => checkAiOpen?.isDaysEnough ?? false;
  int get runningDays => checkAiOpen?.runningDays ?? 0;

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
    checkOpenAI();
    //fetchModelControl();
    //queryStrategyProtected();
    //fetchStrategyData();
  }

  @override
  void onClose() {
    super.onClose();
  }

  Future<void> checkOpenAI() async {
    checkAiOpen = await AIControlAPI.checkOpenAI(siteId: '$id');
  }

  Future<void> fetchModelControl() async {
    ModelCtrlEntity? value = await AIControlAPI.fetchModelControl(
      siteId: '$id',
    );
    modelCtrl = value;
    update();
  }

  Future<void> queryStrategyProtected() async {
    StrategyProtectedEntity? value = await AIControlAPI.queryStrategyProtected(
      siteId: '$id',
    );
    protected = value;
    update();
  }

  Future<void> queryStrategyCurve() async {
    List<StrategyPowerItemEntity>? value =
        await AIControlAPI.queryStrategyCurve(siteId: '$id');
    // update();
  }
}
