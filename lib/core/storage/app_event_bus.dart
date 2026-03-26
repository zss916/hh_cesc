import 'package:event_bus/event_bus.dart';

class AppEventBus {
  static final EventBus eventBus = EventBus();
}

class OpenDrawerEvent {
  final int index;
  final int? siteStatus;
  final int? alarmLevel;
  OpenDrawerEvent(this.index, {this.siteStatus, this.alarmLevel});
}

class HasPVEvent {
  final bool hasPv;
  HasPVEvent(this.hasPv);
}

class CheckPolicy {
  final bool isCheck;
  CheckPolicy(this.isCheck);
}

class MainPageEvent {
  final int select;
  MainPageEvent({required this.select});
}

class TopologyEvent {
  TopologyEvent();
}
