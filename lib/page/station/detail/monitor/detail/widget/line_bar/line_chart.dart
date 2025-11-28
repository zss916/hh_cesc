import 'package:cescpro/core/helper/extension_helper.dart';
import 'package:cescpro/http/bean/soc_entity.dart';
import 'package:cescpro/page/station/detail/monitor/detail/monitor_detail_logic.dart';
import 'package:cescpro/page/station/detail/monitor/detail/widget/dialog/real_time_dialog.dart';
import 'package:collection/collection.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MonitorLineChartWidget extends StatefulWidget {
  final MonitorDetailLogic logic;
  const MonitorLineChartWidget({super.key, required this.logic});

  @override
  State<StatefulWidget> createState() => MonitorLineChartWidgetState();
}

class MonitorLineChartWidgetState extends State<MonitorLineChartWidget> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _scrollToRight();
    });
  }

  void _scrollToRight() {
    _scrollController.animateTo(
      _scrollController.position.maxScrollExtent,
      duration: const Duration(milliseconds: 1000),
      curve: Curves.easeOut,
    );
  }

  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        /* PositionedDirectional(
          start: 0,
          top: 25,
          bottom: 0,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: List.generate(6, (index) {
              final style = TextStyle(
                color: Color(0xA8FFFFFF),
                fontWeight: FontWeight.w400,
                fontSize: 10.sp,
              );
              if (index == 5) {
                return Text(
                  (widget.logic.minY).toDouble().toStringAsFixed(2),
                  style: style,
                );
              } else {
                return Text(
                  (widget.logic.maxY * (4 - index) / 4)
                      .toDouble()
                      .toStringAsFixed(1),
                  style: style,
                );
              }
            }),
          ),
        ),*/
        SingleChildScrollView(
          //physics: NeverScrollableScrollPhysics(),
          controller: _scrollController,
          scrollDirection: Axis.horizontal,
          child: Container(
            padding: const EdgeInsetsDirectional.only(
              start: 12,
              end: 12,
              top: 12 + 18,
              bottom: 0,
            ),
            height: double.maxFinite,
            width: MediaQuery.of(context).size.width,
            /*  width: widget.logic.arrList.length <= 10
                ? MediaQuery.of(context).size.width - 80
                : widget.logic.arrList.length * 2.0,*/
            child: LineChart(
              LineChartData(
                lineTouchData: lineTouchData,
                gridData: FlGridData(
                  show: true,
                  // horizontalInterval: 10,
                  drawHorizontalLine: true,
                  drawVerticalLine: false,
                  //horizontalInterval: ((widget.logic.maxY) / 3),
                ),
                titlesData: FlTitlesData(
                  rightTitles: const AxisTitles(
                    sideTitles: SideTitles(showTitles: false),
                  ),
                  topTitles: AxisTitles(
                    sideTitles: SideTitles(showTitles: false),
                  ),
                  bottomTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      reservedSize: 25,
                      getTitlesWidget: (value, meta) {
                        return SideTitleWidget(
                          //axisSide: meta.axisSide,
                          //(widget.logic.arrList[value.toInt()].time ?? 0).hms
                          // space: 2,
                          meta: meta,
                          child: value.toInt() == widget.logic.arrList.length
                              ? SizedBox.shrink()
                              : Text(
                                  "${(widget.logic.arrList[value.toInt()].time ?? 0).hms}",
                                  style: TextStyle(
                                    color: Color(0xA8FFFFFF),
                                    fontWeight: FontWeight.w400,
                                    fontSize: 6.sp,
                                  ),
                                ),
                        );
                      },
                    ),
                  ),
                  leftTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      reservedSize: 30,
                      getTitlesWidget: (value, meta) {
                        return SideTitleWidget(
                          //axisSide: meta.axisSide,
                          space: 2,
                          meta: meta,
                          child: Text(
                            "$value",
                            style: TextStyle(
                              color: Color(0xA8FFFFFF),
                              fontWeight: FontWeight.w400,
                              fontSize: 8.sp,
                            ),
                          ),
                        );
                      },
                    ), // 左边Y轴标签禁用，手动创建
                  ),
                ),
                borderData: FlBorderData(
                  show: true,
                  border: Border(
                    bottom: BorderSide(color: Color(0x33FFFFFF), width: 1),
                    left: const BorderSide(color: Colors.transparent, width: 0),
                    right: const BorderSide(
                      color: Colors.transparent,
                      width: 0,
                    ),
                    top: const BorderSide(color: Colors.transparent, width: 0),
                  ),
                ),
                lineBarsData: lineBarsData(widget.logic.arrList),
                minX: 0,
                maxX: widget.logic.maxX.toDouble(),
                maxY: widget.logic.maxY,
                minY: widget.logic.minY,
                extraLinesData: ExtraLinesData(
                  horizontalLines: [
                    /* HorizontalLine(
                      y: widget.logic.minY,
                      // color: Colors.transparent, // 水平线颜色
                      // strokeWidth: 1, // 水平线宽度
                      color: Color(0xA8FFFFFF),
                      strokeWidth: 0.4,
                      dashArray: [8, 4],
                    ),*/
                    HorizontalLine(
                      y: 0,
                      color: Colors.transparent, // 水平线颜色
                      strokeWidth: 0.4, // 水平线宽度
                    ),
                    /*  HorizontalLine(
                      y: widget.logic.maxY,
                      // color: Colors.transparent, // 水平线颜色
                      // strokeWidth: 1, // 水平线宽度
                      color: Color(0xA8FFFFFF),
                      strokeWidth: 0.4,
                      dashArray: [8, 4],
                    ),*/
                  ],
                ),
              ),
              duration: const Duration(milliseconds: 2000),
            ),
          ),
        ),

        if (false)
          Positioned(
            top: 0,
            right: 0,
            child: InkWell(
              onTap: () {
                showRealTimeDialog(
                  arrList: widget.logic.arrList,
                  minY: widget.logic.minY,
                  maxY: widget.logic.maxY,
                  maxX: widget.logic.maxX.toDouble(),
                );
              },
              child: Container(height: 40, width: 40, color: Colors.red),
            ),
          ),
      ],
    );
  }

  ///触摸
  LineTouchData get lineTouchData => LineTouchData(
    enabled: false,
    handleBuiltInTouches: false,
    touchTooltipData: LineTouchTooltipData(
      getTooltipColor: (touchedSpot) => Colors.white.withValues(alpha: 0.8),
    ),
  );

  ///折现数据列表
  List<LineChartBarData> lineBarsData(List<SocEntity> lines) {
    return [
      LineChartBarData(
        ///是否圆一点
        isCurved: true,
        color: Color(0xFF3874F2),
        barWidth: 1,
        isStrokeCapRound: true,

        ///点数据
        dotData: const FlDotData(show: false),

        ///线下面的区域(true)
        belowBarData: BarAreaData(show: false),
        spots: [
          ...lines.mapIndexed(
            (i, e) => FlSpot(i.toDouble(), (e.power ?? 0).toDouble()),
          ),
        ],
      ),
      LineChartBarData(
        isCurved: true,
        color: Color(0xFF0BC3C4),
        barWidth: 1,
        isStrokeCapRound: true,
        dotData: const FlDotData(show: false),
        belowBarData: BarAreaData(
          show: false,
          color: Colors.pink.withValues(alpha: 0),
        ),
        spots: [
          ...lines.mapIndexed(
            (i, e) => FlSpot(i.toDouble(), (e.soc ?? 0).toDouble()),
          ),
        ],
      ),
    ];
  }
}
