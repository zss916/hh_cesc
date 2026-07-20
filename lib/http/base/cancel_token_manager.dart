import 'package:dio/dio.dart';

class CancelTokenManager {
  static final Map<String, CancelToken> _tokens = {};

  static CancelToken of(String tag) {
    return _tokens.putIfAbsent(tag, () => CancelToken());
  }

  static void cancel(String tag) {
    _tokens.remove(tag)?.cancel('page disposed');
  }
}

// Widget dispose 时：CancelTokenManager.cancel(widgetTag);
