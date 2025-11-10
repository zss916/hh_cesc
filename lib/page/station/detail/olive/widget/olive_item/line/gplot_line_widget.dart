import 'package:cescpro/page/station/detail/olive/widget/olive_item/line/animated_line_painter.dart';
import 'package:cescpro/page/station/detail/olive/widget/olive_item/line/custom_line_painter.dart';
import 'package:flutter/material.dart';

class GplotLineWidget extends StatelessWidget {
  final List defaultLines;
  final List lines;

  const GplotLineWidget({
    super.key,

    this.lines = const [],
    required this.defaultLines,
  });

  @override
  Widget build(BuildContext context) {
    return _buildGplotWidget();
  }

  Widget _buildGplotWidget() {
    return Container(
      height: double.infinity,
      width: double.infinity,
      child: Stack(
        children: [
          // 检查 defaultLines 列表的长度，避免访问无效的索引
          if (defaultLines.isNotEmpty)
            CustomPaint(painter: CustomLinePainter(lines: defaultLines[0])),

          if (defaultLines.length > 1)
            CustomPaint(painter: CustomLinePainter(lines: defaultLines[1])),

          if (defaultLines.length > 2)
            CustomPaint(painter: CustomLinePainter(lines: defaultLines[2])),

          if (defaultLines.length > 3)
            CustomPaint(painter: CustomLinePainter(lines: defaultLines[3])),

          ///icon

          // 检查 lines 列表的长度，避免访问无效的索引
          if (lines.isNotEmpty)
            LineAnimationWidget(lines: lines[0], animationValue: 4),
          if (lines.length > 1)
            LineAnimationWidget(lines: lines[1], animationValue: 4),

          if (lines.length > 2)
            LineAnimationWidget(lines: lines[2], animationValue: 4),

          if (lines.length > 3)
            LineAnimationWidget(lines: lines[3], animationValue: 4),
        ],
      ),
    );
  }
}
