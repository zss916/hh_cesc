import 'package:cescpro/generated/json/base/json_convert_content.dart';
import 'package:cescpro/http/bean/power_graph_entity.dart';

PowerGraphEntity $PowerGraphEntityFromJson(Map<String, dynamic> json) {
  final PowerGraphEntity powerGraphEntity = PowerGraphEntity();
  final int? type = jsonConvert.convert<int>(json['type']);
  if (type != null) {
    powerGraphEntity.type = type;
  }
  final bool? total = jsonConvert.convert<bool>(json['total']);
  if (total != null) {
    powerGraphEntity.total = total;
  }
  final int? did = jsonConvert.convert<int>(json['did']);
  if (did != null) {
    powerGraphEntity.did = did;
  }
  final String? sn = jsonConvert.convert<String>(json['sn']);
  if (sn != null) {
    powerGraphEntity.sn = sn;
  }
  final String? title = jsonConvert.convert<String>(json['title']);
  if (title != null) {
    powerGraphEntity.title = title;
  }
  final List<PowerGraphList>? list = (json['list'] as List<dynamic>?)
      ?.map(
          (e) => jsonConvert.convert<PowerGraphList>(e) as PowerGraphList)
      .toList();
  if (list != null) {
    powerGraphEntity.list = list;
  }
  final List<int>? yList = (json['yList'] as List<dynamic>?)?.map(
          (e) => jsonConvert.convert<int>(e) as int).toList();
  if (yList != null) {
    powerGraphEntity.yList = yList;
  }
  return powerGraphEntity;
}

Map<String, dynamic> $PowerGraphEntityToJson(PowerGraphEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['type'] = entity.type;
  data['total'] = entity.total;
  data['did'] = entity.did;
  data['sn'] = entity.sn;
  data['title'] = entity.title;
  data['list'] = entity.list?.map((v) => v.toJson()).toList();
  data['yList'] = entity.yList;
  return data;
}

extension PowerGraphEntityExtension on PowerGraphEntity {
  PowerGraphEntity copyWith({
    int? type,
    bool? total,
    int? did,
    String? sn,
    String? title,
    List<PowerGraphList>? list,
    List<int>? yList,
  }) {
    return PowerGraphEntity()
      ..type = type ?? this.type
      ..total = total ?? this.total
      ..did = did ?? this.did
      ..sn = sn ?? this.sn
      ..title = title ?? this.title
      ..list = list ?? this.list
      ..yList = yList ?? this.yList;
  }
}

PowerGraphList $PowerGraphListFromJson(Map<String, dynamic> json) {
  final PowerGraphList powerGraphList = PowerGraphList();
  final int? time = jsonConvert.convert<int>(json['time']);
  if (time != null) {
    powerGraphList.time = time;
  }
  final double? val = jsonConvert.convert<double>(json['val']);
  if (val != null) {
    powerGraphList.val = val;
  }
  return powerGraphList;
}

Map<String, dynamic> $PowerGraphListToJson(PowerGraphList entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['time'] = entity.time;
  data['val'] = entity.val;
  return data;
}

extension PowerGraphListExtension on PowerGraphList {
  PowerGraphList copyWith({
    int? time,
    double? val,
  }) {
    return PowerGraphList()
      ..time = time ?? this.time
      ..val = val ?? this.val;
  }
}