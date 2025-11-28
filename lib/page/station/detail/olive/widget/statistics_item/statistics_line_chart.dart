import 'package:cescpro/http/bean/power_graph_entity.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

@immutable
class StatisticsLineChartWidget extends StatefulWidget {
  final List<PowerGraphList> value;
  const StatisticsLineChartWidget({super.key, required this.value});

  @override
  State<StatefulWidget> createState() => LineChartWidgetState();
}

class LineChartWidgetState extends State<StatisticsLineChartWidget> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return _LineChart(widget.value);
  }
}

class _LineChart extends StatelessWidget {
  final List<PowerGraphList> powerList;

  const _LineChart(this.powerList);

  @override
  Widget build(BuildContext context) {
    return LineChart(
      LineChartData(
        lineTouchData: LineTouchData(enabled: false),
        gridData: FlGridData(
          show: true,
          horizontalInterval: 1,
          drawVerticalLine: false,
        ),
        titlesData: FlTitlesData(
          bottomTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              reservedSize: 30,
              interval: 1,
              getTitlesWidget: bottomTitleWidgets,
            ),
          ),
          rightTitles: const AxisTitles(
            sideTitles: SideTitles(showTitles: false),
          ),
          topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
          leftTitles: AxisTitles(
            sideTitles: SideTitles(
              getTitlesWidget: leftTitleWidgets,
              showTitles: true,
              interval: 1,
              reservedSize: 30,
            ),
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
        lineBarsData: [
          LineChartBarData(
            ///是否圆一点
            isCurved: true,
            color: Color(0xFF3874F2),
            barWidth: 1,
            isStrokeCapRound: true,

            ///点数据
            dotData: const FlDotData(show: false),

            ///线下面的区域(true)
            belowBarData: BarAreaData(
              show: true,
              color: Color(0xFF3874F2).withValues(alpha: 0.15),
            ),
            spots: [
              // ...(powerList ?? []).map((e) => e.mFlSpot),
              /*...(list[0].list??[])
            .map((e) => FlSpot(0,0)),
        */
              ///点坐标
              // FlSpot(1, 1),
              // FlSpot(3, 1.5),
            ],
          ),
          //lineChartBarData1_2,
          //lineChartBarData1_3,
          //lineChartBarData1_4,
          //lineChartBarData1_5,
        ],
        //minX: 0,
        //maxX: 24,
        // minY: 0,
        // maxY: 80,
        //minY: (powerList.first.list?.first.time ?? 0).toDouble(),
        //maxY: (powerList.first.list?.last.time ?? 0).toDouble(),
      ),
      duration: const Duration(milliseconds: 250),
    );
  }

  ///left title
  Widget leftTitleWidgets(double value, TitleMeta meta) {
    return SideTitleWidget(
      meta: meta,
      child: Text(
        "${value}",
        style: TextStyle(
          fontWeight: FontWeight.normal,
          fontSize: 12.sp,
          color: Color(0x80FFFFFF),
        ),
        textAlign: TextAlign.center,
      ),
    );
  }

  ///底部title
  Widget bottomTitleWidgets(double value, TitleMeta meta) {
    TextStyle style = TextStyle(
      fontWeight: FontWeight.normal,
      fontSize: 12.sp,
      color: Color(0x80FFFFFF),
    );
    Widget text;
    switch (value.toInt()) {
      case 0:
        text = Container(
          margin: EdgeInsetsGeometry.only(left: 24.w),
          child: Text('00:00', style: style),
        );
        break;
      case 6:
        text = Text('06:00', style: style);
        break;
      case 12:
        text = Text('12:00', style: style);
        break;
      case 18:
        text = Text('18:00', style: style);
        break;
      case 24:
        text = Container(
          margin: EdgeInsetsGeometry.only(right: 22.w),
          child: Text('24:00', style: style),
        );
        break;
      default:
        text = const Text('');
        break;
    }

    return SideTitleWidget(meta: meta, space: 2, child: text);
  }

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
    belowBarData: BarAreaData(
      show: true,
      color: Color(0xFF3874F2).withValues(alpha: 0.15),
    ),
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
      show: true,
      color: Color(0xFF0BC3C4).withValues(alpha: 0.15),
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

  ///折线3
  LineChartBarData get lineChartBarData1_3 => LineChartBarData(
    ///是否圆一点
    isCurved: true,
    color: Color(0xFFF9C74F),
    barWidth: 1,
    isStrokeCapRound: true,

    ///点数据
    dotData: const FlDotData(show: false),

    ///线下面的区域(true)
    belowBarData: BarAreaData(
      show: true,
      color: Color(0xFFF9C74F).withValues(alpha: 0.15),
    ),
    spots: const [
      ///点坐标
      FlSpot(1, 1),
      FlSpot(2, 2),
      FlSpot(3.3, 1.5),
      FlSpot(6.5, 3.4),
      FlSpot(9, 2.2),
      FlSpot(12.5, 4),
      FlSpot(13, 1.6),
    ],
  );

  ///折线4
  LineChartBarData get lineChartBarData1_4 => LineChartBarData(
    ///是否圆一点
    isCurved: true,
    color: Color(0xFFF94144),
    barWidth: 1,
    isStrokeCapRound: true,

    ///点数据
    dotData: const FlDotData(show: false),

    ///线下面的区域(true)
    belowBarData: BarAreaData(
      show: true,
      color: Color(0xFFF94144).withValues(alpha: 0.15),
    ),
    spots: const [
      ///点坐标
      FlSpot(0.5, 1.5),
      FlSpot(2.1, 2),
      FlSpot(3.2, 1.5),
      FlSpot(5.2, 3.4),
      FlSpot(7, 3.2),
      FlSpot(10.5, 1.3),
      FlSpot(13.3, 3),
    ],
  );

  ///折线5
  LineChartBarData get lineChartBarData1_5 => LineChartBarData(
    ///是否圆一点
    isCurved: true,
    color: Color(0xFFB131DB),
    barWidth: 1,
    isStrokeCapRound: true,

    ///点数据
    dotData: const FlDotData(show: false),

    ///线下面的区域(true)
    belowBarData: BarAreaData(
      show: true,
      color: Color(0xFFB131DB).withValues(alpha: 0.15),
    ),
    spots: const [
      ///点坐标
      FlSpot(0.2, 1.5),
      FlSpot(2.1, 2.3),
      FlSpot(3.2, 1.8),
      FlSpot(5.2, 3.4),
      FlSpot(7.2, 3.2),
      FlSpot(8.5, 1.6),
      FlSpot(14.3, 3.1),
    ],
  );
}
