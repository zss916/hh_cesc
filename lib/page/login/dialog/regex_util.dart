class RegexUtil {
  /// 密码校验
  static final RegExp password = RegExp(
    r'^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*#?&.~])[A-Za-z\d@$!%*#?&.~]{8,18}$',
  );
}
