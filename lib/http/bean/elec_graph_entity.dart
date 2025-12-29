import 'dart:convert';

import 'package:cescpro/generated/json/base/json_field.dart';
import 'package:cescpro/generated/json/elec_graph_entity.g.dart';

export 'package:cescpro/generated/json/elec_graph_entity.g.dart';

@JsonSerializable()
class ElecGraphEntity {
  String? dateTime; //日期
  double? totalIncome; //总效益
  double? totalCharge; //充电
  double? totalRecharge; //放电
  double? efficiency; //系统效率
  int? type; //1.月 2.年
  ///海外版本新增字段
  double? pvGeneration; //光伏发电量
  double? gridFeed; //电网馈入量
  double? storageProfit; //储能差价收益
  double? pvSelfUse; //发电自用量
  double? pvSelfUseGain; //发电自用收益
  double? pvProfit; //光伏收益
  double? gridFeedGain; //上网收益

  ElecGraphEntity();

  factory ElecGraphEntity.fromJson(Map<String, dynamic> json) =>
      $ElecGraphEntityFromJson(json);

  Map<String, dynamic> toJson() => $ElecGraphEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}
