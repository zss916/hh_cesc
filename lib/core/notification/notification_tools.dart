import 'package:app_settings/app_settings.dart';
import 'package:permission_handler/permission_handler.dart';

class NotificationTools {
  static final NotificationTools _instance = NotificationTools._internal();
  static NotificationTools get instance => NotificationTools();
  factory NotificationTools() => _instance;
  NotificationTools._internal();

  /// 请求权限
  Future<void> request() async {
    PermissionStatus status = await Permission.notification.request();
    if (status == PermissionStatus.granted) {
      //todo
    } else if (status == PermissionStatus.denied) {
      //todo
    } else {
      //todo
    }
  }

  /// 获取状态
  Future<void> getStatus() async {
    PermissionStatus status = await Permission.notification.status;
    if (status == PermissionStatus.granted) {
      //todo
    } else if (status == PermissionStatus.denied) {
      //todo
    } else {
      //todo
    }
  }

  /// 跳转到系统设置
  Future<void> toAppSettings() async {
    AppSettings.openAppSettings(type: AppSettingsType.notification);
  }
}
