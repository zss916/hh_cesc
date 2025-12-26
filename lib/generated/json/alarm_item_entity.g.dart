import 'package:cescpro/generated/json/base/json_convert_content.dart';
import 'package:cescpro/http/bean/alarm_item_entity.dart';
import 'package:cescpro/core/helper/extension_helper.dart';

import 'package:cescpro/core/translations/en.dart';

import 'package:get/get.dart';

import 'package:intl/intl.dart';


AlarmItemEntity $AlarmItemEntityFromJson(Map<String, dynamic> json) {
  final AlarmItemEntity alarmItemEntity = AlarmItemEntity();
  final int? alarmId = jsonConvert.convert<int>(json['alarmId']);
  if (alarmId != null) {
    alarmItemEntity.alarmId = alarmId;
  }
  final int? alarmLevel = jsonConvert.convert<int>(json['alarmLevel']);
  if (alarmLevel != null) {
    alarmItemEntity.alarmLevel = alarmLevel;
  }
  final String? content = jsonConvert.convert<String>(json['content']);
  if (content != null) {
    alarmItemEntity.content = content;
  }
  final int? devNo = jsonConvert.convert<int>(json['devNo']);
  if (devNo != null) {
    alarmItemEntity.devNo = devNo;
  }
  final String? devType = jsonConvert.convert<String>(json['devType']);
  if (devType != null) {
    alarmItemEntity.devType = devType;
  }
  final int? did = jsonConvert.convert<int>(json['did']);
  if (did != null) {
    alarmItemEntity.did = did;
  }
  final int? endTimeMill = jsonConvert.convert<int>(json['endTimeMill']);
  if (endTimeMill != null) {
    alarmItemEntity.endTimeMill = endTimeMill;
  }
  final String? name = jsonConvert.convert<String>(json['name']);
  if (name != null) {
    alarmItemEntity.name = name;
  }
  final String? enName = jsonConvert.convert<String>(json['enName']);
  if (enName != null) {
    alarmItemEntity.enName = enName;
  }
  final int? siteId = jsonConvert.convert<int>(json['siteId']);
  if (siteId != null) {
    alarmItemEntity.siteId = siteId;
  }
  final String? siteName = jsonConvert.convert<String>(json['siteName']);
  if (siteName != null) {
    alarmItemEntity.siteName = siteName;
  }
  final String? sn = jsonConvert.convert<String>(json['sn']);
  if (sn != null) {
    alarmItemEntity.sn = sn;
  }
  final int? startTimeMill = jsonConvert.convert<int>(json['startTimeMill']);
  if (startTimeMill != null) {
    alarmItemEntity.startTimeMill = startTimeMill;
  }
  final int? status = jsonConvert.convert<int>(json['status']);
  if (status != null) {
    alarmItemEntity.status = status;
  }
  final int? arrNo = jsonConvert.convert<int>(json['arrNo']);
  if (arrNo != null) {
    alarmItemEntity.arrNo = arrNo;
  }
  final bool? attention = jsonConvert.convert<bool>(json['attention']);
  if (attention != null) {
    alarmItemEntity.attention = attention;
  }
  final String? createTime = jsonConvert.convert<String>(json['createTime']);
  if (createTime != null) {
    alarmItemEntity.createTime = createTime;
  }
  final String? label = jsonConvert.convert<String>(json['label']);
  if (label != null) {
    alarmItemEntity.label = label;
  }
  return alarmItemEntity;
}

Map<String, dynamic> $AlarmItemEntityToJson(AlarmItemEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['alarmId'] = entity.alarmId;
  data['alarmLevel'] = entity.alarmLevel;
  data['content'] = entity.content;
  data['devNo'] = entity.devNo;
  data['devType'] = entity.devType;
  data['did'] = entity.did;
  data['endTimeMill'] = entity.endTimeMill;
  data['name'] = entity.name;
  data['enName'] = entity.enName;
  data['siteId'] = entity.siteId;
  data['siteName'] = entity.siteName;
  data['sn'] = entity.sn;
  data['startTimeMill'] = entity.startTimeMill;
  data['status'] = entity.status;
  data['arrNo'] = entity.arrNo;
  data['attention'] = entity.attention;
  data['createTime'] = entity.createTime;
  data['label'] = entity.label;
  return data;
}

extension AlarmItemEntityExtension on AlarmItemEntity {
  AlarmItemEntity copyWith({
    int? alarmId,
    int? alarmLevel,
    String? content,
    int? devNo,
    String? devType,
    int? did,
    int? endTimeMill,
    String? name,
    String? enName,
    int? siteId,
    String? siteName,
    String? sn,
    int? startTimeMill,
    int? status,
    int? arrNo,
    bool? attention,
    String? createTime,
    String? label,
  }) {
    return AlarmItemEntity()
      ..alarmId = alarmId ?? this.alarmId
      ..alarmLevel = alarmLevel ?? this.alarmLevel
      ..content = content ?? this.content
      ..devNo = devNo ?? this.devNo
      ..devType = devType ?? this.devType
      ..did = did ?? this.did
      ..endTimeMill = endTimeMill ?? this.endTimeMill
      ..name = name ?? this.name
      ..enName = enName ?? this.enName
      ..siteId = siteId ?? this.siteId
      ..siteName = siteName ?? this.siteName
      ..sn = sn ?? this.sn
      ..startTimeMill = startTimeMill ?? this.startTimeMill
      ..status = status ?? this.status
      ..arrNo = arrNo ?? this.arrNo
      ..attention = attention ?? this.attention
      ..createTime = createTime ?? this.createTime
      ..label = label ?? this.label;
  }
}