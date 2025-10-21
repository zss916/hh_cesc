import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class StatusTag extends StatelessWidget {
  final String title;
  const StatusTag({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: AlignmentDirectional.center,
      padding: EdgeInsetsDirectional.only(
        start: 8.w,
        end: 8.w,
        top: 2.h,
        bottom: 2.h,
      ),
      decoration: BoxDecoration(
        color: Color(0x3322EEBD),
        border: Border.all(width: 1, color: Color(0xFF22EEBD)),
        borderRadius: BorderRadius.circular(50.r),
      ),
      child: Text(
        title,
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 12, color: Color(0xFF22EEBD)),
      ),
    );
  }
}
