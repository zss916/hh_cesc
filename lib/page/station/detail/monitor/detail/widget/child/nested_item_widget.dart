import 'package:cescpro/http/bean/comp_tree_entity.dart';
import 'package:flutter/material.dart';

///多级嵌套
class NestedItemWidget extends StatefulWidget {
  final CompTreeEntity item;
  final bool isExpanded;
  final Function(CompTreeEntity)? onToggle;
  final int level;
  const NestedItemWidget({
    super.key,
    required this.item,
    required this.isExpanded,
    this.onToggle,
    required this.level,
  });

  @override
  State<NestedItemWidget> createState() => NestedItemWidgetState();
}

class NestedItemWidgetState extends State<NestedItemWidget> {
  bool isItemExpanded = false;

  @override
  void initState() {
    super.initState();
    isItemExpanded = widget.isExpanded;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        // 列表项本身
        InkWell(
          onTap: () {
            setState(() {
              isItemExpanded = !isItemExpanded;
              if (isItemExpanded) {
                widget.item.isSelected = isItemExpanded;
              } else {
                widget.item.isSelected = isItemExpanded;
                widget.item.propagateUnselectedState();
              }
              widget.onToggle?.call(widget.item);
            });
          },
          child: Padding(
            padding: EdgeInsets.only(
              left: widget.level * 20.0,
              top: 12.0,
              bottom: 12.0,
              right: 16.0,
            ),
            child: Row(
              children: [
                // 如果有子项，显示展开/折叠图标
                if ((widget.item.child ?? []).isNotEmpty)
                  Icon(
                    isItemExpanded ? Icons.expand_more : Icons.chevron_right,
                    size: 20,
                    color: isItemExpanded == true
                        ? Color(0xFF43FFFF)
                        : Colors.white,
                  ),
                const SizedBox(width: 8.0),
                Text(
                  widget.item.labelName,
                  style: TextStyle(
                    color: widget.item.isSelected == true
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
        if (isItemExpanded && (widget.item.child ?? []).isNotEmpty)
          ListView.builder(
            shrinkWrap: true, // 至关重要！让 ListView 适应子内容的高度
            physics: const NeverScrollableScrollPhysics(), // 禁止子列表滚动
            itemCount: (widget.item.child ?? []).length,
            itemBuilder: (context, index) {
              CompTreeEntity childItem = (widget.item.child ?? [])[index];
              return NestedItemWidget(
                item: childItem,
                onToggle: widget.onToggle,
                isExpanded: false,
                level: widget.level + 1,
              );
            },
          ),
      ],
    );
  }
}
