part of 'index.dart';

class MainBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<HomeLogic>(HomeLogic());
    Get.put<AlarmLogic>(AlarmLogic());
    Get.put<ServiceLogic>(ServiceLogic());
  }
}
