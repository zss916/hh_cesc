import 'package:cescpro/core/storage/app_event_bus.dart';
import 'package:cescpro/core/translations/en.dart';
import 'package:cescpro/page/home/widget/pie_chart_line_widget.dart';
import 'package:cescpro/page/station/index/widget/text_rich_widget2.dart';
import 'package:flutter/material.dart';
//import 'package:flutter_echart/flutter_echart.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

//https://juejin.cn/post/6901828472142823438?searchId=2025092022502584005D1D54B5DA9A6D9C
class BuildStationStatus extends StatelessWidget {
  final int normalNum;

  ///正常站点数
  final int faultNum;

  ///故障站点数
  final int alarmNum;

  ///告警站点数
  final int cutOffNum;
  const BuildStationStatus({
    super.key,
    required this.normalNum,
    required this.faultNum,
    required this.alarmNum,
    required this.cutOffNum,
  });

  List<PieChartData> get chartData => [
    PieChartData(TKey.common.tr, normalNum, const Color(0xFF3BFFC5)),
    PieChartData(TKey.interrupt.tr, cutOffNum, const Color(0xFF44A7FF)),
    PieChartData(TKey.alarm.tr, alarmNum, const Color(0xFFFF9C4A)),
    PieChartData(TKey.fault.tr, faultNum, const Color(0xFFF8D834)),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: EdgeInsetsDirectional.only(start: 18.w, end: 18.w, top: 9.h),
          width: double.maxFinite,
          child: Text(
            TKey.stationStatus.tr,
            style: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.w500,
              color: Colors.white,
            ),
          ),
        ),
        Container(
          width: double.maxFinite,
          // height: 220.h,
          constraints: BoxConstraints(minHeight: 240.h),
          clipBehavior: Clip.hardEdge,
          decoration: BoxDecoration(
            color: Color(0xFF313540),
            borderRadius: BorderRadius.circular(20),
          ),
          margin: EdgeInsetsDirectional.only(
            top: 16.h,
            bottom: 16.h,
            start: 16.w,
            end: 16.w,
          ),
          padding: EdgeInsetsDirectional.all(16.r),
          child: Column(
            children: [
              if (false)
                SizedBox(
                  width: double.maxFinite,
                  height: 170.h,
                  child: RepaintBoundary(
                    child: PieChartLineWidget(
                      total: (normalNum + faultNum + alarmNum + cutOffNum),
                      normalNum: normalNum,
                      faultNum: faultNum,
                      alarmNum: alarmNum,
                      cutOffNum: cutOffNum,
                    ),
                  ),
                ),

              SizedBox(
                height: 220.h,
                child: RepaintBoundary(
                  child: SfCircularChart(
                    annotations: <CircularChartAnnotation>[
                      CircularChartAnnotation(
                        widget: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              '${normalNum + faultNum + alarmNum + cutOffNum}',
                              style: TextStyle(
                                fontSize: 28.sp,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              TKey.total.tr,
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                    title: ChartTitle(text: ''),
                    legend: Legend(
                      isVisible: false,
                      position: LegendPosition.bottom,
                      textStyle: const TextStyle(
                        fontSize: 14,
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    /* onDataLabelRender: (DataLabelRenderArgs args) {
                        int index = args.pointIndex;
                        final data = chartData[index];
                        args.color = data.color;
                      },*/

                    ///点击label
                    onDataLabelTapped: (DataLabelTapDetails onTapArgs) {
                      int index = onTapArgs.pointIndex;
                      final data = chartData[index];
                      if (data.category == TKey.alarm.tr) {
                        if (alarmNum != 0) {
                          AppEventBus.eventBus.fire(MainPageEvent(select: 2));
                        }
                      }
                    },
                    series: <CircularSeries>[
                      DoughnutSeries<PieChartData, String>(
                        dataSource: chartData,
                        xValueMapper: (PieChartData data, _) => data.category,
                        yValueMapper: (PieChartData data, _) => data.value,
                        pointColorMapper: (PieChartData data, _) => data.color,
                        radius: '70%',
                        innerRadius: '78%',
                        //explodeIndex: _explodeIndex ?? -1,
                        //explode: true,
                        onPointTap: (ChartPointDetails details) {
                          final index = details.pointIndex ?? 0;
                          //_explodeIndex = _explodeIndex == index ? null : index;
                          final data = chartData[index];
                          if (data.category == TKey.alarm.tr) {
                            if (alarmNum != 0) {
                              AppEventBus.eventBus.fire(
                                MainPageEvent(select: 2),
                              );
                            }
                          }
                        },
                        dataLabelSettings: DataLabelSettings(
                          textStyle: TextStyle(
                            color: Colors.white,
                            fontSize: 15.sp,
                          ),
                          showZeroValue: false,
                          useSeriesColor: false,
                          isVisible: true,
                          labelPosition: ChartDataLabelPosition.outside,
                        ),
                        enableTooltip: true,
                      ),
                    ],
                  ),
                ),
              ),

              // Divider(color: Colors.transparent, height: 8.h),
              SizedBox(
                width: double.maxFinite,
                child: Wrap(
                  spacing: 20.w,
                  runSpacing: 8.h,
                  children: [
                    if (normalNum != 0)
                      TextRichWidget2(
                        pointColor: Color(0xFF3BFFC5),
                        interval: 8.w,
                        title: "${TKey.common.tr}:",
                        titleStyle: TextStyle(
                          color: Color(0xFF3BFFC5),
                          fontWeight: FontWeight.w500,
                          fontSize: 14,
                        ),
                        value: "$normalNum",
                        valueStyle: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                          fontSize: 12,
                        ),
                      ),
                    if (faultNum != 0)
                      TextRichWidget2(
                        pointColor: Color(0xFFF8D834),
                        interval: 8.w,
                        title: "${TKey.fault.tr}:",
                        titleStyle: TextStyle(
                          color: Color(0xFFF8D834),
                          fontWeight: FontWeight.w500,
                          fontSize: 14,
                        ),
                        value: "$faultNum",
                        valueStyle: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                          fontSize: 12,
                        ),
                      ),
                    if (alarmNum != 0)
                      TextRichWidget2(
                        pointColor: Color(0xFFFF9C4A),
                        interval: 8.w,
                        title: "${TKey.alarm.tr}:",
                        titleStyle: TextStyle(
                          color: Color(0xFFFF9C4A),
                          fontWeight: FontWeight.w500,
                          fontSize: 14,
                        ),
                        value: "$alarmNum",
                        valueStyle: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                          fontSize: 12,
                        ),
                      ),
                    if (cutOffNum != 0)
                      TextRichWidget2(
                        pointColor: Color(0xFF44A7FF),
                        interval: 8.w,
                        title: "${TKey.interrupt.tr}:",
                        titleStyle: TextStyle(
                          color: Color(0xFF44A7FF),
                          fontWeight: FontWeight.w500,
                          fontSize: 14,
                        ),
                        value: "$cutOffNum",
                        valueStyle: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                          fontSize: 12,
                        ),
                      ),
                  ],
                ),
              ),
            ],
          ),
        ),

        /*  Container(
          width: double.maxFinite,
          height: 220.h,
          clipBehavior: Clip.hardEdge,
          decoration: BoxDecoration(
            color: Color(0xFF313540),
            borderRadius: BorderRadius.circular(20),
          ),
          margin: EdgeInsetsDirectional.only(
            top: 16.h,
            bottom: 16.h,
            start: 16.w,
            end: 16.w,
          ),
          padding: EdgeInsetsDirectional.all(16.r),
          child: buildPieChatWidget(data),
        ),*/
      ],
    );
  }

  /*  PieChatWidget buildPieChatWidget(List<EChartPieBean> data) {
    return PieChatWidget(
      dataList: data,
      //是否输出日志
      isLog: false,
      //是否需要背景
      isBackground: false,
      //是否画直线
      isLineText: true,
      //背景
      bgColor: Color(0xFF313540),
      //是否显示最前面的内容
      isFrontgText: true,
      //默认选择放大的块
      initSelect: -1,
      //初次显示以动画方式展开
      openType: OpenType.NON,
      //旋转类型
      loopType: LoopType.NON,
      //点击回调
      clickCallBack: (int value) {
        //print("当前点击显示 $value");
      },
    );
  }*/
}

class PieChartData {
  PieChartData(this.category, this.value, this.color);
  final String category;
  final int value;
  final Color color;
}
