import 'package:flutter/material.dart';

class TextRichWidget extends StatelessWidget {
  final String title;
  final String value;
  final TextStyle? titleStyle;
  final TextStyle? valueStyle;

  const TextRichWidget({
    super.key,
    required this.title,
    required this.value,
    this.titleStyle,
    this.valueStyle,
  });

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        children: [
          TextSpan(
            text: title,
            children: [
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
