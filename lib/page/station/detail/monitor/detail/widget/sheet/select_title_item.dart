import 'package:cescpro/http/bean/comp_tree_entity.dart';
import 'package:cescpro/page/station/detail/monitor/detail/widget/sheet/select_title_child_item.dart';
import 'package:flutter/material.dart';

class SelectTitleItem extends StatelessWidget {
  final CompTreeEntity item;
  final List<CompTreeEntity> total;
  final Function()? onTap;
  const SelectTitleItem({
    super.key,
    required this.total,
    required this.item,
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
              for (CompTreeEntity child in (item.child ?? [])) {
                child.isChildSelected = false;
              }
            } else {
              ///打开
              for (CompTreeEntity value in total) {
                value.isSelected = false;
              }
              for (CompTreeEntity child in (item.child ?? [])) {
                child.isChildSelected = false;
              }
              item.isSelected = true;
            }
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
                  item.labelName,
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
              CompTreeEntity childItem = (item.child ?? [])[index];
              return SelectTitleChildItem(
                total: item.child ?? [],
                item: childItem,
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
