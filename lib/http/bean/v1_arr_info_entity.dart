import 'dart:convert';

import 'package:cescpro/core/helper/extension_helper.dart';
import 'package:cescpro/core/translations/en.dart';
import 'package:cescpro/generated/json/base/json_field.dart';
import 'package:cescpro/generated/json/v1_arr_info_entity.g.dart';
import 'package:cescpro/http/bean/child_item_info.dart';
import 'package:get/get.dart';

export 'package:cescpro/generated/json/v1_arr_info_entity.g.dart';

@JsonSerializable()
class V1ArrInfoEntity {
  bool? alarmStatus;
  bool? communicationStatus;
  int? devStatus;
  String? statusNameDesc;
  String? statusEnNameDesc;
  int? statusUpdateTimeMill;
  int? id;
  int? did;
  int? siteId;
  int? arrNo;
  int? arrStatus;
  int? bmsStatus;
  double? arrVol;
  double? arrCur;
  double? arrSoc;
  List<V1ArrInfoUnitList>? unitList;

  V1ArrInfoEntity();

  factory V1ArrInfoEntity.fromJson(Map<String, dynamic> json) =>
      $V1ArrInfoEntityFromJson(json);

  Map<String, dynamic> toJson() => $V1ArrInfoEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }

  ///是否超过30分钟
  bool get isWithin30Minutes =>
      (DateTime.now().millisecondsSinceEpoch -
              ((statusUpdateTimeMill ?? 0) * 1000))
          .abs() <=
      (30 * 60 * 1000);

  ///实时数据显示
  List<ChildItemInfo> get childList => (unitList ?? []).isEmpty
      ? <ChildItemInfo>[]
      : (unitList?.first.list ?? []);

  ///告警状态
  String get showAlarmStatus => alarmStatus == null
      ? "-"
      : (alarmStatus == true ? TKey.alarm.tr : TKey.common.tr);

  ///通信状态
  String get showCommunicationStatus => communicationStatus == null
      ? "-"
      : (communicationStatus == true ? TKey.interrupt.tr : TKey.common.tr);

  ///运行状态
  String get showRunStatus =>
      Get.isEn ? (statusEnNameDesc ?? "") : (statusNameDesc ?? "");

  ///当前EMS设备与「堆」的通信状态已中断
}

@JsonSerializable()
class V1ArrInfoUnitList {
  String? name;
  int? sort;
  List<ChildItemInfo>? list;

  V1ArrInfoUnitList();

  factory V1ArrInfoUnitList.fromJson(Map<String, dynamic> json) =>
      $V1ArrInfoUnitListFromJson(json);

  Map<String, dynamic> toJson() => $V1ArrInfoUnitListToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}
