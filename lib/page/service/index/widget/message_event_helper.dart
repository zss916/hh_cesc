import 'dart:async';

import 'package:cescpro/core/storage/app_event_bus.dart';

mixin MessageEventHelper {
  late StreamSubscription<MessageEvent> messageEvent;

  void onEvent(Function onCall) {
    messageEvent = AppEventBus.eventBus.on<MessageEvent>().listen((event) {
      onCall.call();
    });
  }

  void onDispose() {
    messageEvent.cancel();
  }
}
