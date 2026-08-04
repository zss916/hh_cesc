import 'dart:math' as math;

import 'package:cescpro/generated/assets.dart';
import 'package:flutter/material.dart';

class CescGlowLoading extends StatefulWidget {
  const CescGlowLoading({super.key});

  @override
  State<CescGlowLoading> createState() => _CescGlowLoadingState();
}

class _CescGlowLoadingState extends State<CescGlowLoading>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    )..repeat();
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
      builder: (_, child) {
        return Stack(
          alignment: Alignment.center,
          children: [
            // 旋转光晕环
            Transform.rotate(
              angle: _controller.value * math.pi * 2,
              child: SizedBox(
                width: 120,
                height: 120,
                child: CircularProgressIndicator(
                  strokeWidth: 5,
                  valueColor: AlwaysStoppedAnimation(
                    Colors.white.withValues(alpha: 0.2),
                  ),
                ),
              ),
            ),

            Image.asset(
              Assets.imgLogoText,
              width: 220,
              height: 220,
              matchTextDirection: true,
            ),
          ],
        );
      },
    );
  }
}
