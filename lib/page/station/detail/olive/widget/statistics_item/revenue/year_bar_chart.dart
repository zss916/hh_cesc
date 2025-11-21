import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class YearBarChartWidget extends StatefulWidget {
  const YearBarChartWidget({super.key});

  @override
  State<StatefulWidget> createState() => BarChartWidgetState();
}

class BarChartWidgetState extends State<YearBarChartWidget> {
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

    final items = [barGroup1, barGroup2, barGroup3, barGroup4, barGroup5];

    showingBarGroups = items;
  }

  @override
  Widget build(BuildContext context) {
    return BarChart(
      BarChartData(
        ///最大值dataList.reduce(max)；
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
              reservedSize: 20,
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
        text = '0';
        break;
      case 1:
        text = '20';
        break;
      case 2:
        text = '40';
        break;
      case 3:
        text = '60';
        break;
      case 4:
        text = '80';
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
      fontSize: 12.sp,
      color: Color(0x80FFFFFF),
    );
    Widget text;
    switch (value.toInt()) {
      case 0:
        text = Text('00:00', style: style);
        break;
      case 1:
        text = Text('01:00', style: style);
        break;
      case 2:
        text = Text('02:00', style: style);
        break;
      case 3:
        text = Text('03:00', style: style);
        break;
      case 4:
        text = Text('04:00', style: style);
        break;
      default:
        text = const Text('');
        break;
    }

    return SideTitleWidget(meta: meta, space: 2, child: text);
  }

  ///barsSpace 柱状图的间隔
  ///x 是第几个
  BarChartGroupData makeGroupData(int x, double y1, double y2) {
    return BarChartGroupData(
      barsSpace: 4,
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
          width: 8.w,
        ),
        BarChartRodData(
          fromY: y1,
          toY: 0,
          //toY: y2,
          gradient: LinearGradient(
            colors: [Color(0xFFFFC08C), Color(0xFFFF8334)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(2),
            topRight: Radius.circular(2),
            bottomLeft: Radius.zero,
            bottomRight: Radius.zero,
          ),
          // color: Color(0xFFFF8334),
          width: 8.w,
        ),
      ],
    );
  }
}
