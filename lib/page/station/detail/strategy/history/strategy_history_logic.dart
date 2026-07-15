import 'package:cescpro/core/enum/app_enum.dart';
import 'package:cescpro/http/api/ai.dart';
import 'package:cescpro/http/bean/strategy_history_entity.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class StrategyHistoryLogic extends GetxController {
  int? id;
  //List<StrategyHistoryEntity> data = [];
  ViewStateEnum viewState = ViewStateEnum.common;

  List<List<StrategyHistoryEntity>> list = [];

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
    List<List<Map<String, dynamic>>> data = groupByDay(
      value.map((e) => e.toJson()).toList(),
    );
    List<List<StrategyHistoryEntity>> historyList = data
        .map((e) => e.map((b) => StrategyHistoryEntity.fromJson(b)).toList())
        .toList();
    list.assignAll(historyList);
    viewState = data.isEmpty ? ViewStateEnum.empty : ViewStateEnum.common;
    update();
  }

  List<List<Map<String, dynamic>>> groupByDay(List<Map<String, dynamic>> data) {
    // 按日期分组
    final Map<String, List<Map<String, dynamic>>> groupMap = {};

    for (final item in data) {
      final date = DateTime.parse(item['createTime']);
      String key = DateFormat('yyyy-MM-dd').format(date);
      groupMap.putIfAbsent(key, () => []).add(item);
    }

    // 每组按照时间倒序
    for (final list in groupMap.values) {
      list.sort((a, b) {
        final t1 = DateTime.parse(a['createTime']);
        final t2 = DateTime.parse(b['createTime']);
        return t2.compareTo(t1); // 倒序
      });
    }

    // 日期分组也按照日期倒序
    final keys = groupMap.keys.toList()..sort((a, b) => b.compareTo(a));
    return keys.map((e) => groupMap[e]!).toList();
  }
}
