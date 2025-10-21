part of 'index.dart';

class SplashBinding implements Bindings {
  @override
  void dependencies() => Get.put<SplashLogic>(SplashLogic());
}
