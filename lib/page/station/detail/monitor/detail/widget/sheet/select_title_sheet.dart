import 'package:cescpro/core/setting/app_loading.dart';
import 'package:cescpro/core/translations/en.dart';
import 'package:cescpro/http/bean/comp_tree_entity.dart';
import 'package:cescpro/page/station/detail/monitor/detail/widget/sheet/select_title_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

void showSelectTitleSheet(
  List<CompTreeEntity> titles, {
  Function(String, int? did, int? nodeNo, int? devNo)? onSelect,
}) {
  /*Get.bottomSheet(
    SelectTitleWidget(titles: titles, onSelect: onSelect),
    isScrollControlled: true,
  );*/

  Get.bottomSheet(
    SelectTitle(titles: titles, onSelect: onSelect),
    isScrollControlled: true,
    ignoreSafeArea: false,
  );
}

class SelectTitle extends StatefulWidget {
  final List<CompTreeEntity> titles;
  final Function(String, int? did, int? nodeNo, int? devNo)? onSelect;
  const SelectTitle({super.key, required this.titles, this.onSelect});

  @override
  State<SelectTitle> createState() => _SelectTitleState();
}

class _SelectTitleState extends State<SelectTitle> {
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
                    CompTreeEntity? title1 = widget.titles
                        .where((e) => e.isSelected == true)
                        .toList()
                        .firstOrNull;
                    CompTreeEntity? title2 = (title1?.child ?? [])
                        .where((e) => e.isChildSelected == true)
                        .toList()
                        .firstOrNull;
                    CompTreeEntity? title3 = (title2?.child ?? [])
                        .where((e) => e.isChildChildSelected == true)
                        .toList()
                        .firstOrNull;

                    if (title1 != null && title2 != null && title3 != null) {
                      String topTitle =
                          "${title1.labelName}/${title2.labelName}/${title3.labelName}";
                      int? did = title1.val;
                      int? nodeNo = title2.val;
                      int? devNO = title3.val;
                      // debugPrint("topTitle ===> $topTitle");
                      widget.onSelect?.call(topTitle, did, nodeNo, devNO);
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
                CompTreeEntity item = widget.titles[i];
                return SelectTitleItem(
                  total: widget.titles,
                  item: item,
                  onTap: () {
                    // debugPrint("SelectTitleItem====>>>>");
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
}
