part of 'index.dart';

extension GetExtension on GetInterface {
  ///路由历史
  List<Route<dynamic>> get history => appRouteObserver.history;

  ///是否已打开该页面
  bool containName(String name) {
    return getRouteByName(name) != null;
  }

  ///通过name获取route，从栈顶开始查找
  Route? getRouteByName(String name) {
    var index = history.lastIndexWhere(
      (element) => element.settings.name == name,
    );
    if (index != -1) {
      return history[index];
    }
    return null;
  }

  ///通过name获取route
  List<Route> getRoutesByName(String name) {
    return history.where((element) => element.settings.name == name).toList();
  }

  ///移除指定的页面,一次
  void removeName(String name) {
    var route = getRouteByName(name);
    if (route != null) {
      Get.removeRoute(route);
    }
  }

  ///移除所有指定的页面
  void removeAllName(String name) {
    var routes = getRoutesByName(name);
    for (var o in routes) {
      Get.removeRoute(o);
    }
  }
}
