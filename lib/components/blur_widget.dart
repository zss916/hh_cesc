import 'dart:ui';

import 'package:flutter/material.dart';

class BlurWidget extends StatelessWidget {
  final Widget child;
  final bool isBlur;
  final double? sigma;
  const BlurWidget({
    super.key,
    required this.child,
    required this.isBlur,
    this.sigma,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.center,
      children: [
        if (isBlur)
          Positioned.fill(
            child: ClipRRect(
              child: BackdropFilter(
                filter: ImageFilter.blur(
                  sigmaX: sigma ?? 2.8,
                  sigmaY: sigma ?? 2.8,
                ),
                child: Container(
                  decoration: BoxDecoration(color: Colors.transparent),
                ),
              ),
            ),
          ),
        child,
      ],
    );
  }
}
