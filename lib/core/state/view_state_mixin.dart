import 'package:cescpro/core/enum/app_enum.dart';
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

  /* Future<void> loadData({bool loading = true, bool? isDelayed}) async {
    if (loading) {
      onLoading();
      update();
      if (isDelayed == true) await Future.delayed(Duration(seconds: 2));
    }

    final isConnected = await NetworkStatusService.instance.isConnected();
    if (!isConnected) {
      onError();
      update();
      return;
    }
    loadHome();
  }
*/
}
