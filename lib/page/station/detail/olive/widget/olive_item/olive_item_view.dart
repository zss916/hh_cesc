import 'package:cached_network_image/cached_network_image.dart';
import 'package:cescpro/core/helper/extension_helper.dart';
import 'package:cescpro/core/router/index.dart';
import 'package:cescpro/core/setting/app_setting.dart';
import 'package:cescpro/core/tools/state.dart';
import 'package:cescpro/core/translations/en.dart';
import 'package:cescpro/http/bean/site_detail_entity.dart';
import 'package:cescpro/page/station/detail/olive/widget/olive_item/line_status_widget.dart';
import 'package:cescpro/page/station/detail/olive/widget/olive_item/olive_item_logic.dart';
import 'package:cescpro/page/station/detail/olive/widget/olive_item/widget/grid_view_widget2.dart';
import 'package:cescpro/page/station/detail/olive/widget/olive_item/widget/topology_widget.dart';
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
                if (AppSetting.isOverseas) buildTopTitle(logic),

                RepaintBoundary(
                  child: TopologyWidget(topology: logic.topology),
                ),

                GridViewWidget2(
                  data: logic.data,
                  siteDetail: logic.siteDetail,
                  statisticRecord: logic.statisticRecord,
                  currencyUnit: logic.currencyUnit,
                ),

                if (AppState.instance.isShowRevenue() && logic.revenueShow)
                  buildReport(logic)
                else
                  buildReport2(logic),

                buildSiteInfo(
                  siteDetail: logic.siteDetail,
                  // deviceCount: logic.siteDetail?.containerCount ?? 0,
                ),

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
                  '${TKey.stationStatus.tr}:',
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

  Future<void> refresh(OliveItemLogic logic) async {
    await logic.loadData();
  }

  Widget buildReport(OliveItemLogic logic) => Column(
    children: [
      Container(
        padding: EdgeInsetsDirectional.only(
          top: 16.h,
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
                        siteName: logic.siteName,
                        location: logic.siteDetail?.location,
                        isShowPv: logic.pvCardShow,
                      );
                    } else {
                      if (logic.siteDetail?.showOverSeasUi ?? false) {
                        PageTools.toEleReport(
                          siteId: logic.siteId,
                          siteName: logic.siteName,
                          location: logic.siteDetail?.location,
                          isShowPv: logic.pvCardShow,
                        );
                      } else {
                        PageTools.toReportDetail(
                          siteId: logic.siteId,
                          siteName: logic.siteName,
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
                      siteName: logic.siteName,
                      location: logic.siteDetail?.location,
                      isShowTimeSlot:
                          (logic.siteDetail?.showOverSeasUi ?? false),
                      isShowPv: logic.pvCardShow,
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

  Widget buildReport2(OliveItemLogic logic) => Container(
    width: double.maxFinite,
    height: 48,
    margin: EdgeInsetsDirectional.only(start: 18.w, end: 18.w, top: 14.h),
    clipBehavior: Clip.hardEdge,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(8.r),
      color: Color(0xFF313540),
    ),
    child: Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () {
          if (AppSetting.isOverseas) {
            PageTools.toEleReport(
              siteId: logic.siteId,
              siteName: logic.siteName,
              location: logic.siteDetail?.location,
              isShowPv: logic.pvCardShow,
            );
          } else {
            if (logic.siteDetail?.showOverSeasUi ?? false) {
              PageTools.toEleReport(
                siteId: logic.siteId,
                siteName: logic.siteName,
                location: logic.siteDetail?.location,
                isShowPv: logic.pvCardShow,
              );
            } else {
              PageTools.toReportDetail(
                siteId: logic.siteId,
                siteName: logic.siteName,
                location: logic.siteDetail?.location,
              );
            }
          }
        },
        child: Container(
          padding: EdgeInsetsDirectional.only(start: 10.w, end: 10.w),
          alignment: AlignmentDirectional.center,
          child: Row(
            children: [
              Text(
                AppSetting.isOverseas
                    ? TKey.electricity.tr
                    : TKey.electricityLevelLimit.tr,
                style: TextStyle(color: Colors.white, fontSize: 14.sp),
              ),
              Spacer(),
              Icon(
                Icons.arrow_forward_ios_outlined,
                size: 14.r,
                color: Color(0xA6FFFFFF),
              ),
            ],
          ),
        ),
      ),
    ),
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
                          text: siteDetail?.name ?? "--",
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
                          text: siteDetail?.cname ?? "--",
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
                          text: "${siteDetail?.containerCount ?? 0}",
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
                                text: "${siteDetail?.power ?? 0}kW",
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
                                text: "${siteDetail?.capacity ?? 0}kWh",
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
                            "${siteDetail?.power ?? 0}kW",
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
                            "${siteDetail?.capacity ?? 0}kWh",
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
                                text: "${siteDetail?.pvPower ?? 0}kW",
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
