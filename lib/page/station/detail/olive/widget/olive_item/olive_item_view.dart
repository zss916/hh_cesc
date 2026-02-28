import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cescpro/core/helper/extension_helper.dart';
import 'package:cescpro/core/router/index.dart';
import 'package:cescpro/core/setting/app_setting.dart';
import 'package:cescpro/core/translations/en.dart';
import 'package:cescpro/generated/assets.dart';
import 'package:cescpro/http/bean/site_detail_entity.dart';
import 'package:cescpro/page/station/detail/olive/widget/olive_item/grid_view_widget.dart';
import 'package:cescpro/page/station/detail/olive/widget/olive_item/line/gplot_line_widget.dart';
import 'package:cescpro/page/station/detail/olive/widget/olive_item/line_status_widget.dart';
import 'package:cescpro/page/station/detail/olive/widget/olive_item/olive_item_logic.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class OliveItemView extends StatelessWidget {
  const OliveItemView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OliveItemLogic>(
      init: OliveItemLogic(),
      builder: (logic) {
        return RefreshIndicator(
          onRefresh: () => refresh(logic),
          child: SingleChildScrollView(
            child: Column(
              children: [
                buildTopTitle(logic),

                buildTopology(logic),

                GridViewWidget(
                  todayCharging: logic.showChargeAvg,
                  todayChargingUnit: logic.showChargeAvgUnit,
                  todayDischarge: logic.showRechargeAvg,
                  todayDischargeUnit: logic.showRechargeAvgUnit,
                  showTodayIncome: logic.showLastDayIncome,
                  todayPVPowerEarnings: logic.showTodayPvTotalNeg,
                  todayPVPowerEarningsUnit: logic.showTodayPvTotalNegUnit,
                  siteDetail: logic.siteDetail,
                  statisticRecord: logic.statisticRecord,
                  currencyUnit: logic.currencyUnit,
                ),

                buildReport(logic),
                buildSiteInfo(siteDetail: logic.siteDetail),

                SizedBox(height: 200.h),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget buildTopTitle(OliveItemLogic logic) {
    return Container(
      margin: EdgeInsets.only(top: 18.h, left: 16.w, right: 16.w),
      width: double.maxFinite,
      child: Wrap(
        spacing: 10,
        children: [
          if (logic.weather != null)
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  TKey.todayWeather.tr,
                  style: TextStyle(fontSize: 13, color: Color(0xB3FFFFFF)),
                ),
                Text(
                  logic.weatherData,
                  style: TextStyle(fontSize: 15, color: Color(0xDEFFFFFF)),
                ),
              ],
            ),

          if (logic.workModel.isNotEmpty)
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  TKey.workModel.tr,
                  style: TextStyle(fontSize: 13, color: Color(0xB3FFFFFF)),
                ),
                LineStatusWidget(status: logic.siteDetail?.status ?? 99),
                Text(
                  logic.workModel,
                  style: TextStyle(fontSize: 15, color: Color(0xDEFFFFFF)),
                ),
              ],
            ),
        ],
      ),
    );
  }

  ///拓扑图
  Widget buildTopology(OliveItemLogic logic) {
    if (logic.topology != null) {
      return (logic.isHasPv)
          ? Container(
              decoration: BoxDecoration(
                color: Color(0xFF313540),
                borderRadius: BorderRadius.circular(8),
              ),
              padding: EdgeInsetsDirectional.all(5.r),
              margin: EdgeInsets.only(top: 16.h, left: 16.w, right: 16.w),
              width: double.maxFinite,
              height: (Get.width - 32.w),
              child: Stack(
                alignment: AlignmentDirectional.center,
                children: [
                  GplotLineWidget(
                    defaultLines: [
                      [
                        {
                          'start': Offset(70.r, (Get.width - 32.w) / 2),
                          'end': Offset(125.r, (Get.width - 32.w) / 2),
                        },
                      ],
                      [
                        {
                          'start': Offset(70.r + 150.r, (Get.width - 32.w) / 2),
                          'end': Offset(125.r + 150.r, (Get.width - 32.w) / 2),
                        },
                      ],
                      if (logic.isHasPv)
                        [
                          {
                            'start': Offset((Get.width - 32.w) / 2, 70.r),
                            'end': Offset((Get.width - 32.w) / 2, 70.r + 75.r),
                          },
                        ],
                      [
                        {
                          'start': Offset((Get.width - 32.w) / 2, 70.r + 170.r),
                          'end': Offset(
                            (Get.width - 32.w) / 2,
                            70.r + 75.r + 120.r + 15.r,
                          ),
                        },
                      ],
                    ],
                    lines: logic.line.isEmpty
                        ? []
                        : [
                            if (logic.topology?.load != null &&
                                logic.topology?.isHasLoad == true)
                              [
                                ///load <- ems
                                {
                                  'end': Offset(70.r, (Get.width - 32.w) / 2),
                                  'start': Offset(
                                    125.r,
                                    (Get.width - 32.w) / 2,
                                  ),
                                },
                              ],

                            if (logic.topology?.grid != null &&
                                logic.topology?.isHasGrid == true)
                              [
                                ///grid <->ems
                                if (logic.topology?.isGridOut == true)
                                  {
                                    'end': Offset(
                                      70.r + 150.r,
                                      (Get.width - 32.w) / 2,
                                    ),
                                    'start': Offset(
                                      125.r + 150.r,
                                      (Get.width - 32.w) / 2,
                                    ),
                                  },

                                if (logic.topology?.isGridOut == false)
                                  {
                                    'start': Offset(
                                      70.r + 150.r,
                                      (Get.width - 32.w) / 2,
                                    ),
                                    'end': Offset(
                                      125.r + 150.r,
                                      (Get.width - 32.w) / 2,
                                    ),
                                  },
                              ],
                            if (logic.isHasPv)
                              [
                                ///pv -> ems
                                {
                                  'start': Offset((Get.width - 32.w) / 2, 70.r),
                                  'end': Offset(
                                    (Get.width - 32.w) / 2,
                                    70.r + 75.r,
                                  ),
                                },
                              ],

                            if (logic.topology?.storage != null &&
                                logic.topology?.isHasStorage == true)
                              [
                                ///ems <-> battery
                                if (logic.topology?.isBatteryOut == false)
                                  {
                                    'start': Offset(
                                      (Get.width - 32.w) / 2,
                                      70.r + 155.r,
                                    ),
                                    'end': Offset(
                                      (Get.width - 32.w) / 2,
                                      70.r + 75.r + 120.r,
                                    ),
                                  },

                                if (logic.topology?.isBatteryOut == true)
                                  {
                                    'end': Offset(
                                      (Get.width - 32.w) / 2,
                                      70.r + 155.r,
                                    ),
                                    'start': Offset(
                                      (Get.width - 32.w) / 2,
                                      70.r + 75.r + 120.r,
                                    ),
                                  },
                              ],
                          ],
                  ),

                  Center(
                    child: Stack(
                      alignment: AlignmentDirectional.center,
                      children: [
                        Image.asset(
                          Assets.gplotInverter,
                          width: 110.r,
                          height: 110.r,
                        ),
                        PositionedDirectional(
                          bottom: 0,
                          child: Text(
                            "EMS",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 13.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  ///battery
                  PositionedDirectional(
                    bottom: 0,
                    end: 0,
                    start: 0,
                    child: Stack(
                      alignment: AlignmentDirectional.center,
                      children: [
                        Transform.scale(
                          scale: 0.9,
                          child: Image.asset(
                            Assets.gplotBattery,
                            width: 75.r,
                            height: 75.r,
                          ),
                        ),
                        PositionedDirectional(
                          start: (Get.width - 32.r) / 2 - 100.r,
                          bottom: 5.r,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                "Battery",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 13.sp,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              Text(
                                "${logic.storagePower}KW",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 13.sp,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              Text(
                                "SOC:${logic.storageSoc}%",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 13.sp,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),

                  ///load
                  PositionedDirectional(
                    top: 0,
                    bottom: 0,
                    start: 0,
                    child: Stack(
                      alignment: AlignmentDirectional.center,
                      children: [
                        Image.asset(
                          Assets.gplotLoad,
                          width: 75.r,
                          height: 75.r,
                        ),
                      ],
                    ),
                  ),

                  ///load text
                  PositionedDirectional(
                    top: (Get.width - 32.w) / 2 + 20.r,
                    start: 0,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          "Load",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 13.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Text(
                          "${logic.loadPower}KW",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 13.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),

                  ///grid
                  PositionedDirectional(
                    top: 0,
                    end: 0,
                    bottom: 0,
                    child: Stack(
                      alignment: AlignmentDirectional.center,
                      children: [
                        Image.asset(
                          Assets.gplotPowerGrid,
                          width: 75.r,
                          height: 75.r,
                        ),
                      ],
                    ),
                  ),

                  ///grid text
                  PositionedDirectional(
                    top: (Get.width - 32.w) / 2 + 20.r,
                    end: 20.r,
                    child: SizedBox(
                      width: 100.w,
                      // color: Colors.yellow,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            "Grid",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 13.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          AutoSizeText(
                            "${logic.gridPower}KW",
                            minFontSize: 10,
                            maxLines: 1,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 13.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  if (logic.isHasPv)
                    PositionedDirectional(
                      top: 0,
                      start: 0,
                      end: 0,
                      child: Stack(
                        alignment: AlignmentDirectional.center,
                        children: [
                          Image.asset(
                            Assets.gplotPv,
                            width: 75.r,
                            height: 75.r,
                          ),
                          PositionedDirectional(
                            start: (Get.width - 32.r) / 2 - 90.r,
                            top: 10.r,
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  "PV",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 13.sp,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                Text(
                                  "${logic.pvPower}KW",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 13.sp,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                ],
              ),
            )
          : Container(
              decoration: BoxDecoration(
                color: Color(0xFF313540),
                borderRadius: BorderRadius.circular(8),
              ),
              padding: EdgeInsetsDirectional.all(5.r),
              margin: EdgeInsets.only(top: 16.h, left: 16.w, right: 16.w),
              width: double.maxFinite,
              height: (Get.width - 120.w),
              child: Stack(
                alignment: AlignmentDirectional.topCenter,
                children: [
                  GplotLineWidget(
                    defaultLines: [
                      [
                        {
                          'start': Offset(70.r, 20 + (75.r / 2)),
                          'end': Offset(125.r, 20 + (75.r / 2)),
                        },
                      ],
                      [
                        {
                          'start': Offset(75.r + 150.r, 20 + (75.r / 2)),
                          'end': Offset(130.r + 150.r, 20 + (75.r / 2)),
                        },
                      ],
                      [
                        {
                          'start': Offset((Get.width - 32.w) / 2, 20 + 100.r),
                          'end': Offset(
                            (Get.width - 32.w) / 2,
                            20 + 100.r + 50.r,
                          ),
                        },
                      ],
                    ],
                    lines: logic.line.isEmpty
                        ? []
                        : [
                            if (logic.topology?.load != null &&
                                logic.topology?.isHasLoad == true)
                              [
                                ///load <- ems
                                {
                                  'end': Offset(70.r, 20 + (75.r / 2)),
                                  'start': Offset(125.r, 20 + (75.r / 2)),
                                },
                              ],

                            if (logic.topology?.grid != null &&
                                logic.topology?.isHasGrid == true)
                              [
                                ///grid <->ems
                                if (logic.topology?.isGridOut == true)
                                  {
                                    'end': Offset(
                                      70.r + 150.r,
                                      20 + (75.r / 2),
                                    ),
                                    'start': Offset(
                                      125.r + 150.r,
                                      20 + (75.r / 2),
                                    ),
                                  },

                                if (logic.topology?.isGridOut == false)
                                  {
                                    'start': Offset(
                                      70.r + 150.r,
                                      20 + (75.r / 2),
                                    ),
                                    'end': Offset(
                                      125.r + 150.r,
                                      20 + (75.r / 2),
                                    ),
                                  },
                              ],

                            if (logic.topology?.storage != null &&
                                logic.topology?.isHasStorage == true)
                              [
                                ///ems <-> battery
                                if (logic.topology?.isBatteryOut == false)
                                  {
                                    'start': Offset(
                                      (Get.width - 32.w) / 2,
                                      20 + 100.r,
                                    ),
                                    'end': Offset(
                                      (Get.width - 32.w) / 2,
                                      20 + 100.r + 50.r,
                                    ),
                                  },

                                if (logic.topology?.isBatteryOut == true)
                                  {
                                    'end': Offset(
                                      (Get.width - 32.w) / 2,
                                      20 + 100.r,
                                    ),
                                    'start': Offset(
                                      (Get.width - 32.w) / 2,
                                      20 + 100.r + 50.r,
                                    ),
                                  },
                              ],
                          ],
                  ),

                  Stack(
                    alignment: AlignmentDirectional.center,
                    children: [
                      Image.asset(
                        Assets.gplotInverter,
                        width: 110.r,
                        height: 110.r,
                      ),
                      PositionedDirectional(
                        bottom: 0,
                        child: Text(
                          "EMS",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 13.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
                  ),

                  ///battery
                  PositionedDirectional(
                    bottom: 10,
                    end: 0,
                    start: 0,
                    child: Stack(
                      alignment: AlignmentDirectional.center,
                      children: [
                        Transform.scale(
                          scale: 0.9,
                          child: Image.asset(
                            Assets.gplotBattery,
                            width: 75.r,
                            height: 75.r,
                          ),
                        ),
                        PositionedDirectional(
                          start: (Get.width - 32.r) / 2 - 100.r,
                          bottom: 5.r,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                "Battery",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 13.sp,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              Text(
                                "${logic.storagePower}KW",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 13.sp,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              Text(
                                "SOC:${logic.storageSoc}%",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 13.sp,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),

                  ///load
                  PositionedDirectional(
                    top: 20,
                    start: 0,
                    child: Stack(
                      alignment: AlignmentDirectional.center,
                      children: [
                        Image.asset(
                          Assets.gplotLoad,
                          width: 75.r,
                          height: 75.r,
                        ),
                      ],
                    ),
                  ),

                  ///load text
                  PositionedDirectional(
                    top: 75.r + 20,
                    start: 10,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          "Load",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 13.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Text(
                          "${logic.loadPower}KW",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 13.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),

                  ///grid
                  PositionedDirectional(
                    top: 25,
                    end: 0,
                    // bottom: 0,
                    child: Stack(
                      alignment: AlignmentDirectional.center,
                      children: [
                        Image.asset(
                          Assets.gplotPowerGrid,
                          width: 75.r,
                          height: 75.r,
                        ),
                      ],
                    ),
                  ),

                  ///grid text
                  PositionedDirectional(
                    top: 75.r + 25,
                    end: 20.r,
                    child: SizedBox(
                      width: 100.w,
                      // color: Colors.yellow,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            "Grid",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 13.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          AutoSizeText(
                            "${logic.gridPower}KW",
                            minFontSize: 10,
                            maxLines: 1,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 13.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            );
    } else {
      return Container(
        decoration: BoxDecoration(
          color: Color(0xFF313540),
          borderRadius: BorderRadius.circular(8),
        ),
        padding: EdgeInsetsDirectional.all(5.r),
        margin: EdgeInsets.only(top: 16.h, left: 16.w, right: 16.w),
        width: double.maxFinite,
        height: (Get.width - 32.w),
        child: Stack(
          alignment: Alignment.center,
          children: [
            SizedBox(
              width: 42,
              height: 42,
              child: CircularProgressIndicator(
                color: Colors.white,
                strokeWidth: 3,
              ),
            ),
          ],
        ),
      );
    }
  }

  Future<void> refresh(OliveItemLogic logic) async {
    await logic.loadData();
  }

  Widget buildReport(OliveItemLogic logic) => Column(
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
                    if (AppSetting.isOverseas) {
                      PageTools.toEleReport(
                        siteId: logic.siteId,
                        location: logic.siteDetail?.location,
                      );
                    } else {
                      if (logic.siteDetail?.showOverSeasUi ?? false) {
                        PageTools.toEleReport(
                          siteId: logic.siteId,
                          location: logic.siteDetail?.location,
                        );
                      } else {
                        PageTools.toReportDetail(
                          siteId: logic.siteId,
                          location: logic.siteDetail?.location,
                        );
                      }
                    }
                  },
                  child: Container(
                    alignment: AlignmentDirectional.center,
                    child: Text(
                      AppSetting.isOverseas
                          ? TKey.electricity.tr
                          : TKey.electricityLevelLimit.tr,
                      style: TextStyle(color: Colors.white, fontSize: 14.sp),
                    ),
                  ),
                ),
              ),
            ),
          ),
          VerticalDivider(width: 16.w, color: Colors.transparent),
          if (false)
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
          if (false) VerticalDivider(width: 16.w, color: Colors.transparent),
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
                    PageTools.toRevenue(
                      siteId: logic.siteId,
                      location: logic.siteDetail?.location,
                      isShowTimeSlot:
                          (logic.siteDetail?.showOverSeasUi ?? false),
                    );
                  },
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

  Widget buildSiteInfo({SiteDetailEntity? siteDetail}) => Column(
    children: [
      Container(
        padding: EdgeInsetsDirectional.only(
          top: 24.h,
          start: 18.w,
          end: 18.w,
          bottom: 0.h,
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
            Container(
              alignment: Alignment.centerLeft,
              width: double.maxFinite,
              child: Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: "${TKey.powerSiteName.tr}: ",
                      children: [
                        TextSpan(
                          style: TextStyle(
                            fontSize: 12.sp,
                            color: Color(0xFFFFFFFF),
                          ),
                          text: siteDetail?.name ?? "",
                        ),
                      ],
                      style: TextStyle(
                        fontSize: 12.sp,
                        color: Color(0xA6FFFFFF),
                      ),
                    ),
                  ],
                ),
                textAlign: TextAlign.start,
              ),
            ),
            Divider(height: 8.h, color: Colors.transparent),
            Container(
              alignment: Alignment.centerLeft,
              width: double.maxFinite,
              child: Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: "${TKey.affiliatedCustomer.tr}: ",
                      children: [
                        TextSpan(
                          style: TextStyle(
                            fontSize: 12.sp,
                            color: Color(0xFFFFFFFF),
                          ),
                          text: siteDetail?.cname ?? "",
                        ),
                      ],
                      style: TextStyle(
                        fontSize: 12.sp,
                        color: Color(0xA6FFFFFF),
                      ),
                    ),
                  ],
                ),
                textAlign: TextAlign.start,
              ),
            ),
            Divider(height: 8.h, color: Colors.transparent),
            Container(
              alignment: Alignment.centerLeft,
              width: double.maxFinite,
              child: Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: "${TKey.energyStorageDevicesCount.tr}: ",
                      children: [
                        TextSpan(
                          style: TextStyle(
                            fontSize: 12.sp,
                            color: Color(0xFFFFFFFF),
                          ),
                          text: "${siteDetail?.hasDevCount ?? 0}",
                        ),
                      ],
                      style: TextStyle(
                        fontSize: 12.sp,
                        color: Color(0xA6FFFFFF),
                      ),
                    ),
                  ],
                ),
                textAlign: TextAlign.start,
              ),
            ),
            Divider(height: 8.h, color: Colors.transparent),
            if (!Get.isZh)
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    alignment: Alignment.centerLeft,
                    width: double.maxFinite,
                    child: Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: "${TKey.energyStorageInstalledPower.tr}: ",
                            children: [
                              TextSpan(
                                style: TextStyle(
                                  fontSize: 12.sp,
                                  color: Color(0xFFFFFFFF),
                                ),
                                text: "${siteDetail?.power ?? 0}kw",
                              ),
                            ],
                            style: TextStyle(
                              fontSize: 12.sp,
                              color: Color(0xA6FFFFFF),
                            ),
                          ),
                        ],
                      ),
                      textAlign: TextAlign.start,
                    ),
                  ),
                  Divider(height: 8.h, color: Colors.transparent),
                  Container(
                    alignment: Alignment.centerLeft,
                    width: double.maxFinite,
                    child: Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: "${TKey.energyStorageInstalledCapacity.tr}: ",
                            children: [
                              TextSpan(
                                style: TextStyle(
                                  fontSize: 12.sp,
                                  color: Color(0xFFFFFFFF),
                                ),
                                text: "${siteDetail?.capacity ?? 0}kwh",
                              ),
                            ],
                            style: TextStyle(
                              fontSize: 12.sp,
                              color: Color(0xA6FFFFFF),
                            ),
                          ),
                        ],
                      ),
                      textAlign: TextAlign.start,
                    ),
                  ),
                ],
              )
            else
              Row(
                children: [
                  Expanded(
                    child: Row(
                      children: [
                        Text(
                          "${TKey.energyStorageInstalledPower.tr}: ",
                          style: TextStyle(
                            fontSize: 12.sp,
                            color: Color(0xA6FFFFFF),
                          ),
                        ),
                        Expanded(
                          child: Text(
                            "${siteDetail?.power ?? 0}kw",
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
                          "${TKey.energyStorageInstalledCapacity.tr}: ",
                          style: TextStyle(
                            fontSize: 12.sp,
                            color: Color(0xA6FFFFFF),
                          ),
                        ),

                        Expanded(
                          child: Text(
                            "${siteDetail?.capacity ?? 0}kwh",
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

            /* if ((siteDetail?.hasPv ?? false) && Get.isEn)
              Row(
                children: [
                  Expanded(
                    child: Row(
                      children: [
                        Text(
                          "${TKey.photovoltaicInstalledPower.tr}: ",
                          style: TextStyle(
                            fontSize: 12.sp,
                            color: Color(0xA6FFFFFF),
                          ),
                        ),
                        Expanded(
                          child: Text(
                            "${siteDetail?.pvPower ?? 0}kw",
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
                          "${TKey.photovoltaicInstalledCapacity.tr}: ",
                          style: TextStyle(
                            fontSize: 12.sp,
                            color: Color(0xA6FFFFFF),
                          ),
                        ),
                        Expanded(
                          child: Text(
                            "${siteDetail?.pvCapacity ?? 0}kwh",
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
              ),*/
            if ((siteDetail?.hasPv ?? false))
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    alignment: Alignment.centerLeft,
                    width: double.maxFinite,
                    child: Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: "${TKey.photovoltaicInstalledPower.tr}: ",
                            children: [
                              TextSpan(
                                style: TextStyle(
                                  fontSize: 12.sp,
                                  color: Color(0xFFFFFFFF),
                                ),
                                text: "${siteDetail?.pvPower ?? 0}kw",
                              ),
                            ],
                            style: TextStyle(
                              fontSize: 12.sp,
                              color: Color(0xA6FFFFFF),
                            ),
                          ),
                        ],
                      ),
                      textAlign: TextAlign.start,
                    ),
                  ),
                  Divider(height: 8.h, color: Colors.transparent),
                  Container(
                    alignment: Alignment.centerLeft,
                    width: double.maxFinite,
                    child: Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: "${TKey.photovoltaicInstalledCapacity.tr}: ",
                            children: [
                              TextSpan(
                                style: TextStyle(
                                  fontSize: 12.sp,
                                  color: Color(0xFFFFFFFF),
                                ),
                                text: "${siteDetail?.pvCapacity ?? 0}kwh",
                              ),
                            ],
                            style: TextStyle(
                              fontSize: 12.sp,
                              color: Color(0xA6FFFFFF),
                            ),
                          ),
                        ],
                      ),
                      textAlign: TextAlign.start,
                    ),
                  ),
                ],
              ),

            Divider(height: 8.h, color: Colors.transparent),
            if (siteDetail?.picture != null)
              Container(
                width: double.infinity,
                height: 164.h,
                decoration: BoxDecoration(
                  color: Colors.black,
                  image: DecorationImage(
                    image: CachedNetworkImageProvider(
                      siteDetail?.picture ?? "",
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
                //child: Icon(Icons.image, color: Colors.white, size: 60),
              ),
          ],
        ),
      ),
    ],
  );
}
