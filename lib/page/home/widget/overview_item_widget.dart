import 'package:cescpro/core/helper/extension_helper.dart';
import 'package:cescpro/page/station/index/widget/text_rich_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class OverviewItemWidget extends StatelessWidget {
  final String icon;
  final String value;
  final String unit;
  final String title;
  final String image;
  const OverviewItemWidget({
    super.key,
    required this.icon,
    required this.value,
    required this.unit,
    required this.title,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      /* decoration: BoxDecoration(
        border: const GradientBoxBorder(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Color(0x33FFFFFF), Color(0x33999999)],
          ),
          width: 1,
        ),
        gradient: LinearGradient(
          begin: AlignmentDirectional.topStart,
          end: AlignmentDirectional.bottomEnd,
          colors: [Color(0xFF282C31), Color(0xFF4F5C6C)],
        ),
        borderRadius: BorderRadius.circular(8.r),
      ),*/
      decoration: BoxDecoration(
        image: DecorationImage(image: ExactAssetImage(image)),
      ),
      padding: EdgeInsetsDirectional.all(12.r),
      width: 170.w,
      height: 120.h,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsetsDirectional.only(top: 4.h, bottom: 4.h),
            child: Image.asset(
              icon,
              width: 28,
              height: 28,
              matchTextDirection: true,
            ),
          ),
          Spacer(),
          Container(
            margin: EdgeInsetsDirectional.only(top: 0.h),
            width: double.maxFinite,
            child: TextRichWidget(
              title: value,
              titleStyle: TextStyle(
                fontWeight: FontWeight.bold,
                color: Color(0xFFFFFFFF),
                fontSize: 24.sp,
              ),
              value: unit,
              valueStyle: TextStyle(
                color: Color(0xFFFFFFFF),
                fontWeight: FontWeight.normal,
                fontSize: 12.sp,
              ),
            ),
          ),
          Spacer(),
          Container(
            margin: EdgeInsetsDirectional.only(top: 0.h),
            width: double.maxFinite,
            child: Text(
              title,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                color: Color(0xD9FFFFFF),
                fontSize: Get.isDe ? 11.sp : 12.sp,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
