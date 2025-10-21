import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CommonTag extends StatelessWidget {
  final String title;
  const CommonTag({super.key, required this.title});

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
        border: Border.all(width: 1, color: Color(0x739D9D9D)),
        borderRadius: BorderRadius.circular(50.r),
      ),
      child: Text(
        title,
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 12, color: Colors.white),
      ),
    );
  }
}
