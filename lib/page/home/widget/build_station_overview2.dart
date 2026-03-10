import 'package:cescpro/core/helper/extension_helper.dart';
import 'package:cescpro/core/setting/app_setting.dart';
import 'package:cescpro/core/translations/en.dart';
import 'package:cescpro/generated/assets.dart';
import 'package:cescpro/page/home/widget/overview_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class BuildStationOverview2 extends StatelessWidget {
  final num capacity; //站点容量
  final num totalPos; //累计充电
  final num totalNeg; //累计放电
  final num totalPvNeg; //累计光伏发电

  const BuildStationOverview2({
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
          height: 120.h,
          margin: EdgeInsetsDirectional.only(top: 5.h, bottom: 10.h),
          child: ListView(
            padding: EdgeInsetsDirectional.symmetric(horizontal: 16.w),
            scrollDirection: Axis.horizontal,
            children: [
              OverviewItemWidget(
                icon: Assets.imgEnergyStorage2,
                value: '$capacity ',
                unit: "kWh",
                title: TKey.energyStorageInstalledCapacity.tr,
              ),

              VerticalDivider(width: 8.w, color: Colors.transparent),

              OverviewItemWidget(
                icon: Assets.imgCumulativeCharging2,
                value: '$showTotalPos ',
                unit: showTotalPosUnit,
                title: TKey.cumulativeChargingCapacity.tr,
              ),

              VerticalDivider(width: 8.w, color: Colors.transparent),

              OverviewItemWidget(
                icon: Assets.imgCumulativeDischarge2,
                value: '$showTotalNeg ',
                unit: showTotalNegUnit,
                title: TKey.cumulativeDischargeCapacity.tr,
              ),

              VerticalDivider(width: 8.w, color: Colors.transparent),

              OverviewItemWidget(
                icon: Assets.imgAccumulatedPhotovoltaic2,
                value: '$showTotalPvNeg ',
                unit: showTotalPvNegUnit,
                title: TKey.accumulatedPhotovoltaicPowerGeneration.tr,
              ),
            ],
          ),
        ),
      ],
    );
  }

  String get showTotalPos =>
      AppSetting.isOverseas ? totalPos.formatPowerValue() : "$totalPos";

  String get showTotalPosUnit =>
      AppSetting.isOverseas ? totalPos.formatPowerValueUnit() : "MWh";

  String get showTotalNeg =>
      AppSetting.isOverseas ? totalNeg.formatPowerValue() : "$totalNeg";

  String get showTotalNegUnit =>
      AppSetting.isOverseas ? totalNeg.formatPowerValueUnit() : "MWh";

  String get showTotalPvNeg =>
      AppSetting.isOverseas ? totalPvNeg.formatPowerValue() : "$totalPvNeg";

  String get showTotalPvNegUnit =>
      AppSetting.isOverseas ? totalPvNeg.formatPowerValueUnit() : "MWh";
}
