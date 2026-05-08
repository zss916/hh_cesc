import 'package:cescpro/core/color/colors.dart';
import 'package:cescpro/core/helper/extension_helper.dart';
import 'package:cescpro/http/bean/power_graph_entity.dart';
import 'package:collection/collection.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class HPowerLineChart extends StatefulWidget {
  final List<List<PowerGraphList>> list;
  final double maxX;
  final double minY;
  final double maxY;

  const HPowerLineChart({
    super.key,
    required this.list,
    required this.maxX,
    required this.maxY,
    required this.minY,
  });

  @override
  State<StatefulWidget> createState() => MonitorLineChartWidgetState();
}

class MonitorLineChartWidgetState extends State<HPowerLineChart> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsetsDirectional.only(
        start: 10,
        end: 0,
        top: 10,
        bottom: 0,
      ),
      height: double.maxFinite,
      width: double.maxFinite,
      child: LineChart(
        transformationConfig: buildFlTransformationConfig,
        LineChartData(
          titlesData: buildFlTitlesData(),
          lineBarsData: lineBarsData(widget.list),
          lineTouchData: lineTouchData,
          gridData: buildFlGridData,
          borderData: buildFlBorderData,
          minX: 0,
          maxX: widget.maxX.toDouble(),
          maxY: widget.maxY,
          minY: widget.minY,
        ),
        duration: const Duration(seconds: 2),
      ),
    );
  }

  ///标题
  FlTitlesData buildFlTitlesData() {
    return FlTitlesData(
      rightTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
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
                              fontSize: 10,
                            ),
                          ),
                  );
                },
              ),
      ),
      leftTitles: AxisTitles(
        sideTitles: SideTitles(
          maxIncluded: false,
          minIncluded: false,
          showTitles: true,
          reservedSize: 28,
          getTitlesWidget: (value, meta) {
            return SideTitleWidget(
              space: 2,
              meta: meta,
              child: Text(
                value.formatNum(),
                style: TextStyle(
                  color: Color(0xA8FFFFFF),
                  fontWeight: FontWeight.w400,
                  fontSize: 8,
                ),
              ),
            );
          },
        ), // 左边Y轴标签禁用，手动创建
      ),
    );
  }

  FlBorderData get buildFlBorderData => FlBorderData(
    show: true,
    border: Border(
      bottom: BorderSide(color: Color(0x33FFFFFF), width: 1),
      left: const BorderSide(color: Colors.transparent, width: 0),
      right: const BorderSide(color: Colors.transparent, width: 0),
      top: const BorderSide(color: Colors.transparent, width: 0),
    ),
  );

  ///网格
  FlGridData get buildFlGridData =>
      FlGridData(show: true, drawHorizontalLine: true, drawVerticalLine: false);

  ///转化设置
  FlTransformationConfig get buildFlTransformationConfig =>
      FlTransformationConfig(
        scaleAxis: FlScaleAxis.horizontal,
        minScale: 1,
        maxScale: 3,
      );

  ///触摸
  LineTouchData get lineTouchData => LineTouchData(
    enabled: false,
    handleBuiltInTouches: false,
    touchTooltipData: LineTouchTooltipData(
      getTooltipColor: (touchedSpot) => Colors.white.withValues(alpha: 0.8),
    ),
  );

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
      isCurved: false,
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
