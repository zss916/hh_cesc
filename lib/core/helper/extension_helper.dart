extension MoneyExtension on double {
  ///元 => 万元
  String get moneyFormatted {
    if (this >= 10000) {
      return (this / 10000).toStringAsFixed(2);
    } else {
      return toStringAsFixed(2);
    }
  }
}
