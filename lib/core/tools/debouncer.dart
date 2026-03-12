import 'dart:async';

class Debouncer {
  static Timer? _timer;

  /// 防抖 只执行最后一次
  /// delay 延迟时间
  /// action 执行操作
  /// cancelAction 取消操作
  static void run({
    Duration delay = const Duration(milliseconds: 1000),
    required Function action,
    Function? cancelAction,
  }) {
    if (_timer != null) {
      cancelAction?.call();
      _timer?.cancel();
    }
    _timer = Timer(delay, () {
      action.call();
      _timer = null;
    });
  }
}
