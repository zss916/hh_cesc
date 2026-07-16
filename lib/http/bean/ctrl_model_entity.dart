import 'dart:convert';

import 'package:cescpro/core/translations/en.dart';
import 'package:cescpro/generated/json/base/json_field.dart';
import 'package:cescpro/generated/json/ctrl_model_entity.g.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';

export 'package:cescpro/generated/json/ctrl_model_entity.g.dart';

@JsonSerializable()
class CtrlModelEntity {
  int? activeType;
  CtrlModelPower? power;
  CtrlModelPeak? peak;
  CtrlModelDemand? demand;
  CtrlModelSub? sub;
  CtrlModelSelfGenerateInfo? selfGenerateInfo;

  CtrlModelEntity();

  factory CtrlModelEntity.fromJson(Map<String, dynamic> json) =>
      $CtrlModelEntityFromJson(json);

  Map<String, dynamic> toJson() => $CtrlModelEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }

  ///是否运行中
  bool get running => activeType != null;

  String get activeTypeText {
    switch (activeType) {
      case 1:
        return TKey.totalPowerType.tr;
      case 2:
        return TKey.subSystemType.tr;
      case 3:
        return TKey.peakShavingAndValleyFillingMonthType.tr;
      case 4:
        return TKey.peakShavingAndValleyFillingDayType.tr;
      case 5:
        return TKey.selfGenerationAndSelfConsumptionType.tr;
      case 6:
        return TKey.aiModeType.tr;
      default:
        return '--';
    }
  }
}

@JsonSerializable()
class CtrlModelPower {
  double? power;

  CtrlModelPower();

  factory CtrlModelPower.fromJson(Map<String, dynamic> json) =>
      $CtrlModelPowerFromJson(json);

  Map<String, dynamic> toJson() => $CtrlModelPowerToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class CtrlModelPeak {
  List<CtrlModelPeakPeakList>? peakList;

  CtrlModelPeak();

  factory CtrlModelPeak.fromJson(Map<String, dynamic> json) =>
      $CtrlModelPeakFromJson(json);

  Map<String, dynamic> toJson() => $CtrlModelPeakToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class CtrlModelPeakPeakList {
  String? name;
  int? startMonth;
  List<double>? powerList;

  CtrlModelPeakPeakList();

  factory CtrlModelPeakPeakList.fromJson(Map<String, dynamic> json) =>
      $CtrlModelPeakPeakListFromJson(json);

  Map<String, dynamic> toJson() => $CtrlModelPeakPeakListToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class CtrlModelDemand {
  List<CtrlModelDemandDemandList>? demandList;

  CtrlModelDemand();

  factory CtrlModelDemand.fromJson(Map<String, dynamic> json) =>
      $CtrlModelDemandFromJson(json);

  Map<String, dynamic> toJson() => $CtrlModelDemandToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class CtrlModelDemandDemandList {
  double? power;
  String? startDate;
  String? endDate;
  String? startTime;
  String? endTime;
  double? dpower;

  CtrlModelDemandDemandList();

  factory CtrlModelDemandDemandList.fromJson(Map<String, dynamic> json) =>
      $CtrlModelDemandDemandListFromJson(json);

  Map<String, dynamic> toJson() => $CtrlModelDemandDemandListToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class CtrlModelSub {
  int? id;
  String? name;
  int? type;
  int? nowPower;
  int? allocPower;
  dynamic child;

  CtrlModelSub();

  factory CtrlModelSub.fromJson(Map<String, dynamic> json) =>
      $CtrlModelSubFromJson(json);

  Map<String, dynamic> toJson() => $CtrlModelSubToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class CtrlModelSelfGenerateInfo {
  int? activeType;
  int? feedIn;
  double? startSoc;
  double? stopSoc;
  double? margin;
  List<CtrlModelSelfGenerateInfoCompulsory>? compulsory;

  CtrlModelSelfGenerateInfo();

  factory CtrlModelSelfGenerateInfo.fromJson(Map<String, dynamic> json) =>
      $CtrlModelSelfGenerateInfoFromJson(json);

  Map<String, dynamic> toJson() => $CtrlModelSelfGenerateInfoToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class CtrlModelSelfGenerateInfoCompulsory {
  int? startSocEnable;
  double? startSoc;
  int? stopSocEnable;
  double? stopSoc;
  int? stopStrategy;
  int? isBack;
  double? power;
  String? startDate;
  String? endDate;
  String? startTime;
  String? endTime;

  CtrlModelSelfGenerateInfoCompulsory();

  factory CtrlModelSelfGenerateInfoCompulsory.fromJson(
    Map<String, dynamic> json,
  ) => $CtrlModelSelfGenerateInfoCompulsoryFromJson(json);

  Map<String, dynamic> toJson() =>
      $CtrlModelSelfGenerateInfoCompulsoryToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}
