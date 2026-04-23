import 'package:cescpro/components/line_chart/custom_touch_indicators.dart';
import 'package:cescpro/core/color/colors.dart';
import 'package:cescpro/core/helper/extension_helper.dart';
import 'package:cescpro/http/bean/power_graph_entity.dart';
import 'package:collection/collection.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PowerLineChart extends StatefulWidget {
  final List<List<PowerGraphList>> list;
  final double maxX;
  final double minY;
  final double maxY;

  const PowerLineChart({
    super.key,
    required this.list,
    required this.maxX,
    required this.maxY,
    required this.minY,
  });

  @override
  State<StatefulWidget> createState() => MonitorLineChartWidgetState();
}

class MonitorLineChartWidgetState extends State<PowerLineChart> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsetsDirectional.only(
        start: 12,
        end: 12,
        top: 40,
        bottom: 0,
      ),
      height: double.maxFinite,
      width: MediaQuery.of(context).size.width,
      child: LineChart(
        transformationConfig: FlTransformationConfig(
          scaleAxis: FlScaleAxis.horizontal,
          minScale: 1,
          maxScale: 4,
        ),
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
            topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
            bottomTitles: AxisTitles(
              sideTitles: widget.list.isEmpty
                  ? SideTitles(
                      showTitles: true,
                      reservedSize: 25,
                      getTitlesWidget: (value, meta) => SizedBox(height: 10),
                    )
                  : SideTitles(
                      showTitles: true,
                      reservedSize: 25,
                      getTitlesWidget: (value, meta) {
                        return SideTitleWidget(
                          meta: meta,
                          child: value.toInt() >= (widget.list.first).length
                              ? SizedBox.shrink()
                              : Text(
                                  ((widget.list.first)[value.toInt()].time).hm,
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
                reservedSize: 25,
                maxIncluded: false,
                minIncluded: false,
                getTitlesWidget: (value, meta) {
                  return SideTitleWidget(
                    space: 2,
                    meta: meta,
                    child: Text(
                      value.formatNum(),
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
              right: const BorderSide(color: Colors.transparent, width: 0),
              top: const BorderSide(color: Colors.transparent, width: 0),
            ),
          ),
          lineBarsData: lineBarsData(widget.list),
          minX: 0,
          maxX: widget.maxX.toDouble(),
          maxY: widget.maxY,
          minY: widget.minY,
        ),
        duration: const Duration(seconds: 2),
      ),
    );
  }

  ///触摸
  LineTouchData get lineTouchData => LineTouchData(
    enabled: false,
    handleBuiltInTouches: false,
    getTouchedSpotIndicator: customTouchedIndicators,
    touchTooltipData: LineTouchTooltipData(
      getTooltipColor: (touchedSpot) => Colors.white,
    ),
  );

  Color lerpGradient(List<Color> colors, List<double> stops, double t) {
    final length = colors.length;
    if (stops.length != length) {
      /// provided gradientColorStops is invalid and we calculate it here
      stops = List.generate(length, (i) => (i + 1) / length);
    }

    for (var s = 0; s < stops.length - 1; s++) {
      final leftStop = stops[s];
      final rightStop = stops[s + 1];

      final leftColor = colors[s];
      final rightColor = colors[s + 1];

      if (t <= leftStop) {
        return leftColor;
      } else if (t < rightStop) {
        final sectionT = (t - leftStop) / (rightStop - leftStop);
        return Color.lerp(leftColor, rightColor, sectionT)!;
      }
    }
    return colors.last;
  }

  ///折现数据列表
  List<LineChartBarData> lineBarsData(List<List<PowerGraphList>> lines) {
    return lines.isEmpty
        ? <LineChartBarData>[]
        : [
            ...lines.mapIndexed(
              (i, e) => buildLineChartBarData(AppColors.colorList[i], e),
            ),
          ];
  }

  LineChartBarData buildLineChartBarData(
    Color color,
    List<PowerGraphList> lines,
  ) {
    return LineChartBarData(
      ///是否圆一点
      isCurved: true,
      color: color,
      barWidth: 1,
      isStrokeCapRound: true,

      ///点数据
      dotData: const FlDotData(show: false),

      ///线下面的区域(true)
      belowBarData: BarAreaData(
        show: true,
        color: color.withValues(alpha: 0.1),
      ),
      spots: [
        ...lines.mapIndexed(
          (i, e) => FlSpot(i.toDouble(), (e.val ?? 0).toDouble()),
        ),
      ],
    );
  }
}
