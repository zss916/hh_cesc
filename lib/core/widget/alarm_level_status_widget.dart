import 'package:flutter/material.dart';

class AlarmLevelStatusWidget extends StatelessWidget {
  final int level;
  const AlarmLevelStatusWidget({super.key, required this.level});

  static final List<Color> colors = [
    Color(0xFFC34847),
    Color(0xFFEB9657),
    Color(0xFFEBD357),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 20,
      height: 20,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: colors[level].withValues(alpha: 0.20),
            offset: Offset(0, 0),
            blurRadius: 4,
          ),
        ],
        borderRadius: BorderRadius.circular(50),
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            width: 12,
            height: 12,
            decoration: BoxDecoration(
              border: Border.all(width: 1, color: colors[level]),
              borderRadius: BorderRadius.circular(50),
            ),
            child: Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  width: 6,
                  height: 6,
                  decoration: BoxDecoration(
                    color: colors[level],
                    borderRadius: BorderRadius.circular(50),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
