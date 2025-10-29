import 'package:cescpro/core/translations/en.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class BuildDeviceAndSiteCount extends StatelessWidget {
  final int deviceNum;
  final int siteNum;

  const BuildDeviceAndSiteCount({
    super.key,
    required this.deviceNum,
    required this.siteNum,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      padding: EdgeInsetsDirectional.all(15),
      margin: EdgeInsetsDirectional.only(start: 16.w, end: 16.w, bottom: 16.h),
      decoration: BoxDecoration(
        color: Color(0xFF313540),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          Expanded(
            child: Container(
              //color: Colors.amber,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FittedBox(
                    child: Text(
                      "$siteNum",
                      maxLines: 1,
                      style: TextStyle(
                        fontSize: 26.sp,
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Divider(height: 7, color: Colors.transparent),
                  Text(
                    TKey.stationNum.tr,
                    style: TextStyle(fontSize: 14.sp, color: Color(0xA6FFFFFF)),
                  ),
                ],
              ),
            ),
          ),
          Container(
            margin: EdgeInsetsDirectional.symmetric(horizontal: 10.w),
            width: 1,
            height: 40,
            color: Colors.white30,
          ),
          Expanded(
            child: Container(
              //color: Colors.blue,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FittedBox(
                    child: Text(
                      "$deviceNum",
                      maxLines: 1,
                      style: TextStyle(
                        fontSize: 26.sp,
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Divider(height: 7, color: Colors.transparent),
                  Text(
                    TKey.deviceNum.tr,
                    style: TextStyle(fontSize: 14.sp, color: Color(0xA6FFFFFF)),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
