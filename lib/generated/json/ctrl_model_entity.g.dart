import 'package:cescpro/generated/json/base/json_convert_content.dart';
import 'package:cescpro/http/bean/ctrl_model_entity.dart';

CtrlModelEntity $CtrlModelEntityFromJson(Map<String, dynamic> json) {
  final CtrlModelEntity ctrlModelEntity = CtrlModelEntity();
  final int? activeType = jsonConvert.convert<int>(json['activeType']);
  if (activeType != null) {
    ctrlModelEntity.activeType = activeType;
  }
  final CtrlModelPower? power = jsonConvert.convert<CtrlModelPower>(
    json['power'],
  );
  if (power != null) {
    ctrlModelEntity.power = power;
  }
  final CtrlModelPeak? peak = jsonConvert.convert<CtrlModelPeak>(json['peak']);
  if (peak != null) {
    ctrlModelEntity.peak = peak;
  }
  final CtrlModelDemand? demand = jsonConvert.convert<CtrlModelDemand>(
    json['demand'],
  );
  if (demand != null) {
    ctrlModelEntity.demand = demand;
  }
  final CtrlModelSub? sub = jsonConvert.convert<CtrlModelSub>(json['sub']);
  if (sub != null) {
    ctrlModelEntity.sub = sub;
  }
  final CtrlModelSelfGenerateInfo? selfGenerateInfo = jsonConvert
      .convert<CtrlModelSelfGenerateInfo>(json['selfGenerateInfo']);
  if (selfGenerateInfo != null) {
    ctrlModelEntity.selfGenerateInfo = selfGenerateInfo;
  }
  return ctrlModelEntity;
}

Map<String, dynamic> $CtrlModelEntityToJson(CtrlModelEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['activeType'] = entity.activeType;
  data['power'] = entity.power?.toJson();
  data['peak'] = entity.peak?.toJson();
  data['demand'] = entity.demand?.toJson();
  data['sub'] = entity.sub?.toJson();
  data['selfGenerateInfo'] = entity.selfGenerateInfo?.toJson();
  return data;
}

extension CtrlModelEntityExtension on CtrlModelEntity {
  CtrlModelEntity copyWith({
    int? activeType,
    CtrlModelPower? power,
    CtrlModelPeak? peak,
    CtrlModelDemand? demand,
    CtrlModelSub? sub,
    CtrlModelSelfGenerateInfo? selfGenerateInfo,
  }) {
    return CtrlModelEntity()
      ..activeType = activeType ?? this.activeType
      ..power = power ?? this.power
      ..peak = peak ?? this.peak
      ..demand = demand ?? this.demand
      ..sub = sub ?? this.sub
      ..selfGenerateInfo = selfGenerateInfo ?? this.selfGenerateInfo;
  }
}

CtrlModelPower $CtrlModelPowerFromJson(Map<String, dynamic> json) {
  final CtrlModelPower ctrlModelPower = CtrlModelPower();
  final double? power = jsonConvert.convert<double>(json['power']);
  if (power != null) {
    ctrlModelPower.power = power;
  }
  return ctrlModelPower;
}

Map<String, dynamic> $CtrlModelPowerToJson(CtrlModelPower entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['power'] = entity.power;
  return data;
}

extension CtrlModelPowerExtension on CtrlModelPower {
  CtrlModelPower copyWith({double? power}) {
    return CtrlModelPower()..power = power ?? this.power;
  }
}

CtrlModelPeak $CtrlModelPeakFromJson(Map<String, dynamic> json) {
  final CtrlModelPeak ctrlModelPeak = CtrlModelPeak();
  final List<CtrlModelPeakPeakList>? peakList =
      (json['peakList'] as List<dynamic>?)
          ?.map(
            (e) =>
                jsonConvert.convert<CtrlModelPeakPeakList>(e)
                    as CtrlModelPeakPeakList,
          )
          .toList();
  if (peakList != null) {
    ctrlModelPeak.peakList = peakList;
  }
  return ctrlModelPeak;
}

Map<String, dynamic> $CtrlModelPeakToJson(CtrlModelPeak entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['peakList'] = entity.peakList?.map((v) => v.toJson()).toList();
  return data;
}

extension CtrlModelPeakExtension on CtrlModelPeak {
  CtrlModelPeak copyWith({List<CtrlModelPeakPeakList>? peakList}) {
    return CtrlModelPeak()..peakList = peakList ?? this.peakList;
  }
}

