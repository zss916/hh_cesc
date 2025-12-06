import 'package:cescpro/core/helper/extension_helper.dart';
import 'package:cescpro/core/router/index.dart';
import 'package:cescpro/core/translations/en.dart';
import 'package:cescpro/http/bean/com_type_list_entity.dart';
import 'package:cescpro/page/station/detail/monitor/detail/monitor_detail_logic.dart';
import 'package:cescpro/page/station/detail/monitor/detail/widget/child/real_time_data_widget.dart';
import 'package:cescpro/page/station/detail/monitor/detail/widget/child/top_item_widget.dart';
import 'package:cescpro/page/station/detail/monitor/detail/widget/line_bar/line_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

///电池系统
class BatteryView extends StatelessWidget {
  final MonitorDetailLogic logic;

  const BatteryView({super.key, required this.logic});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TopItemWidget(logic: logic),
        Divider(height: 12.h, color: Colors.transparent),

        ///状态
        buildBatterySatusItem(logic),
        Divider(height: 12.h, color: Colors.transparent),

        ///基础数据
        buildBatteryBaseInfoItem(logic),
        Divider(height: 12.h, color: Colors.transparent),

        ///簇
        buildInfoList(logic),
        Divider(height: 12.h, color: Colors.transparent),

        ///实时曲线
        buildLineChartWidget(),
        Divider(height: 12.h, color: Colors.transparent),

        ///实时数据
        RealTimeDataWidget(comCardVoList: logic.comCardVoList),
        Divider(height: 120.h, color: Colors.transparent),
      ],
    );
  }

  ///电池状态
  Widget buildBatterySatusItem(MonitorDetailLogic logic) => Column(
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

  ///电池基础信息
  Widget buildBatteryBaseInfoItem(MonitorDetailLogic logic) => Column(
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
        constraints: BoxConstraints(minHeight: 200.h),
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

                  GetBuilder<MonitorDetailLogic>(
                    id: "realTimeData",
                    init: MonitorDetailLogic(),
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

  Widget buildInfoList(MonitorDetailLogic logic) => Column(
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
      SizedBox(
        width: double.maxFinite,
        height: 186.h,
        child: ListView.separated(
          padding: EdgeInsetsDirectional.only(start: 16.w, end: 16.w),
          separatorBuilder: (BuildContext context, int index) =>
              VerticalDivider(color: Colors.transparent, width: 8.w),
          itemCount: (logic.comTypeList?.otherList ?? []).length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (BuildContext context, int index) {
            List<ComTypeListItem> items =
                (logic.comTypeList?.otherList ?? [])[index];

            ComTypeListItem? current = items
                .where((e) => e.fieldName == "current")
                .firstOrNull;

            ComTypeListItem? soc = items
                .where((e) => e.fieldName == "soc")
                .firstOrNull;

            ComTypeListItem? power = items
                .where((e) => e.fieldName == "power")
                .firstOrNull;

            ComTypeListItem? voltage = items
                .where((e) => e.fieldName == "voltage")
                .firstOrNull;
            return AspectRatio(
              aspectRatio: Get.isEn ? (200 / 186) : (140 / 186),
              //aspectRatio: ,
              child: Container(
                width: double.maxFinite,
                height: double.maxFinite,
                clipBehavior: Clip.hardEdge,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.r),
                  color: Color(0xFF313540),
                ),
                child: Material(
                  color: Colors.transparent,
                  child: InkWell(
                    onTap: () {
                      PageTools.toBatteryCluster(
                        siteId: logic.siteId,
                        did: logic.did,
                        nodeNo: logic.nodeNo,
                        devNo: logic.devNo,
                      );
                    },
                    child: Container(
                      padding: EdgeInsets.all(14.r),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Text(
                                "CLU",
                                style: TextStyle(
                                  fontSize: 14.sp,
                                  color: Color(0xFFFFFFFF),
                                ),
                              ),
                              Spacer(),
                              Icon(
                                Icons.arrow_forward_ios_rounded,
                                color: Colors.white,
                                size: 12,
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Text(
                                "${soc?.showFieldName ?? ""}:",
                                style: TextStyle(
                                  fontSize: 14.sp,
                                  color: Color(0xA6FFFFFF),
                                ),
                              ),
                              Spacer(),
                              Text(
                                "${soc?.showValue ?? ""}${soc?.unit ?? ""}",
                                style: TextStyle(
                                  fontSize: 14.sp,
                                  color: Color(0xFFFFFFFF),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Text(
                                "${voltage?.showFieldName ?? ""}:",
                                style: TextStyle(
                                  fontSize: 14.sp,
                                  color: Color(0xA6FFFFFF),
                                ),
                              ),
                              Spacer(),
                              Text(
                                "${voltage?.showValue ?? ""}${voltage?.unit ?? ""}",
                                style: TextStyle(
                                  fontSize: 14.sp,
                                  color: Color(0xFFFFFFFF),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Text(
                                "${current?.showFieldName ?? ""}:",
                                style: TextStyle(
                                  fontSize: 14.sp,
                                  color: Color(0xA6FFFFFF),
                                ),
                              ),
                              Spacer(),
                              Text(
                                "${current?.showValue ?? ""}${current?.unit ?? ""}",
                                style: TextStyle(
                                  fontSize: 14.sp,
                                  color: Color(0xFFFFFFFF),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Text(
                                "${power?.showFieldName ?? ""}:",
                                style: TextStyle(
                                  fontSize: 14.sp,
                                  color: Color(0xA6FFFFFF),
                                ),
                              ),
                              Spacer(),
                              Text(
                                "${power?.showValue ?? ""}${power?.unit ?? ""}",
                                style: TextStyle(
                                  fontSize: 14.sp,
                                  color: Color(0xFFFFFFFF),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    ],
  );
}
