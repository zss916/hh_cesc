import 'package:event_bus/event_bus.dart';

class AppEventBus {
  static final EventBus eventBus = EventBus();
}

class OpenDrawerEvent {
  final int index;
  OpenDrawerEvent(this.index);
}
