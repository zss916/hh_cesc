import 'package:cescpro/http/bean/id_tree_entity.dart';
import 'package:flutter/material.dart';

class SelectTitleChildChildItem2 extends StatelessWidget {
  final IdTreeEntity item;
  final List<IdTreeEntity> total;
  final Function()? onTap;
  final int index;
  const SelectTitleChildChildItem2({
    super.key,
    required this.total,
    required this.item,
    this.onTap,
    required this.index,
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
              for (IdTreeEntity value in total) {
                value.isChildChildSelected = false;
              }
              item.isChildChildSelected = true;
            }

            item.selectTitle = item.showLabel.trim().isEmpty
                ? ("${index + 1}# ${item.showChildLabel()}")
                : (item.showLabel);
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
                if ((item.child ?? []).isNotEmpty)
                  Icon(
                    (item.isChildSelected == true)
                        ? Icons.expand_more
                        : Icons.chevron_right,
                    size: 20,
                    color: (item.isChildSelected == true)
                        ? Color(0xFF43FFFF)
                        : Colors.white,
                  ),
                if ((item.child ?? []).isNotEmpty) const SizedBox(width: 8.0),
                // 如果有子项，显示展开/折叠图标
                Text(
                  item.showLabel.trim().isEmpty
                      ? ("${index + 1}# ${item.showChildLabel()}")
                      : (item.showLabel),
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
