import 'package:flutter/material.dart';

class LineStatusWidget extends StatelessWidget {
  final int status;
  const LineStatusWidget({super.key, required this.status});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 18,
      height: 18,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: (status == 4 || status == -3 || status == -2)
                ? Color(0xFFB71C1C).withValues(alpha: 0.20)
                : Color(0xFF13D4D2).withValues(alpha: 0.20),
            offset: Offset(0, 0),
            blurRadius: 4,
          ),
        ],
        borderRadius: BorderRadius.circular(50),
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              Container(
                width: 6,
                height: 6,
                decoration: BoxDecoration(
                  color: (status == 4 || status == -3 || status == -2)
                      ? Color(0xFFB71C1C).withValues(alpha: 0.20)
                      : Color(0xFF13D4D2),
                  borderRadius: BorderRadius.circular(50),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
