import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

/// 请求队列项
class QueuedRequest {
  final RequestOptions options;
  final RequestInterceptorHandler handler;

  QueuedRequest({
    required this.options,
    required this.handler,
  });
}

/// 请求队列管理器
/// 断网时将请求入队，网络恢复后按顺序自动重试
class RequestQueue {
  static final RequestQueue instance = RequestQueue._();

  final List<QueuedRequest> _queue = [];

  /// 队列最大容量，避免断网期间积压过多请求
  static const int _maxQueueSize = 50;

  RequestQueue._();

  /// 当前队列长度
  int get length => _queue.length;

  /// 是否为空
  bool get isEmpty => _queue.isEmpty;

  /// 将请求加入队列
  /// 返回 true 表示入队成功，false 表示队列已满
  bool enqueue(QueuedRequest request) {
    if (_queue.length >= _maxQueueSize) {
      debugPrint('[RequestQueue] 队列已满，丢弃最早请求');
      _queue.removeAt(0);
    }
    _queue.add(request);
    debugPrint('[RequestQueue] 请求入队: ${request.options.path}, 当前队列长度: ${_queue.length}');
    return true;
  }

  /// 网络恢复后执行队列中的所有请求
  /// [fetch] 为实际执行请求的函数
  Future<void> flush(Future<Response<dynamic>> Function(RequestOptions) fetch) async {
    if (_queue.isEmpty) return;

    debugPrint('[RequestQueue] 开始执行队列中的 ${_queue.length} 个请求');

    final requests = List<QueuedRequest>.from(_queue);
    _queue.clear();

    for (final queued in requests) {
      try {
        final response = await fetch(queued.options);
        queued.handler.resolve(response);
      } catch (e) {
        if (e is DioException) {
          queued.handler.reject(e);
        } else {
          queued.handler.reject(DioException(
            requestOptions: queued.options,
            error: e,
          ));
        }
      }
    }

    debugPrint('[RequestQueue] 队列执行完毕');
  }

  /// 清空队列，所有请求以失败告终
  void clear([String? reason]) {
    final clearReason = reason ?? '队列已清空';
    for (final queued in _queue) {
      queued.handler.reject(DioException(
        requestOptions: queued.options,
        error: clearReason,
      ));
    }
    _queue.clear();
    debugPrint('[RequestQueue] 队列已清空: $clearReason');
  }
}
