class Environment {
  static const bool isOverseas = bool.fromEnvironment(
    'isOverseas',
    defaultValue: true,
  );

  static const String appName = String.fromEnvironment(
    'appName',
    defaultValue: 'BUJUNSHOU',
  );
}
