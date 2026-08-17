import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';

/// 网络状态枚举
enum NetworkStatus {
  /// 已连接
  connected,
  /// 未连接
  disconnected,
  /// 连接中
  connecting,
}

/// 网络质量等级
enum NetworkQuality {
  /// 优秀：WiFi/以太网
  excellent,
  /// 良好：4G
  good,
  /// 较差：3G/2G（弱网）
  poor,
  /// 无网络
  none,
}

/// 网络状态服务
/// 负责监听网络状态变化、判断网络质量、提供动态超时配置
class NetworkStatusService {
  static final NetworkStatusService instance = NetworkStatusService._();

  final Connectivity _connectivity = Connectivity();
  final StreamController<NetworkStatus> _statusController =
      StreamController<NetworkStatus>.broadcast();
  final StreamController<NetworkQuality> _qualityController =
      StreamController<NetworkQuality>.broadcast();

  NetworkStatus _currentStatus = NetworkStatus.disconnected;
  NetworkQuality _currentQuality = NetworkQuality.none;

  /// 当前网络状态
  NetworkStatus get currentStatus => _currentStatus;

  /// 当前网络质量
  NetworkQuality get currentQuality => _currentQuality;

  /// 网络状态变化流
  Stream<NetworkStatus> get statusStream => _statusController.stream;

  /// 网络质量变化流
  Stream<NetworkQuality> get qualityStream => _qualityController.stream;

  /// 是否正在切换网络（用于避免切换瞬间的请求失败）
  bool _isSwitching = false;
  bool get isSwitching => _isSwitching;

  NetworkStatusService._();

  /// 初始化网络监听
  Future<void> init() async {
    _connectivity.onConnectivityChanged.listen(_onConnectivityChanged);
    final result = await _connectivity.checkConnectivity();
    _onConnectivityChanged(result);
  }

  /// 网络状态变化回调
  void _onConnectivityChanged(List<ConnectivityResult> results) {
    // 标记开始切换网络，短暂延迟后清除标记
    _isSwitching = true;
    Future.delayed(const Duration(milliseconds: 500), () {
      _isSwitching = false;
    });

    final newStatus = _mapConnectivityResult(results);
    final newQuality = _mapNetworkQuality(results);

    if (newStatus != _currentStatus) {
      _currentStatus = newStatus;
      _statusController.add(newStatus);
    }

    if (newQuality != _currentQuality) {
      _currentQuality = newQuality;
      _qualityController.add(newQuality);
    }
  }

  /// 将 ConnectivityResult 列表映射为网络状态
  NetworkStatus _mapConnectivityResult(List<ConnectivityResult> results) {
    if (results.isEmpty) {
      return NetworkStatus.disconnected;
    }

    // 只要包含 wifi/mobile/ethernet 任一连接，即为已连接
    final hasConnection = results.any(
      (result) =>
          result == ConnectivityResult.wifi ||
          result == ConnectivityResult.mobile ||
          result == ConnectivityResult.ethernet,
    );

    return hasConnection ? NetworkStatus.connected : NetworkStatus.disconnected;
  }

  /// 将 ConnectivityResult 列表映射为网络质量等级
  /// 用于弱网场景的动态超时调整
  NetworkQuality _mapNetworkQuality(List<ConnectivityResult> results) {
    if (results.isEmpty || results.every((r) => r == ConnectivityResult.none)) {
      return NetworkQuality.none;
    }

    // 优先级：以太网 > WiFi > 4G移动网络 > 3G/2G弱网
    if (results.contains(ConnectivityResult.ethernet) ||
        results.contains(ConnectivityResult.wifi)) {
      return NetworkQuality.excellent;
    }

    if (results.contains(ConnectivityResult.mobile)) {
      // mobile 无法区分 4G/3G/2G，默认为良好
      // 实际项目中可结合网速测试进一步判断
      return NetworkQuality.good;
    }

    return NetworkQuality.poor;
  }

  /// 根据当前网络质量动态获取超时时间
  /// 弱网环境下适当延长超时时间，避免请求过早失败
  Duration get connectTimeout {
    switch (_currentQuality) {
      case NetworkQuality.excellent:
        return const Duration(seconds: 10);
      case NetworkQuality.good:
        return const Duration(seconds: 15);
      case NetworkQuality.poor:
        return const Duration(seconds: 30);
      case NetworkQuality.none:
        return const Duration(seconds: 10);
    }
  }

  /// 根据当前网络质量动态获取接收超时时间
  Duration get receiveTimeout {
    switch (_currentQuality) {
      case NetworkQuality.excellent:
        return const Duration(seconds: 15);
      case NetworkQuality.good:
        return const Duration(seconds: 20);
      case NetworkQuality.poor:
        return const Duration(seconds: 40);
      case NetworkQuality.none:
        return const Duration(seconds: 15);
    }
  }

  /// 当前是否联网
  Future<bool> isConnected() async {
    final results = await _connectivity.checkConnectivity();
    return results.any(
      (result) =>
          result == ConnectivityResult.wifi ||
          result == ConnectivityResult.mobile ||
          result == ConnectivityResult.ethernet,
    );
  }

  /// 当前是否弱网
  bool get isPoorNetwork => _currentQuality == NetworkQuality.poor;

  void dispose() {
    _statusController.close();
    _qualityController.close();
  }
}
