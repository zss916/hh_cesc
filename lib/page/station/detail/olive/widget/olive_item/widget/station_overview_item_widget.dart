import 'package:cescpro/core/helper/extension_helper.dart';
import 'package:cescpro/page/station/index/widget/text_rich_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class StationOverviewItemWidget extends StatelessWidget {
  final String icon;
  final String value;
  final String unit;
  final String title;
  final String image;
  final Rect? centerSlice;
  const StationOverviewItemWidget({
    super.key,
    required this.icon,
    required this.value,
    required this.unit,
    required this.title,
    required this.image,
    this.centerSlice,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          centerSlice: centerSlice,
          image: ExactAssetImage(image),
        ),
      ),
      padding: EdgeInsetsDirectional.all(8),
      height: 116.h,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsetsDirectional.only(top: 4.r, bottom: 4.r),
            width: double.maxFinite,
            child: Row(
              children: [
                Expanded(
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
                Icon(
                  Icons.arrow_forward_ios_outlined,
                  size: 14.r,
                  color: Color(0xA6FFFFFF),
                ),
              ],
            ),
          ),
          Spacer(),
          Container(
            margin: EdgeInsetsDirectional.only(top: 0.h),
            child: Image.asset(
              icon,
              width: 28.r,
              height: 28.r,
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
        ],
      ),
    );
  }
}
