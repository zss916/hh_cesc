import 'package:cescpro/components/common_app_bar.dart';
import 'package:cescpro/page/station/detail/monitor/detail/monitor_detail_logic.dart';
import 'package:cescpro/page/station/detail/monitor/detail/widget/battery_view.dart';
import 'package:cescpro/page/station/detail/monitor/detail/widget/cool_view.dart';
import 'package:cescpro/page/station/detail/monitor/detail/widget/drier_view.dart';
import 'package:cescpro/page/station/detail/monitor/detail/widget/meter_view.dart';
import 'package:cescpro/page/station/detail/monitor/detail/widget/pcs_view.dart';
import 'package:cescpro/page/station/detail/monitor/detail/widget/pv_view.dart';
import 'package:cescpro/page/station/detail/monitor/v1/helper/device_view_enum.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MonitorDetailPage extends StatelessWidget {
  const MonitorDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: GetBuilder<MonitorDetailLogic>(
        init: MonitorDetailLogic(),
        builder: (logic) {
          return Scaffold(
            appBar: baseAppBar(title: logic.title),
            backgroundColor: Color(0xFF23282E),
            body: SingleChildScrollView(child: buildBody(logic)),
          );
        },
      ),
    );
  }

  Widget buildBody(MonitorDetailLogic logic) => Stack(
    alignment: Alignment.topCenter,
    children: [
      if (logic.devType == DeviceEnum.arr.value) BatteryView(logic: logic),

      if (logic.devType == DeviceEnum.pcs.value) PcsView(logic: logic),

      if (logic.devType == DeviceEnum.meter.value) MeterView(logic: logic),

      if (logic.devType == DeviceEnum.cool.value) CoolView(logic: logic),

      if (logic.devType == DeviceEnum.drier.value) DrierView(logic: logic),

      if (logic.devType == DeviceEnum.dido.value) DrierView(logic: logic),

      if (logic.devType == DeviceEnum.pv.value) PVView(logic: logic),
    ],
  );

  Widget buildBody2(DeviceEnum type, MonitorDetailLogic logic) {
    return switch (type) {
      DeviceEnum.arr => BatteryView(logic: logic),
      DeviceEnum.pcs => PcsView(logic: logic),
      DeviceEnum.meter => MeterView(logic: logic),
      DeviceEnum.cool => CoolView(logic: logic),
      DeviceEnum.drier => DrierView(logic: logic),
      DeviceEnum.pv => PVView(logic: logic),
      DeviceEnum.clu => SizedBox.shrink(),
      DeviceEnum.airCool => SizedBox.shrink(),
      DeviceEnum.dido => SizedBox.shrink(),
      DeviceEnum.cell => SizedBox.shrink(),
      DeviceEnum.statsMeter => SizedBox.shrink(),
      DeviceEnum.fire => SizedBox.shrink(),
    };
  }

  ///交流侧
  /*  Widget buildACSide(MonitorDetailLogic logic) => Container(
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
  );*/
}
