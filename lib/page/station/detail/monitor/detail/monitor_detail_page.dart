import 'package:cescpro/components/common_app_bar.dart';
import 'package:cescpro/core/router/index.dart';
import 'package:cescpro/page/station/detail/statistics/widget/line_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MonitorDetailPage extends StatelessWidget {
  const MonitorDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: baseAppBar(title: "电池系统"),
      backgroundColor: Color(0xFF23282E),
      body: SingleChildScrollView(
        child: Column(
          children: [
            buildTopItem(),
            Divider(height: 12.h, color: Colors.transparent),
            buildSatusItem(),
            Divider(height: 12.h, color: Colors.transparent),
            buildBaseInfoItem(),
            Divider(height: 12.h, color: Colors.transparent),
            buildDirectFlowMeasurement(),
            Divider(height: 12.h, color: Colors.transparent),
            buildACSide(),
            Divider(height: 12.h, color: Colors.transparent),
            buildInfoList(),
            Divider(height: 12.h, color: Colors.transparent),
            buildLineChartWidget(),
            Divider(height: 12.h, color: Colors.transparent),
            buildRealTimeData(),
            Divider(height: 120.h, color: Colors.transparent),
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
          PageTools.toBatteryCluster();
        },
        child: Container(
          width: double.maxFinite,
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          child: Row(
            children: [
              Text(
                "标准协议设备/4#并网点/2#堆",
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

  Widget buildInfoList() => Column(
    children: [
      Container(
        padding: EdgeInsetsDirectional.only(
          start: 18.w,
          end: 18.w,
          bottom: 16.h,
        ),
        alignment: AlignmentDirectional.centerStart,
        child: Text(
          "基础信息2",
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
          itemCount: 6,
          scrollDirection: Axis.horizontal,
          itemBuilder: (BuildContext context, int index) {
            return AspectRatio(
              aspectRatio: 140 / 186,
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
                      ////
                    },
                    child: Container(
                      padding: EdgeInsets.all(14.r),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Text(
                                "簇3",
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
                                "SOC:",
                                style: TextStyle(
                                  fontSize: 14.sp,
                                  color: Color(0xA6FFFFFF),
                                ),
                              ),
                              Spacer(),
                              Text(
                                "5%",
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
                                "电压：",
                                style: TextStyle(
                                  fontSize: 14.sp,
                                  color: Color(0xA6FFFFFF),
                                ),
                              ),
                              Spacer(),
                              Text(
                                "834.7V",
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
                                "电流：",
                                style: TextStyle(
                                  fontSize: 14.sp,
                                  color: Color(0xA6FFFFFF),
                                ),
                              ),
                              Spacer(),
                              Text(
                                "0.0A",
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
                                "功率：",
                                style: TextStyle(
                                  fontSize: 14.sp,
                                  color: Color(0xA6FFFFFF),
                                ),
                              ),
                              Spacer(),
                              Text(
                                "0.0A",
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

  // 直测流
  Widget buildDirectFlowMeasurement() => Container(
    margin: EdgeInsets.symmetric(horizontal: 16.w),
    padding: EdgeInsetsDirectional.all(16.r),
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
            "直测流",
            style: TextStyle(
              fontSize: 14,
              color: Color(0xFFFFFFFF),
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        Divider(height: 16.h, color: Colors.transparent),
        Row(
          children: [
            Text(
              "功率：",
              style: TextStyle(fontSize: 14, color: Color(0xA6FFFFFF)),
            ),
            Spacer(),
            Text(
              "0.0kW",
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
              "8.3V",
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
      ],
    ),
  );

  //交流侧
  Widget buildACSide() => Container(
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
            "交流侧",
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
                    "电相",
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
                    "电压(V)",
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
                    "电流(A)",
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
                    "功率(kW)",
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
        ListView.separated(
          shrinkWrap: true,
          itemCount: 4,
          physics: NeverScrollableScrollPhysics(),
          itemBuilder: (BuildContext context, int index) => Container(
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
                      "A电相",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 14.sp,
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
                      "123",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 14.sp,
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
                      "0.5",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 14.sp,
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
                      "78",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 14.sp,
                        color: Color(0xA6FFFFFF),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          separatorBuilder: (BuildContext context, int index) =>
              Divider(height: 1, color: Color(0xA64F5C6D)),
        ),
      ],
    ),
  );
}
