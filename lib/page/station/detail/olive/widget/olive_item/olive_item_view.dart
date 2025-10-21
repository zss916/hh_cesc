import 'package:cescpro/core/router/index.dart';
import 'package:cescpro/core/translations/en.dart';
import 'package:cescpro/page/station/detail/olive/widget/olive_item/grid_view_widget.dart';
import 'package:cescpro/page/station/detail/olive/widget/olive_item/line_status_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class OliveItemView extends StatelessWidget {
  const OliveItemView({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.only(top: 18.h, left: 16.w, right: 16.w),
            width: double.maxFinite,
            child: Row(
              children: [
                Text(
                  TKey.todayWeather.tr,
                  style: TextStyle(fontSize: 13, color: Color(0xB3FFFFFF)),
                ),
                Text(
                  "多云 26°",
                  style: TextStyle(fontSize: 15, color: Color(0xDEFFFFFF)),
                ),
                Spacer(),
                Text(
                  TKey.workModel.tr,
                  style: TextStyle(fontSize: 13, color: Color(0xB3FFFFFF)),
                ),
                LineStatusWidget(),
                Text(
                  "online",
                  style: TextStyle(fontSize: 15, color: Color(0xDEFFFFFF)),
                ),
              ],
            ),
          ),

          Container(
            decoration: BoxDecoration(
              color: Color(0xFF313540),
              borderRadius: BorderRadius.circular(8),
            ),
            margin: EdgeInsets.only(top: 16.h, left: 16.w, right: 16.w),
            width: double.maxFinite,
            height: 386,
          ),

          GridViewWidget(),

          buildReport(),
          buildSiteInfo(),

          SizedBox(height: 200.h),
        ],
      ),
    );
  }

  Widget buildReport() => Column(
    children: [
      Container(
        padding: EdgeInsetsDirectional.only(
          top: 24.h,
          start: 18.w,
          end: 18.w,
          bottom: 16.h,
        ),
        alignment: AlignmentDirectional.centerStart,
        child: Text(
          TKey.singleSiteStatisticalReport.tr,
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w500,
            fontSize: 16,
          ),
        ),
      ),

      Row(
        children: [
          VerticalDivider(width: 16.w, color: Colors.transparent),
          Expanded(
            child: Container(
              width: double.maxFinite,
              height: 36,
              clipBehavior: Clip.hardEdge,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5.r),
                color: Color(0xFF313540),
              ),
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  onTap: () {
                    PageTools.toReportDetail();
                  },
                  child: Container(
                    alignment: AlignmentDirectional.center,
                    child: Text(
                      TKey.electricityLevelLimit.tr,
                      style: TextStyle(color: Colors.white, fontSize: 14.sp),
                    ),
                  ),
                ),
              ),
            ),
          ),
          VerticalDivider(width: 16.w, color: Colors.transparent),
          Expanded(
            child: Container(
              width: double.maxFinite,
              height: 36,
              clipBehavior: Clip.hardEdge,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5.r),
                color: Color(0xFF313540),
              ),
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  onTap: () {
                    //
                  },
                  child: Container(
                    alignment: AlignmentDirectional.center,
                    child: Text(
                      TKey.settlement.tr,
                      style: TextStyle(color: Colors.white, fontSize: 14.sp),
                    ),
                  ),
                ),
              ),
            ),
          ),
          VerticalDivider(width: 16.w, color: Colors.transparent),
          Expanded(
            child: Container(
              width: double.maxFinite,
              height: 36,
              clipBehavior: Clip.hardEdge,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5.r),
                color: Color(0xFF313540),
              ),
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  onTap: () {},
                  child: Container(
                    alignment: AlignmentDirectional.center,
                    child: Text(
                      TKey.revenue.tr,
                      style: TextStyle(color: Colors.white, fontSize: 14.sp),
                    ),
                  ),
                ),
              ),
            ),
          ),
          VerticalDivider(width: 16.w, color: Colors.transparent),
        ],
      ),
    ],
  );

  Widget buildSiteInfo() => Column(
    children: [
      Container(
        padding: EdgeInsetsDirectional.only(
          top: 24.h,
          start: 18.w,
          end: 18.w,
          bottom: 16.h,
        ),
        alignment: AlignmentDirectional.centerStart,
        child: Text(
          TKey.powerStationInformation.tr,
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w500,
            fontSize: 16,
          ),
        ),
      ),

      Container(
        width: double.maxFinite,
        margin: EdgeInsets.only(
          left: 16.w,
          right: 16.w,
          top: 16.h,
          bottom: 16.h,
        ),
        padding: EdgeInsets.all(16.r),
        decoration: BoxDecoration(
          color: Color(0xFF313540),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          children: [
            Row(
              children: [
                Text(
                  "${TKey.powerSiteName.tr}:",
                  style: TextStyle(fontSize: 12.sp, color: Color(0xA6FFFFFF)),
                ),
                Expanded(
                  child: Text(
                    "新城区党政机关办公区源网荷储一体化管理…",
                    style: TextStyle(fontSize: 12.sp, color: Color(0xFFFFFFFF)),
                  ),
                ),
              ],
            ),
            Divider(height: 8.h, color: Colors.transparent),
            Row(
              children: [
                Text(
                  "${TKey.affiliatedCustomer.tr}:",
                  style: TextStyle(fontSize: 12.sp, color: Color(0xA6FFFFFF)),
                ),
                Expanded(
                  child: Text(
                    "新城区党政",
                    style: TextStyle(fontSize: 12.sp, color: Color(0xFFFFFFFF)),
                  ),
                ),
              ],
            ),
            Divider(height: 8.h, color: Colors.transparent),
            Row(
              children: [
                Text(
                  "${TKey.energyStorageDevicesCount.tr}:",
                  style: TextStyle(fontSize: 12.sp, color: Color(0xA6FFFFFF)),
                ),
                Expanded(
                  child: Text(
                    "2",
                    style: TextStyle(fontSize: 12.sp, color: Color(0xFFFFFFFF)),
                  ),
                ),
              ],
            ),
            Divider(height: 8.h, color: Colors.transparent),
            Row(
              children: [
                Expanded(
                  child: Row(
                    children: [
                      Text(
                        "${TKey.energyStorageInstalledPower.tr}:",
                        style: TextStyle(
                          fontSize: 12.sp,
                          color: Color(0xA6FFFFFF),
                        ),
                      ),
                      Expanded(
                        child: Text(
                          "100kw",
                          style: TextStyle(
                            fontSize: 12.sp,
                            color: Color(0xFFFFFFFF),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                VerticalDivider(width: 10.w, color: Colors.transparent),
                Expanded(
                  child: Row(
                    children: [
                      Text(
                        "${TKey.energyStorageInstalledCapacity.tr}:",
                        style: TextStyle(
                          fontSize: 12.sp,
                          color: Color(0xA6FFFFFF),
                        ),
                      ),

                      Expanded(
                        child: Text(
                          "12088kw",
                          style: TextStyle(
                            fontSize: 12.sp,
                            color: Color(0xFFFFFFFF),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Divider(height: 8.h, color: Colors.transparent),
            Row(
              children: [
                Expanded(
                  child: Row(
                    children: [
                      Text(
                        "${TKey.photovoltaicInstalledPower.tr}:",
                        style: TextStyle(
                          fontSize: 12.sp,
                          color: Color(0xA6FFFFFF),
                        ),
                      ),
                      Expanded(
                        child: Text(
                          "100kw",
                          style: TextStyle(
                            fontSize: 12.sp,
                            color: Color(0xFFFFFFFF),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                VerticalDivider(width: 10.w, color: Colors.transparent),
                Expanded(
                  child: Row(
                    children: [
                      Text(
                        "${TKey.photovoltaicInstalledCapacity.tr}:",
                        style: TextStyle(
                          fontSize: 12.sp,
                          color: Color(0xA6FFFFFF),
                        ),
                      ),
                      Expanded(
                        child: Text(
                          "12088kw",
                          style: TextStyle(
                            fontSize: 12.sp,
                            color: Color(0xFFFFFFFF),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Divider(height: 8.h, color: Colors.transparent),
            Container(
              width: double.infinity,
              height: 164.h,
              decoration: BoxDecoration(
                color: Colors.black,
                image: DecorationImage(
                  image: NetworkImage(
                    "https://img0.baidu.com/it/u=1882145012,3962079913&fm=253&fmt=auto&app=138&f=JPEG?w=500&h=666",
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ],
        ),
      ),
    ],
  );
}
