import 'package:cescpro/http/api/ai.dart';
import 'package:cescpro/http/bean/check_ai_open_entity.dart';
import 'package:cescpro/http/bean/model_ctrl_entity.dart';
import 'package:cescpro/http/bean/site_entity.dart';
import 'package:get/get.dart';

class StrategyPageLogic extends GetxController {
  SiteEntity? site;
  String get siteName => site?.name ?? "";
  ModelCtrlEntity? modelCtrl;
  String get activeType => modelCtrl?.activeTypeText ?? "--";

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
    fetchModelControl(siteId: '479');
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
    //value?.activeTypeText ?? "";
    //debugPrint("fetchModelControl ==>> ${value?.activeTypeText ?? ""}");
  }

  Future<void> checkOpenAI({required String siteId}) async {
    CheckAiOpenEntity? value = await AIControlAPI.checkOpenAI(siteId: siteId);
  }
}
