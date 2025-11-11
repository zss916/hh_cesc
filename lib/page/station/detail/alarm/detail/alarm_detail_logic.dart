import 'package:cescpro/core/enum/app_enum.dart';
import 'package:cescpro/core/setting/app_loading.dart';
import 'package:cescpro/http/api/alarm.dart';
import 'package:cescpro/http/bean/alarm_item_entity.dart';
import 'package:get/get.dart';

class AlarmDetailLogic extends GetxController {
  int? siteId;

  List<AlarmItemEntity> list = [];
  int pageNum = 1;
  int viewState = ViewStateEnum.common.index;
  int? alarmLevel;
  String? alarmTitle;
  String? compType;

  @override
  void onInit() {
    super.onInit();
    if (Get.arguments != null) {
      Map<String, dynamic> map = Get.arguments as Map<String, dynamic>;
      siteId = map['siteId'] as int?;
      viewState = ViewStateEnum.loading.index;
      update();
    }
  }

  @override
  void onReady() {
    super.onReady();
    refreshData();
  }

  refreshData() {
    pageNum = 1;
    loadData(pageNum: pageNum);
  }

  loadMoreData() {
    pageNum += 1;
    loadData(pageNum: pageNum);
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
        siteId: siteId!,
        alarmLevel: alarmLevel,
        compType: compType,
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
      viewState = list.isEmpty
          ? ViewStateEnum.empty.index
          : ViewStateEnum.common.index;
      update();
    }
  }

  @override
  void onClose() {
    super.onClose();
  }
}
