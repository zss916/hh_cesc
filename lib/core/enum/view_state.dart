enum HomeViewState {
  data(value: 0, symbol: 'data'),
  loading(value: 1, symbol: 'loading'),
  reload(value: 2, symbol: 'reload');

  final int value;
  final String symbol;

  const HomeViewState({required this.value, required this.symbol});

  static String getSymbol(int value) =>
      HomeViewState.values.firstWhere((e) => e.value == value).symbol;
}
