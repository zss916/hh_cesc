import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ItemWidget extends StatelessWidget {
  final String title;
  final Function onTap;
  final BorderRadius? borderRadius;
  const ItemWidget({
    super.key,
    required this.title,
    required this.onTap,
    this.borderRadius,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        borderRadius: borderRadius ?? BorderRadius.zero,
        onTap: () {
          onTap.call();
        },
        child: Container(
          padding: EdgeInsetsDirectional.symmetric(
            horizontal: 16.w,
            vertical: 14.h,
          ),
          width: double.maxFinite,
          child: Row(
            children: [
              Expanded(
                child: Text(
                  title,
                  textAlign: TextAlign.start,
                  style: TextStyle(color: Color(0xDEFFFFFF), fontSize: 16.sp),
                ),
              ),
              Icon(
                Icons.arrow_forward_ios_rounded,
                size: 15,
                color: Color(0xDEFFFFFF),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
