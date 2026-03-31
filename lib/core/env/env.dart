class Environment {
  static const bool isOverseas = bool.fromEnvironment(
    'isOverseas',
    defaultValue: true,
  );

  static const String appName = String.fromEnvironment(
    'appName',
    defaultValue: 'CESC Energy',
  );

  static const bool isPro = bool.fromEnvironment('isPro', defaultValue: false);

  ///是否显示收益
  static const bool isShowRevenue = bool.fromEnvironment(
    'isShowRevenue',
    defaultValue: false,
  );
}
