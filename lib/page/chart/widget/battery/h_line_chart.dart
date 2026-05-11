import 'package:cescpro/core/helper/extension_helper.dart';
import 'package:cescpro/http/bean/soc_entity.dart';
import 'package:collection/collection.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class HMonitorLineChartWidget extends StatefulWidget {
  final List<SocEntity> arrList;
  final double maxX;
  final double maxY;
  final double minY;
  final double maxYR;
  final double minYR;
  final bool isDiffL;
  final bool isDiffR;

  const HMonitorLineChartWidget({
    super.key,
    required this.arrList,
    required this.maxX,
    required this.maxY,
    required this.minY,
    required this.maxYR,
    required this.minYR,
    required this.isDiffL,
    required this.isDiffR,
  });

  @override
  State<StatefulWidget> createState() => MonitorLineChartWidgetState();
}

class MonitorLineChartWidgetState extends State<HMonitorLineChartWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsetsDirectional.only(
        start: 0,
        end: 0,
        top: 12,
        bottom: 0,
      ),
      height: double.maxFinite,
      child: Stack(
        alignment: Alignment.center,
        children: [
          LineChart(
            LineChartData(
              lineTouchData: lineTouchData,
              gridData: flGridData,
              titlesData: FlTitlesData(
                topTitles: axisTitles,
                bottomTitles: bottomTitles,
                leftTitles: mAxisTitles,
                rightTitles: AxisTitles(
                  sideTitles: SideTitles(
                    showTitles: true,
                    minIncluded: true,
                    //maxIncluded: true,
                    maxIncluded: !widget.isDiffR,
                    reservedSize: 35,
                    getTitlesWidget: (value, meta) {
                      return SideTitleWidget(
                        space: 2,
                        meta: meta,
                        child: Text(
                          value.titleL,
                          style: TextStyle(
                            color: Color(0xFF0BC3C4),
                            fontWeight: FontWeight.w400,
                            fontSize: 8,
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
              borderData: flBorderData,
              lineBarsData: lineBarsData2(widget.arrList),
              minX: 0,
              maxX: widget.maxX.toDouble(),
              maxY: widget.maxYR,
              minY: widget.minYR,
            ),
            duration: const Duration(milliseconds: 2000),
          ),
          LineChart(
            LineChartData(
              lineTouchData: lineTouchData,
              gridData: flGridData,
              titlesData: FlTitlesData(
                topTitles: axisTitles,
                bottomTitles: bottomTitles,
                rightTitles: mAxisTitles,
                leftTitles: AxisTitles(
                  sideTitles: SideTitles(
                    showTitles: true,
                    minIncluded: true,
                    maxIncluded: !widget.isDiffL,
                    //maxIncluded: true,
                    reservedSize: 35,
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
              ),
              borderData: flBorderData,
              lineBarsData: lineBarsData3(widget.arrList),
              minX: 0,
              maxX: widget.maxX.toDouble(),
              maxY: widget.maxY,
              minY: widget.minY,
            ),
            duration: const Duration(milliseconds: 2000),
          ),
        ],
      ),
    );
  }

  ///mAxisTitles
  AxisTitles get mAxisTitles => AxisTitles(
    sideTitles: SideTitles(
      showTitles: true,
      reservedSize: 30,
      minIncluded: false,
      maxIncluded: false,
      getTitlesWidget: (value, meta) {
        return SizedBox();
      },
    ),
  );

  ///axisTitles
  AxisTitles get axisTitles =>
      AxisTitles(sideTitles: SideTitles(showTitles: false));

  ///flGridData
  FlGridData get flGridData =>
      FlGridData(show: true, drawHorizontalLine: true, drawVerticalLine: false);

  ///flBorderData
  FlBorderData get flBorderData => FlBorderData(
    show: true,
    border: Border(bottom: BorderSide(color: Color(0x33FFFFFF), width: 1)),
  );

  ///触摸
  LineTouchData get lineTouchData => LineTouchData(
    enabled: false,
    handleBuiltInTouches: false,
    touchTooltipData: LineTouchTooltipData(
      getTooltipColor: (touchedSpot) => Colors.white.withValues(alpha: 0.8),
    ),
  );

  ///底部titles
  AxisTitles get bottomTitles => AxisTitles(
    sideTitles: SideTitles(
      showTitles: true,
      reservedSize: 25,
      getTitlesWidget: (value, meta) {
        return SideTitleWidget(
          meta: meta,
          child: value.toInt() >= widget.arrList.length
              ? SizedBox.shrink()
              : Text(
                  (widget.arrList[value.toInt()].time ?? 0).hm2,
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

  List<LineChartBarData> lineBarsData2(List<SocEntity> lines) {
    return [
      LineChartBarData(
        isCurved: false,
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

  List<LineChartBarData> lineBarsData3(List<SocEntity> lines) {
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
