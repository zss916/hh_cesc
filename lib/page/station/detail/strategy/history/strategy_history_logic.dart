import 'package:cescpro/core/enum/app_enum.dart';
import 'package:cescpro/http/api/ai.dart';
import 'package:cescpro/http/bean/strategy_history_entity.dart';
import 'package:get/get.dart';

class StrategyHistoryLogic extends GetxController {
  int? id;
  List<StrategyHistoryEntity> data = [];
  ViewStateEnum viewState = ViewStateEnum.common;

  @override
  void onInit() {
    super.onInit();
    id = ((Get.arguments as Map<String, dynamic>)['siteId'] as int?);
  }

  @override
  void onReady() {
    super.onReady();
    fetchStrategyHistory();
  }

  @override
  void onClose() {
    super.onClose();
  }

  Future<void> fetchStrategyHistory() async {
    viewState = ViewStateEnum.loading;
    update();
    List<StrategyHistoryEntity> value = await AIControlAPI.fetchStrategyHistory(
      siteId: '$id',
    );
    data.assignAll(value);
    viewState = data.isEmpty ? ViewStateEnum.empty : ViewStateEnum.common;
    update();
  }
}
