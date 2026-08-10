part of 'index.dart';

class StrategyHistoryLogic extends GetxController with NetWorkRefreshEvent {
  late RefreshController refreshCtrl = RefreshController(
    initialRefresh: false,
    initialLoadStatus: LoadStatus.canLoading,
  );

  int? id;
  UiState state = Loading();
  int pageNum = 1;
  final List<List<StrategyHistoryEntity>> _list = [];

  @override
  void onInit() {
    super.onInit();
    id = ((Get.arguments as Map<String, dynamic>)['siteId'] as int?);
    onNetWorkRefresh(
      onRefresh: () {
        loadData(loading: true, isDelayed: true);
      },
    );
  }

  @override
  void onReady() {
    super.onReady();
    loadData(loading: true);
  }

  @override
  void onClose() {
    refreshCtrl.dispose();
    super.onClose();
    _list.clear();
    onDisposeNetWork();
  }

  Future<void> loadData({bool loading = true, bool? isDelayed}) async {
    if (loading) {
      state = Loading();
      update();
      if (isDelayed == true) await Future.delayed(Duration(seconds: 2));
    }

    final isConnected = await NetworkStatusService.instance.isConnected();
    if (!isConnected) {
      state = Offline();
      update();
      return;
    }
    refreshData();
  }

  void refreshData() {
    pageNum = 1;
    fetchStrategyHistory(pageNum: pageNum);
  }

  void loadMoreData() {
    pageNum += 1;
    fetchStrategyHistory(pageNum: pageNum);
  }

  Future<void> fetchStrategyHistory({required int pageNum}) async {
    ApiResult<List<StrategyHistoryEntity>> result =
        await AIControlAPI.fetchStrategyHistory(
          siteId: '$id',
          pageNum: pageNum,
        );

    switch (result) {
      case ApiSuccess(:final data):
        List<List<Map<String, dynamic>>> list = groupByDay(
          data.map((e) => e.toJson()).toList(),
        );
        List<List<StrategyHistoryEntity>> historyList = list
            .map(
              (e) => e.map((b) => StrategyHistoryEntity.fromJson(b)).toList(),
            )
            .toList();
        if (pageNum == 1) {
          _list.assignAll(historyList);
        } else {
          _list.addAll(historyList);
        }
        state = _list.isEmpty ? Empty() : Success(_list);
        refreshAndLoadCtl(pageNum == 1, historyList.length);
        update();
        update();
      case ApiError(:final errorState, :final msg):
        state = Failure();
        update();
        if (errorState == ErrorState.error) {
          AppLoading.toast(msg);
        } else {
          AppLoading.toast("Fail");
        }
    }
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
