import 'dart:convert';

import 'package:cescpro/core/helper/extension_helper.dart';
import 'package:cescpro/generated/json/base/json_field.dart';
import 'package:cescpro/generated/json/comp_tree_entity.g.dart';
import 'package:get/get_core/src/get_main.dart';

export 'package:cescpro/generated/json/comp_tree_entity.g.dart';

@JsonSerializable()
class CompTreeEntity {
  String? label;
  String? key;
  int? val;
  String? type;
  String? labelVal;
  String? labelCn;
  String? labelEn;
  List<CompTreeEntity>? child;

  String get labelName => Get.isEn ? (labelEn ?? "") : (labelCn ?? "");

  CompTreeEntity();

  factory CompTreeEntity.fromJson(Map<String, dynamic> json) =>
      $CompTreeEntityFromJson(json);

  Map<String, dynamic> toJson() => $CompTreeEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

/*@JsonSerializable()
class CompTreeChild {
  String? label;
  String? key;
  int? val;
  String? type;
  String? labelVal;
  String? labelCn;
  String? labelEn;
  List<CompTreeChild>? child;

  CompTreeChild();

  factory CompTreeChild.fromJson(Map<String, dynamic> json) =>
      $CompTreeChildFromJson(json);

  Map<String, dynamic> toJson() => $CompTreeChildToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}*/
