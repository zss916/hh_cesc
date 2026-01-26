class Environment {
  static const bool isOverseas = bool.fromEnvironment(
    'isOverseas',
    defaultValue: false,
  );

  static const String appName = String.fromEnvironment(
    'appName',
    defaultValue: 'BUJUNSHOU',
  );

  static const bool isPro = bool.fromEnvironment('isPro', defaultValue: false);
}
