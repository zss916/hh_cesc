import 'package:cescpro/http/bean/comp_tree_entity.dart';
import 'package:flutter/material.dart';

class SelectTitleChildChildItem extends StatelessWidget {
  final CompTreeEntity item;
  final List<CompTreeEntity> total;
  final Function()? onTap;
  const SelectTitleChildChildItem({
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
            if (item.isChildChildSelected == true) {
              item.isChildChildSelected = false;
            } else {
              for (CompTreeEntity value in total) {
                value.isChildChildSelected = false;
              }
              item.isChildChildSelected = true;
            }
            onTap?.call();
          },
          child: Padding(
            padding: EdgeInsets.only(
              left: (2 * 20.0) + 28,
              top: 12.0,
              bottom: 12.0,
              right: 16.0,
            ),
            child: Row(
              children: [
                // 如果有子项，显示展开/折叠图标
                Text(
                  item.labelName,
                  style: TextStyle(
                    color: (item.isChildChildSelected == true)
                        ? Color(0xFF43FFFF)
                        : Colors.white,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
