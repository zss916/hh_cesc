import 'package:flutter/material.dart';

class CustomLinePainter extends CustomPainter {
  final List<Map<String, Offset>> lines; // 数组，包含每个线段的起点和终点

  const CustomLinePainter({required this.lines});

  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      ..color = Colors.white30
      ..strokeWidth = 2.0
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke;
    for (var line in lines) {
      Offset start = line['start']!;
      Offset end = line['end']!;
      canvas.drawLine(start, end, paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true; // 每次传入不同的线段时需要重绘
  }
}
