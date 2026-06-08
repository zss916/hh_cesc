import 'package:cescpro/core/helper/extension_helper.dart';
import 'package:cescpro/http/bean/power_graph_entity.dart';
import 'package:collection/collection.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class HPowerLineChart2 extends StatefulWidget {
  final List<(List<PowerGraphList>, Color)> list;
  final List<(List<PowerGraphList>, Color)> socList;
  final double maxX;
  final double minY;
  final double maxY;

  const HPowerLineChart2({
    super.key,
    required this.list,
    required this.socList,
    required this.maxX,
    required this.maxY,
    required this.minY,
  });

  @override
  State<StatefulWidget> createState() => MonitorLineChartWidgetState();
}

class MonitorLineChartWidgetState extends State<HPowerLineChart2> {
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
      child: Stack(
        alignment: AlignmentDirectional.center,
        children: [
          ///soc
          LineChart(
            transformationConfig: FlTransformationConfig(
              scaleAxis: FlScaleAxis.horizontal,
              minScale: 80,
              maxScale: 100,
            ),
            LineChartData(
              lineTouchData: lineTouchData,
              gridData: buildFlGridDataR,
              titlesData: buildFlTitlesDataSoc(),
              borderData: buildFlBorderDataR,
              lineBarsData: lineBarsDataR(widget.socList),
              extraLinesData: buildExtraLinesDataR(),
              minX: 0,
              maxX: widget.maxX.toDouble(),
              maxY: 100,
              minY: 0,
            ),
            duration: const Duration(milliseconds: 2000),
          ),

          ///other
          LineChart(
            // transformationConfig: buildFlTransformationConfig,
            LineChartData(
              titlesData: buildFlTitlesData(),
              lineBarsData: lineBarsData(widget.list),
              lineTouchData: lineTouchData,
              gridData: buildFlGridData,
              borderData: buildFlBorderData,
              minX: 0,
              maxX: widget.maxX.toDouble(),
              maxY: widget.maxY,
              minY: widget.minY >= 0 ? 0 : widget.minY,
            ),
            duration: const Duration(seconds: 2),
          ),
        ],
      ),
    );
  }

  ///额外线R
  ExtraLinesData? buildExtraLinesDataR() {
    return ExtraLinesData(
      horizontalLines: [
        HorizontalLine(
          y: 100,
          label: HorizontalLineLabel(show: false),
          color: widget.socList.first.$2,
          strokeWidth: 0.4,
          dashArray: [8, 4],
        ),
      ],
    );
  }

  FlBorderData get buildFlBorderDataR => FlBorderData(
    show: true,
    border: Border(bottom: BorderSide(color: Colors.transparent, width: 1)),
  );

  ///soc
  FlTitlesData buildFlTitlesDataSoc() {
    return FlTitlesData(
      topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
      bottomTitles: bottomTitlesR,
      leftTitles: mAxisTitles,
      rightTitles: AxisTitles(
        sideTitles: SideTitles(
          showTitles: true,
          minIncluded: true,
          maxIncluded: true,
          reservedSize: 24,
          getTitlesWidget: (value, meta) {
            return SideTitleWidget(
              space: 2,
              meta: meta,
              child: Text(
                value.toStringAsFixed(1).toString(),
                style: TextStyle(
                  color: widget.socList.first.$2,
                  fontWeight: FontWeight.w400,
                  fontSize: 8,
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  ///网格R
  FlGridData get buildFlGridDataR => FlGridData(
    show: true,
    drawHorizontalLine: true,
    drawVerticalLine: false,
    getDrawingHorizontalLine: (value) {
      return FlLine(
        strokeWidth: 0.4,
        dashArray: [8, 4],
        color: widget.socList.first.$2.withValues(alpha: 0.65),
      );
    },
  );

  AxisTitles get bottomTitles => AxisTitles(
    sideTitles: SideTitles(
      showTitles: true,
      reservedSize: 20,
      //interval: 160,
      getTitlesWidget: (value, meta) {
        return widget.list.isEmpty
            ? SizedBox(height: 10)
            : SideTitleWidget(
                meta: meta,
                child: value.toInt() >= (widget.list.first.$1).length
                    ? SizedBox.shrink()
                    : Text(
                        ((widget.list.first.$1)[value.toInt()].time).hm,
                        style: TextStyle(
                          color: Color(0xA8FFFFFF),
                          fontWeight: FontWeight.w400,
                          fontSize: 10,
                        ),
                      ),
              );
      },
    ),
  );

  AxisTitles get bottomTitlesR => AxisTitles(
    sideTitles: SideTitles(
      showTitles: true,
      reservedSize: 20,
      getTitlesWidget: (value, meta) {
        return widget.socList.isEmpty
            ? SizedBox(height: 10)
            : SideTitleWidget(
                meta: meta,
                child: value.toInt() >= (widget.list.first.$1).length
                    ? SizedBox.shrink()
                    : Text(
                        ((widget.list.first.$1)[value.toInt()].time).hm,
                        style: TextStyle(
                          color: Colors.transparent,
                          fontWeight: FontWeight.w400,
                          fontSize: 10,
                        ),
                      ),
              );
      },
    ),
  );

  ///标题
  FlTitlesData buildFlTitlesData() {
    return FlTitlesData(
      rightTitles: mAxisTitles,
      topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
      bottomTitles: bottomTitles,
      leftTitles: AxisTitles(
        sideTitles: SideTitles(
          maxIncluded: false,
          minIncluded: false,
          showTitles: true,
          reservedSize: 30,
          getTitlesWidget: (value, meta) {
            return SideTitleWidget(
              space: 2,
              meta: meta,
              child: Text(
                value.titleL,
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
    border: Border(bottom: BorderSide(color: Colors.white, width: 1)),
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
  List<LineChartBarData> lineBarsData(
    List<(List<PowerGraphList>, Color)> lines,
  ) {
    return lines.isEmpty
        ? <LineChartBarData>[]
        : [...lines.mapIndexed((i, e) => buildLineChartBarData(e.$2, e.$1))];
  }

  LineChartBarData buildLineChartBarData(
    Color color,
    List<PowerGraphList> lines,
  ) {
    // debugPrint("lines ==>${lines.length}, ${lines.toString()}");

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
        show: false,
        color: color.withValues(alpha: 0.1),
      ),
      spots: [
        ...lines.mapIndexed((i, e) {
          // FlSpot.nullSpot;
          // debugPrint("FlSpot ===>>> ${i.toDouble()}, ${e.val.toDouble()}");
          return FlSpot(i.toDouble(), (e.val ?? 0).toDouble());
        }),
      ],
    );
  }

  ///soc line
  List<LineChartBarData> lineBarsDataR(
    List<(List<PowerGraphList>, Color)> lines,
  ) {
    return lines.isEmpty
        ? <LineChartBarData>[]
        : [...lines.mapIndexed((i, e) => buildLineChartBarData(e.$2, e.$1))];
  }

  ///mAxisTitles
  AxisTitles get mAxisTitles => AxisTitles(
    sideTitles: SideTitles(
      showTitles: true,
      reservedSize: 30,
      minIncluded: false,
      maxIncluded: false,
      getTitlesWidget: (value, meta) {
        return SideTitleWidget(
          space: 2,
          meta: meta,
          child: Text(
            "",
            style: TextStyle(
              color: Colors.transparent,
              fontWeight: FontWeight.w400,
              fontSize: 8,
            ),
          ),
        );
      },
    ),
  );
}
