import 'package:cescpro/core/helper/extension_helper.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class HEleBarchartItemWidget extends StatefulWidget {
  final List<double> data; // 充电列表
  final List<double> data2; // 放电列表
  final List<double> data3; // 发电列表
  final List<String> labels; // 标签列表
  final double maxY; // Y轴的最大值
  final double minY; // Y轴的最小值

  const HEleBarchartItemWidget({
    super.key,
    required this.data,
    required this.data2,
    required this.data3,
    required this.labels,
    required this.maxY,
    required this.minY,
  });

  @override
  _BarChartWidgetState createState() => _BarChartWidgetState();
}

class _BarChartWidgetState extends State<HEleBarchartItemWidget> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (widget.labels.isNotEmpty) {
        //_scrollToRight();
      }
    });
  }

  void _scrollToRight() {
    _scrollController.animateTo(
      _scrollController.position.maxScrollExtent,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.maxFinite,
      height: double.maxFinite,
      child: SingleChildScrollView(
        controller: _scrollController,
        scrollDirection: Axis.horizontal,
        child: Container(
          padding: const EdgeInsetsDirectional.only(
            start: 12,
            end: 12,
            top: 12,
            bottom: 0,
          ),
          height: double.maxFinite,
          width: screenWidth,
          child: BarChart(
            BarChartData(
              titlesData: _buildTitlesData(), // 构建标题数据
              barGroups: _buildBarGroups(), // 构建柱状图组
              maxY: widget.maxY,
              minY: (widget.minY >= 0) ? 0 : widget.minY,
              barTouchData: buildBarTouchData(),
              borderData: buildFlBorderData, // 边框数据
              gridData: buildFlGridData, // 网格数据
              alignment: BarChartAlignment.spaceEvenly, // 确保间距均匀
              extraLinesData: buildExtraLinesData, // 额外线条数据
            ),
          ),
        ),
      ),
    );
  }

  ///边框线
  FlBorderData get buildFlBorderData => FlBorderData(
    show: true,
    border: Border(bottom: BorderSide(color: Colors.white, width: 1)),
  );

  ///触摸数据
  BarTouchData? buildBarTouchData() {
    return widget.labels.isEmpty
        ? null
        : BarTouchData(
            enabled: true,
            touchTooltipData: BarTouchTooltipData(
              getTooltipColor: (_) => Color(0x66000000),
              tooltipHorizontalAlignment: FLHorizontalAlignment.right,
              tooltipMargin: -30,
              getTooltipItem: (group, groupIndex, rod, rodIndex) {
                return BarTooltipItem(
                  '${widget.labels[groupIndex]}\n',
                  TextStyle(
                    color: [
                      Color(0xFF39FFEF),
                      Color(0xFFFFC08C),
                      Color(0xFF42A5F5),
                    ][rodIndex],
                    fontSize: 8,
                  ),
                  children: <TextSpan>[
                    TextSpan(
                      text: (rod.toY).toDouble().formatAmount(),
                      style: TextStyle(
                        color: [
                          Color(0xFF39FFEF),
                          Color(0xFFFFC08C),
                          Color(0xFF42A5F5),
                        ][rodIndex],
                        fontWeight: FontWeight.w500,
                        fontSize: 10,
                      ),
                    ),
                  ],
                );
              },
            ),
            touchCallback: (FlTouchEvent event, barTouchResponse) {
              setState(() {
                if (!event.isInterestedForInteractions ||
                    barTouchResponse == null ||
                    barTouchResponse.spot == null) {
                  return;
                }
              });
            },
          );
  }

  ///额外线
  ExtraLinesData get buildExtraLinesData => ExtraLinesData(
    horizontalLines: [
      /*HorizontalLine(
        y: 0,
        color: Colors.white, // 水平线颜色
        strokeWidth: 0.4, // 水平线宽度
      ),*/

      //
      HorizontalLine(
        y: widget.maxY,
        label: HorizontalLineLabel(show: true),
        color: Colors.transparent,
        strokeWidth: 0.4,
        dashArray: [8, 4],
      ),

      HorizontalLine(
        y: widget.minY,
        label: HorizontalLineLabel(show: true),
        color: Colors.transparent, // 水平线颜色
        strokeWidth: 0.4,
        dashArray: [8, 4],
      ),
    ],
  );

  ///网格
  FlGridData get buildFlGridData => FlGridData(
    show: true,
    drawHorizontalLine: true,
    drawVerticalLine: false,
    /*   horizontalInterval: widget.maxY == 0
                        ? 10
                        : ((widget.maxY) / 4),*/
    // 确保水平线间隔与 Y 轴标签一致
    getDrawingHorizontalLine: (value) {
      return FlLine(
        strokeWidth: 0.4,
        dashArray: [8, 4],
        color: Color(0xA8FFFFFF), // 水平线颜色
        //strokeWidth: 1, // 水平线宽度
      );
    },
  );

  ///屏幕宽
  double get screenWidth =>
      ((widget.data.length * 80.0) <= (MediaQuery.of(context).size.width - 80))
      ? (MediaQuery.of(context).size.width - 80)
      : widget.data.length * 80.0;

  /// 构建标题数据，包括X轴和Y轴
  FlTitlesData _buildTitlesData() {
    return FlTitlesData(
      show: true,
      bottomTitles: AxisTitles(
        sideTitles: SideTitles(
          showTitles: true,
          reservedSize: 18,
          getTitlesWidget: (value, meta) {
            final style = TextStyle(
              color: Color(0xA8FFFFFF),
              fontWeight: FontWeight.w400,
              fontSize: 8,
            );
            return SideTitleWidget(
              //axisSide: meta.axisSide,
              space: 4,
              meta: meta,
              child: Text(widget.labels[value.toInt()], style: style),
            );
          },
        ),
      ),
      leftTitles: AxisTitles(
        sideTitles: SideTitles(
          showTitles: true,
          maxIncluded: false,
          minIncluded: true,
          reservedSize: 25,
          getTitlesWidget: (value, meta) {
            return SideTitleWidget(
              space: 1,
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
        ),

        /*sideTitles: SideTitles(
          showTitles: true,
          reservedSize: 30,
          getTitlesWidget: (value, meta) {
            final style = TextStyle(
              color: Color(0xA8FFFFFF),
              fontWeight: FontWeight.w400,
              fontSize: 8.sp,
            );
            return SideTitleWidget(
              //axisSide: meta.axisSide,
              space: 4,
              meta: meta,
              child: Text("$value", style: style),
            );
          },
        ),*/
      ),
      topTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
      rightTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
    );
  }

  FlTitlesData _buildTitlesData2() {
    return FlTitlesData(
      show: true,
      bottomTitles: AxisTitles(
        sideTitles: SideTitles(
          showTitles: true,
          reservedSize: 25,
          getTitlesWidget: (value, meta) {
            final style = TextStyle(
              color: Color(0xA8FFFFFF),
              fontWeight: FontWeight.w400,
              fontSize: 8,
            );
            return SideTitleWidget(
              //axisSide: meta.axisSide,
              space: 4,
              meta: meta,
              child: Text(widget.labels[value.toInt()], style: style),
            );
          },
        ),
      ),
      leftTitles: AxisTitles(
        sideTitles: SideTitles(
          showTitles: false,
          reservedSize: 40,
          getTitlesWidget: (value, meta) {
            final style = TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w400,
              fontSize: 8,
            );
            final style2 = TextStyle(
              color: Colors.transparent,
              fontWeight: FontWeight.w400,
              fontSize: 8,
            );

            bool isShow = (value == widget.minY) || (value == widget.maxY);
            return SideTitleWidget(
              space: 1,
              meta: meta,
              child: Text("$value", style: isShow ? style2 : style),
            );
          },
        ),

        /*sideTitles: SideTitles(
          showTitles: true,
          reservedSize: 30,
          getTitlesWidget: (value, meta) {
            final style = TextStyle(
              color: Color(0xA8FFFFFF),
              fontWeight: FontWeight.w400,
              fontSize: 8.sp,
            );
            return SideTitleWidget(
              //axisSide: meta.axisSide,
              space: 4,
              meta: meta,
              child: Text("$value", style: style),
            );
          },
        ),*/
      ),
      topTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
      rightTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
    );
  }

  // 构建柱状图组
  List<BarChartGroupData> _buildBarGroups() {
    return List.generate(widget.data.length, (index) {
      return BarChartGroupData(
        x: index,
        barsSpace: 4,
        barRods: [
          BarChartRodData(
            fromY: 0,
            toY: widget.data[index],
            gradient: LinearGradient(
              colors: [Color(0xFF39FFEF), Color(0xFF06B59B)],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
            borderRadius: BorderRadius.only(
              topLeft: widget.data[index] >= 0
                  ? Radius.circular(2.0)
                  : Radius.zero,
              topRight: widget.data[index] >= 0
                  ? Radius.circular(2.0)
                  : Radius.zero,
              bottomLeft: widget.data[index] < 0
                  ? Radius.circular(2.0)
                  : Radius.zero,
              bottomRight: widget.data[index] < 0
                  ? Radius.circular(2.0)
                  : Radius.zero,
            ),
            width: 8,
          ),
          BarChartRodData(
            fromY: 0,
            toY: widget.data2[index],
            gradient: LinearGradient(
              colors: [Color(0xFFFFC08C), Color(0xFFFF8334)],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
            borderRadius: BorderRadius.only(
              topLeft: widget.data2[index] >= 0
                  ? Radius.circular(2.0)
                  : Radius.zero,
              topRight: widget.data2[index] >= 0
                  ? Radius.circular(2.0)
                  : Radius.zero,
              bottomLeft: widget.data2[index] < 0
                  ? Radius.circular(2.0)
                  : Radius.zero,
              bottomRight: widget.data2[index] < 0
                  ? Radius.circular(2.0)
                  : Radius.zero,
            ),
            width: 8,
          ),
          BarChartRodData(
            fromY: 0,
            toY: widget.data3[index],
            gradient: LinearGradient(
              colors: [Color(0xFF42A5F5), Colors.blue],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
            borderRadius: BorderRadius.only(
              topLeft: widget.data3[index] >= 0
                  ? Radius.circular(2.0)
                  : Radius.zero,
              topRight: widget.data3[index] >= 0
                  ? Radius.circular(2.0)
                  : Radius.zero,
              bottomLeft: widget.data3[index] < 0
                  ? Radius.circular(2.0)
                  : Radius.zero,
              bottomRight: widget.data3[index] < 0
                  ? Radius.circular(2.0)
                  : Radius.zero,
            ),
            width: 8,
          ),
        ],
      );
    });
  }
}
