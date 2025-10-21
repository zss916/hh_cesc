part of 'index.dart';

AppRouteObserver appRouteObserver = AppRouteObserver();

///记录路由历史
class AppRouteObserver extends RouteObserver<PageRoute> {
  List<Route<dynamic>> history = <Route<dynamic>>[];

  List<String> historyPage = [];

  @override
  void didPop(Route<dynamic> route, Route<dynamic>? previousRoute) {
    super.didPop(route, previousRoute);
    history.remove(route);
    historyPage.remove(route.settings.name ?? "");
  }

  @override
  void didPush(Route route, Route? previousRoute) {
    super.didPush(route, previousRoute);
    history.add(route);
    historyPage.add(route.settings.name ?? "");
  }

  @override
  void didRemove(Route route, Route? previousRoute) {
    super.didRemove(route, previousRoute);
    history.remove(route);
    historyPage.remove(route.settings.name ?? "");
  }

  @override
  void didReplace({Route? newRoute, Route? oldRoute}) {
    super.didReplace(newRoute: newRoute, oldRoute: oldRoute);
    if (oldRoute != null) {
      history.remove(oldRoute);
      historyPage.remove(oldRoute.settings.name ?? "");
    }
    if (newRoute != null) {
      history.add(newRoute);
      historyPage.add(newRoute.settings.name ?? "");
    }
  }
}
