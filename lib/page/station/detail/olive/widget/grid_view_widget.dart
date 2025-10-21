import 'package:cescpro/core/router/index.dart';
import 'package:cescpro/generated/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GridViewWidget extends StatelessWidget {
  const GridViewWidget({super.key});

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

  static const List<String> titles = [
    "今日充电(kwh)",
    "今日放电(kwh)",
    "今日收益(¥)",
    "今日光伏发电(kwh)",
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: 4,
      padding: EdgeInsets.only(top: 24.h, left: 16.w, right: 16.w),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 15.r,
        crossAxisSpacing: 15.r,
        childAspectRatio: 163 / 80,
      ),
      itemBuilder: (BuildContext context, int index) {
        return GestureDetector(
          onTap: () {
            PageTools.toOliveSiteDetail();
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
                colors: colorLists[index],
              ),
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: shadowColor[index],
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
                  child: Image.asset(icons[index], width: 80.w, height: 70.h),
                ),

                Column(
                  children: [
                    SizedBox(
                      width: double.maxFinite,
                      child: Row(
                        children: [
                          Expanded(
                            child: Text(
                              titles[index],
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
                        "2000",
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
        );
      },
    );
  }
}
