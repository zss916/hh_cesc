import 'package:cescpro/components/common_app_bar.dart';
import 'package:cescpro/core/router/index.dart';
import 'package:cescpro/core/translations/en.dart';
import 'package:cescpro/page/station/detail/monitor/cluster/line_chart.dart';
import 'package:cescpro/page/station/detail/olive/widget/statistics_item/line_title_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class BatteryClusterPage extends StatelessWidget {
  const BatteryClusterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: baseAppBar(title: "电池集群"),
      backgroundColor: Color(0xFF23282E),
      body: SingleChildScrollView(
        child: Column(
          children: [
            buildSatusItem(),
            Divider(height: 12.h, color: Colors.transparent),
            buildBaseInfoItem(),
            Divider(height: 12.h, color: Colors.transparent),
            buildLineChartWidget(),
            Divider(height: 12.h, color: Colors.transparent),
            buildDistributionMap(),
            Divider(height: 12.h, color: Colors.transparent),
            buildRealTimeData(),
            Divider(height: 120.h, color: Colors.transparent),
          ],
        ),
      ),
    );
  }

  Widget buildSatusItem() => Column(
    children: [
      Container(
        padding: EdgeInsetsDirectional.only(
          start: 18.w,
          end: 18.w,
          bottom: 16.h,
        ),
        alignment: AlignmentDirectional.centerStart,
        child: Text(
          "状态",
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
                  "通信状态：",
                  style: TextStyle(fontSize: 14, color: Color(0xA6FFFFFF)),
                ),
                Spacer(),
                Text(
                  "通信正常",
                  style: TextStyle(fontSize: 14, color: Color(0xFFFFFFFF)),
                ),
              ],
            ),
            Divider(height: 16.h, color: Colors.transparent),
            Row(
              children: [
                Text(
                  "系统状态：",
                  style: TextStyle(fontSize: 14, color: Color(0xA6FFFFFF)),
                ),
                Spacer(),
                Text(
                  "待机",
                  style: TextStyle(fontSize: 14, color: Color(0xFFFFFFFF)),
                ),
              ],
            ),
            Divider(height: 16.h, color: Colors.transparent),
            Row(
              children: [
                Text(
                  "告警状态：",
                  style: TextStyle(fontSize: 14, color: Color(0xA6FFFFFF)),
                ),
                Spacer(),
                Text(
                  "正常",
                  style: TextStyle(fontSize: 14, color: Color(0xFFFFFFFF)),
                ),
              ],
            ),
          ],
        ),
      ),
    ],
  );

  Widget buildBaseInfoItem() => Column(
    children: [
      Container(
        padding: EdgeInsetsDirectional.only(
          start: 18.w,
          end: 18.w,
          bottom: 16.h,
        ),
        alignment: AlignmentDirectional.centerStart,
        child: Text(
          "基础信息",
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
                  "SOC：",
                  style: TextStyle(fontSize: 14, color: Color(0xA6FFFFFF)),
                ),
                Spacer(),
                Text(
                  "5%",
                  style: TextStyle(fontSize: 14, color: Color(0xFFFFFFFF)),
                ),
              ],
            ),
            Divider(height: 16.h, color: Colors.transparent),
            Row(
              children: [
                Text(
                  "电压：",
                  style: TextStyle(fontSize: 14, color: Color(0xA6FFFFFF)),
                ),
                Spacer(),
                Text(
                  "834.7V",
                  style: TextStyle(fontSize: 14, color: Color(0xFFFFFFFF)),
                ),
              ],
            ),
            Divider(height: 16.h, color: Colors.transparent),
            Row(
              children: [
                Text(
                  "电流：",
                  style: TextStyle(fontSize: 14, color: Color(0xA6FFFFFF)),
                ),
                Spacer(),
                Text(
                  "0.0A",
                  style: TextStyle(fontSize: 14, color: Color(0xFFFFFFFF)),
                ),
              ],
            ),
            Divider(height: 16.h, color: Colors.transparent),
            Row(
              children: [
                Text(
                  "最高/最低单体电压：",
                  style: TextStyle(fontSize: 14, color: Color(0xA6FFFFFF)),
                ),
                Spacer(),
                Text(
                  "3.309v/3.205v",
                  style: TextStyle(fontSize: 14, color: Color(0xFFFFFFFF)),
                ),
              ],
            ),
            Divider(height: 16.h, color: Colors.transparent),
            Row(
              children: [
                Text(
                  "最高/最低单体温度：",
                  style: TextStyle(fontSize: 14, color: Color(0xA6FFFFFF)),
                ),
                Spacer(),
                Text(
                  "3.309v/3.205v",
                  style: TextStyle(fontSize: 14, color: Color(0xFFFFFFFF)),
                ),
              ],
            ),
            Divider(height: 16.h, color: Colors.transparent),
            Row(
              children: [
                Text(
                  "最大允许充电/放电功率：",
                  style: TextStyle(fontSize: 14, color: Color(0xA6FFFFFF)),
                ),
                Spacer(),
                Text(
                  "3.309kW/3.205KW",
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

  Widget buildDistributionMap() => Column(
    children: [
      Container(
        padding: EdgeInsetsDirectional.only(
          start: 18.w,
          end: 18.w,
          bottom: 16.h,
        ),
        alignment: AlignmentDirectional.centerStart,
        child: Text(
          "分布图",
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
                    //
                  },
                  child: Container(
                    alignment: AlignmentDirectional.center,
                    child: Text(
                      "单体温度",
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
                    PageTools.toDistributionMap();
                  },
                  child: Container(
                    alignment: AlignmentDirectional.center,
                    child: Text(
                      "单体电压",
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

  Widget buildRealTimeData() {
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
            "实时数据",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w500,
              fontSize: 16,
            ),
          ),
        ),
        ListView.separated(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemCount: 3,
          itemBuilder: (BuildContext context, int index) {
            return Container(
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
                        "分组${index}",
                        style: TextStyle(
                          fontSize: 14,
                          color: Color(0xFFFFFFFF),
                        ),
                      ),
                      Spacer(),
                    ],
                  ),
                  Divider(height: 16.h, color: Colors.transparent),
                  Row(
                    children: [
                      Text(
                        "SOC：",
                        style: TextStyle(
                          fontSize: 14,
                          color: Color(0xA6FFFFFF),
                        ),
                      ),
                      Spacer(),
                      Text(
                        "5%",
                        style: TextStyle(
                          fontSize: 14,
                          color: Color(0xFFFFFFFF),
                        ),
                      ),
                    ],
                  ),
                  Divider(height: 16.h, color: Colors.transparent),
                  Row(
                    children: [
                      Text(
                        "电压：",
                        style: TextStyle(
                          fontSize: 14,
                          color: Color(0xA6FFFFFF),
                        ),
                      ),
                      Spacer(),
                      Text(
                        "834.7V",
                        style: TextStyle(
                          fontSize: 14,
                          color: Color(0xFFFFFFFF),
                        ),
                      ),
                    ],
                  ),
                  Divider(height: 16.h, color: Colors.transparent),
                  Row(
                    children: [
                      Text(
                        "电流：",
                        style: TextStyle(
                          fontSize: 14,
                          color: Color(0xA6FFFFFF),
                        ),
                      ),
                      Spacer(),
                      Text(
                        "0.0A",
                        style: TextStyle(
                          fontSize: 14,
                          color: Color(0xFFFFFFFF),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            );
          },
          separatorBuilder: (BuildContext context, int index) =>
              Divider(color: Colors.transparent, height: 16.h),
        ),
      ],
    );
  }
}
