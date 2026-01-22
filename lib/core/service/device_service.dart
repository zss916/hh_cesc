import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DeviceService extends GetxService {
  static DeviceService get to => Get.find();

  Future<DeviceService> init() async {
    return this;
  }

  ///是否打开底部兼具
  bool isBottomPadding = false;

  @override
  void onReady() {
    super.onReady();
    getDeviceInfo();
  }

  Future<void> getDeviceInfo() async {
    if (GetPlatform.isAndroid) {
      DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
      AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
      debugPrint("sdkInt:${androidInfo.version.sdkInt}");

      ///ios 和 android 14- bottom 设置false, android 15+ 设置true
      isBottomPadding = androidInfo.version.sdkInt >= 35;
    }
  }
}
