import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RevenueBarchartWidget extends StatefulWidget {
  final List<double> data; // 数据列表
  final List<String> labels; // 标签列表
  final double maxY; // Y轴的最大值
  final double minY;

  const RevenueBarchartWidget({
    super.key,
    required this.data,
    required this.labels,
    required this.maxY,
    required this.minY,
  });

  @override
  _BarChartWidgetState createState() => _BarChartWidgetState();
}

class _BarChartWidgetState extends State<RevenueBarchartWidget> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _scrollToRight();
    });
  }

  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
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
    return Stack(
      children: [
        // Y 轴标签
        PositionedDirectional(
          start: 0,
          top: 5,
          bottom: 0,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: List.generate(6, (index) {
              final style = TextStyle(
                color: Color(0xA8FFFFFF),
                fontWeight: FontWeight.w400,
                fontSize: 10.sp,
              );
              if (index == 5) {
                return Text(
                  (widget.minY).toDouble().toStringAsFixed(2),
                  style: style,
                );
              } else {
                return Text(
                  (widget.maxY * (4 - index) / 4).toDouble().toStringAsFixed(2),
                  style: style,
                );
              }
            }),
          ),
        ),
        // 滚动视图中的柱状图
        Container(
          margin: EdgeInsetsDirectional.only(start: 40.w), // 确保柱状图不与Y轴标签重叠
          child: SingleChildScrollView(
            controller: _scrollController,
            scrollDirection: Axis.horizontal,
            child: Container(
              //color: Colors.green,
              padding: const EdgeInsetsDirectional.only(
                start: 12,
                end: 12,
                top: 12,
                bottom: 0,
              ),
              // padding: const EdgeInsets.all(12.0),
              height: double.maxFinite,
              width: widget.data.length <= 4
                  ? MediaQuery.of(context).size.width - 80
                  : widget.data.length * 80.0, // 当数据少于4个时，使用屏幕宽度，确保所有标签展示
              child: BarChart(
                BarChartData(
                  maxY: widget.maxY,
                  minY: widget.minY,
                  barTouchData: BarTouchData(enabled: false), // 禁用触摸数据
                  titlesData: _buildTitlesData(), // 构建标题数据
                  borderData: FlBorderData(show: false), // 边框数据
                  barGroups: _buildBarGroups(), // 构建柱状图组
                  gridData: FlGridData(
                    show: true,
                    drawHorizontalLine: true,
                    drawVerticalLine: false,
                    horizontalInterval: ((widget.maxY) / 4), // 确保水平线间隔与 Y 轴标签一致
                    getDrawingHorizontalLine: (value) {
                      return FlLine(
                        strokeWidth: 0.4,
                        dashArray: [8, 4],
                        color: Color(0xA8FFFFFF), // 水平线颜色
                        //strokeWidth: 1, // 水平线宽度
                      );
                    },
                  ), // 网格数据
                  alignment: BarChartAlignment.spaceEvenly, // 确保间距均匀
                  extraLinesData: ExtraLinesData(
                    horizontalLines: [
                      HorizontalLine(
                        y: widget.minY,
                        // color: Colors.transparent, // 水平线颜色
                        // strokeWidth: 1, // 水平线宽度
                        color: Color(0xA8FFFFFF),
                        strokeWidth: 0.4,
                        dashArray: [8, 4],
                      ),

                      HorizontalLine(
                        y: 0,
                        color: Colors.white, // 水平线颜色
                        strokeWidth: 1, // 水平线宽度
                      ),
                      HorizontalLine(
                        y: widget.maxY,
                        // color: Colors.transparent, // 水平线颜色
                        // strokeWidth: 1, // 水平线宽度
                        color: Color(0xA8FFFFFF),
                        strokeWidth: 0.4,
                        dashArray: [8, 4],
                      ),
                    ],
                  ),
                  // 额外线条数据
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  // 构建标题数据，包括X轴和Y轴
  FlTitlesData _buildTitlesData() {
    return FlTitlesData(
      show: true,
      bottomTitles: AxisTitles(
        sideTitles: SideTitles(
          showTitles: true,
          reservedSize: 15,
          getTitlesWidget: (value, meta) {
            final style = TextStyle(
              color: Color(0xA8FFFFFF),
              fontWeight: FontWeight.w400,
              fontSize: 10.sp,
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
        ), // 左边Y轴标签禁用，手动创建
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
        barRods: [
          BarChartRodData(
            fromY: 0,
            toY: widget.data[index],
            gradient: LinearGradient(
              colors: [Color(0xFF43FFFF), Color(0xFF0978E9)],
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
            width: 8.w,
          ),
        ],
      );
    });
  }
}
