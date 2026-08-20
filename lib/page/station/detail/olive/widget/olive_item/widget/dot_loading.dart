import 'package:flutter/material.dart';

class ThreeDotsLoading extends StatefulWidget {
  const ThreeDotsLoading({
    super.key,
    this.color = Colors.white,
    this.size = 6,
    this.spacing = 6,
    this.duration = const Duration(milliseconds: 1000),
  });

  final Color color;
  final double size;
  final double spacing;
  final Duration duration;

  @override
  State<ThreeDotsLoading> createState() => _ThreeDotsLoadingState();
}

class _ThreeDotsLoadingState extends State<ThreeDotsLoading>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(vsync: this, duration: widget.duration)
      ..repeat();
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
        return Row(
          mainAxisSize: MainAxisSize.min,
          children: List.generate(3, (index) {
            final progress = (_controller.value - index / 3) % 1.0;

            // 亮度变化
            final opacity = _getOpacity(progress);

            return Padding(
              padding: EdgeInsets.symmetric(horizontal: widget.spacing / 2),
              child: Container(
                width: widget.size,
                height: widget.size,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: widget.color.withValues(alpha: opacity),
                ),
              ),
            );
          }),
        );
      },
    );
  }

  double _getOpacity(double progress) {
    // 从 0.25 -> 1.0 -> 0.25
    if (progress < 0.5) {
      return 0.25 + progress * 2 * 0.75;
    }

    return 1.0 - (progress - 0.5) * 2 * 0.75;
  }
}
