import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RevenueBarchartWidget extends StatefulWidget {
  final List<double> data; // 数据列表
  final List<String> labels; // 标签列表
  final double maxY; // Y轴的最大值
  final double minY;
  final bool isDiff;

  const RevenueBarchartWidget({
    super.key,
    required this.data,
    required this.labels,
    required this.maxY,
    required this.minY,
    required this.isDiff,
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
      if (widget.labels.isNotEmpty) {
        // _scrollToRight();
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.maxFinite,
      child: SingleChildScrollView(
        controller: _scrollController,
        scrollDirection: Axis.horizontal,
        child: Container(
          padding: EdgeInsetsDirectional.only(
            start: 0,
            end: 10,
            top: 18,
            bottom: 0,
          ),
          height: double.maxFinite,
          width: screenWidth,
          child: BarChart(
            BarChartData(
              maxY: widget.maxY,
              minY: widget.minY,
              barTouchData: buildBarTouchData(),
              titlesData: _buildTitlesData(
                isShowLeft: true,
                isDiff: widget.isDiff,
              ), // 构建标题数据
              borderData: buildFlBorderData, // 边框数据
              barGroups: _buildBarGroups(), // 构建柱状图组
              gridData: buildGridData, // 网格数据
              alignment: BarChartAlignment.spaceEvenly, // 确保间距均匀
              extraLinesData: buildExtraLinesData(widget.isDiff), // 额外线条数据
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

  /// 构建标题数据，包括X轴和Y轴（X轴优化一下）
  FlTitlesData _buildTitlesData({bool isShowLeft = false, bool isDiff = true}) {
    return FlTitlesData(
      show: true,
      bottomTitles: AxisTitles(
        sideTitles: SideTitles(
          showTitles: true,
          reservedSize: 15,
          getTitlesWidget: (value, meta) {
            return SideTitleWidget(
              angle: 0,
              space: 4,
              meta: meta,
              child: Text(
                (widget.labels.isEmpty || widget.data.isEmpty)
                    ? ""
                    : widget.labels[value.toInt()],
                style: TextStyle(
                  color: Color(0xA8FFFFFF),
                  fontWeight: FontWeight.w400,
                  fontSize: 8.sp,
                ),
              ),
            );
          },
        ),
      ),
      leftTitles: AxisTitles(
        sideTitles: SideTitles(
          maxIncluded: !isDiff,
          minIncluded: true,
          showTitles: isShowLeft,
          reservedSize: 35,
          getTitlesWidget: (value, meta) {
            return SideTitleWidget(
              space: 4,
              meta: meta,
              child: Text(
                formatNumber(value),
                style: TextStyle(
                  color: Color(0xA8FFFFFF),
                  fontWeight: FontWeight.w400,
                  fontSize: 8.sp,
                ),
              ),
            );
          },
        ), // 左边Y轴标签禁用，手动创建
      ),
      topTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
      rightTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
    );
  }

  /// 构建柱状图组
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

  ///屏幕宽度
  double get screenWidth => widget.data.length <= 3
      ? MediaQuery.of(context).size.width - 80
      : widget.data.length * 65.0;

  ///网格线
  FlGridData get buildGridData => FlGridData(
    show: true,
    drawHorizontalLine: true,
    drawVerticalLine: false,
    getDrawingHorizontalLine: (value) {
      return FlLine(
        strokeWidth: 0.4,
        dashArray: [8, 4],
        color: Color(0xA8FFFFFF), // 水平线颜色
        //strokeWidth: 1, // 水平线宽度
      );
    },
  );

  ///额外线
  ExtraLinesData? buildExtraLinesData(bool isDiff) {
    return ExtraLinesData(
      horizontalLines: [
        HorizontalLine(
          y: 0,
          color: Colors.white, // 水平线颜色
          strokeWidth: 0.4, // 水平线宽度
        ),

        HorizontalLine(
          y: widget.maxY,
          label: HorizontalLineLabel(show: isDiff),
          color: isDiff ? Color(0xFF0978E9) : Color(0xA8FFFFFF),
          strokeWidth: 0.4,
          dashArray: [8, 4],
        ),

        if (isDiff)
          HorizontalLine(
            y: widget.minY,
            label: HorizontalLineLabel(show: true),
            color: Color(0xFF0978E9), // 水平线颜色
            strokeWidth: 0.4,
            dashArray: [8, 4],
          ),
      ],
    );
  }

  ///触摸数据
  BarTouchData buildBarTouchData() {
    return BarTouchData(
      enabled: true,
      touchTooltipData: widget.labels.isEmpty
          ? null
          : BarTouchTooltipData(
              getTooltipColor: (_) => Color(0x66000000),
              tooltipHorizontalAlignment: FLHorizontalAlignment.right,
              tooltipMargin: -30,
              getTooltipItem: (group, groupIndex, rod, rodIndex) {
                return BarTooltipItem(
                  '${widget.labels[groupIndex]}\n',
                  TextStyle(color: Color(0xFF0978E9), fontSize: 8.sp),
                  children: <TextSpan>[
                    TextSpan(
                      text: (rod.toY).toString(),
                      //text: (rod.toY).toDouble().formatAmount(),
                      style: TextStyle(
                        color: Color(0xFF0978E9),
                        fontWeight: FontWeight.w500,
                        fontSize: 10.sp,
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

  String formatNumber(num value) {
    if (value >= 1000000) {
      return '${(value / 1000000).toStringAsFixed(1)}M';
    } else if (value >= 10000) {
      return '${(value / 10000).toStringAsFixed(1)}W';
    } else if (value >= 1000) {
      return '${(value / 1000).toStringAsFixed(1)}K';
    } else {
      return value.toStringAsFixed(1).toString();
    }
  }

  void _scrollToRight() {
    _scrollController.animateTo(
      _scrollController.position.maxScrollExtent,
      duration: const Duration(seconds: 2),
      curve: Curves.easeOut,
    );
  }
}
