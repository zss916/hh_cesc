import 'package:cescpro/components/common_app_bar.dart';
import 'package:cescpro/core/router/index.dart';
import 'package:cescpro/core/translations/en.dart';
import 'package:cescpro/http/bean/analysis_entity.dart';
import 'package:cescpro/page/station/detail/alarm/index/real_alarm_logic.dart';
import 'package:cescpro/page/station/detail/alarm/index/widget/pie_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
//import 'package:marquee/marquee.dart';
import 'package:marquee_widget/marquee_widget.dart';

class RealAlarmView extends StatelessWidget {
  const RealAlarmView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: baseAppBar(title: TKey.realTimeData.tr),
      backgroundColor: Color(0xFF23282E),
      body: GetBuilder<RealAlarmLogic>(
        init: RealAlarmLogic(),
        builder: (logic) {
          return SingleChildScrollView(
            child: Column(
              children: [
                buildTopItem(logic.siteId),
                Divider(height: 12.h, color: Colors.transparent),

                if (logic.totalAlarmData != null)
                  buildTotalAlarmItem(logic.totalAlarmData!, logic),

                if ((logic.list2).isNotEmpty) buildHighestAlarmItem(logic),

                if ((logic.list3).isNotEmpty) buildAttentionAlarmItem(logic),

                if (logic.contents.isNotEmpty) buildFocusOn(logic),

                Divider(height: 150.h, color: Colors.transparent),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget buildTopItem(int? siteId) => Container(
    decoration: BoxDecoration(color: Color(0xFF313540)),
    width: double.maxFinite,
    child: Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () {
          PageTools.toAlarmDetail(siteId: siteId);
        },
        child: Container(
          width: double.maxFinite,
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          child: Row(
            children: [
              Text(
                TKey.alertDetailsData.tr,
                style: TextStyle(color: Colors.white, fontSize: 14),
              ),
              Spacer(),
              Icon(
                Icons.arrow_right_rounded,
                color: Color(0xA6FFFFFF),
                size: 25,
              ),
            ],
          ),
        ),
      ),
    ),
  );

  Widget buildTotalAlarmItem(
    AnalysisTotalAlarmData value,
    RealAlarmLogic logic,
  ) => Container(
    width: double.maxFinite,
    constraints: BoxConstraints(minHeight: 230),
    padding: EdgeInsets.all(15.r),
    decoration: BoxDecoration(
      color: Color(0xFF313540),
      borderRadius: BorderRadius.circular(8),
    ),
    margin: EdgeInsetsDirectional.only(start: 16.w, end: 16.w, bottom: 16.h),
    child: Row(
      children: [
        PieChartWidget(
          size: Size(140.w, 140.w),
          title: TKey.alarmTotal.tr,
          count: "${value.totalCnt ?? 0}",
          list: logic.list,
        ),
        VerticalDivider(color: Colors.transparent, width: 20.w),
        Expanded(
          child: Column(
            children: [
              Row(
                children: [
                  Container(
                    width: 10,
                    height: 10,
                    margin: EdgeInsetsDirectional.only(end: 10.w),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(3),
                      color: Color(0xFFEE2727),
                    ),
                  ),
                  Text(
                    TKey.alarmLevel1.tr,
                    style: TextStyle(color: Colors.white, fontSize: 12),
                  ),
                  Spacer(),
                  Text(
                    TKey.alarmCount.trArgs(["${value.firstCnt ?? 0}"]),
                    style: TextStyle(color: Colors.white, fontSize: 12),
                  ),
                ],
              ),
              Divider(height: 15.h, color: Colors.transparent),
              Row(
                children: [
                  Container(
                    width: 10,
                    height: 10,
                    margin: EdgeInsetsDirectional.only(end: 10.w),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(3),
                      color: Color(0xFFFFE725),
                    ),
                  ),
                  Text(
                    TKey.alarmLevel2.tr,
                    style: TextStyle(color: Colors.white, fontSize: 12),
                  ),
                  Spacer(),
                  Text(
                    TKey.alarmCount.trArgs(["${value.secondCnt ?? 0}"]),
                    style: TextStyle(color: Colors.white, fontSize: 12),
                  ),
                ],
              ),
              Divider(height: 15.h, color: Colors.transparent),
              Row(
                children: [
                  Container(
                    width: 10,
                    height: 10,
                    margin: EdgeInsetsDirectional.only(end: 10.w),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(3),
                      color: Color(0xFF376FFF),
                    ),
                  ),
                  Text(
                    TKey.alarmLevel3.tr,
                    style: TextStyle(color: Colors.white, fontSize: 12),
                  ),
                  Spacer(),
                  Text(
                    TKey.alarmCount.trArgs(["${value.thirdCnt ?? 0}"]),
                    style: TextStyle(color: Colors.white, fontSize: 12),
                  ),
                ],
              ),
              Divider(height: 15.h, color: Colors.transparent),
              Row(
                children: [
                  Container(
                    width: 10,
                    height: 10,
                    margin: EdgeInsetsDirectional.only(end: 10.w),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(3),
                      color: Color(0xFF26FFBD),
                    ),
                  ),
                  Text(
                    TKey.other.tr,
                    style: TextStyle(color: Colors.white, fontSize: 12),
                  ),
                  Spacer(),
                  Text(
                    TKey.alarmCount.trArgs(["${value.otherCnt ?? 0}"]),
                    style: TextStyle(color: Colors.white, fontSize: 12),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    ),
  );

  Widget buildHighestAlarmItem(RealAlarmLogic logic) => Container(
    width: double.maxFinite,
    constraints: BoxConstraints(minHeight: 230),
    padding: EdgeInsets.all(15.r),
    decoration: BoxDecoration(
      color: Color(0xFF313540),
      borderRadius: BorderRadius.circular(8),
    ),
    margin: EdgeInsetsDirectional.only(start: 16.w, end: 16.w, bottom: 16.h),
    child: Row(
      children: [
        PieChartWidget(
          size: Size(140.w, 140.w),
          title: TKey.highLevel.tr,
          count: "${logic.highestAlarmData?.totalCnt ?? 0}",
          list: logic.list2,
        ),
        VerticalDivider(color: Colors.transparent, width: 20.w),
        Expanded(
          child: Column(
            spacing: 15.h,
            children: [
              ...(logic.list2).map(
                (e) => Row(
                  children: [
                    Container(
                      width: 10,
                      height: 10,
                      margin: EdgeInsetsDirectional.only(end: 10.w),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(3),
                        color: e["color"] ?? Colors.transparent,
                      ),
                    ),
                    Text(
                      e["title"] ?? "",
                      style: TextStyle(color: Colors.white, fontSize: 12),
                    ),
                    Spacer(),
                    Text(
                      TKey.alarmCount.trArgs(["${e["number"] ?? 0}"]),
                      style: TextStyle(color: Colors.white, fontSize: 12),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    ),
  );

  Widget buildAttentionAlarmItem(RealAlarmLogic logic) => Container(
    width: double.maxFinite,
    constraints: BoxConstraints(minHeight: 230),
    padding: EdgeInsets.all(15.r),
    decoration: BoxDecoration(
      color: Color(0xFF313540),
      borderRadius: BorderRadius.circular(8),
    ),
    margin: EdgeInsetsDirectional.only(start: 16.w, end: 16.w, bottom: 16.h),
    child: Row(
      children: [
        PieChartWidget(
          size: Size(140.w, 140.w),
          title: TKey.focusOn.tr,
          count: "${logic.attentionAlarmData?.totalCnt ?? 0}",
          list: logic.list3,
        ),
        VerticalDivider(color: Colors.transparent, width: 20.w),
        Expanded(
          child: Column(
            spacing: 15.h,
            children: [
              ...(logic.list3).map(
                (e) => Row(
                  children: [
                    Container(
                      width: 10,
                      height: 10,
                      margin: EdgeInsetsDirectional.only(end: 10.w),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(3),
                        color: e["color"] ?? Colors.transparent,
                      ),
                    ),
                    Text(
                      e["title"] ?? "",
                      style: TextStyle(color: Colors.white, fontSize: 12),
                    ),
                    Spacer(),
                    Text(
                      TKey.alarmCount.trArgs(["${e["number"] ?? 0}"]),
                      style: TextStyle(color: Colors.white, fontSize: 12),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    ),
  );

  Widget buildFocusOn(RealAlarmLogic logic) => Column(
    children: [
      Container(
        width: double.maxFinite,
        margin: EdgeInsetsDirectional.only(
          start: 16.w,
          end: 16.w,
          bottom: 16.h,
        ),
        alignment: AlignmentDirectional.centerStart,
        child: Text(
          TKey.focusOn.tr,
          style: TextStyle(fontSize: 16, color: Colors.white),
        ),
      ),
      Container(
        width: double.maxFinite,
        height: 170,
        constraints: BoxConstraints(minHeight: 170),
        padding: EdgeInsets.all(15.r),
        decoration: BoxDecoration(
          color: Color(0xFF313540),
          borderRadius: BorderRadius.circular(8),
        ),
        margin: EdgeInsetsDirectional.only(
          start: 16.w,
          end: 16.w,
          // bottom: 200.h,
        ),
        child: Marquee(
          direction: Axis.vertical,
          animationDuration: Duration(seconds: 10),
          backDuration: Duration(milliseconds: 5000),
          pauseDuration: Duration(milliseconds: 500),
          directionMarguee: DirectionMarguee.oneDirection,
          child: Text(
            logic.contents,
            style: TextStyle(fontSize: 14, color: Colors.white),
          ),
        ),
        /*child: Marquee(
          text: 'Some sample text that takes some space.',
          style: TextStyle(fontSize: 14, color: Colors.white),
          scrollAxis: Axis.vertical,
          crossAxisAlignment: CrossAxisAlignment.start,
          blankSpace: 10.0,
          velocity: 100.0,
          pauseAfterRound: Duration(milliseconds: 500),
          startPadding: 10.0,
          accelerationDuration: Duration(seconds: 1),
          accelerationCurve: Curves.linear,
          decelerationDuration: Duration(milliseconds: 500),
          decelerationCurve: Curves.linear,
        ),*/
      ),
    ],
  );
}
