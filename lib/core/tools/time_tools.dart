import 'dart:async';

class TimeTools {
  static final TimeTools _instance = TimeTools._internal();
  static TimeTools get instance => TimeTools();
  factory TimeTools() => _instance;
  TimeTools._internal();

  Timer? _timer;

  void start({Function? onCall, Duration? duration}) {
    _timer = Timer.periodic(duration ?? const Duration(seconds: 32), (timer) {
      onCall?.call();
    });
  }

  void stop() {
    _timer?.cancel();
  }
}
