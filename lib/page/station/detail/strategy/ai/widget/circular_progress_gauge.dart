import 'dart:math';

import 'package:flutter/material.dart';

class CircularProgressGauge extends StatefulWidget {
  const CircularProgressGauge({
    super.key,
    required this.value,
    required this.max,
    this.size = 180,
    this.strokeWidth = 14,
    this.duration = const Duration(milliseconds: 1200),
    this.backgroundColor = const Color(0xFFBDBDBD),
    this.gradientColors = const [Color(0xFF0C7FEA), Color(0xFF3EF3FD)],
    this.textStyle,
  });

  /// 当前值
  final int value;

  /// 最大值
  final int max;

  /// 控件大小
  final double size;

  /// 圆环宽度
  final double strokeWidth;

  /// 动画时长
  final Duration duration;

  /// 背景颜色
  final Color backgroundColor;

  /// 渐变颜色
  final List<Color> gradientColors;

  final TextStyle? textStyle;

  @override
  State<CircularProgressGauge> createState() => _CircularProgressGaugeState();
}

class _CircularProgressGaugeState extends State<CircularProgressGauge>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(vsync: this, duration: widget.duration);

    _animation = Tween<double>(
      begin: 0,
      end: widget.value.toDouble(),
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOutCubic));

    _controller.forward();
  }

  @override
  void didUpdateWidget(covariant CircularProgressGauge oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (oldWidget.value != widget.value) {
      _animation =
          Tween<double>(
            begin: _animation.value,
            end: widget.value.toDouble(),
          ).animate(
            CurvedAnimation(parent: _controller, curve: Curves.easeOutCubic),
          );

      _controller
        ..reset()
        ..forward();
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.size,
      height: widget.size,
      child: AnimatedBuilder(
        animation: _animation,
        builder: (_, __) {
          return CustomPaint(
            painter: _GaugePainter(
              value: _animation.value,
              max: widget.max.toDouble(),
              strokeWidth: widget.strokeWidth,
              backgroundColor: widget.backgroundColor,
              gradientColors: widget.gradientColors,
            ),
            child: Container(
              padding: EdgeInsetsDirectional.only(bottom: 25),
              alignment: AlignmentDirectional.bottomCenter,
              child: Text(
                "${_animation.value.round()}/${widget.max.round()}",
                style:
                    widget.textStyle ??
                    const TextStyle(
                      color: Colors.white,
                      fontSize: 35,
                      fontWeight: FontWeight.w500,
                    ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class _GaugePainter extends CustomPainter {
  _GaugePainter({
    required this.value,
    required this.max,
    required this.strokeWidth,
    required this.backgroundColor,
    required this.gradientColors,
  });

  final double value;
  final double max;
  final double strokeWidth;
  final Color backgroundColor;
  final List<Color> gradientColors;

  @override
  void paint(Canvas canvas, Size size) {
    final rect = Offset.zero & size;

    final center = rect.center;
    final radius = size.width / 2 - strokeWidth;

    const startAngle = 140 * pi / 180;
    const totalAngle = 260 * pi / 180;

    /// 背景
    final bgPaint = Paint()
      ..color = backgroundColor
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = strokeWidth;

    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      startAngle,
      totalAngle,
      false,
      bgPaint,
    );

    final progress = (value / max).clamp(0.0, 1.0);

    final sweepAngle = totalAngle * progress;

    /// 渐变
    /*  final shader2 = SweepGradient(
      startAngle: startAngle,
      endAngle: startAngle + totalAngle,
      colors: gradientColors,
    ).createShader(rect);*/

    if (sweepAngle > 0.0001) {
      final shader = SweepGradient(
        startAngle: startAngle,
        endAngle: startAngle + sweepAngle,
        colors: gradientColors,
        transform: GradientRotation(startAngle + totalAngle),
      ).createShader(rect);

      final progressPaint = Paint()
        ..shader = shader
        ..style = PaintingStyle.stroke
        ..strokeCap = StrokeCap.round
        ..strokeWidth = strokeWidth;

      canvas.drawArc(
        Rect.fromCircle(center: center, radius: radius),
        startAngle,
        sweepAngle,
        false,
        progressPaint,
      );

      /// 圆点
      final angle = startAngle + sweepAngle;

      final point = Offset(
        center.dx + radius * cos(angle),
        center.dy + radius * sin(angle),
      );

      /// glow
      canvas.drawCircle(
        point,
        strokeWidth * 0.7,
        Paint()
          ..color = gradientColors.first.withOpacity(.35)
          ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 10),
      );

      /// 白点
      canvas.drawCircle(
        point,
        strokeWidth * 0.38,
        Paint()..color = Colors.white,
      );
    }
  }

  @override
  bool shouldRepaint(covariant _GaugePainter oldDelegate) {
    return oldDelegate.value != value;
  }
}
