import 'package:flutter/material.dart';

class LineStatusWidget extends StatelessWidget {
  const LineStatusWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 18,
      height: 18,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Color(0xFF13D4D2).withValues(alpha: 0.20),
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
                  color: Color(0xFF13D4D2),
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
