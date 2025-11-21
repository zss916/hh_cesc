import 'package:cached_network_image/cached_network_image.dart';
import 'package:cescpro/core/router/index.dart';
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
                Container(
                  margin: EdgeInsets.only(top: 18.h, left: 16.w, right: 16.w),
                  width: double.maxFinite,
                  child: Row(
                    children: [
                      if (logic.weather != null)
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              TKey.todayWeather.tr,
                              style: TextStyle(
                                fontSize: 13,
                                color: Color(0xB3FFFFFF),
                              ),
                            ),
                            Text(
                              logic.weatherData,
                              style: TextStyle(
                                fontSize: 15,
                                color: Color(0xDEFFFFFF),
                              ),
                            ),
                          ],
                        ),
                      Spacer(),
                      Text(
                        TKey.workModel.tr,
                        style: TextStyle(
                          fontSize: 13,
                          color: Color(0xB3FFFFFF),
                        ),
                      ),
                      if (logic.workModel.isNotEmpty) LineStatusWidget(),
                      if (logic.workModel.isNotEmpty)
                        Text(
                          logic.workModel,
                          style: TextStyle(
                            fontSize: 15,
                            color: Color(0xDEFFFFFF),
                          ),
                        ),
                    ],
                  ),
                ),

                Container(
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
                              {
                                'start': Offset((Get.width - 32.w) / 2, 70.r),
                                'end': Offset(
                                  (Get.width - 32.w) / 2,
                                  70.r + 75.r,
                                ),
                              },
                            ],
                          [
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
                          ],
                        ],
                        lines: [
                          [
                            {
                              'start': Offset(70.r, (Get.width - 32.w) / 2),
                              'end': Offset(125.r, (Get.width - 32.w) / 2),
                            },
                          ],
                          [
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
                              {
                                'start': Offset((Get.width - 32.w) / 2, 70.r),
                                'end': Offset(
                                  (Get.width - 32.w) / 2,
                                  70.r + 75.r,
                                ),
                              },
                            ],
                          [
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
                            PositionedDirectional(
                              top: (Get.width - 32.w) / 2 + 20.r,
                              child: Column(
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
                          ],
                        ),
                      ),

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
                            PositionedDirectional(
                              top: (Get.width - 32.w) / 2 + 20.r,
                              end: 20.r,
                              child: Column(
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
                                  Text(
                                    "${logic.gridPower}KW",
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
                ),

                GridViewWidget(
                  todayCharging: logic.showChargeAvg,
                  todayDischarge: logic.showRechargeAvg,
                  showTodayIncome: logic.showTodayIncome,
                  todayPVPowerEarnings: logic.showTodayPvTotalNeg,
                  siteDetail: logic.siteDetail,
                  statisticRecord: logic.statisticRecord,
                ),

                buildReport(),
                buildSiteInfo(siteDetail: logic.siteDetail),

                SizedBox(height: 200.h),
              ],
            ),
          ),
        );
      },
    );
  }

  Future<void> refresh(OliveItemLogic logic) async {
    await Future.delayed(const Duration(seconds: 2));
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

  Widget buildSiteInfo({SiteDetailEntity? siteDetail}) => Column(
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
                    siteDetail?.name ?? "",
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
                    siteDetail?.cname ?? "",
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
                    "${siteDetail?.hasDevCount ?? 0}",
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
                        "${TKey.energyStorageInstalledCapacity.tr}:",
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
            if (siteDetail?.hasPv ?? false)
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
                          "${TKey.photovoltaicInstalledCapacity.tr}:",
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
