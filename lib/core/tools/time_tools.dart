import 'dart:async';

class TimeTools {
  static final TimeTools _instance = TimeTools._internal();
  static TimeTools get instance => TimeTools();
  factory TimeTools() => _instance;
  TimeTools._internal();

  Timer? _timer;

  void start({Function? onCall}) {
    _timer = Timer.periodic(const Duration(seconds: 12), (timer) {
      onCall?.call();
    });
  }

  void stop() {
    _timer?.cancel();
  }
}
