import 'dart:async';

import 'package:cescpro/core/storage/app_event_bus.dart';

mixin NetWorkRefreshEvent {
  late StreamSubscription<NetWorkRefresh> event;

  void onNetWorkRefresh({Function? onRefresh}) {
    event = AppEventBus.eventBus.on<NetWorkRefresh>().listen((event) {
      onRefresh?.call();
    });
  }

  void onDisposeNetWork() {
    event.cancel();
  }
}
