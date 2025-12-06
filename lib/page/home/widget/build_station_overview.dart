import 'package:auto_size_text/auto_size_text.dart';
import 'package:cescpro/core/helper/extension_helper.dart';
import 'package:cescpro/core/translations/en.dart';
import 'package:cescpro/generated/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class BuildStationOverview extends StatelessWidget {
  final num capacity; //站点容量
  final num totalPos; //累计充电
  final num totalNeg; //累计放电
  final num totalPvNeg; //累计光伏发电

  const BuildStationOverview({
    super.key,
    required this.capacity,
    required this.totalPos,
    required this.totalNeg,
    required this.totalPvNeg,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: EdgeInsetsDirectional.only(start: 18.w, end: 18.w, top: 9.h),
          width: double.maxFinite,
          child: Text(
            TKey.stationOverview.tr,
            style: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.w500,
              color: Colors.white,
            ),
          ),
        ),
        Container(
          width: double.maxFinite,
          height: 126.h,
          margin: EdgeInsetsDirectional.only(top: 10.h, bottom: 10.h),
          child: ListView(
            padding: EdgeInsetsDirectional.symmetric(horizontal: 16.w),
            scrollDirection: Axis.horizontal,
            children: [
              buildItem(capacity: capacity),

              VerticalDivider(width: 8.w, color: Colors.transparent),

              buildItem2(totalPos: totalPos),

              VerticalDivider(width: 8.w, color: Colors.transparent),

              buildItem3(totalNeg: totalNeg),

              VerticalDivider(width: 8.w, color: Colors.transparent),

              buildItem4(totalPvNeg: totalPvNeg),
            ],
          ),
        ),
      ],
    );
  }

  Widget buildItem({required num capacity}) {
    return Container(
      margin: EdgeInsetsDirectional.only(top: 6.h, bottom: 6.h),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: AlignmentDirectional.topStart,
          end: AlignmentDirectional.bottomEnd,
          colors: [Color(0xFFFE7016), Color(0xFFF79A4C)],
        ),
        borderRadius: BorderRadius.circular(18),
        boxShadow: [
          BoxShadow(
            color: Color(0xFFFD7821),
            offset: Offset(0.1, 0.1),
            blurRadius: 8,
          ),
        ],
      ),
      width: 148.w,
      height: 126.h,
      child: Stack(
        alignment: Alignment.center,
        children: [
          PositionedDirectional(
            bottom: -8,
            end: -5,
            child: Image.asset(
              Assets.imgEnergyStorage,
              width: 78,
              height: 79,
              matchTextDirection: true,
            ),
          ),

          Container(
            padding: EdgeInsetsDirectional.all(14),
            child: Column(
              children: [
                Container(
                  margin: EdgeInsetsDirectional.only(top: 2),
                  width: double.maxFinite,
                  child: AutoSizeText(
                    TKey.energyStorageInstalledCapacity.tr,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(color: Color(0xCCFFFFFF), fontSize: 14.sp),
                  ),
                ),
                SizedBox(
                  width: double.maxFinite,
                  child: Text(
                    "(kWh)",
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(color: Color(0xCCFFFFFF), fontSize: 14.sp),
                  ),
                ),
                Spacer(),
                Container(
                  margin: EdgeInsetsDirectional.only(top: 0.h),
                  width: double.maxFinite,
                  child: AutoSizeText(
                    "$capacity",
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      color: Color(0xFFFFFFFF),
                      fontSize: 25.sp,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildItem2({required num totalPos}) {
    return Container(
      margin: EdgeInsetsDirectional.only(top: 6.h, bottom: 6.h),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: AlignmentDirectional.topStart,
          end: AlignmentDirectional.bottomEnd,
          colors: [Color(0xFF1788FA), Color(0xFF33BDFD)],
        ),
        borderRadius: BorderRadius.circular(18),
        boxShadow: [
          BoxShadow(
            color: Color(0xFF1788FA),
            offset: Offset(0.1, 0.1),
            blurRadius: 8,
          ),
        ],
      ),
      width: 148.w,
      height: 126.h,
      child: Stack(
        alignment: Alignment.center,
        children: [
          PositionedDirectional(
            bottom: -8,
            end: -5,
            child: Image.asset(
              Assets.imgCumulativeCharging,
              width: 78,
              height: 79,
              matchTextDirection: true,
            ),
          ),

          Container(
            padding: EdgeInsetsDirectional.all(14),
            child: Column(
              children: [
                Container(
                  margin: EdgeInsetsDirectional.only(top: 2),
                  width: double.maxFinite,
                  child: AutoSizeText(
                    TKey.cumulativeChargingCapacity.tr,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(color: Color(0xCCFFFFFF), fontSize: 14.sp),
                  ),
                ),
                SizedBox(
                  width: double.maxFinite,
                  child: Text(
                    "(${totalPos.formatPowerValueUnit()})",
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(color: Color(0xCCFFFFFF), fontSize: 14.sp),
                  ),
                ),
                Spacer(),
                Container(
                  margin: EdgeInsetsDirectional.only(top: 0),
                  width: double.maxFinite,
                  child: AutoSizeText(
                    totalPos.formatPowerValue(),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      color: Color(0xFFFFFFFF),
                      fontSize: 25.sp,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildItem3({required num totalNeg}) {
    return Container(
      margin: EdgeInsetsDirectional.only(top: 6.h, bottom: 6.h),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: AlignmentDirectional.topStart,
          end: AlignmentDirectional.bottomEnd,
          colors: [Color(0xFF2FC4AF), Color(0xFF1EFBC2)],
        ),
        borderRadius: BorderRadius.circular(18),
        boxShadow: [
          BoxShadow(
            color: Color(0xFF2FC4AF),
            offset: Offset(0.1, 0.1),
            blurRadius: 8,
          ),
        ],
      ),
      width: 148.w,
      height: 126.h,
      child: Stack(
        alignment: Alignment.center,
        children: [
          PositionedDirectional(
            bottom: -8,
            end: -5,
            child: Image.asset(
              Assets.imgCumulativeDischarge,
              width: 78,
              height: 79,
              matchTextDirection: true,
            ),
          ),

          Container(
            padding: EdgeInsetsDirectional.all(14),
            child: Column(
              children: [
                Container(
                  margin: EdgeInsetsDirectional.only(top: 2),
                  width: double.maxFinite,
                  child: Text(
                    TKey.cumulativeDischargeCapacity.tr,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(color: Color(0xCCFFFFFF), fontSize: 14.sp),
                  ),
                ),
                SizedBox(
                  width: double.maxFinite,
                  child: Text(
                    "(${totalNeg.formatPowerValueUnit()})",
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(color: Color(0xCCFFFFFF), fontSize: 14.sp),
                  ),
                ),
                Spacer(),
                Container(
                  margin: EdgeInsetsDirectional.only(top: 0),
                  width: double.maxFinite,
                  child: AutoSizeText(
                    totalNeg.formatPowerValue(),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      color: Color(0xFFFFFFFF),
                      fontSize: 25.sp,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildItem4({required num totalPvNeg}) {
    return Container(
      margin: EdgeInsetsDirectional.only(top: 6.h, bottom: 6.h),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: AlignmentDirectional.topStart,
          end: AlignmentDirectional.bottomEnd,
          colors: [Color(0xFFFFB22A), Color(0xFFF6D961)],
        ),
        borderRadius: BorderRadius.circular(18),
        boxShadow: [
          BoxShadow(
            color: Color(0xFFFFB22A),
            offset: Offset(0.1, 0.1),
            blurRadius: 8,
          ),
        ],
      ),
      width: 148.w,
      height: 126.h,
      child: Stack(
        alignment: Alignment.center,
        children: [
          PositionedDirectional(
            bottom: -8,
            end: -5,
            child: Image.asset(
              Assets.imgAccumulatedPhotovoltaic,
              width: 78,
              height: 79,
              matchTextDirection: true,
            ),
          ),

          Container(
            padding: EdgeInsetsDirectional.all(14),
            child: Column(
              children: [
                Container(
                  margin: EdgeInsetsDirectional.only(top: 2),
                  width: double.maxFinite,
                  child: Text(
                    TKey.accumulatedPhotovoltaicPowerGeneration.tr,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(color: Color(0xCCFFFFFF), fontSize: 14.sp),
                  ),
                ),
                SizedBox(
                  width: double.maxFinite,
                  child: Text(
                    "(${totalPvNeg.formatPowerValueUnit()})",
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(color: Color(0xCCFFFFFF), fontSize: 14.sp),
                  ),
                ),
                Spacer(),
                Container(
                  margin: EdgeInsetsDirectional.only(top: 0),
                  width: double.maxFinite,
                  child: AutoSizeText(
                    totalPvNeg.formatPowerValue(),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      color: Color(0xFFFFFFFF),
                      fontSize: 25.sp,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
