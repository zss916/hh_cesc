import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CommonBtn extends StatelessWidget {
  final String title;

  final Function onTap;

  const CommonBtn({super.key, required this.title, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTap.call();
      },
      child: Container(
        alignment: AlignmentDirectional.center,
        width: double.maxFinite,
        height: 48,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF43FFFF), Color(0xFF0978E9)],
          ),
          borderRadius: BorderRadiusDirectional.all(Radius.circular(50.r)),
        ),
        child: Text(
          title,
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 17.sp, color: Color(0xFFFFFFFF)),
        ),
      ),
    );
  }
}
