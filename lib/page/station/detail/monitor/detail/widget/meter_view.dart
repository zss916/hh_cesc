import 'package:cescpro/core/translations/en.dart';
import 'package:cescpro/page/station/detail/monitor/detail/monitor_detail_logic.dart';
import 'package:cescpro/page/station/detail/monitor/detail/widget/child/real_time_data_widget.dart';
import 'package:cescpro/page/station/detail/monitor/detail/widget/child/top_item_widget.dart';
import 'package:cescpro/page/station/detail/monitor/detail/widget/line_bar/line_chart2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class MeterView extends StatelessWidget {
  final MonitorDetailLogic logic;
  const MeterView({super.key, required this.logic});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TopItemWidget(logic: logic),
        Divider(height: 12.h, color: Colors.transparent),

        ///状态
        buildMeterSatusItem(logic),
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

  ///电表状态
  Widget buildMeterSatusItem(MonitorDetailLogic logic) => Column(
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
        constraints: BoxConstraints(minHeight: 160.h),
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
            if (logic.comTypeList?.activePowerT?.showFieldName != null)
              Row(
                children: [
                  Text(
                    "${logic.comTypeList?.activePowerT?.showFieldName ?? ""}:",
                    style: TextStyle(fontSize: 14, color: Color(0xA6FFFFFF)),
                  ),
                  Spacer(),
                  Text(
                    "${logic.comTypeList?.activePowerT?.value ?? "0"}${logic.comTypeList?.activePowerT?.unit ?? ""}",
                    style: TextStyle(fontSize: 14, color: Color(0xFFFFFFFF)),
                  ),
                ],
              ),

            Divider(height: 16.h, color: Colors.transparent),
            if (logic.comTypeList?.reactivePowerT?.showFieldName != null)
              Row(
                children: [
                  Text(
                    "${logic.comTypeList?.reactivePowerT?.showFieldName ?? ""}:",
                    style: TextStyle(fontSize: 14, color: Color(0xA6FFFFFF)),
                  ),
                  Spacer(),
                  Text(
                    "${logic.comTypeList?.reactivePowerT?.value ?? "0"}${logic.comTypeList?.reactivePowerT?.unit ?? ""}",
                    style: TextStyle(fontSize: 14, color: Color(0xFFFFFFFF)),
                  ),
                ],
              ),

            Divider(height: 16.h, color: Colors.transparent),
            if (logic.comTypeList?.powerTFactor?.showFieldName != null)
              Row(
                children: [
                  Text(
                    "${logic.comTypeList?.powerTFactor?.showFieldName ?? ""}:",
                    style: TextStyle(fontSize: 14, color: Color(0xA6FFFFFF)),
                  ),
                  Spacer(),
                  Text(
                    logic.comTypeList?.powerTFactor?.value ?? "--",
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
                        child: logic.powerList.isEmpty
                            ? Center(
                                child: CircularProgressIndicator(
                                  color: Colors.white,
                                ),
                              )
                            : MonitorLineChartWidget2(
                                powerList: logic.powerList,
                                maxY: logic.powerMaxY,
                                minY: logic.powerMinY,
                                maxX: logic.powerMaxX,
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
}
