import 'package:cescpro/http/api/ai.dart';
import 'package:cescpro/http/bean/ai_compare_data_entity.dart';
import 'package:cescpro/http/bean/check_ai_open_entity.dart';
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

  @override
  void onInit() {
    super.onInit();
    id = ((Get.arguments as Map<String, dynamic>)['siteId'] as int?);
  }

  @override
  void onReady() {
    super.onReady();
    //checkOpenAI(siteId: '$id');
    getAIDataCompare(siteId: '$id');
  }

  @override
  void onClose() {
    super.onClose();
  }

  Future<void> checkOpenAI({required String siteId}) async {
    CheckAiOpenEntity? value = await AIControlAPI.checkOpenAI(siteId: siteId);
    showAIProgressDialog();
  }

  Future<void> getAIDataCompare({required String siteId}) async {
    AiCompareDataEntity? value = await AIControlAPI.getAIDataCompare(
      siteId: siteId,
    );
  }
}
