import 'package:cescpro/core/enum/app_enum.dart';
import 'package:cescpro/http/api/ai.dart';
import 'package:cescpro/http/bean/strategy_history_entity.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:pull_to_refresh_simple/pull_to_refresh_simple.dart';

class StrategyHistoryLogic extends GetxController {
  int? id;
  //List<StrategyHistoryEntity> data = [];
  ViewStateEnum viewState = ViewStateEnum.common;

  List<List<StrategyHistoryEntity>> list = [];

  late RefreshController refreshCtrl = RefreshController(
    initialRefresh: false,
    initialLoadStatus: LoadStatus.canLoading,
  );

  @override
  void onInit() {
    super.onInit();
    id = ((Get.arguments as Map<String, dynamic>)['siteId'] as int?);
  }

  @override
  void onReady() {
    super.onReady();
    refreshData();
  }

  @override
  void onClose() {
    refreshCtrl.dispose();
    super.onClose();
  }

  void refreshAndLoadCtl(bool isRefresh, int size) {
    if (isRefresh) {
      refreshCtrl.refreshCompleted(resetFooterState: true);
    } else {
      if (size == 0) {
        refreshCtrl.loadNoData();
      } else {
        refreshCtrl.loadComplete();
      }
    }
  }

  int pageNum = 1;

  void refreshData() {
    pageNum = 1;
    fetchStrategyHistory(pageNum: pageNum);
  }

  void loadMoreData() {
    pageNum += 1;
    fetchStrategyHistory(pageNum: pageNum);
  }

  Future<void> fetchStrategyHistory({required int pageNum}) async {
    if (list.isEmpty && pageNum == 1) {
      viewState = ViewStateEnum.loading;
      update();
    }
    List<StrategyHistoryEntity> value = await AIControlAPI.fetchStrategyHistory(
      siteId: '$id',
      pageNum: pageNum,
    );
    List<List<Map<String, dynamic>>> data = groupByDay(
      value.map((e) => e.toJson()).toList(),
    );
    List<List<StrategyHistoryEntity>> historyList = data
        .map((e) => e.map((b) => StrategyHistoryEntity.fromJson(b)).toList())
        .toList();
    if (pageNum == 1) {
      //list.assignAll(historyList);
      list = historyList;
    } else {
      list.addAll(historyList);
    }
    refreshAndLoadCtl(pageNum == 1, historyList.length);
    viewState = list.isEmpty ? ViewStateEnum.empty : ViewStateEnum.common;
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