CtrlModelPeakPeakList $CtrlModelPeakPeakListFromJson(
  Map<String, dynamic> json,
) {
  final CtrlModelPeakPeakList ctrlModelPeakPeakList = CtrlModelPeakPeakList();
  final String? name = jsonConvert.convert<String>(json['name']);
  if (name != null) {
    ctrlModelPeakPeakList.name = name;
  }
  final int? startMonth = jsonConvert.convert<int>(json['startMonth']);
  if (startMonth != null) {
    ctrlModelPeakPeakList.startMonth = startMonth;
  }
  final List<double>? powerList = (json['powerList'] as List<dynamic>?)
      ?.map((e) => jsonConvert.convert<double>(e) as double)
      .toList();
  if (powerList != null) {
    ctrlModelPeakPeakList.powerList = powerList;
  }
  return ctrlModelPeakPeakList;
}

Map<String, dynamic> $CtrlModelPeakPeakListToJson(
  CtrlModelPeakPeakList entity,
) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['name'] = entity.name;
  data['startMonth'] = entity.startMonth;
  data['powerList'] = entity.powerList;
  return data;
}

extension CtrlModelPeakPeakListExtension on CtrlModelPeakPeakList {
  CtrlModelPeakPeakList copyWith({
    String? name,
    int? startMonth,
    List<double>? powerList,
  }) {
    return CtrlModelPeakPeakList()
      ..name = name ?? this.name
      ..startMonth = startMonth ?? this.startMonth
      ..powerList = powerList ?? this.powerList;
  }
}

CtrlModelDemand $CtrlModelDemandFromJson(Map<String, dynamic> json) {
  final CtrlModelDemand ctrlModelDemand = CtrlModelDemand();
  final List<CtrlModelDemandDemandList>? demandList =
      (json['demandList'] as List<dynamic>?)
          ?.map(
            (e) =>
                jsonConvert.convert<CtrlModelDemandDemandList>(e)
                    as CtrlModelDemandDemandList,
          )
          .toList();
  if (demandList != null) {
    ctrlModelDemand.demandList = demandList;
  }
  return ctrlModelDemand;
}

Map<String, dynamic> $CtrlModelDemandToJson(CtrlModelDemand entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['demandList'] = entity.demandList?.map((v) => v.toJson()).toList();
  return data;
}

extension CtrlModelDemandExtension on CtrlModelDemand {
  CtrlModelDemand copyWith({List<CtrlModelDemandDemandList>? demandList}) {
    return CtrlModelDemand()..demandList = demandList ?? this.demandList;
  }
}

CtrlModelDemandDemandList $CtrlModelDemandDemandListFromJson(
  Map<String, dynamic> json,
) {
  final CtrlModelDemandDemandList ctrlModelDemandDemandList =
      CtrlModelDemandDemandList();
  final double? power = jsonConvert.convert<double>(json['power']);
  if (power != null) {
    ctrlModelDemandDemandList.power = power;
  }
  final String? startDate = jsonConvert.convert<String>(json['startDate']);
  if (startDate != null) {
    ctrlModelDemandDemandList.startDate = startDate;
  }
  final String? endDate = jsonConvert.convert<String>(json['endDate']);
  if (endDate != null) {
    ctrlModelDemandDemandList.endDate = endDate;
  }
  final String? startTime = jsonConvert.convert<String>(json['startTime']);
  if (startTime != null) {
    ctrlModelDemandDemandList.startTime = startTime;
  }
  final String? endTime = jsonConvert.convert<String>(json['endTime']);
  if (endTime != null) {
    ctrlModelDemandDemandList.endTime = endTime;
  }
  final double? dpower = jsonConvert.convert<double>(json['dpower']);
  if (dpower != null) {
    ctrlModelDemandDemandList.dpower = dpower;
  }
  return ctrlModelDemandDemandList;
}

Map<String, dynamic> $CtrlModelDemandDemandListToJson(
  CtrlModelDemandDemandList entity,
) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['power'] = entity.power;
  data['startDate'] = entity.startDate;
  data['endDate'] = entity.endDate;
  data['startTime'] = entity.startTime;
  data['endTime'] = entity.endTime;
  data['dpower'] = entity.dpower;
  return data;
}

extension CtrlModelDemandDemandListExtension on CtrlModelDemandDemandList {
  CtrlModelDemandDemandList copyWith({
    double? power,
    String? startDate,
    String? endDate,
    String? startTime,
    String? endTime,
    double? dpower,
  }) {
    return CtrlModelDemandDemandList()
      ..power = power ?? this.power
      ..startDate = startDate ?? this.startDate
      ..endDate = endDate ?? this.endDate
      ..startTime = startTime ?? this.startTime
      ..endTime = endTime ?? this.endTime
      ..dpower = dpower ?? this.dpower;
  }
}

