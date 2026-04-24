import 'package:flutter/material.dart';

class HLineTitleWidget extends StatelessWidget {
  final String title;
  final Color color;
  const HLineTitleWidget({super.key, required this.color, required this.title});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 7,
          height: 7,
          margin: EdgeInsets.only(right: 5),
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(2),
          ),
        ),
        Text(title, style: TextStyle(color: Color(0xD9FFFFFF), fontSize: 12)),
      ],
    );
  }
}
