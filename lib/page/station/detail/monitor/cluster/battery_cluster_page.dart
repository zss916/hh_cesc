import 'package:auto_size_text/auto_size_text.dart';
import 'package:cescpro/components/common_app_bar.dart';
import 'package:cescpro/core/router/index.dart';
import 'package:cescpro/core/translations/en.dart';
import 'package:cescpro/http/bean/com_type_list_entity.dart';
import 'package:cescpro/page/station/detail/monitor/cluster/battery_cluster_logic.dart';
import 'package:cescpro/page/station/detail/monitor/cluster/line_chart.dart';
import 'package:cescpro/page/station/detail/monitor/detail/widget/child/real_time_data_widget.dart';
import 'package:cescpro/page/station/detail/monitor/detail/widget/line_bar/line_chart.dart';
import 'package:cescpro/page/station/detail/olive/widget/statistics_item/line_title_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class BatteryClusterPage extends StatelessWidget {
  const BatteryClusterPage({super.key});

  //电池集群
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: baseAppBar(title: TKey.batteryCluster.tr),
      backgroundColor: Color(0xFF23282E),
      body: SingleChildScrollView(
        child: GetBuilder<BatteryClusterLogic>(
          init: BatteryClusterLogic(),
          builder: (logic) {
            return Column(
              children: [
                buildSatusItem(logic),
                Divider(height: 12.h, color: Colors.transparent),
                buildBaseInfoItem(logic),
                Divider(height: 12.h, color: Colors.transparent),

                ///todo
                buildLineChartWidget(),
                Divider(height: 12.h, color: Colors.transparent),
                buildDistributionMap(logic),
                Divider(height: 12.h, color: Colors.transparent),
                RealTimeDataWidget(comCardVoList: logic.comCardVoList),
                Divider(height: 120.h, color: Colors.transparent),
              ],
            );
          },
        ),
      ),
    );
  }

  Widget buildSatusItem(BatteryClusterLogic logic) => Column(
    children: [
      Container(
        padding: EdgeInsetsDirectional.only(
          start: 18.w,
          end: 18.w,
          bottom: 16.h,
        ),
        alignment: AlignmentDirectional.centerStart,
        child: Text(
          TKey.status.tr,
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w500,
            fontSize: 16,
          ),
        ),
      ),
      Container(
        constraints: BoxConstraints(minHeight: 120.h),
        margin: EdgeInsets.symmetric(horizontal: 16.w),
        padding: EdgeInsetsDirectional.all(16.r),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Color(0xFF313540),
        ),
        width: double.maxFinite,
        child: Column(
          children: [
            if (logic.comTypeList?.signalStatus?.showFieldName != null)
              Row(
                children: [
                  Text(
                    "${logic.comTypeList?.signalStatus?.showFieldName ?? "--"}:",
                    style: TextStyle(fontSize: 14, color: Color(0xA6FFFFFF)),
                  ),
                  Spacer(),
                  Text(
                    logic.comTypeList?.signalStatus?.showValue ?? "--",
                    style: TextStyle(fontSize: 14, color: Color(0xFFFFFFFF)),
                  ),
                ],
              ),

            Divider(height: 16.h, color: Colors.transparent),

            if (logic.comTypeList?.runStatus?.showFieldName != null)
              Row(
                children: [
                  Text(
                    "${logic.comTypeList?.runStatus?.showFieldName ?? ""}:",
                    style: TextStyle(fontSize: 14, color: Color(0xA6FFFFFF)),
                  ),
                  Spacer(),
                  Text(
                    logic.comTypeList?.runStatus?.showValue ?? "--",
                    style: TextStyle(fontSize: 14, color: Color(0xFFFFFFFF)),
                  ),
                ],
              ),

            Divider(height: 16.h, color: Colors.transparent),

            if (logic.comTypeList?.alarmStatus?.showFieldName != null)
              Row(
                children: [
                  Text(
                    "${logic.comTypeList?.alarmStatus?.showFieldName ?? ""}:",
                    style: TextStyle(fontSize: 14, color: Color(0xA6FFFFFF)),
                  ),
                  Spacer(),
                  Text(
                    logic.comTypeList?.alarmStatus?.showValue ?? "--",
                    style: TextStyle(fontSize: 14, color: Color(0xFFFFFFFF)),
                  ),
                ],
              ),
          ],
        ),
      ),
    ],
  );

  Widget buildBaseInfoItem(BatteryClusterLogic logic) => Column(
    children: [
      Container(
        padding: EdgeInsetsDirectional.only(
          start: 18.w,
          end: 18.w,
          bottom: 16.h,
        ),
        alignment: AlignmentDirectional.centerStart,
        child: Text(
          TKey.basicInformation.tr,
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w500,
            fontSize: 16,
          ),
        ),
      ),
      Container(
        constraints: BoxConstraints(minHeight: 180.h),
        margin: EdgeInsets.symmetric(horizontal: 16.w),
        padding: EdgeInsetsDirectional.all(16.r),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Color(0xFF313540),
        ),
        width: double.maxFinite,
        child: Column(
          children: [
            if (logic.comTypeList?.soc?.showFieldName != null)
              Row(
                children: [
                  Text(
                    "${logic.comTypeList?.soc?.showFieldName ?? ""}:",
                    style: TextStyle(fontSize: 14, color: Color(0xA6FFFFFF)),
                  ),
                  Spacer(),
                  Text(
                    "${logic.comTypeList?.soc?.value ?? "0"}${logic.comTypeList?.soc?.unit ?? ""}",
                    style: TextStyle(fontSize: 14, color: Color(0xFFFFFFFF)),
                  ),
                ],
              ),
            Divider(height: 16.h, color: Colors.transparent),
            if (logic.comTypeList?.voltage?.showFieldName != null)
              Row(
                children: [
                  Text(
                    "${logic.comTypeList?.voltage?.showFieldName ?? ""}:",
                    style: TextStyle(fontSize: 14, color: Color(0xA6FFFFFF)),
                  ),
                  Spacer(),
                  Text(
                    "${logic.comTypeList?.voltage?.value ?? "0"}${logic.comTypeList?.voltage?.unit ?? ""}",
                    style: TextStyle(fontSize: 14, color: Color(0xFFFFFFFF)),
                  ),
                ],
              ),
            Divider(height: 16.h, color: Colors.transparent),
            if (logic.comTypeList?.current?.showFieldName != null)
              Row(
                children: [
                  Text(
                    "${logic.comTypeList?.current?.showFieldName ?? ""}:",
                    style: TextStyle(fontSize: 14, color: Color(0xA6FFFFFF)),
                  ),
                  Spacer(),
                  Text(
                    "${logic.comTypeList?.current?.value ?? "0"}${logic.comTypeList?.current?.unit ?? ""}",
                    style: TextStyle(fontSize: 14, color: Color(0xFFFFFFFF)),
                  ),
                ],
              ),
            Divider(height: 16.h, color: Colors.transparent),
            if (logic.comTypeList?.singleMaxVoltage?.showFieldName != null)
              Row(
                children: [
                  Text(
                    "${logic.comTypeList?.singleMaxVoltage?.showFieldName ?? ""}:",
                    style: TextStyle(fontSize: 14, color: Color(0xA6FFFFFF)),
                  ),
                  Spacer(),
                  Text(
                    "${logic.comTypeList?.singleMaxVoltage?.value ?? "0"}${logic.comTypeList?.singleMaxVoltage?.unit ?? ""}",
                    style: TextStyle(fontSize: 14, color: Color(0xFFFFFFFF)),
                  ),
                ],
              ),
            Divider(height: 16.h, color: Colors.transparent),
            if (logic.comTypeList?.singleMinVoltage?.showFieldName != null)
              Row(
                children: [
                  Text(
                    "${logic.comTypeList?.singleMinVoltage?.showFieldName ?? ""}:",
                    style: TextStyle(fontSize: 14, color: Color(0xA6FFFFFF)),
                  ),
                  Spacer(),
                  Text(
                    "${logic.comTypeList?.singleMinVoltage?.value ?? "0"}${logic.comTypeList?.singleMinVoltage?.unit ?? ""}",
                    style: TextStyle(fontSize: 14, color: Color(0xFFFFFFFF)),
                  ),
                ],
              ),
            Divider(height: 16.h, color: Colors.transparent),
            if (logic.comTypeList?.singleMaxTemp?.showFieldName != null)
              Row(
                children: [
                  Text(
                    "${logic.comTypeList?.singleMaxTemp?.showFieldName ?? ""}:",
                    style: TextStyle(fontSize: 14, color: Color(0xA6FFFFFF)),
                  ),
                  Spacer(),
                  Text(
                    "${logic.comTypeList?.singleMaxTemp?.value ?? 0}${logic.comTypeList?.singleMaxTemp?.unit ?? ""}",
                    style: TextStyle(fontSize: 14, color: Color(0xFFFFFFFF)),
                  ),
                ],
              ),
            Divider(height: 16.h, color: Colors.transparent),
            if (logic.comTypeList?.singleMinTemp?.showFieldName != null)
              Row(
                children: [
                  Text(
                    "${logic.comTypeList?.singleMinTemp?.showFieldName ?? ""}:",
                    style: TextStyle(fontSize: 14, color: Color(0xA6FFFFFF)),
                  ),
                  Spacer(),
                  Text(
                    "${logic.comTypeList?.singleMinTemp?.value ?? 0}${logic.comTypeList?.singleMinTemp?.unit ?? ""}",
                    style: TextStyle(fontSize: 14, color: Color(0xFFFFFFFF)),
                  ),
                ],
              ),
            Divider(height: 16.h, color: Colors.transparent),
            if (logic.comTypeList?.maxChargePower?.showFieldName != null)
              Row(
                children: [
                  Text(
                    "${logic.comTypeList?.maxChargePower?.showFieldName ?? ""}:",
                    style: TextStyle(fontSize: 14, color: Color(0xA6FFFFFF)),
                  ),
                  Spacer(),
                  Text(
                    "${logic.comTypeList?.maxChargePower?.value ?? "0"}${logic.comTypeList?.maxChargePower?.unit ?? ""}",
                    style: TextStyle(fontSize: 14, color: Color(0xFFFFFFFF)),
                  ),
                ],
              ),
            Divider(height: 16.h, color: Colors.transparent),
            if (logic.comTypeList?.maxOutPower?.showFieldName != null)
              Row(
                children: [
                  Text(
                    "${logic.comTypeList?.maxOutPower?.showFieldName ?? ""}:",
                    style: TextStyle(fontSize: 14, color: Color(0xA6FFFFFF)),
                  ),
                  Spacer(),
                  Text(
                    "${logic.comTypeList?.maxOutPower?.value ?? "0"}${logic.comTypeList?.maxOutPower?.unit ?? ""}",
                    style: TextStyle(fontSize: 14, color: Color(0xFFFFFFFF)),
                  ),
                ],
              ),
          ],
        ),
      ),
    ],
  );

  Widget buildLineChartWidget2() {
    return Column(
      children: [
        Container(
          padding: EdgeInsetsDirectional.only(
            start: 18.w,
            end: 18.w,
            bottom: 16.h,
          ),
          alignment: AlignmentDirectional.centerStart,
          child: Text(
            TKey.realTimeSoc.tr,
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w500,
              fontSize: 16,
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 16.w),
          padding: EdgeInsetsDirectional.only(
            start: 5.w,
            end: 10.w,
            bottom: 15.h,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Color(0xFF313540),
          ),
          width: double.maxFinite,
          child: Stack(
            alignment: AlignmentDirectional.topCenter,
            children: [
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    color: Colors.transparent,
                    height: 270,
                    width: double.maxFinite,
                    child: LineChartWidget(),
                  ),
                  Divider(height: 5.h, color: Colors.transparent),
                  Row(
                    children: [
                      Spacer(),
                      LineTitleWidget(
                        title: TKey.power.tr,
                        color: Color(0xFF3874F2),
                      ),
                      VerticalDivider(width: 16.w, color: Colors.transparent),
                      LineTitleWidget(title: "SOC", color: Color(0xFF0BC3C4)),
                      Spacer(),
                    ],
                  ),
                ],
              ),
              PositionedDirectional(
                start: 0.w,
                top: 15.h,
                child: Text(
                  "(KW)",
                  style: TextStyle(color: Color(0x80FFFFFF), fontSize: 12.sp),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget buildLineChartWidget() {
    return Column(
      children: [
        Container(
          padding: EdgeInsetsDirectional.only(
            start: 18.w,
            end: 18.w,
            bottom: 16.h,
          ),
          alignment: AlignmentDirectional.centerStart,
          child: Text(
            TKey.realTimeSoc.tr,
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w500,
              fontSize: 16,
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 16.w),
          padding: EdgeInsetsDirectional.only(
            start: 5.w,
            end: 10.w,
            bottom: 15.h,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Color(0xFF313540),
          ),
          width: double.maxFinite,
          child: Stack(
            alignment: AlignmentDirectional.topCenter,
            children: [
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Divider(height: 5.h, color: Colors.transparent),

                  GetBuilder<BatteryClusterLogic>(
                    id: "realTimeData",
                    init: BatteryClusterLogic(),
                    builder: (logic) {
                      return Container(
                        color: Colors.transparent,
                        height: 270.h,
                        width: double.maxFinite,
                        child: logic.arrList.isEmpty
                            ? Center(
                                child: CircularProgressIndicator(
                                  color: Colors.white,
                                ),
                              )
                            : MonitorLineChartWidget(
                                arrList: logic.arrList,
                                maxX: logic.arrMaxX.toDouble(),
                                maxY: logic.arrMaxY,
                                minY: logic.arrMinY,
                                maxYR: logic.arrMaxYR,
                                minYR: logic.arrMinYR,
                              ),
                      );
                    },
                  ),
                  Divider(height: 5.h, color: Colors.transparent),
                  Row(
                    children: [
                      Spacer(),
                      Row(
                        children: [
                          Container(
                            width: 7,
                            height: 7,
                            margin: EdgeInsets.only(right: 5.w),
                            decoration: BoxDecoration(
                              color: Color(0xFF3874F2),
                              borderRadius: BorderRadius.circular(2),
                            ),
                          ),
                          Text(
                            TKey.power.tr,
                            style: TextStyle(
                              color: Color(0xD9FFFFFF),
                              fontSize: 12.sp,
                            ),
                          ),
                        ],
                      ),
                      VerticalDivider(width: 16.w, color: Colors.transparent),
                      Row(
                        children: [
                          Container(
                            width: 7,
                            height: 7,
                            margin: EdgeInsets.only(right: 5.w),
                            decoration: BoxDecoration(
                              color: Color(0xFF0BC3C4),
                              borderRadius: BorderRadius.circular(2),
                            ),
                          ),
                          Text(
                            "SOC",
                            style: TextStyle(
                              color: Color(0xD9FFFFFF),
                              fontSize: 12.sp,
                            ),
                          ),
                        ],
                      ),
                      Spacer(),
                    ],
                  ),
                ],
              ),
              PositionedDirectional(
                start: 0.w,
                top: 15.h,
                child: Text(
                  "(KW)",
                  style: TextStyle(color: Color(0x80FFFFFF), fontSize: 12.sp),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget buildDistributionMap(BatteryClusterLogic logic) => Column(
    children: [
      Container(
        padding: EdgeInsetsDirectional.only(
          start: 18.w,
          end: 18.w,
          bottom: 16.h,
        ),
        alignment: AlignmentDirectional.centerStart,
        child: Text(
          TKey.distributionMap.tr,
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
                    ComTypeListItem? maxTemp = logic.comTypeList?.singleMaxTemp;
                    ComTypeListItem? minTemp = logic.comTypeList?.singleMinTemp;
                    String content =
                        "${maxTemp?.showFieldName ?? ""}/${minTemp?.showFieldName ?? ""}:${maxTemp?.showValue ?? ""}${minTemp?.unit ?? ""}/${minTemp?.showValue ?? ""}${minTemp?.unit ?? ""}";
                    PageTools.toDistributionMap(
                      title: TKey.singleTemp.tr,
                      content: content,
                      siteId: logic.siteId,
                      did: logic.did,
                      nodeNo: logic.nodeNo,
                      devNo: logic.devNo,
                      type: 1,
                    );
                  },
                  child: Container(
                    padding: EdgeInsets.all(4),
                    alignment: AlignmentDirectional.center,
                    child: AutoSizeText(
                      TKey.singleTemp.tr,
                      maxLines: 1,
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
                    PageTools.toDistributionMap(
                      title: "SOC",
                      content: "",
                      siteId: logic.siteId,
                      did: logic.did,
                      nodeNo: logic.nodeNo,
                      devNo: logic.devNo,
                      type: 2,
                    );
                  },
                  child: Container(
                    alignment: AlignmentDirectional.center,
                    child: Text(
                      "SOC",
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
                    ComTypeListItem? maxV = logic.comTypeList?.singleMaxVoltage;
                    ComTypeListItem? minV = logic.comTypeList?.singleMinVoltage;
                    String content =
                        "${maxV?.showFieldName ?? ""}/${minV?.showFieldName ?? ""}:${maxV?.showValue ?? ""}${minV?.unit ?? ""}/${minV?.showValue ?? ""}${minV?.unit ?? ""}";

                    PageTools.toDistributionMap(
                      title: TKey.cellVoltage.tr,
                      content: content,
                      siteId: logic.siteId,
                      did: logic.did,
                      nodeNo: logic.nodeNo,
                      devNo: logic.devNo,
                      type: 3,
                    );
                  },
                  child: Container(
                    alignment: AlignmentDirectional.center,
                    child: AutoSizeText(
                      TKey.cellVoltage.tr,
                      maxLines: 1,
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
}