CtrlModelSub $CtrlModelSubFromJson(Map<String, dynamic> json) {
  final CtrlModelSub ctrlModelSub = CtrlModelSub();
  final int? id = jsonConvert.convert<int>(json['id']);
  if (id != null) {
    ctrlModelSub.id = id;
  }
  final String? name = jsonConvert.convert<String>(json['name']);
  if (name != null) {
    ctrlModelSub.name = name;
  }
  final int? type = jsonConvert.convert<int>(json['type']);
  if (type != null) {
    ctrlModelSub.type = type;
  }
  final int? nowPower = jsonConvert.convert<int>(json['nowPower']);
  if (nowPower != null) {
    ctrlModelSub.nowPower = nowPower;
  }
  final int? allocPower = jsonConvert.convert<int>(json['allocPower']);
  if (allocPower != null) {
    ctrlModelSub.allocPower = allocPower;
  }
  final dynamic child = json['child'];
  if (child != null) {
    ctrlModelSub.child = child;
  }
  return ctrlModelSub;
}

Map<String, dynamic> $CtrlModelSubToJson(CtrlModelSub entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['id'] = entity.id;
  data['name'] = entity.name;
  data['type'] = entity.type;
  data['nowPower'] = entity.nowPower;
  data['allocPower'] = entity.allocPower;
  data['child'] = entity.child;
  return data;
}

extension CtrlModelSubExtension on CtrlModelSub {
  CtrlModelSub copyWith({
    int? id,
    String? name,
    int? type,
    int? nowPower,
    int? allocPower,
    dynamic child,
  }) {
    return CtrlModelSub()
      ..id = id ?? this.id
      ..name = name ?? this.name
      ..type = type ?? this.type
      ..nowPower = nowPower ?? this.nowPower
      ..allocPower = allocPower ?? this.allocPower
      ..child = child ?? this.child;
  }
}

CtrlModelSelfGenerateInfo $CtrlModelSelfGenerateInfoFromJson(
  Map<String, dynamic> json,
) {
  final CtrlModelSelfGenerateInfo ctrlModelSelfGenerateInfo =
      CtrlModelSelfGenerateInfo();
  final int? activeType = jsonConvert.convert<int>(json['activeType']);
  if (activeType != null) {
    ctrlModelSelfGenerateInfo.activeType = activeType;
  }
  final int? feedIn = jsonConvert.convert<int>(json['feedIn']);
  if (feedIn != null) {
    ctrlModelSelfGenerateInfo.feedIn = feedIn;
  }
  final double? startSoc = jsonConvert.convert<double>(json['startSoc']);
  if (startSoc != null) {
    ctrlModelSelfGenerateInfo.startSoc = startSoc;
  }
  final double? stopSoc = jsonConvert.convert<double>(json['stopSoc']);
  if (stopSoc != null) {
    ctrlModelSelfGenerateInfo.stopSoc = stopSoc;
  }
  final double? margin = jsonConvert.convert<double>(json['margin']);
  if (margin != null) {
    ctrlModelSelfGenerateInfo.margin = margin;
  }
  final List<CtrlModelSelfGenerateInfoCompulsory>? compulsory =
      (json['compulsory'] as List<dynamic>?)
          ?.map(
            (e) =>
                jsonConvert.convert<CtrlModelSelfGenerateInfoCompulsory>(e)
                    as CtrlModelSelfGenerateInfoCompulsory,
          )
          .toList();
  if (compulsory != null) {
    ctrlModelSelfGenerateInfo.compulsory = compulsory;
  }
  return ctrlModelSelfGenerateInfo;
}

Map<String, dynamic> $CtrlModelSelfGenerateInfoToJson(
  CtrlModelSelfGenerateInfo entity,
) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['activeType'] = entity.activeType;
  data['feedIn'] = entity.feedIn;
  data['startSoc'] = entity.startSoc;
  data['stopSoc'] = entity.stopSoc;
  data['margin'] = entity.margin;
  data['compulsory'] = entity.compulsory?.map((v) => v.toJson()).toList();
  return data;
}

extension CtrlModelSelfGenerateInfoExtension on CtrlModelSelfGenerateInfo {
  CtrlModelSelfGenerateInfo copyWith({
    int? activeType,
    int? feedIn,
    double? startSoc,
    double? stopSoc,
    double? margin,
    List<CtrlModelSelfGenerateInfoCompulsory>? compulsory,
  }) {
    return CtrlModelSelfGenerateInfo()
      ..activeType = activeType ?? this.activeType
      ..feedIn = feedIn ?? this.feedIn
      ..startSoc = startSoc ?? this.startSoc
      ..stopSoc = stopSoc ?? this.stopSoc
      ..margin = margin ?? this.margin
      ..compulsory = compulsory ?? this.compulsory;
  }
}

