import 'dart:async';

import 'package:cescpro/core/enum/app_enum.dart';
import 'package:cescpro/core/storage/app_event_bus.dart';
import 'package:get/get.dart';

class ViewStateController extends GetxController {
  ViewStateEnum viewState = ViewStateEnum.common;

  void onLoading() {
    viewState = ViewStateEnum.loading;
  }

  void onEmpty() {
    viewState = ViewStateEnum.empty;
  }

  void onError() {
    viewState = ViewStateEnum.error;
  }

  void onOffline() {
    viewState = ViewStateEnum.offline;
  }

  void onComplete() {
    viewState = ViewStateEnum.common;
  }

  late StreamSubscription<NetWorkRefresh> event;

  void onNetWorkRefresh({Function? onRefresh}) {
    event = AppEventBus.eventBus.on<NetWorkRefresh>().listen((event) {
      onRefresh?.call();
    });
  }

  void onDisposeNetWork() {
    event.cancel();
  }

  /* Future<void> loadData({bool loading = true, bool? isDelayed}) async {
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
    loadHome();
  }
*/
}
