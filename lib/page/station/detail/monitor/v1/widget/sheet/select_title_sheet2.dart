import 'package:cescpro/core/setting/app_loading.dart';
import 'package:cescpro/core/translations/en.dart';
import 'package:cescpro/http/bean/id_tree_entity.dart';
import 'package:cescpro/page/station/detail/monitor/v1/widget/sheet/select_title_item2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

void showSelectTitleSheet2(
  List<IdTreeEntity> titles, {
  Function(String, int? did, int? id, int? childId)? onSelect,
}) {
  Get.bottomSheet(
    SelectTitle(titles: titles, onSelect: onSelect),
    isScrollControlled: true,
  );
}

class SelectTitle extends StatefulWidget {
  final List<IdTreeEntity> titles;
  final Function(String, int? did, int? id, int? childId)? onSelect;
  const SelectTitle({super.key, required this.titles, this.onSelect});

  @override
  State<SelectTitle> createState() => _SelectTitleState();
}

class _SelectTitleState extends State<SelectTitle> {
  List<String> list = [];

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
                    list.clear();
                    IdTreeEntity? title1 = widget.titles
                        .where((e) => e.isSelected == true)
                        .toList()
                        .firstOrNull;
                    if (title1?.selectTitle != null) {
                      list.add(title1?.selectTitle ?? "");
                    }
                    IdTreeEntity? title2 = (title1?.child ?? [])
                        .where((e) => e.isChildSelected == true)
                        .toList()
                        .firstOrNull;
                    if (title2?.selectTitle != null) {
                      list.add(title2?.selectTitle ?? "");
                    }
                    IdTreeEntity? title3 = (title2?.child ?? [])
                        .where((e) => e.isChildChildSelected == true)
                        .toList()
                        .firstOrNull;
                    if (title3?.selectTitle != null) {
                      list.add(title3?.selectTitle ?? "");
                    }

                    if (list.isNotEmpty) {
                      String topTitle = list.join("/").toString();
                      int? did = title1?.val;
                      int? id = title2?.val;
                      int? childId = title3?.val;
                      // debugPrint("topTitle ===> $topTitle");
                      widget.onSelect?.call(topTitle, did, id, childId);
                      Get.back();
                    } else {
                      AppLoading.showError(TKey.selectHint.tr);
                    }
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
                IdTreeEntity item = widget.titles[i];
                return SelectTitleItem2(
                  total: widget.titles,
                  index: i,
                  item: item,
                  onTap: () {
                    setState(() {});
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    list.clear();
    super.dispose();
  }
}
