import 'package:pull_to_refresh_simple/pull_to_refresh_simple.dart';

mixin RefreshControllerHelper {
  RefreshController refreshCtrl = RefreshController(initialRefresh: false);

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

  void onRefreshDispose() {
    refreshCtrl.dispose();
  }
}
