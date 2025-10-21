import 'package:cescpro/components/common_app_bar.dart';
import 'package:cescpro/core/router/index.dart';
import 'package:cescpro/core/translations/en.dart';
import 'package:cescpro/page/station/detail/alarm/index/widget/pie_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
//import 'package:marquee/marquee.dart';
import 'package:marquee_widget/marquee_widget.dart';

class AlarmView extends StatelessWidget {
  const AlarmView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: baseAppBar(title: TKey.realTimeData.tr),
      backgroundColor: Color(0xFF23282E),
      body: SingleChildScrollView(
        child: Column(
          children: [
            buildTopItem(),
            Divider(height: 12.h, color: Colors.transparent),

            buildItem(),

            buildItem(),

            buildFocusOn(),

            Divider(height: 150.h, color: Colors.transparent),
          ],
        ),
      ),
    );
  }

  Widget buildTopItem() => Container(
    decoration: BoxDecoration(color: Color(0xFF313540)),
    width: double.maxFinite,
    child: Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () {
          PageTools.toAlarmDetail();
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

  Widget buildItem() => Container(
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
        PieChartWidget(size: Size(140.w, 140.w), title: "告警总数", count: "2511"),
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
                    "一级告警",
                    style: TextStyle(color: Colors.white, fontSize: 12),
                  ),
                  Spacer(),
                  Text(
                    "12台",
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
                    "二级告警",
                    style: TextStyle(color: Colors.white, fontSize: 12),
                  ),
                  Spacer(),
                  Text(
                    "12台",
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
                    "三级告警",
                    style: TextStyle(color: Colors.white, fontSize: 12),
                  ),
                  Spacer(),
                  Text(
                    "12台",
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
                    "其他",
                    style: TextStyle(color: Colors.white, fontSize: 12),
                  ),
                  Spacer(),
                  Text(
                    "12台",
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

  Widget buildFocusOn() => Column(
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
          child: Text(
            ' 这是一段重点gdfsgdsfgsdf关注这gfdsgdfsgdfsgdsfgdsfgdsfgsdfgdsf'
            '是一段重点关注gfsdgdfsgdsfgdsf这是gdfsgdfsgdfsgdfsgdfsgdsfgsdf'
            '一段重点关注这是一段重点关注这是一段gdfsgdfsgdsf重gdfsgdfsgdfsgdfsgdfsgdsf点关注这'
            '是一段重点关注fdsgdfsgdfsgdfsgdsfgdsfgfdsgdsfgsdfgsdfgdsfgdsfgfdsgdfsgdsfgsdgsdf',
            style: TextStyle(fontSize: 14, color: Colors.white),
          ),
          direction: Axis.vertical,
          animationDuration: Duration(seconds: 4),
          backDuration: Duration(milliseconds: 5000),
          pauseDuration: Duration(milliseconds: 500),
          directionMarguee: DirectionMarguee.oneDirection,
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
