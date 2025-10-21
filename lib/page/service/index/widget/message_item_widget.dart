import 'package:cescpro/core/translations/en.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class MessageItemWidget extends StatelessWidget {
  final Function onTap;
  const MessageItemWidget({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Color(0xFF313540),
      ),
      margin: EdgeInsetsDirectional.only(top: 36.h, start: 16.w, end: 16.w),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(8),
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
                    TKey.message.tr,
                    textAlign: TextAlign.start,
                    style: TextStyle(fontSize: 16.sp, color: Color(0xDEFFFFFF)),
                  ),
                ),
                Container(
                  width: 16,
                  height: 16,
                  margin: EdgeInsetsDirectional.only(start: 10.w, end: 8.w),
                  alignment: AlignmentDirectional.center,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: Color(0xFFFF5353),
                  ),
                  child: Text(
                    "1",
                    style: TextStyle(color: Colors.white, fontSize: 12.sp),
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
      ),
    );
  }
}
