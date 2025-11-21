import 'package:cescpro/core/translations/en.dart';
import 'package:cescpro/page/station/detail/monitor/cluster/line_chart.dart';
import 'package:cescpro/page/station/detail/monitor/detail/monitor_detail_logic.dart';
import 'package:cescpro/page/station/detail/monitor/detail/widget/child/real_time_data_widget.dart';
import 'package:cescpro/page/station/detail/monitor/detail/widget/child/top_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class PcsView extends StatelessWidget {
  final MonitorDetailLogic logic;
  const PcsView({super.key, required this.logic});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TopItemWidget(title: logic.compTree),
        Divider(height: 12.h, color: Colors.transparent),

        ///状态
        buildPCSSatusItem(logic),
        Divider(height: 12.h, color: Colors.transparent),

        ///基础数据
        buildPCSBaseInfoItem(logic),
        Divider(height: 12.h, color: Colors.transparent),

        ///AC
        buildACSide(logic),
        Divider(height: 12.h, color: Colors.transparent),

        ///todo 实时曲线
        buildLineChartWidget(),
        Divider(height: 12.h, color: Colors.transparent),

        ///实时数据
        RealTimeDataWidget(comCardVoList: logic.comCardVoList),
        Divider(height: 120.h, color: Colors.transparent),
      ],
    );
  }

  ///PCS状态
  Widget buildPCSSatusItem(MonitorDetailLogic logic) => Column(
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
        margin: EdgeInsets.symmetric(horizontal: 16.w),
        padding: EdgeInsetsDirectional.all(16.r),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Color(0xFF313540),
        ),
        width: double.maxFinite,
        child: Column(
          children: [
            Row(
              children: [
                Text(
                  "${logic.comTypeList?.signalStatus?.showFieldName ?? "--"}:",
                  style: TextStyle(fontSize: 14, color: Color(0xA6FFFFFF)),
                ),
                Spacer(),
                Text(
                  logic.comTypeList?.signalStatus?.value ?? "--",
                  style: TextStyle(fontSize: 14, color: Color(0xFFFFFFFF)),
                ),
              ],
            ),

            Divider(height: 16.h, color: Colors.transparent),

            Row(
              children: [
                Text(
                  "${logic.comTypeList?.runStatus?.showFieldName ?? ""}:",
                  style: TextStyle(fontSize: 14, color: Color(0xA6FFFFFF)),
                ),
                Spacer(),
                Text(
                  logic.comTypeList?.runStatus?.value ?? "--",
                  style: TextStyle(fontSize: 14, color: Color(0xFFFFFFFF)),
                ),
              ],
            ),

            Divider(height: 16.h, color: Colors.transparent),

            Row(
              children: [
                Text(
                  "${logic.comTypeList?.gridStatus?.showFieldName ?? ""}:",
                  style: TextStyle(fontSize: 14, color: Color(0xA6FFFFFF)),
                ),
                Spacer(),
                Text(
                  logic.comTypeList?.gridStatus?.value ?? "--",
                  style: TextStyle(fontSize: 14, color: Color(0xFFFFFFFF)),
                ),
              ],
            ),
          ],
        ),
      ),
    ],
  );

  ///PCS基础信息
  Widget buildPCSBaseInfoItem(MonitorDetailLogic logic) => Column(
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
        margin: EdgeInsets.symmetric(horizontal: 16.w),
        padding: EdgeInsetsDirectional.all(16.r),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Color(0xFF313540),
        ),
        width: double.maxFinite,
        child: Column(
          children: [
            Row(
              children: [
                Text(
                  logic.comTypeList?.totalChargeElectric?.showFieldName ?? "--",
                  style: TextStyle(fontSize: 14, color: Color(0xA6FFFFFF)),
                ),
                Spacer(),
                Text(
                  "${logic.comTypeList?.totalChargeElectric?.value ?? "0"}${logic.comTypeList?.totalChargeElectric?.unit ?? ""}",
                  style: TextStyle(fontSize: 14, color: Color(0xFFFFFFFF)),
                ),
              ],
            ),
            Divider(height: 16.h, color: Colors.transparent),
            Row(
              children: [
                Text(
                  logic.comTypeList?.totalOutElectric?.showFieldName ?? "--",
                  style: TextStyle(fontSize: 14, color: Color(0xA6FFFFFF)),
                ),
                Spacer(),
                Text(
                  "${logic.comTypeList?.totalOutElectric?.value ?? "0"}${logic.comTypeList?.totalOutElectric?.unit ?? ""}",
                  style: TextStyle(fontSize: 14, color: Color(0xFFFFFFFF)),
                ),
              ],
            ),
            Divider(height: 16.h, color: Colors.transparent),
            Row(
              children: [
                Text(
                  logic.comTypeList?.hz?.showFieldName ?? "--",
                  style: TextStyle(fontSize: 14, color: Color(0xA6FFFFFF)),
                ),
                Spacer(),
                Text(
                  "${logic.comTypeList?.hz?.value ?? "0"}${logic.comTypeList?.hz?.unit ?? ""}",
                  style: TextStyle(fontSize: 14, color: Color(0xFFFFFFFF)),
                ),
              ],
            ),
            Divider(height: 16.h, color: Colors.transparent),
            Row(
              children: [
                Text(
                  logic.comTypeList?.temp?.showFieldName ?? "--",
                  style: TextStyle(fontSize: 14, color: Color(0xA6FFFFFF)),
                ),
                Spacer(),
                Text(
                  "${logic.comTypeList?.temp?.value ?? "0"}${logic.comTypeList?.temp?.unit ?? ""}",
                  style: TextStyle(fontSize: 14, color: Color(0xFFFFFFFF)),
                ),
              ],
            ),
            Divider(height: 16.h, color: Colors.transparent),
            Row(
              children: [
                Text(
                  logic.comTypeList?.activePowerT?.showFieldName ?? "--",
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
            Row(
              children: [
                Text(
                  logic.comTypeList?.reactivePowerT?.showFieldName ?? "--",
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
            Row(
              children: [
                Text(
                  logic.comTypeList?.powerTFactor?.showFieldName ?? "--",
                  style: TextStyle(fontSize: 14, color: Color(0xA6FFFFFF)),
                ),
                Spacer(),
                Text(
                  "${logic.comTypeList?.powerTFactor?.value ?? "0"}${logic.comTypeList?.powerTFactor?.unit ?? ""}",
                  style: TextStyle(fontSize: 14, color: Color(0xFFFFFFFF)),
                ),
              ],
            ),
            Divider(height: 16.h, color: Colors.transparent),
            Row(
              children: [
                Text(
                  logic.comTypeList?.apparentPowerT?.showFieldName ?? "--",
                  style: TextStyle(fontSize: 14, color: Color(0xA6FFFFFF)),
                ),
                Spacer(),
                Text(
                  "${logic.comTypeList?.apparentPowerT?.value ?? "0"}${logic.comTypeList?.apparentPowerT?.unit ?? ""}",
                  style: TextStyle(fontSize: 14, color: Color(0xFFFFFFFF)),
                ),
              ],
            ),
            Divider(height: 16.h, color: Colors.transparent),
            Row(
              children: [
                Text(
                  logic.comTypeList?.powerAFactor?.showFieldName ?? "--",
                  style: TextStyle(fontSize: 14, color: Color(0xA6FFFFFF)),
                ),
                Spacer(),
                Text(
                  "${logic.comTypeList?.powerAFactor?.value ?? "0"}${logic.comTypeList?.powerAFactor?.unit ?? ""}",
                  style: TextStyle(fontSize: 14, color: Color(0xFFFFFFFF)),
                ),
              ],
            ),
            Divider(height: 16.h, color: Colors.transparent),
            Row(
              children: [
                Text(
                  logic.comTypeList?.powerBFactor?.showFieldName ?? "--",
                  style: TextStyle(fontSize: 14, color: Color(0xA6FFFFFF)),
                ),
                Spacer(),
                Text(
                  "${logic.comTypeList?.powerBFactor?.value ?? "0"}${logic.comTypeList?.powerBFactor?.unit ?? ""}",
                  style: TextStyle(fontSize: 14, color: Color(0xFFFFFFFF)),
                ),
              ],
            ),
            Divider(height: 16.h, color: Colors.transparent),
            Row(
              children: [
                Text(
                  logic.comTypeList?.powerCFactor?.showFieldName ?? "--",
                  style: TextStyle(fontSize: 14, color: Color(0xA6FFFFFF)),
                ),
                Spacer(),
                Text(
                  "${logic.comTypeList?.powerCFactor?.value ?? "0"}${logic.comTypeList?.powerCFactor?.unit ?? ""}",
                  style: TextStyle(fontSize: 14, color: Color(0xFFFFFFFF)),
                ),
              ],
            ),
            Divider(height: 16.h, color: Colors.transparent),
          ],
        ),
      ),
    ],
  );

  ///交流侧
  Widget buildACSide(MonitorDetailLogic logic) => Container(
    margin: EdgeInsets.symmetric(horizontal: 16.w),
    padding: EdgeInsetsDirectional.only(
      start: 16.w,
      top: 16.h,
      bottom: 4.h,
      end: 16.w,
    ),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(10),
      color: Color(0xFF313540),
    ),
    width: double.maxFinite,
    child: Column(
      children: [
        Container(
          alignment: AlignmentDirectional.centerStart,
          child: Text(
            TKey.acSide.tr,
            style: TextStyle(
              fontSize: 14,
              color: Color(0xFFFFFFFF),
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        Container(
          width: double.maxFinite,
          margin: EdgeInsets.only(top: 12.h),
          padding: EdgeInsetsDirectional.only(
            top: 8.h,
            bottom: 8.h,
            start: 0.w,
            end: 0.w,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4.r),
            color: Color(0x2686A3C1),
          ),
          child: Row(
            children: [
              Expanded(
                child: Container(
                  width: double.maxFinite,
                  alignment: AlignmentDirectional.center,
                  child: Text(
                    TKey.electricalPhase.tr,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500,
                      color: Color(0xA6FFFFFF),
                    ),
                  ),
                ),
              ),
              VerticalDivider(width: 2.w, color: Colors.transparent),
              Expanded(
                child: Container(
                  width: double.maxFinite,
                  alignment: AlignmentDirectional.center,
                  child: Text(
                    "${TKey.voltage.tr}(${logic.comTypeList?.voltageA?.unit ?? ""})",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500,
                      color: Color(0xA6FFFFFF),
                    ),
                  ),
                ),
              ),
              VerticalDivider(width: 2.w, color: Colors.transparent),
              Expanded(
                child: Container(
                  width: double.maxFinite,
                  alignment: AlignmentDirectional.center,
                  child: Text(
                    "${TKey.current.tr}(${logic.comTypeList?.currentA?.unit ?? ""})",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500,
                      color: Color(0xA6FFFFFF),
                    ),
                  ),
                ),
              ),
              VerticalDivider(width: 2.w, color: Colors.transparent),
              Expanded(
                child: Container(
                  width: double.maxFinite,
                  alignment: AlignmentDirectional.center,
                  child: Text(
                    "${TKey.power.tr}${logic.comTypeList?.activePowerA?.unit ?? ""}",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500,
                      color: Color(0xA6FFFFFF),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        Container(
          width: double.maxFinite,
          padding: EdgeInsetsDirectional.only(
            top: 12.h,
            bottom: 12.h,
            start: 0.w,
            end: 0.w,
          ),
          child: Row(
            children: [
              Expanded(
                child: Container(
                  width: double.maxFinite,
                  alignment: AlignmentDirectional.center,
                  child: Text(
                    logic.comTypeList?.voltageA?.showFieldName ?? "--",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 14.sp, color: Color(0xA6FFFFFF)),
                  ),
                ),
              ),
              VerticalDivider(width: 2.w, color: Colors.transparent),
              Expanded(
                child: Container(
                  width: double.maxFinite,
                  alignment: AlignmentDirectional.center,
                  child: Text(
                    logic.comTypeList?.voltageA?.value ?? "--",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 14.sp, color: Color(0xA6FFFFFF)),
                  ),
                ),
              ),
              VerticalDivider(width: 2.w, color: Colors.transparent),
              Expanded(
                child: Container(
                  width: double.maxFinite,
                  alignment: AlignmentDirectional.center,
                  child: Text(
                    logic.comTypeList?.currentA?.value ?? "--",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 14.sp, color: Color(0xA6FFFFFF)),
                  ),
                ),
              ),
              VerticalDivider(width: 2.w, color: Colors.transparent),
              Expanded(
                child: Container(
                  width: double.maxFinite,
                  alignment: AlignmentDirectional.center,
                  child: Text(
                    logic.comTypeList?.activePowerA?.value ?? "--",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 14.sp, color: Color(0xA6FFFFFF)),
                  ),
                ),
              ),
            ],
          ),
        ),
        Divider(height: 1, color: Color(0xA64F5C6D)),
        Container(
          width: double.maxFinite,
          padding: EdgeInsetsDirectional.only(
            top: 12.h,
            bottom: 12.h,
            start: 0.w,
            end: 0.w,
          ),
          child: Row(
            children: [
              Expanded(
                child: Container(
                  width: double.maxFinite,
                  alignment: AlignmentDirectional.center,
                  child: Text(
                    logic.comTypeList?.voltageB?.showFieldName ?? "--",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 14.sp, color: Color(0xA6FFFFFF)),
                  ),
                ),
              ),
              VerticalDivider(width: 2.w, color: Colors.transparent),
              Expanded(
                child: Container(
                  width: double.maxFinite,
                  alignment: AlignmentDirectional.center,
                  child: Text(
                    logic.comTypeList?.voltageB?.value ?? "--",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 14.sp, color: Color(0xA6FFFFFF)),
                  ),
                ),
              ),
              VerticalDivider(width: 2.w, color: Colors.transparent),
              Expanded(
                child: Container(
                  width: double.maxFinite,
                  alignment: AlignmentDirectional.center,
                  child: Text(
                    logic.comTypeList?.currentB?.value ?? "--",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 14.sp, color: Color(0xA6FFFFFF)),
                  ),
                ),
              ),
              VerticalDivider(width: 2.w, color: Colors.transparent),
              Expanded(
                child: Container(
                  width: double.maxFinite,
                  alignment: AlignmentDirectional.center,
                  child: Text(
                    logic.comTypeList?.activePowerB?.value ?? "--",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 14.sp, color: Color(0xA6FFFFFF)),
                  ),
                ),
              ),
            ],
          ),
        ),
        Divider(height: 1, color: Color(0xA64F5C6D)),
        Container(
          width: double.maxFinite,
          padding: EdgeInsetsDirectional.only(
            top: 12.h,
            bottom: 12.h,
            start: 0.w,
            end: 0.w,
          ),
          child: Row(
            children: [
              Expanded(
                child: Container(
                  width: double.maxFinite,
                  alignment: AlignmentDirectional.center,
                  child: Text(
                    logic.comTypeList?.voltageC?.showFieldName ?? "--",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 14.sp, color: Color(0xA6FFFFFF)),
                  ),
                ),
              ),
              VerticalDivider(width: 2.w, color: Colors.transparent),
              Expanded(
                child: Container(
                  width: double.maxFinite,
                  alignment: AlignmentDirectional.center,
                  child: Text(
                    logic.comTypeList?.voltageC?.value ?? "--",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 14.sp, color: Color(0xA6FFFFFF)),
                  ),
                ),
              ),
              VerticalDivider(width: 2.w, color: Colors.transparent),
              Expanded(
                child: Container(
                  width: double.maxFinite,
                  alignment: AlignmentDirectional.center,
                  child: Text(
                    logic.comTypeList?.currentC?.value ?? "--",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 14.sp, color: Color(0xA6FFFFFF)),
                  ),
                ),
              ),
              VerticalDivider(width: 2.w, color: Colors.transparent),
              Expanded(
                child: Container(
                  width: double.maxFinite,
                  alignment: AlignmentDirectional.center,
                  child: Text(
                    logic.comTypeList?.activePowerC?.value ?? "--",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 14.sp, color: Color(0xA6FFFFFF)),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    ),
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
            "实时曲线",
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
                            "功率",
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
}
