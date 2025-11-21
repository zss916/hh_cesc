import 'dart:math' as math;

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MonthBarChartWidget extends StatefulWidget {
  final List<int> yList;
  final List<String> xList;
  const MonthBarChartWidget({
    super.key,
    required this.yList,
    required this.xList,
  });

  @override
  State<StatefulWidget> createState() => BarChartWidgetState();
}

class BarChartWidgetState extends State<MonthBarChartWidget> {
  late List<BarChartGroupData> showingBarGroups;

  @override
  void initState() {
    super.initState();

    ///创建数据
    final barGroup1 = makeGroupData(0, 1, 2);
    final barGroup2 = makeGroupData(1, 3, 4);
    final barGroup3 = makeGroupData(2, 1.2, 1.5);
    final barGroup4 = makeGroupData(3, 2.2, 3.4);
    final barGroup5 = makeGroupData(4, 1.6, 0.6);
    final barGroup6 = makeGroupData(5, 1.6, 0.6);
    final barGroup7 = makeGroupData(6, 1.6, 0.6);
    final barGroup8 = makeGroupData(7, 1.6, 0.6);
    final barGroup9 = makeGroupData(8, 1.6, 0.6);
    final barGroup10 = makeGroupData(9, 1.6, 0.6);

    final items = [
      barGroup1,
      barGroup2,
      barGroup3,
      barGroup4,
      barGroup5,
      barGroup6,
      barGroup7,
      barGroup8,
      barGroup9,
      barGroup10,
      makeGroupData(10, 1.6, 0.6),
      makeGroupData(11, 1.6, 0.6),
      makeGroupData(12, 1.6, 0.6),
      makeGroupData(13, 1.6, 0.6),
      makeGroupData(14, 1.6, 0.6),
      makeGroupData(15, 1.6, 0.6),
      makeGroupData(16, 1.6, 0.6),
      makeGroupData(17, 1.6, 0.6),
      makeGroupData(18, 1.6, 0.6),
      makeGroupData(19, 1.6, 0.6),
      makeGroupData(20, 1.6, 0.6),
      makeGroupData(21, 1.6, 0.6),
      makeGroupData(22, 1.6, 0.6),
      makeGroupData(23, 1.6, 0.6),
      /* makeGroupData(24, 1.6, 0.6),
      makeGroupData(25, 1.6, 0.6),
      makeGroupData(26, 1.6, 0.6),
      makeGroupData(27, 1.6, 0.6),
      makeGroupData(28, 1.6, 0.6),
      makeGroupData(29, 1.6, 0.6),
      makeGroupData(30, 1.6, 0.6),
      makeGroupData(31, 1.6, 0.6),*/
    ];

    showingBarGroups = items;
  }

  @override
  Widget build(BuildContext context) {
    return BarChart(
      BarChartData(
        maxY: 5,
        minY: 0,
        barTouchData: BarTouchData(enabled: false),
        titlesData: FlTitlesData(
          show: true,
          rightTitles: const AxisTitles(
            sideTitles: SideTitles(showTitles: false),
          ),
          topTitles: const AxisTitles(
            sideTitles: SideTitles(showTitles: false),
          ),

          ///底部文案
          bottomTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              getTitlesWidget: bottomTitles,
              reservedSize: 70,
            ),
          ),

          ///左侧文案
          leftTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              reservedSize: 30,
              interval: 1,
              getTitlesWidget: leftTitles,
            ),
          ),
        ),

        barGroups: showingBarGroups,

        ///背景边框
        borderData: FlBorderData(
          show: true,
          border: Border(bottom: BorderSide(color: Colors.grey, width: 0.5)),
        ),

        ///背景表格
        gridData: const FlGridData(show: true, drawVerticalLine: false),
      ),
    );
  }

  ///左侧文案
  Widget leftTitles(double value, TitleMeta meta) {
    TextStyle style = TextStyle(
      fontWeight: FontWeight.normal,
      fontSize: 12.sp,
      color: Color(0x80FFFFFF),
    );
    String text;
    switch (value.toInt()) {
      case 0:
        text = '${widget.yList[0]}';
        break;
      case 1:
        text = '${widget.yList[1]}';
        break;
      case 2:
        text = '${widget.yList[2]}';
        break;
      case 3:
        text = '${widget.yList[3]}';
        break;
      case 4:
        text = '${widget.yList[4]}';
        break;
      default:
        return SizedBox.shrink();
    }
    return SideTitleWidget(
      meta: meta,
      // space: 0,
      child: Text(text, style: style),
    );
  }

  ///底部文案
  Widget bottomTitles(double value, TitleMeta meta) {
    TextStyle style = TextStyle(
      fontWeight: FontWeight.normal,
      fontSize: 8.sp,
      color: Color(0x80FFFFFF),
    );
    //
    /*Widget text = Text(
      widget.xList[value.toInt()],
      textAlign: TextAlign.center,
      style: style,
    );*/

    Widget text = Text(
      "${value.toInt()}",
      textAlign: TextAlign.center,
      style: style,
    );
    return SideTitleWidget(
      meta: meta,
      space: 2,
      angle: (-math.pi / 2) * 0,
      child: text,
    );
  }

  ///barsSpace 柱状图的间隔
  ///x 是第几个
  BarChartGroupData makeGroupData(int x, double y1, double y2) {
    return BarChartGroupData(
      barsSpace: 0,
      x: x,
      barRods: [
        BarChartRodData(
          //toY: y1,
          fromY: y1,
          toY: 0,
          gradient: LinearGradient(
            colors: [Color(0xFF43FFFF), Color(0xFF0978E9)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(2),
            topRight: Radius.circular(2),
            bottomLeft: Radius.zero,
            bottomRight: Radius.zero,
          ),
          //color: Color(0xFF39FFEF),
          width: 4.w,
        ),
      ],
    );
  }
}
