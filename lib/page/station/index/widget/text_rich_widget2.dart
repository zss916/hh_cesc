import 'dart:ui' as ui;

import 'package:flutter/material.dart';

class TextRichWidget2 extends StatelessWidget {
  final String title;
  final String value;
  final TextStyle? titleStyle;
  final TextStyle? valueStyle;
  final Color? pointColor;
  final double? interval;

  const TextRichWidget2({
    super.key,
    required this.title,
    required this.value,
    this.titleStyle,
    this.valueStyle,
    this.pointColor,
    this.interval,
  });

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        children: [
          WidgetSpan(
            alignment: ui.PlaceholderAlignment.middle,
            child: Container(
              width: 7,
              height: 7,
              margin: EdgeInsetsDirectional.only(end: 2),
              decoration: BoxDecoration(
                color: pointColor ?? Colors.transparent,
                borderRadius: BorderRadius.circular(50),
              ),
            ),
          ),

          TextSpan(
            text: title,
            children: [
              WidgetSpan(child: SizedBox(width: interval ?? 0)),

              TextSpan(
                style:
                    valueStyle ??
                    TextStyle(fontSize: 12, color: Color(0xFFFFFFFF)),
                text: value,
              ),
            ],
            style:
                titleStyle ?? TextStyle(fontSize: 12, color: Color(0xA6FFFFFF)),
          ),
        ],
      ),
      textAlign: TextAlign.start,
    );
  }
}
