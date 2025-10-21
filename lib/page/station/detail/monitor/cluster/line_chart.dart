import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

@immutable
class LineChartWidget extends StatefulWidget {
  const LineChartWidget({super.key});

  @override
  State<StatefulWidget> createState() => LineChartWidgetState();
}

class LineChartWidgetState extends State<LineChartWidget> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return _LineChart();
  }
}

class _LineChart extends StatelessWidget {
  const _LineChart();

  @override
  Widget build(BuildContext context) {
    return LineChart(sampleData1, duration: const Duration(milliseconds: 250));
  }

  ///数据1
  LineChartData get sampleData1 => LineChartData(
    lineTouchData: lineTouchData1,
    gridData: gridData,
    titlesData: titlesData1,
    borderData: borderData,
    lineBarsData: lineBarsData1,
    minX: 0,
    maxX: 14,
    maxY: 5,
    minY: 0,
  );

  ///触摸
  LineTouchData get lineTouchData1 => LineTouchData(
    handleBuiltInTouches: false,
    touchTooltipData: LineTouchTooltipData(
      getTooltipColor: (touchedSpot) => Colors.white.withValues(alpha: 0.8),
    ),
  );

  FlTitlesData get titlesData1 => FlTitlesData(
    bottomTitles: AxisTitles(sideTitles: bottomTitles),
    rightTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
    topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
    leftTitles: AxisTitles(sideTitles: leftTitles()),
  );

  ///折现数据列表
  List<LineChartBarData> get lineBarsData1 => [
    lineChartBarData1_1,
    lineChartBarData1_2,
  ];

  Widget leftTitleWidgets(double value, TitleMeta meta) {
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
      child: Text(text, style: style, textAlign: TextAlign.center),
    );
  }

  ///左侧文案
  SideTitles leftTitles() => SideTitles(
    getTitlesWidget: leftTitleWidgets,
    showTitles: true,
    interval: 1,
    reservedSize: 30,
  );

  Widget bottomTitleWidgets(double value, TitleMeta meta) {
    TextStyle style = TextStyle(
      fontWeight: FontWeight.normal,
      fontSize: 12.sp,
      color: Color(0x80FFFFFF),
    );
    Widget text;
    switch (value.toInt()) {
      case 1:
        text = Text('00:00', style: style);
        break;
      case 4:
        text = Text('01:00', style: style);
        break;
      case 7:
        text = Text('02:00', style: style);
        break;
      case 10:
        text = Text('03:00', style: style);
        break;
      case 13:
        text = Text('04:00', style: style);
        break;
      default:
        text = const Text('');
        break;
    }

    return SideTitleWidget(meta: meta, space: 2, child: text);
  }

  ///底部文案
  SideTitles get bottomTitles => SideTitles(
    showTitles: true,
    reservedSize: 30,
    interval: 1,
    getTitlesWidget: bottomTitleWidgets,
  );

  ///网格
  FlGridData get gridData =>
      FlGridData(show: true, horizontalInterval: 1, drawVerticalLine: false);

  /// 边框
  FlBorderData get borderData => FlBorderData(
    show: true,
    border: Border(
      bottom: BorderSide(color: Color(0x33FFFFFF), width: 1),
      left: const BorderSide(color: Colors.transparent, width: 0),
      right: const BorderSide(color: Colors.transparent, width: 0),
      top: const BorderSide(color: Colors.transparent, width: 0),
    ),
  );

  ///折线1
  LineChartBarData get lineChartBarData1_1 => LineChartBarData(
    ///是否圆一点
    isCurved: true,
    color: Color(0xFF3874F2),
    barWidth: 1,
    isStrokeCapRound: true,

    ///点数据
    dotData: const FlDotData(show: false),

    ///线下面的区域(true)
    belowBarData: BarAreaData(show: false),
    spots: const [
      ///点坐标
      FlSpot(1, 1),
      FlSpot(3, 1.5),
      FlSpot(5, 1.4),
      FlSpot(7, 3.4),
      FlSpot(10, 2),
      FlSpot(12, 2.2),
      FlSpot(13, 1.8),
    ],
  );

  ///折线2
  LineChartBarData get lineChartBarData1_2 => LineChartBarData(
    isCurved: true,
    color: Color(0xFF0BC3C4),
    barWidth: 1,
    isStrokeCapRound: true,
    dotData: const FlDotData(show: false),
    belowBarData: BarAreaData(
      show: false,
      color: Colors.pink.withValues(alpha: 0),
    ),
    spots: const [
      FlSpot(1, 1),
      FlSpot(3, 2.8),
      FlSpot(7, 1.2),
      FlSpot(10, 2.8),
      FlSpot(12, 2.6),
      FlSpot(13, 3.9),
    ],
  );
}
