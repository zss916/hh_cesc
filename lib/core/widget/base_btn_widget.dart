import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BaseBtnWidget extends StatelessWidget {
  final String title;
  final Function onTap;
  final EdgeInsetsGeometry? margin;
  const BaseBtnWidget({
    super.key,
    this.margin,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTap.call();
      },
      child: Container(
        height: 48,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF43FFFF), Color(0xFF0978E9)],
          ),
          borderRadius: BorderRadius.circular(100),
        ),
        alignment: AlignmentDirectional.center,
        margin:
            margin ??
            EdgeInsetsDirectional.only(start: 16.w, end: 16.w, top: 0.h),
        child: Text(
          title,
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 17, color: Colors.white),
        ),
      ),
    );
  }
}
