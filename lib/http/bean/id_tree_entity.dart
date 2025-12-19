import 'dart:convert';

import 'package:cescpro/core/helper/extension_helper.dart';
import 'package:cescpro/core/translations/en.dart';
import 'package:cescpro/generated/json/base/json_field.dart';
import 'package:cescpro/generated/json/id_tree_entity.g.dart';
import 'package:get/get.dart';

export 'package:cescpro/generated/json/id_tree_entity.g.dart';

@JsonSerializable()
class IdTreeEntity {
  String? label;
  String? key;
  int? val;
  dynamic type;
  dynamic labelVal;
  String? labelCn;
  String? labelEn;
  List<IdTreeEntity>? child;

  ///本地
  bool? isSelected;
  bool? isChildSelected;
  bool? isChildChildSelected;

  IdTreeEntity();

  String get showLabel => Get.isEn ? (labelEn ?? "") : (labelCn ?? "");

  //["ARR", "CLU", "PCS", "AIR_COOL", "METER", "DIDO", "CELL"]
  String showChildLabel({int index = 0}) {
    if (label == "ARR") {
      return TKey.stack.tr;
    } else if (label == "CLU") {
      return TKey.cluster.tr;
    } else if (label == "PCS") {
      return "PCS";
    } else if (label == "METER") {
      if (index == 0) {
        return TKey.demandMeter.tr;
      } else if (index == 1) {
        return TKey.meteringMeter.tr;
      } else if (index == 2) {
        return TKey.pvMeter.tr;
      } else if (index == 3) {
        return TKey.energyStorageMeter.tr;
      } else if (index == 4) {
        return TKey.loadMeter.tr;
      }
    } else if (label == "DIDO") {
      return "DI/DO";
    } else if (label == "CELL") {
      if (label == "ARR") {
        return TKey.stack.tr;
      } else if (label == "CLU") {
        return TKey.cluster.tr;
      } else {
        return "CELL";
      }
    } else if (label == "FIRE") {
      return TKey.fire.tr;
    }
    return label ?? "";
  }

  /*String get showChildLabel =>
      Get.isEn ? (childLabelNameEn ?? "") : (childLabelNameCn ?? "");
*/
  int? get didValue => val;

  int? get idValue => child?.first.val;

  factory IdTreeEntity.fromJson(Map<String, dynamic> json) =>
      $IdTreeEntityFromJson(json);

  Map<String, dynamic> toJson() => $IdTreeEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

/*@JsonSerializable()
class IdTreeChild {
  String? label;
  String? key;
  int? val;
  dynamic type;
  dynamic labelVal;
  String? labelCn;
  String? labelEn;
  List<IdTreeChild>? child;

  String get showLabel => Get.isEn ? (labelEn ?? "") : (labelCn ?? "");

  int? get didValue => val;

  int? get idValue => child?.first.val;

  IdTreeChild();

  factory IdTreeChild.fromJson(Map<String, dynamic> json) =>
      $IdTreeChildFromJson(json);

  Map<String, dynamic> toJson() => $IdTreeChildToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}*/
