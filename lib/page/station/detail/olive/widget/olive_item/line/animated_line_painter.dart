import 'dart:ui' as ui;

import 'package:flutter/material.dart';

class AnimatedLinePainter extends CustomPainter {
  final List<Map<String, Offset>> lines;
  final double animationValue;

  AnimatedLinePainter({required this.lines, required this.animationValue});

  @override
  void paint(Canvas canvas, Size size) {
    if (lines.isNotEmpty) {
      // 1. 计算每条线段的长度
      double totalDistance = 0.0;
      List<double> segmentLengths = [];
      for (var line in lines) {
        Offset start = line['start']!;
        Offset end = line['end']!;
        double segmentLength = (end - start).distance;
        segmentLengths.add(segmentLength);
        totalDistance += segmentLength;
      }

      // 2. 计算动画的总进度
      double currentProgress = totalDistance * animationValue;

      // 3. 找到当前线段并在跨线段时衔接
      double accumulatedDistance = 0.0;
      for (int i = 0; i < lines.length; i++) {
        if (currentProgress < accumulatedDistance + segmentLengths[i]) {
          // 当前线段
          Offset start = lines[i]['start']!;
          Offset end = lines[i]['end']!;

          // 计算线段上具体的位置
          double localProgress =
              (currentProgress - accumulatedDistance) / segmentLengths[i];
          Offset currentPoint = Offset.lerp(start, end, localProgress)!;

          // 计算短线段的结束位置
          double shortLineLength = 15.0;
          Offset shortLineEnd = Offset.lerp(
            start,
            end,
            localProgress + shortLineLength / segmentLengths[i],
          )!;

          // 创建渐变着色器
          Paint gradientPaint = Paint()
            ..strokeCap = StrokeCap.round
            ..style = PaintingStyle.stroke
            ..shader = ui.Gradient.linear(currentPoint, shortLineEnd, [
              Color(0xFF24B6F3).withValues(alpha: 0.1), // 尾部颜色渐变变浅
              Color(0xFF24B6F3), // 头部颜色为绿色
            ])
            ..strokeWidth = 2.0;

          // 如果短线段跨越到下一个线段
          if ((shortLineEnd - start).distance > segmentLengths[i]) {
            shortLineEnd = end;
            if (i + 1 < lines.length) {
              // 下一个线段开始的地方
              Offset nextStart = lines[i + 1]['start']!;
              double remainingLength =
                  shortLineLength - (end - currentPoint).distance;
              Offset nextEnd = Offset.lerp(
                nextStart,
                lines[i + 1]['end']!,
                remainingLength / segmentLengths[i + 1],
              )!;

              canvas.drawLine(
                currentPoint,
                shortLineEnd,
                gradientPaint,
              ); // 当前线段最后部分
              canvas.drawLine(nextStart, nextEnd, gradientPaint); // 下一段的开始部分
            }
          } else {
            canvas.drawLine(currentPoint, shortLineEnd, gradientPaint);
          }
          break;
        }
        accumulatedDistance += segmentLengths[i];
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class LineAnimationWidget extends StatefulWidget {
  final List<Map<String, Offset>> lines;
  final int animationValue;

  const LineAnimationWidget({
    Key? key,
    required this.lines,
    this.animationValue = 4,
  }) : super(key: key);

  @override
  _LineAnimationWidgetState createState() => _LineAnimationWidgetState();
}

class _LineAnimationWidgetState extends State<LineAnimationWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: widget.animationValue), // 控制动画的速度
    )..repeat(); // 无限循环动画
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return CustomPaint(
          painter: AnimatedLinePainter(
            lines: widget.lines,
            animationValue: _controller.value, // 使用controller的value
          ),
        );
      },
    );
  }
}
