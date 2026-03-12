import 'dart:async';

class Throttle {
  static Timer? _timer;
  static bool _isExecuting = true;

  /// 节流1 (执行两次,第一次和最后一次)
  /// 1000毫秒内点击执行第一次,
  /// 1000毫秒内点击不执行,1000毫秒后点击执行第二次
  static void run(
    Function func, {
    Duration delay = const Duration(milliseconds: 1000),
    Function? repeatCallback,
  }) {
    if (_isExecuting) {
      func.call();
      _isExecuting = false;
      return;
    }
    if (_timer != null) {
      repeatCallback?.call();
      return;
    }
    _timer = Timer(delay, () {
      func.call();
      _timer = null;
    });
  }

  /// 节流2 (执行一次,只执行一次)
  /// 1000毫秒内点击执行第一次,
  /// 点击最后一次之后不再执行
  static void run1(
    Function func, {
    Duration delay = const Duration(milliseconds: 1000),
    Function? repeatCallback,
  }) {
    if (_isExecuting) {
      func.call();
      _isExecuting = false;
      return;
    }
    if (_isExecuting == false) {
      repeatCallback?.call();
      _timer = Timer(delay, () {
        _isExecuting = true;
        _timer = null;
      });
    }
  }
}
