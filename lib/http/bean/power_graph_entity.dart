import 'dart:convert';

import 'package:cescpro/generated/json/base/json_field.dart';
import 'package:cescpro/generated/json/power_graph_entity.g.dart';
import 'package:fl_chart/fl_chart.dart';

export 'package:cescpro/generated/json/power_graph_entity.g.dart';

@JsonSerializable()
class PowerGraphEntity {
  int? type; //1 电池功率 2 电网功率 3 光伏功率
  bool? total; //true:总曲线，false:设备曲线
  int? did; //设备id
  String? sn; //设备sn
  String? title; //名称
  List<PowerGraphList>? list;

  ///
  List<int> yList = [];

  PowerGraphEntity();

  factory PowerGraphEntity.fromJson(Map<String, dynamic> json) =>
      $PowerGraphEntityFromJson(json);

  Map<String, dynamic> toJson() => $PowerGraphEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class PowerGraphList {
  int time = 0;

  ///y轴数据
  double val = 0;

  //String dd => DateFormat.;

  ///x轴数据
  //double get xAxis => ((time ~/ 3600) % 24).toDouble();
  //int get xAxis => Duration(seconds: time).inHours;

  ///坐标
  FlSpot get mFlSpot => FlSpot(time.toDouble(), val);

  PowerGraphList();

  factory PowerGraphList.fromJson(Map<String, dynamic> json) =>
      $PowerGraphListFromJson(json);

  Map<String, dynamic> toJson() => $PowerGraphListToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}
