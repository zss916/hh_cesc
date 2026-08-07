import 'package:cescpro/core/setting/app_loading.dart';
import 'package:cescpro/core/state/view_state_mixin.dart';
import 'package:cescpro/http/api/alarm.dart';
import 'package:cescpro/http/bean/alarm_item_entity.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh_simple/pull_to_refresh_simple.dart';

class AlarmDetailLogic extends ViewStateController {
  int? siteId;
  List<AlarmItemEntity> list = [];
  int pageNum = 1;
  int? alarmLevel;
  String? alarmTitle;
  String? compType;

  RefreshController refreshCtrl = RefreshController(initialRefresh: false);

  @override
  void onInit() {
    super.onInit();
    if (Get.arguments != null) {
      Map<String, dynamic> map = Get.arguments as Map<String, dynamic>;
      siteId = map['siteId'] as int?;
      onLoading();
      update();
    }
  }

  @override
  void onReady() {
    super.onReady();
    refreshData();
  }

  void refreshData() {
    pageNum = 1;
    loadData(pageNum: pageNum);
  }

  void loadMoreData() {
    pageNum += 1;
    loadData(pageNum: pageNum);
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

  Future<void> loadData({int pageNum = 1, bool isLoading = false}) async {
    if (siteId != null) {
      if (isLoading) {
        AppLoading.show();
      }
      final (
        bool isSuccessful,
        List<AlarmItemEntity> value,
      ) = await AlarmAPI.postRealTimePage(
        siteId: "$siteId",
        alarmLevel: alarmLevel,
        compType: compType,
        pageNum: pageNum,
      ).whenComplete(() => AppLoading.dismiss());

      if (isSuccessful) {
        if (pageNum == 1) {
          list.assignAll(value);
        } else {
          list.addAll(value);
        }
      } else {
        pageNum -= 1;
        AppLoading.toast("Fail");
      }
      refreshAndLoadCtl(pageNum <= 1, value.length);
      list.isEmpty ? onEmpty() : onComplete();
      update();
    }
  }

  @override
  void onClose() {
    refreshCtrl.dispose();
    super.onClose();
    AppLoading.dismiss();
  }
}
