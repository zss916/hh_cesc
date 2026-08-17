import 'dart:async';

import 'package:flutter/foundation.dart';

/// 熔断器状态
enum CircuitBreakerState {
  /// 关闭：正常放行请求
  closed,
  /// 打开：熔断中，拒绝所有请求
  open,
  /// 半开：尝试放行少量请求探测是否恢复
  halfOpen,
}

/// 熔断器
/// 防止持续失败时大量重试导致雪崩
/// 三种状态：
/// - closed：正常状态，记录失败次数
/// - open：失败达阈值，熔断一段时间，拒绝所有请求
/// - halfOpen：熔断冷却后，放行少量请求探测服务是否恢复
class CircuitBreaker {
  /// 失败次数阈值，达到后触发熔断
  final int failureThreshold;

  /// 熔断冷却时间
  final Duration resetDuration;

  /// 半开状态下允许通过的探测请求数
  final int halfOpenMaxCalls;

  CircuitBreakerState _state = CircuitBreakerState.closed;
  int _failureCount = 0;
  DateTime? _lastFailureTime;
  int _halfOpenCalls = 0;

  /// 状态变化流
  final StreamController<CircuitBreakerState> _stateController =
      StreamController<CircuitBreakerState>.broadcast();
  Stream<CircuitBreakerState> get stateStream => _stateController.stream;

  CircuitBreakerState get state => _state;
  int get failureCount => _failureCount;

  CircuitBreaker({
    this.failureThreshold = 10,
    this.resetDuration = const Duration(seconds: 30),
    this.halfOpenMaxCalls = 3,
  });

  /// 是否允许请求通过
  bool get allowRequest {
    switch (_state) {
      case CircuitBreakerState.closed:
        return true;
      case CircuitBreakerState.open:
        // 检查冷却时间是否已过
        if (_lastFailureTime != null &&
            DateTime.now().difference(_lastFailureTime!) >= resetDuration) {
          // 冷却完毕，进入半开状态
          _transitionTo(CircuitBreakerState.halfOpen);
          _halfOpenCalls = 0;
          return true;
        }
        return false;
      case CircuitBreakerState.halfOpen:
        // 半开状态下只允许少量探测请求
        if (_halfOpenCalls < halfOpenMaxCalls) {
          _halfOpenCalls++;
          return true;
        }
        return false;
    }
  }

  /// 记录成功
  /// 半开状态下成功，说明服务已恢复，关闭熔断器
  void recordSuccess() {
    if (_state == CircuitBreakerState.halfOpen) {
      debugPrint('[CircuitBreaker] 探测成功，熔断器关闭');
      _failureCount = 0;
      _transitionTo(CircuitBreakerState.closed);
    }
  }

  /// 记录失败
  /// 达到阈值时打开熔断器
  void recordFailure() {
    _failureCount++;
    _lastFailureTime = DateTime.now();

    if (_state == CircuitBreakerState.halfOpen) {
      // 半开状态下失败，重新熔断
      debugPrint('[CircuitBreaker] 探测失败，熔断器重新打开');
      _transitionTo(CircuitBreakerState.open);
      return;
    }

    if (_failureCount >= failureThreshold) {
      debugPrint('[CircuitBreaker] 失败次数 $_failureCount 达阈值 $failureThreshold，熔断器打开');
      _transitionTo(CircuitBreakerState.open);
    }
  }

  /// 手动重置熔断器
  void reset() {
    _failureCount = 0;
    _lastFailureTime = null;
    _halfOpenCalls = 0;
    _transitionTo(CircuitBreakerState.closed);
  }

  void _transitionTo(CircuitBreakerState newState) {
    if (_state != newState) {
      debugPrint('[CircuitBreaker] 状态变更: $_state -> $newState');
      _state = newState;
      _stateController.add(newState);
    }
  }

  void dispose() {
    _stateController.close();
  }
}
