import 'dart:math';

import 'package:flutter/material.dart';

class StatusPieChart extends StatelessWidget {
  final int total;
  final int normal;
  final int interrupted;
  final int warning;
  final int fault;

  const StatusPieChart({
    Key? key,
    required this.total,
    required this.normal,
    required this.interrupted,
    required this.warning,
    required this.fault,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.center,
      children: [
        Container(
          width: 300,
          height: 300,
          color: const Color(0xFF2A2D3E), // 深色背景
          child: Stack(
            alignment: Alignment.center,
            children: [
              // 环形图
              CustomPaint(
                size: const Size(200, 200),
                painter: StatusPieChartPainter(
                  normal: normal,
                  interrupted: interrupted,
                  warning: warning,
                  fault: fault,
                  total: total,
                ),
              ),

              // 中心文字
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    total.toString(),
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Text(
                    '累计',
                    style: TextStyle(color: Colors.white70, fontSize: 16),
                  ),
                ],
              ),

              // 左上 - 正常
              Positioned(
                top: 60,
                left: 20,
                child: _buildStatusIndicator(
                  '正常',
                  normal,
                  const Color(0xFF7EEBC3),
                ),
              ),

              // 右上 - 中断
              Positioned(
                top: 60,
                right: 20,
                child: _buildStatusIndicator(
                  '中断',
                  interrupted,
                  const Color(0xFF5B8FF9),
                ),
              ),

              // 左下 - 告警
              Positioned(
                bottom: 60,
                left: 20,
                child: _buildStatusIndicator(
                  '告警',
                  warning,
                  const Color(0xFFFFA759),
                ),
              ),

              // 右下 - 故障
              Positioned(
                bottom: 60,
                right: 20,
                child: _buildStatusIndicator(
                  '故障',
                  fault,
                  const Color(0xFFFFD666),
                ),
              ),

              // 连接线 - 左上
              CustomPaint(
                size: const Size(300, 300),
                painter: LinePainter(
                  start: const Offset(100, 100),
                  end: const Offset(60, 70),
                  color: const Color(0xFF7EEBC3),
                ),
              ),

              // 连接线 - 右上
              CustomPaint(
                size: const Size(300, 300),
                painter: LinePainter(
                  start: const Offset(200, 100),
                  end: const Offset(240, 70),
                  color: const Color(0xFF5B8FF9),
                ),
              ),

              // 连接线 - 左下
              CustomPaint(
                size: const Size(300, 300),
                painter: LinePainter(
                  start: const Offset(100, 200),
                  end: const Offset(60, 230),
                  color: const Color(0xFFFFA759),
                ),
              ),

              // 连接线 - 右下
              CustomPaint(
                size: const Size(300, 300),
                painter: LinePainter(
                  start: const Offset(200, 200),
                  end: const Offset(240, 230),
                  color: const Color(0xFFFFD666),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildStatusIndicator(String label, int count, Color color) {
    return Row(
      children: [
        Container(
          width: 8,
          height: 8,
          decoration: BoxDecoration(color: color, shape: BoxShape.circle),
        ),
        const SizedBox(width: 8),
        Text(label, style: const TextStyle(color: Colors.white, fontSize: 14)),
        const SizedBox(width: 8),
        Text(
          count.toString(),
          style: TextStyle(
            color: color,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}

class StatusPieChartPainter extends CustomPainter {
  final int normal;
  final int interrupted;
  final int warning;
  final int fault;
  final int total;

  StatusPieChartPainter({
    required this.normal,
    required this.interrupted,
    required this.warning,
    required this.fault,
    required this.total,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = min(size.width, size.height) / 2;
    final innerRadius = radius * 0.7; // 内圆半径

    // 计算每个部分的角度
    final normalAngle = 2 * pi * normal / total;
    final interruptedAngle = 2 * pi * interrupted / total;
    final warningAngle = 2 * pi * warning / total;
    final faultAngle = 2 * pi * fault / total;

    // 定义颜色
    final normalColor = const Color(0xFF7EEBC3);
    final interruptedColor = const Color(0xFF5B8FF9);
    final warningColor = const Color(0xFFFFA759);
    final faultColor = const Color(0xFFFFD666);

    // 绘制背景圆环
    final bgPaint = Paint()
      ..color = Colors.grey.withOpacity(0.2)
      ..style = PaintingStyle.stroke
      ..strokeWidth = radius - innerRadius;

    canvas.drawCircle(center, (radius + innerRadius) / 2, bgPaint);

    // 绘制各部分
    double startAngle = -pi / 2; // 从顶部开始

    // 正常部分
    _drawArc(
      canvas,
      center,
      radius,
      innerRadius,
      startAngle,
      normalAngle,
      normalColor,
    );
    startAngle += normalAngle;

    // 中断部分
    _drawArc(
      canvas,
      center,
      radius,
      innerRadius,
      startAngle,
      interruptedAngle,
      interruptedColor,
    );
    startAngle += interruptedAngle;

    // 告警部分
    _drawArc(
      canvas,
      center,
      radius,
      innerRadius,
      startAngle,
      warningAngle,
      warningColor,
    );
    startAngle += warningAngle;

    // 故障部分
    _drawArc(
      canvas,
      center,
      radius,
      innerRadius,
      startAngle,
      faultAngle,
      faultColor,
    );
  }

  void _drawArc(
    Canvas canvas,
    Offset center,
    double radius,
    double innerRadius,
    double startAngle,
    double sweepAngle,
    Color color,
  ) {
    final rect = Rect.fromCircle(center: center, radius: radius);
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = radius - innerRadius
      ..strokeCap = StrokeCap.butt;

    canvas.drawArc(rect, startAngle, sweepAngle, false, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class LinePainter extends CustomPainter {
  final Offset start;
  final Offset end;
  final Color color;

  LinePainter({required this.start, required this.end, required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke;

    canvas.drawLine(start, end, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}

// 使用示例
class StatusPieChartExample extends StatelessWidget {
  const StatusPieChartExample({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const StatusPieChart(
      total: 23,
      normal: 4,
      interrupted: 4,
      warning: 4,
      fault: 4,
    );
  }
}
