import 'package:cescpro/http/bean/id_tree_entity.dart';
import 'package:cescpro/page/station/detail/monitor/v1/widget/sheet/select_title_child_item.dart';
import 'package:flutter/material.dart';

class SelectTitleItem2 extends StatelessWidget {
  final IdTreeEntity item;
  final List<IdTreeEntity> total;
  final int index;
  final Function()? onTap;
  const SelectTitleItem2({
    super.key,
    required this.total,
    required this.item,
    required this.index,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        // 列表项本身
        InkWell(
          onTap: () {
            if (item.isSelected == true) {
              ///收起来
              item.isSelected = false;
              for (IdTreeEntity child in (item.child ?? [])) {
                child.isChildSelected = false;
              }
            } else {
              ///打开
              for (IdTreeEntity value in total) {
                value.isSelected = false;
              }
              for (IdTreeEntity child in (item.child ?? [])) {
                child.isChildSelected = false;
              }
              item.isSelected = true;
            }

            item.selectTitle = item.showLabel;
            onTap?.call();
          },
          child: Padding(
            padding: EdgeInsets.only(
              left: 0 * 20.0,
              top: 12.0,
              bottom: 12.0,
              right: 16.0,
            ),
            child: Row(
              children: [
                // 如果有子项，显示展开/折叠图标
                Icon(
                  (item.isSelected == true)
                      ? Icons.expand_more
                      : Icons.chevron_right,
                  size: 20,
                  color: (item.isSelected == true)
                      ? Color(0xFF43FFFF)
                      : Colors.white,
                ),
                const SizedBox(width: 8.0),
                Text(
                  item.showLabel,
                  style: TextStyle(
                    color: (item.isSelected == true)
                        ? Color(0xFF43FFFF)
                        : Colors.white,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
        ),

        // 如果展开，则递归渲染子列表
        if ((item.isSelected == true) && (item.child ?? []).isNotEmpty)
          ListView.builder(
            shrinkWrap: true, // 至关重要！让 ListView 适应子内容的高度
            physics: const NeverScrollableScrollPhysics(), // 禁止子列表滚动
            itemCount: (item.child ?? []).length,
            itemBuilder: (context, index) {
              IdTreeEntity childItem = (item.child ?? [])[index];
              //childItem.showLabel;
              //debugPrint("===>>${childItem.childLabelName}");
              return SelectTitleChildItem2(
                total: item.child ?? [],
                item: childItem,
                index: index,
                onTap: () {
                  onTap?.call();
                },
              );
            },
          ),
      ],
    );
  }
}
