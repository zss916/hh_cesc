import 'package:cescpro/core/user/user.dart';

abstract class AppStateService {
  ///是否金额
  bool isShowRevenue();
}

class AppState implements AppStateService {
  AppState._internal();

  static final AppState instance = AppState._internal();

  @override
  bool isShowRevenue() => User.to.getIsShowRevenue();
}
