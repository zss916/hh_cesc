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

  String get labelName => Get.isEn ? (labelEn ?? "") : (labelCn ?? "");

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

/*class TreeExtractor {
  // 存储结果的变量
  int? _did;
  int? _nodeNo;
  int? _devNo;

  // 入口方法：从根列表开始提取
  (int?, int?, int?) extractFromTree(List<CompTreeEntity> rootNodes) {
    for (var node in rootNodes) {
      _traverse(node, 1); // 层级从1开始（第一层）
    }
    return (_did, _nodeNo, _devNo);
  }

  // 递归遍历方法
  void _traverse(CompTreeEntity node, int level) {
    // 如果当前节点选中，根据层级提取对应字段
    if (node.isSelected == true) {
      switch (level) {
        case 1:
          _did = node.val;
          break;
        case 2:
          _nodeNo = node.val;
          break;
        case 3:
          _devNo = node.val;
          break;
      }
    }

    // 只遍历到第三层，第四层及以下忽略
    if (level >= 3) return;

    // 递归遍历子节点（层级+1）
    if (node.child != null) {
      for (var childNode in node.child!) {
        _traverse(childNode, level + 1);
      }
    }
  }
}*/

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
