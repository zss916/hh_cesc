enum DeviceEnum {
  arr(value: "ARR"),
  clu(value: "CLU"),
  pcs(value: "PCS"),
  airCool(value: "AIR_COOL"),
  meter(value: "METER"),
  dido(value: "DIDO"),
  cell(value: "CELL"),
  statsMeter(value: "STATS_METER"),
  fire(value: "FIRE"),
  drier(value: "DRIER"),
  cool(value: "COOL"),
  pv(value: "PV"),
  other(value: "OTHER");

  final String value;

  const DeviceEnum({required this.value});

  static String getValue(String value) =>
      DeviceEnum.values.firstWhere((e) => e.value == value).value;

  static DeviceEnum fromValue(String value) {
    return DeviceEnum.values.firstWhere(
      (e) => e.value == value,
      orElse: () => DeviceEnum.other,
    );
  }
}
