import 'package:cescpro/http/api/ai.dart';
import 'package:cescpro/http/bean/ai_compare_data_entity.dart';
import 'package:cescpro/http/bean/ai_power_graph_entity.dart';
import 'package:cescpro/page/station/detail/strategy/ai/widget/dialog_ai_progress.dart';
import 'package:get/get.dart';

class AIStrategyPreviewLogic extends GetxController {
  int? id;
  AiCompareDataEntity? revenueForecast;

  ///提升幅度
  String get profitGrowthRate => revenueForecast?.profitGrowthRate ?? "";

  ///ai策略收益
  int? get aiAllRevenue => revenueForecast?.aiPredictTotalProfit ?? 0;

  ///日增长收益
  int? get dayGrowthRevenue => revenueForecast?.profitGrowth ?? 0;

  bool isFullDay = false;
  int runningDays = 0;

  @override
  void onInit() {
    super.onInit();
    id = ((Get.arguments as Map<String, dynamic>)['siteId'] as int?);
    isFullDay =
        ((Get.arguments as Map<String, dynamic>)['isDaysEnough'] as bool?) ??
        false;
    runningDays =
        ((Get.arguments as Map<String, dynamic>)['runningDays'] as int?) ?? 0;
  }

  @override
  void onReady() {
    super.onReady();
    if (!isFullDay) {
      showAIProgressDialog(day: runningDays);
    }

    //getAIDataCompare();
    //fetchAIData();
  }

  @override
  void onClose() {
    super.onClose();
  }

  ///todo 算法那边还没定好
  Future<void> getAIDataCompare() async {
    AiCompareDataEntity? value = await AIControlAPI.getAIDataCompare(
      siteId: '$id',
    );
  }

  Future<void> fetchAIData() async {
    AiPowerGraphEntity? value = await AIControlAPI.fetchAIData(
      siteId: '$id',
      startTime: DateTime.now().microsecond,
      endTime: DateTime.now().microsecond,
    );
    // update();
  }
}
