import 'package:cescpro/core/helper/extension_helper.dart';
import 'package:cescpro/http/bean/power_graph_entity.dart';
import 'package:cescpro/page/station/detail/olive/widget/statistics_item/statistics_item_logic.dart';
import 'package:collection/collection.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PowerLineChart extends StatefulWidget {
  final StatisticsItemLogic logic;
  const PowerLineChart({super.key, required this.logic});

  @override
  State<StatefulWidget> createState() => MonitorLineChartWidgetState();
}

class MonitorLineChartWidgetState extends State<PowerLineChart> {
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
        SingleChildScrollView(
          controller: _scrollController,
          scrollDirection: Axis.horizontal,
          child: Container(
            padding: const EdgeInsetsDirectional.only(
              start: 12,
              end: 12,
              top: 40,
              bottom: 0,
            ),
            height: double.maxFinite,
            width: MediaQuery.of(context).size.width,
            child: LineChart(
              LineChartData(
                lineTouchData: lineTouchData,
                gridData: FlGridData(
                  show: true,
                  drawHorizontalLine: true,
                  drawVerticalLine: false,
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
                          child:
                              value.toInt() ==
                                  (widget.logic.showPowerList.first.list ?? [])
                                      .length
                              ? SizedBox.shrink()
                              : Text(
                                  ((widget.logic.showPowerList.first.list ??
                                                  [])[value.toInt()]
                                              .time ??
                                          0)
                                      .hms,
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
                      reservedSize: 25,
                      getTitlesWidget: (value, meta) {
                        return SideTitleWidget(
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
                lineBarsData: lineBarsData(
                  (widget.logic.showPowerList).first.list ?? [],
                ),
                minX: 0,
                maxX: widget.logic.maxX.toDouble(),
                maxY: widget.logic.maxY,
                minY: widget.logic.minY,
              ),
              duration: const Duration(milliseconds: 2000),
            ),
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
  List<LineChartBarData> lineBarsData(List<PowerGraphList> lines) {
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
            (i, e) => FlSpot(i.toDouble(), (e.val ?? 0).toDouble()),
          ),
        ],
      ),
    ];
  }
}
