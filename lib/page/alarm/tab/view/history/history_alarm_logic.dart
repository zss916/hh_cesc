import 'package:cescpro/core/helper/refresh_conreoller_mixin.dart';
import 'package:cescpro/core/model/country_entity.dart';
import 'package:cescpro/core/setting/app_loading.dart';
import 'package:cescpro/core/state/view_state_mixin.dart';
import 'package:cescpro/http/api/alarm.dart';
import 'package:cescpro/http/base/interceptor/network_status/network_status.dart';
import 'package:cescpro/http/bean/alarm_item_entity.dart';
import 'package:get/get.dart';

class HistoryAlarmLogic extends ViewStateController
    with RefreshControllerHelper {
  List<AlarmItemEntity> data = [];
  int pageNum = 1;
  int? startTimeMill;
  int? endTimeMill;
  CountryEntity? country;
  int? alarmLevel;
  int? siteId;
  String? siteName;
  // String? adcode;
  // SiteEntity? site

  @override
  void onInit() {
    super.onInit();
    onLoading();
    update();
    onNetWorkRefresh(
      onRefresh: () {
        loadData(loading: true, isDelayed: true);
      },
    );
  }

  @override
  void onReady() {
    super.onReady();
    loadData();
  }

  @override
  void onClose() {
    super.onClose();
    onRefreshDispose();
    onDisposeNetWork();
  }

  Future<void> loadData({bool loading = true, bool? isDelayed}) async {
    if (loading) {
      onLoading();
      update();
      if (isDelayed == true) await Future.delayed(Duration(seconds: 2));
    }

    final isConnected = await NetworkStatusService.instance.isConnected();
    if (!isConnected) {
      onOffline();
      update();
      return;
    }
    refreshData();
  }

  void refreshData({bool? isLoading}) {
    pageNum = 1;
    fetchData(pageNum: pageNum);
  }

  void loadMoreData() {
    pageNum += 1;
    fetchData(pageNum: pageNum);
  }

  ///选
  void toFilter({bool isLoading = false}) {
    if (isLoading) {
      onLoading();
      update();
    }
    pageNum = 1;
    fetchData(pageNum: pageNum);
  }

  Future<void> fetchData({int pageNum = 1}) async {
    final (
      bool isSuccessful,
      List<AlarmItemEntity> value,
    ) = await AlarmAPI.getListPageApp(
      pageNum: pageNum,
      adcode: country?.code,
      alarmLevel: alarmLevel,
      siteId: siteId,
      startTimeMill: startTimeMill,
      endTimeMill: endTimeMill,
      status: 0,
    ).whenComplete(() => AppLoading.dismiss());
    if (isSuccessful) {
      if (pageNum == 1) {
        //data.where((e) => (e.status ?? 0) == 0).toList().assignAll(value);
        data.assignAll(value);
      } else {
        data.addAll(value);
      }
    } else {
      pageNum -= 1;
      AppLoading.toast("Fail");
    }
    refreshAndLoadCtl(pageNum <= 1, value.length);
    data.isEmpty ? onEmpty() : onComplete();
    update();
  }
}
