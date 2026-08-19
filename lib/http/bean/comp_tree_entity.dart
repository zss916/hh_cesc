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
  bool? isSelected;
  bool? isChildSelected;
  bool? isChildChildSelected;

  String get labelName => Get.isZh ? (labelCn ?? "") : (labelEn ?? "");

  CompTreeEntity();

  factory CompTreeEntity.fromJson(Map<String, dynamic> json) =>
      $CompTreeEntityFromJson(json);

  Map<String, dynamic> toJson() => $CompTreeEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }

  /// 递归函数，用于向下传递 isSelected = false 的状态
  /// 如果当前节点的 isSelected 为 false，则将其所有子节点的 isSelected 也设为 false
  void propagateUnselectedState() {
    // 1. 检查当前节点是否需要向下传递状态
    if (isSelected == false) {
      // 2. 遍历所有子节点
      if (child != null) {
        for (var childNode in child!) {
          // 3. 将子节点的 isSelected 设为 false
          childNode.isSelected = false;
          // 4. 递归调用子节点的 propagateUnselectedState 方法
          // 确保孙子辈、曾孙子辈等所有后代节点都被处理
          childNode.propagateUnselectedState();
        }
      }
    }
    // 如果当前节点的 isSelected 不为 false，则不做任何操作，直接返回
  }
}
