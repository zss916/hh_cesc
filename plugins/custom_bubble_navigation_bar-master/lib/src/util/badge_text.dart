import 'package:flutter/material.dart';

class BadgeText extends StatelessWidget {
  const BadgeText({
    Key? key,
    this.count,
    this.right,
    this.show,
  }) : super(key: key);

  // counter showed in notification badge
  // set to 0 will hide notification badge
  final int? count;

  final double? right;

  final bool? show;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      right: right,
      top: 0,
      child: show! ? buildContent(count ?? 0) : const SizedBox.shrink(),
    );
  }

  Widget buildContent(int count) {
    return Stack(
      alignment: AlignmentDirectional.center,
      children: [
        if (count > 0 && count < 10)
          Container(
            width: 18,
            height: 18,
            padding: EdgeInsets.zero,
            decoration: BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.circular(30),
            ),
            child: Text(
              '$count',
              style: const TextStyle(
                color: Colors.white,
                fontSize: 12,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        if (count >= 10 && count < 100)
          Container(
            width: 24,
            height: 18,
            padding: EdgeInsets.zero,
            decoration: BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.circular(30),
            ),
            child: Text(
              '$count',
              style: const TextStyle(
                color: Colors.white,
                fontSize: 12,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        if (count >= 100)
          Container(
            width: 28,
            height: 18,
            padding: EdgeInsets.zero,
            decoration: BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.circular(30),
            ),
            child: const Text(
              '99+',
              style: TextStyle(
                color: Colors.white,
                fontSize: 12,
              ),
              textAlign: TextAlign.center,
            ),
          ),
      ],
    );
  }
}
