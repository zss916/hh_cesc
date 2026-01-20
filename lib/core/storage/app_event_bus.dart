import 'package:event_bus/event_bus.dart';

class AppEventBus {
  static final EventBus eventBus = EventBus();
}

class OpenDrawerEvent {
  final int index;
  final int? siteStatus;
  OpenDrawerEvent(this.index, {this.siteStatus});
}

class HasPVEvent {
  final bool hasPv;
  HasPVEvent(this.hasPv);
}

class CheckPolicy {
  final bool isCheck;
  CheckPolicy(this.isCheck);
}
