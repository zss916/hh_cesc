import 'package:cescpro/core/router/index.dart';
import 'package:cescpro/core/translations/en.dart';
import 'package:cescpro/generated/assets.dart';
import 'package:cescpro/http/bean/site_detail_entity.dart';
import 'package:cescpro/http/bean/statistic_record_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class GridViewWidget extends StatelessWidget {
  final String todayCharging;
  final String todayDischarge;
  final String showTodayIncome;
  final String todayPVPowerEarnings;
  final SiteDetailEntity? siteDetail;
  final StatisticRecordEntity? statisticRecord;
  const GridViewWidget({
    super.key,
    required this.todayCharging,
    required this.todayDischarge,
    required this.showTodayIncome,
    required this.todayPVPowerEarnings,
    this.siteDetail,
    this.statisticRecord,
  });

  static const List<List<Color>> colorLists = [
    [Color(0xFF1788FA), Color(0xFF33BDFD)],
    [Color(0xFFFE7016), Color(0xFFF79A4C)],
    [Color(0xFF0061FF), Color(0xFF009AFF)],
    [Color(0xFF06B59B), Color(0xFF0BE2D1)],
  ];

  static const List<Color> shadowColor = [
    Color(0xFF1788FA),
    Color(0xFFFE7016),
    Color(0xFF0061FF),
    Color(0xFF06B59B),
  ];

  static const List<String> icons = [
    Assets.imgCumulativeCharging,
    Assets.imgCumulativeDischarge,
    Assets.imgTodayRecharge,
    Assets.imgAccumulatedPhotovoltaic,
  ];

  @override
  Widget build(BuildContext context) {
    return GridView(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      padding: EdgeInsets.only(top: 24.h, left: 16.w, right: 16.w),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 15.r,
        crossAxisSpacing: 15.r,
        childAspectRatio: 163 / 80,
      ),
      children: [
        GestureDetector(
          onTap: () {
            if (statisticRecord != null) {
              PageTools.toOliveSiteDetail(
                index: 0,
                statisticRecord: statisticRecord!,
              );
            }
          },
          child: Container(
            clipBehavior: Clip.hardEdge,
            padding: EdgeInsetsDirectional.symmetric(
              horizontal: 10.w,
              vertical: 10.h,
            ),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: colorLists[0],
              ),
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: shadowColor[0],
                  offset: Offset(0.1, 0.1),
                  blurRadius: 6,
                ),
              ],
            ),
            width: double.maxFinite,
            child: Stack(
              alignment: Alignment.center,
              children: [
                PositionedDirectional(
                  bottom: -8,
                  end: -12,
                  child: Image.asset(icons[0], width: 80.w, height: 70.h),
                ),

                Column(
                  children: [
                    SizedBox(
                      width: double.maxFinite,
                      child: Row(
                        children: [
                          Expanded(
                            child: Text(
                              "${TKey.todayCharging.tr}(kwh)",
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontSize: 14.sp,
                                color: Color(0xA6FFFFFF),
                              ),
                            ),
                          ),
                          Icon(
                            Icons.arrow_forward_ios_outlined,
                            size: 14,
                            color: Color(0xA6FFFFFF),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: double.maxFinite,
                      child: Text(
                        todayCharging,
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 24.sp,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),

        GestureDetector(
          onTap: () {
            if (statisticRecord != null) {
              PageTools.toOliveSiteDetail(
                index: 1,
                statisticRecord: statisticRecord!,
              );
            }
          },
          child: Container(
            clipBehavior: Clip.hardEdge,
            padding: EdgeInsetsDirectional.symmetric(
              horizontal: 10.w,
              vertical: 10.h,
            ),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: colorLists[1],
              ),
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: shadowColor[1],
                  offset: Offset(0.1, 0.1),
                  blurRadius: 6,
                ),
              ],
            ),
            width: double.maxFinite,
            child: Stack(
              alignment: Alignment.center,
              children: [
                PositionedDirectional(
                  bottom: -8,
                  end: -12,
                  child: Image.asset(icons[1], width: 80.w, height: 70.h),
                ),

                Column(
                  children: [
                    SizedBox(
                      width: double.maxFinite,
                      child: Row(
                        children: [
                          Expanded(
                            child: Text(
                              "${TKey.todayDischarge.tr}(kwh)",
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontSize: 14.sp,
                                color: Color(0xA6FFFFFF),
                              ),
                            ),
                          ),
                          Icon(
                            Icons.arrow_forward_ios_outlined,
                            size: 14,
                            color: Color(0xA6FFFFFF),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: double.maxFinite,
                      child: Text(
                        "$todayDischarge",
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 24.sp,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),

        GestureDetector(
          onTap: () {
            if (siteDetail != null && statisticRecord != null) {
              PageTools.toOliveSiteDetail(
                index: 2,
                statisticRecord: statisticRecord!,
              );
            }
          },
          child: Container(
            clipBehavior: Clip.hardEdge,
            padding: EdgeInsetsDirectional.symmetric(
              horizontal: 10.w,
              vertical: 10.h,
            ),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: colorLists[2],
              ),
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: shadowColor[2],
                  offset: Offset(0.1, 0.1),
                  blurRadius: 6,
                ),
              ],
            ),
            width: double.maxFinite,
            child: Stack(
              alignment: Alignment.center,
              children: [
                PositionedDirectional(
                  bottom: -8,
                  end: -12,
                  child: Image.asset(icons[2], width: 80.w, height: 70.h),
                ),

                Column(
                  children: [
                    SizedBox(
                      width: double.maxFinite,
                      child: Row(
                        children: [
                          Expanded(
                            child: Text(
                              "${TKey.lastDayIncome.tr}(¥)",
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontSize: 14.sp,
                                color: Color(0xA6FFFFFF),
                              ),
                            ),
                          ),
                          Icon(
                            Icons.arrow_forward_ios_outlined,
                            size: 14,
                            color: Color(0xA6FFFFFF),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: double.maxFinite,
                      child: Text(
                        showTodayIncome,
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 24.sp,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),

        GestureDetector(
          onTap: () {
            if (siteDetail != null && statisticRecord != null) {
              PageTools.toOliveSiteDetail(
                index: 3,
                statisticRecord: statisticRecord!,
              );
            }
          },
          child: Container(
            clipBehavior: Clip.hardEdge,
            padding: EdgeInsetsDirectional.symmetric(
              horizontal: 10.w,
              vertical: 10.h,
            ),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: colorLists[3],
              ),
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: shadowColor[3],
                  offset: Offset(0.1, 0.1),
                  blurRadius: 6,
                ),
              ],
            ),
            width: double.maxFinite,
            child: Stack(
              alignment: Alignment.center,
              children: [
                PositionedDirectional(
                  bottom: -8,
                  end: -12,
                  child: Image.asset(icons[3], width: 80.w, height: 70.h),
                ),

                Column(
                  children: [
                    SizedBox(
                      width: double.maxFinite,
                      child: Row(
                        children: [
                          Expanded(
                            child: Text(
                              "${TKey.todayPVPowerEarnings.tr}(kwh)",
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontSize: 14.sp,
                                color: Color(0xA6FFFFFF),
                              ),
                            ),
                          ),
                          Icon(
                            Icons.arrow_forward_ios_outlined,
                            size: 14,
                            color: Color(0xA6FFFFFF),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: double.maxFinite,
                      child: Text(
                        todayPVPowerEarnings,
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 24.sp,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
