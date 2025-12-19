import 'package:cescpro/core/helper/extension_helper.dart';
import 'package:cescpro/http/bean/power_entity.dart';
import 'package:collection/collection.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MonitorLineChartWidget2 extends StatefulWidget {
  final List<PowerEntity> powerList;
  final double maxX;
  final double maxY;
  final double minY;

  const MonitorLineChartWidget2({
    super.key,
    required this.powerList,
    required this.maxX,
    required this.maxY,
    required this.minY,
  });

  @override
  State<StatefulWidget> createState() => MonitorLineChartWidgetState();
}

class MonitorLineChartWidgetState extends State<MonitorLineChartWidget2> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      // _scrollToRight();
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
              top: 12 + 18,
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
                          meta: meta,
                          child: value.toInt() >= widget.powerList.length
                              ? SizedBox.shrink()
                              : Text(
                                  (widget.powerList[value.toInt()].time ?? 0)
                                      .hm2,
                                  style: TextStyle(
                                    color: Color(0xA8FFFFFF),
                                    fontWeight: FontWeight.w400,
                                    fontSize: 10.sp,
                                  ),
                                ),
                        );
                      },
                    ),
                  ),
                  leftTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      reservedSize: 35,
                      getTitlesWidget: (value, meta) {
                        TextStyle textStyle = TextStyle(
                          color: Color(0xA8FFFFFF),
                          fontWeight: FontWeight.w400,
                          fontSize: 8.sp,
                        );

                        TextStyle textStyle2 = TextStyle(
                          color: Color(0xFF3874F2),
                          fontWeight: FontWeight.w400,
                          fontSize: 10.sp,
                        );
                        bool isShow =
                            (value == widget.minY) || (value == widget.maxY);

                        return SideTitleWidget(
                          meta: meta,
                          child: Text(
                            value.formatNum(),
                            style: isShow ? textStyle2 : textStyle,
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
                lineBarsData: lineBarsData(widget.powerList),
                minX: 0,
                maxX: widget.maxX.toDouble(),
                maxY: widget.maxY,
                minY: widget.minY,
                extraLinesData: ExtraLinesData(
                  horizontalLines: [
                    HorizontalLine(
                      y: 0,
                      // dashArray: [8, 4],
                      color: Colors.transparent, // 水平线颜色
                      strokeWidth: 0.4, // 水平线宽度
                    ),

                    HorizontalLine(
                      y: widget.maxY,
                      dashArray: [8, 4],
                      color: Color(0xFF3874F2), // 水平线颜色
                      strokeWidth: 0.4, // 水平线宽度
                    ),

                    HorizontalLine(
                      y: widget.minY,
                      dashArray: [8, 4],
                      color: Color(0xFF3874F2), // 水平线颜色
                      strokeWidth: 0.4, // 水平线宽度
                    ),
                  ],
                ),
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
  List<LineChartBarData> lineBarsData(List<PowerEntity> lines) {
    return [
      LineChartBarData(
        ///是否圆一点
        isCurved: false,
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
    ];
  }
}
