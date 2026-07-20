import 'dart:async';

class TimeTools {
  static final TimeTools _instance = TimeTools._internal();
  static TimeTools get instance => TimeTools();
  factory TimeTools() => _instance;
  TimeTools._internal();

  static final Map<String, Timer?> _timerMap = {};

  Timer? _timer;

  void start({required String tag, Function? onCall, Duration? duration}) {
    _timer = Timer.periodic(duration ?? const Duration(seconds: 32), (timer) {
      onCall?.call();
    });
    _timerMap.putIfAbsent(tag, () => _timer);
  }

  void stop({required String tag}) {
    //_timer?.cancel();
    _timerMap.remove(tag)?.cancel();
  }
}
