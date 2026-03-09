import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RealTimeChildTime extends StatelessWidget {
  final String? name;
  final String? value;
  const RealTimeChildTime({super.key, this.name, this.value});

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 8.h,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          name ?? "-",
          style: TextStyle(color: Color(0x8CFFFFFF), fontSize: 14),
        ),
        Text(value ?? '-', style: TextStyle(color: Colors.white, fontSize: 16)),
      ],
    );
  }
}
