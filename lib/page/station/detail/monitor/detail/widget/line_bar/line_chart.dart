import 'package:cescpro/core/helper/extension_helper.dart';
import 'package:cescpro/http/bean/soc_entity.dart';
import 'package:collection/collection.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MonitorLineChartWidget extends StatefulWidget {
  final List<SocEntity> arrList;
  final double maxX;
  final double maxY;
  final double minY;
  final double maxYR;
  final double minYR;
  final bool isDiffL;
  final bool isDiffR;

  const MonitorLineChartWidget({
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

class MonitorLineChartWidgetState extends State<MonitorLineChartWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsetsDirectional.only(
        start: 0,
        end: 0,
        top: 25,
        bottom: 0,
      ),
      height: double.maxFinite,
      width: double.maxFinite,
      child: Stack(
        alignment: Alignment.center,
        children: [
          LineChart(
            LineChartData(
              lineTouchData: lineTouchData,
              gridData: flGridDataR,
              titlesData: buildFlTitlesDataSoc(),
              borderData: flBorderData,
              lineBarsData: lineBarsData2(widget.arrList),
              extraLinesData: buildExtraLinesDataR(),
              minX: 0,
              maxX: widget.maxX.toDouble(),
              maxY: widget.maxYR,
              minY: widget.minYR >= 0 ? 0 : widget.minYR,
            ),
            duration: const Duration(milliseconds: 2000),
          ),
          LineChart(
            LineChartData(
              lineTouchData: lineTouchData,
              gridData: flGridDataL,
              titlesData: buildFlTitlesDataPower(),
              borderData: flBorderData,
              lineBarsData: lineBarsData3(widget.arrList),
              extraLinesData: buildExtraLinesDataL(),
              minX: 0,
              maxX: widget.maxX.toDouble(),
              maxY: widget.maxY,
              minY: widget.minY >= 0 ? 0 : widget.minY,
            ),
            duration: const Duration(milliseconds: 2000),
          ),
        ],
      ),
    );
  }

  ///额外线
  ExtraLinesData? buildExtraLinesDataR() {
    return ExtraLinesData(
      horizontalLines: [
        HorizontalLine(
          y: widget.maxY,
          label: HorizontalLineLabel(show: false),
          color: Color(0x800BC3C4),
          strokeWidth: 0.4,
          dashArray: [8, 4],
        ),
      ],
    );
  }

  ExtraLinesData? buildExtraLinesDataL() {
    return ExtraLinesData(
      horizontalLines: [
        HorizontalLine(
          y: widget.maxY,
          label: HorizontalLineLabel(show: false),
          color: Color(0x803874F2),
          strokeWidth: 0.4,
          dashArray: [8, 4],
        ),
      ],
    );
  }

  ///power
  FlTitlesData buildFlTitlesDataPower() {
    return FlTitlesData(
      topTitles: axisTitles,
      bottomTitles: bottomTitles,
      rightTitles: mAxisTitles,
      leftTitles: AxisTitles(
        sideTitles: SideTitles(
          showTitles: true,
          minIncluded: true,
          maxIncluded: !widget.isDiffL,
          reservedSize: 30,
          getTitlesWidget: (value, meta) {
            return SideTitleWidget(
              space: 2,
              meta: meta,
              child: Text(
                value.titleL,
                style: TextStyle(
                  color: Color(0x80FFFFFF),
                  //color: Color(0xFF3874F2),
                  fontWeight: FontWeight.w400,
                  fontSize: 8.sp,
                ),
              ),
            );
          },
        ), // 左边Y轴标签禁用，手动创建
      ),
    );
  }

  ///soc
  FlTitlesData buildFlTitlesDataSoc() {
    return FlTitlesData(
      topTitles: axisTitles,
      bottomTitles: bottomTitles,
      leftTitles: mAxisTitles,
      rightTitles: AxisTitles(
        sideTitles: SideTitles(
          showTitles: true,
          minIncluded: true,
          maxIncluded: !widget.isDiffR,
          reservedSize: 30,
          getTitlesWidget: (value, meta) {
            return SideTitleWidget(
              space: 2,
              meta: meta,
              child: Text(
                value.titleL,
                style: TextStyle(
                  color: Color(0xFF0BC3C4),
                  fontWeight: FontWeight.w400,
                  fontSize: 8.sp,
                ),
              ),
            );
          },
        ),
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
        return SideTitleWidget(
          space: 2,
          meta: meta,
          child: Text(
            "",
            style: TextStyle(
              color: Colors.transparent,
              fontWeight: FontWeight.w400,
              fontSize: 8.sp,
            ),
          ),
        );
      },
    ),
  );

  ///axisTitles
  AxisTitles get axisTitles =>
      AxisTitles(sideTitles: SideTitles(showTitles: false));

  ///flGridData
  FlGridData get flGridDataL => FlGridData(
    show: true,
    drawHorizontalLine: true,
    drawVerticalLine: false,
    getDrawingHorizontalLine: (_) => const FlLine(
      color: Color(0x803874F2),
      strokeWidth: 0.4,
      dashArray: [8, 4],
    ),
  );

  FlGridData get flGridDataR => FlGridData(
    show: true,
    drawHorizontalLine: true,
    drawVerticalLine: false,
    getDrawingHorizontalLine: (_) => const FlLine(
      color: Color(0x800BC3C4),
      strokeWidth: 0.4,
      dashArray: [8, 4],
    ),
  );

  ///flBorderData
  FlBorderData get flBorderData => FlBorderData(
    show: true,
    border: Border(bottom: BorderSide(color: Colors.white10, width: 1)),
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
  /* List<LineChartBarData> lineBarsData(List<SocEntity> lines) {
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
  }*/

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
                    fontSize: 10.sp,
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

  ///extraLinesData2
  ExtraLinesData get extraLinesData2 => ExtraLinesData(
    horizontalLines: [
      HorizontalLine(
        y: 0,
        color: Colors.cyanAccent, // 水平线颜色
        strokeWidth: 0.4, // 水平线宽度
      ),

      /*HorizontalLine(
                          y: widget.maxYR,
                          dashArray: [8, 4],
                          color: Colors.cyanAccent, // 水平线颜色
                          strokeWidth: 0.4, // 水平线宽度
                        ),*/

      /*HorizontalLine(
                          y: widget.minYR,
                          dashArray: [8, 4],
                          color: Colors.cyanAccent, // 水平线颜色
                          strokeWidth: 0.4, // 水平线宽度
                        ),*/
    ],
  );

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

  ///extraLinesData3
  ExtraLinesData get extraLinesData3 => ExtraLinesData(
    horizontalLines: [
      /* HorizontalLine(
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
                        ),*/
      HorizontalLine(
        y: 0,
        color: Colors.transparent, // 水平线颜色
        strokeWidth: 0.4, // 水平线宽度
      ),
    ],
  );

  ///mLineBarsData
  List<LineChartBarData> mLineBarsData(List<SocEntity> lines) {
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