CtrlModelSelfGenerateInfoCompulsory
$CtrlModelSelfGenerateInfoCompulsoryFromJson(Map<String, dynamic> json) {
  final CtrlModelSelfGenerateInfoCompulsory
  ctrlModelSelfGenerateInfoCompulsory = CtrlModelSelfGenerateInfoCompulsory();
  final int? startSocEnable = jsonConvert.convert<int>(json['startSocEnable']);
  if (startSocEnable != null) {
    ctrlModelSelfGenerateInfoCompulsory.startSocEnable = startSocEnable;
  }
  final double? startSoc = jsonConvert.convert<double>(json['startSoc']);
  if (startSoc != null) {
    ctrlModelSelfGenerateInfoCompulsory.startSoc = startSoc;
  }
  final int? stopSocEnable = jsonConvert.convert<int>(json['stopSocEnable']);
  if (stopSocEnable != null) {
    ctrlModelSelfGenerateInfoCompulsory.stopSocEnable = stopSocEnable;
  }
  final double? stopSoc = jsonConvert.convert<double>(json['stopSoc']);
  if (stopSoc != null) {
    ctrlModelSelfGenerateInfoCompulsory.stopSoc = stopSoc;
  }
  final int? stopStrategy = jsonConvert.convert<int>(json['stopStrategy']);
  if (stopStrategy != null) {
    ctrlModelSelfGenerateInfoCompulsory.stopStrategy = stopStrategy;
  }
  final int? isBack = jsonConvert.convert<int>(json['isBack']);
  if (isBack != null) {
    ctrlModelSelfGenerateInfoCompulsory.isBack = isBack;
  }
  final double? power = jsonConvert.convert<double>(json['power']);
  if (power != null) {
    ctrlModelSelfGenerateInfoCompulsory.power = power;
  }
  final String? startDate = jsonConvert.convert<String>(json['startDate']);
  if (startDate != null) {
    ctrlModelSelfGenerateInfoCompulsory.startDate = startDate;
  }
  final String? endDate = jsonConvert.convert<String>(json['endDate']);
  if (endDate != null) {
    ctrlModelSelfGenerateInfoCompulsory.endDate = endDate;
  }
  final String? startTime = jsonConvert.convert<String>(json['startTime']);
  if (startTime != null) {
    ctrlModelSelfGenerateInfoCompulsory.startTime = startTime;
  }
  final String? endTime = jsonConvert.convert<String>(json['endTime']);
  if (endTime != null) {
    ctrlModelSelfGenerateInfoCompulsory.endTime = endTime;
  }
  return ctrlModelSelfGenerateInfoCompulsory;
}

Map<String, dynamic> $CtrlModelSelfGenerateInfoCompulsoryToJson(
  CtrlModelSelfGenerateInfoCompulsory entity,
) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['startSocEnable'] = entity.startSocEnable;
  data['startSoc'] = entity.startSoc;
  data['stopSocEnable'] = entity.stopSocEnable;
  data['stopSoc'] = entity.stopSoc;
  data['stopStrategy'] = entity.stopStrategy;
  data['isBack'] = entity.isBack;
  data['power'] = entity.power;
  data['startDate'] = entity.startDate;
  data['endDate'] = entity.endDate;
  data['startTime'] = entity.startTime;
  data['endTime'] = entity.endTime;
  return data;
}

extension CtrlModelSelfGenerateInfoCompulsoryExtension
    on CtrlModelSelfGenerateInfoCompulsory {
  CtrlModelSelfGenerateInfoCompulsory copyWith({
    int? startSocEnable,
    double? startSoc,
    int? stopSocEnable,
    double? stopSoc,
    int? stopStrategy,
    int? isBack,
    double? power,
    String? startDate,
    String? endDate,
    String? startTime,
    String? endTime,
  }) {
    return CtrlModelSelfGenerateInfoCompulsory()
      ..startSocEnable = startSocEnable ?? this.startSocEnable
      ..startSoc = startSoc ?? this.startSoc
      ..stopSocEnable = stopSocEnable ?? this.stopSocEnable
      ..stopSoc = stopSoc ?? this.stopSoc
      ..stopStrategy = stopStrategy ?? this.stopStrategy
      ..isBack = isBack ?? this.isBack
      ..power = power ?? this.power
      ..startDate = startDate ?? this.startDate
      ..endDate = endDate ?? this.endDate
      ..startTime = startTime ?? this.startTime
      ..endTime = endTime ?? this.endTime;
  }
}
