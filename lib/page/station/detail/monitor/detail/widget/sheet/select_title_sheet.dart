import 'package:cescpro/core/helper/extension_helper.dart';
import 'package:cescpro/core/translations/en.dart';
import 'package:cescpro/http/bean/comp_tree_entity.dart';
import 'package:cescpro/page/station/detail/monitor/detail/widget/child/nested_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

void showSelectTitleSheet(
  List<CompTreeEntity> titles, {
  Function(String)? onSelect,
}) {
  Get.bottomSheet(
    SelectTitleWidget(titles: titles, onSelect: onSelect),
    isScrollControlled: true,
  );
}

class SelectTitleWidget extends StatefulWidget {
  final List<CompTreeEntity> titles;
  final Function(String)? onSelect;
  const SelectTitleWidget({super.key, required this.titles, this.onSelect});

  @override
  State<SelectTitleWidget> createState() => _SelectTitleWidgetState();
}

class _SelectTitleWidgetState extends State<SelectTitleWidget> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(maxHeight: Get.height / 2),
      decoration: BoxDecoration(
        color: Color(0xFF23282E),
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(10),
          topLeft: Radius.circular(10),
        ),
      ),
      padding: EdgeInsetsDirectional.symmetric(
        horizontal: 20.w,
        vertical: 20.h,
      ),
      width: double.maxFinite,
      child: Column(
        spacing: 20.h,
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            margin: EdgeInsetsDirectional.only(bottom: 5),
            width: double.maxFinite,
            child: Row(
              children: [
                InkWell(
                  onTap: () {
                    Get.back();
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white10,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    padding: EdgeInsetsDirectional.symmetric(
                      horizontal: 10,
                      vertical: 5,
                    ),
                    child: Text(
                      TKey.cancel.tr,
                      style: TextStyle(fontSize: 14, color: Colors.white),
                    ),
                  ),
                ),
                Spacer(),
                InkWell(
                  onTap: () {
                    List<Map<String, dynamic>> value = widget.titles
                        .where((e) => e.isSelected == true)
                        .map((e) => e.toJson())
                        .toList();

                    String topTitle = handExtractPath(value);
                    CompTreeEntity first = widget.titles
                        .where((e) => e.isSelected == true)
                        .toList()
                        .first;
                    int? did = first.val;
                    CompTreeEntity second = (first.child ?? [])
                        .where((e) => e.isSelected == true)
                        .first;
                    int? nodeNo = second.val;
                    CompTreeEntity third = (second.child ?? [])
                        .where((e) => e.isSelected == true)
                        .first;
                    int? devNO = third.val;

                    //debugPrint("topTitle ==> ${topTitle}");
                    // widget.onSelect?.call(topTitle);
                    //Get.back();
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: Color(0x4D43FFFF),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    padding: EdgeInsetsDirectional.symmetric(
                      horizontal: 10,
                      vertical: 5,
                    ),
                    child: Text(
                      TKey.confirm.tr,
                      style: TextStyle(fontSize: 14, color: Color(0xFF43FFFF)),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: widget.titles.length,
              itemBuilder: (_, i) {
                CompTreeEntity item = widget.titles[i];
                return NestedItemWidget(
                  item: item,
                  isExpanded: isExpanded,
                  onToggle: (CompTreeEntity item) {
                    // String topTitle = handExtractPath([item.toJson()]);
                    // debugPrint("CompTreeEntity ==> ${item.toJson()}");
                  },
                  level: 0,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

///处理路径
String handExtractPath(List<dynamic> data) {
  List<String> pathSegments = [];

  void traverse(Map<String, dynamic> node) {
    if (node['labelCn'] != null &&
        node['labelEn'] != null &&
        node['isSelected'] == true) {
      pathSegments.add(Get.isEn ? node['labelEn'] : node['labelCn']);
    }

    if (node['child'] != null && node['child'] is List) {
      List<dynamic> children = node['child'];
      if (children.isNotEmpty) {
        traverse(children.first);
      }
    }
  }

  if (data.isNotEmpty) {
    traverse(data.first);
  }

  return pathSegments.join('/');
}
