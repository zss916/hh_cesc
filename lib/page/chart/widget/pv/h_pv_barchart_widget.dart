import 'package:cescpro/core/helper/extension_helper.dart';
import 'package:cescpro/generated/assets.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class HPVBarchartItemWidget extends StatefulWidget {
  final List<double> data; // 数据列表
  final List<String> labels; // 标签列表
  final double maxY; // Y轴的最大值
  final double minY; // Y轴的最大值
  const HPVBarchartItemWidget({
    super.key,
    required this.data,
    required this.labels,
    required this.maxY,
    required this.minY,
  });

  @override
  _BarChartWidgetState createState() => _BarChartWidgetState();
}

class _BarChartWidgetState extends State<HPVBarchartItemWidget> {
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
    _scrollController.dispose();
    super.dispose();
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
      alignment: AlignmentDirectional.center,
      children: [
        if (widget.data.isNotEmpty)
          SizedBox(
            width: double.maxFinite,
            height: double.maxFinite,
            child: SingleChildScrollView(
              controller: _scrollController,
              scrollDirection: Axis.horizontal,
              child: Container(
                padding: const EdgeInsetsDirectional.only(
                  start: 0,
                  end: 12,
                  top: 18,
                  bottom: 0,
                ),
                width: screenWidth,
                height: double.maxFinite,
                child: BarChart(
                  BarChartData(
                    maxY: widget.maxY,
                    minY: (widget.minY >= 0) ? 0 : widget.minY,
                    barTouchData: buildBarTouchData(),
                    titlesData: _buildTitlesData(), // 构建标题数据
                    borderData: FlBorderData(show: false), // 边框数据
                    barGroups: _buildBarGroups(), // 构建柱状图组
                    gridData: buildFlGridData, // 网格数据
                    alignment: BarChartAlignment.spaceEvenly, // 确保间距均匀
                    extraLinesData: buildExtraLinesData, // 额外线条数据
                  ),
                ),
              ),
            ),
          )
        else
          Image.asset(Assets.imgEmpty, width: 100, height: 100),
      ],
    );
  }

  ///额外线
  ExtraLinesData get buildExtraLinesData => ExtraLinesData(
    //extraLinesOnTop: true,
    horizontalLines: [
      HorizontalLine(
        y: 0,
        color: Colors.white, // 水平线颜色
        strokeWidth: 1, // 水平线宽度
      ),
      HorizontalLine(
        y: widget.maxY,
        label: HorizontalLineLabel(show: true),
        // color: Colors.transparent, // 水平线颜色
        // strokeWidth: 1, // 水平线宽度
        color: Color(0xFFFEDB65),
        strokeWidth: 0.4,
        dashArray: [8, 4],
      ),

      if (widget.minY != 0)
        HorizontalLine(
          y: widget.minY,
          label: HorizontalLineLabel(show: true),
          // color: Colors.transparent, // 水平线颜色
          // strokeWidth: 1, // 水平线宽度
          color: Color(0xFFFEDB65),
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
    //horizontalInterval: showInterval, // 确保水平线间隔与 Y 轴标签一致
    getDrawingHorizontalLine: (value) {
      return FlLine(
        strokeWidth: 0.4,
        dashArray: [8, 4],
        color: Color(0xA8FFFFFF), // 水平线颜色
        //strokeWidth: 1, // 水平线宽度
      );
    },
  );

  ///宽度
  double get screenWidth =>
      ((widget.data.length * 80.0) <= (MediaQuery.of(context).size.width - 60))
      ? (MediaQuery.of(context).size.width - 60)
      : widget.data.length * 80.0;

  ///触摸数据
  BarTouchData buildBarTouchData() {
    return widget.labels.isEmpty
        ? BarTouchData(enabled: false)
        : BarTouchData(
            enabled: true,
            touchTooltipData: widget.labels.isEmpty
                ? null
                : BarTouchTooltipData(
                    getTooltipColor: (_) => Color(0x66000000),
                    tooltipHorizontalAlignment: FLHorizontalAlignment.right,
                    tooltipMargin: -30,
                    direction: TooltipDirection.auto,
                    getTooltipItem: (group, groupIndex, rod, rodIndex) {
                      return BarTooltipItem(
                        '${widget.labels[groupIndex]}\n',
                        TextStyle(color: Color(0xFFFEDB65), fontSize: 8),
                        children: <TextSpan>[
                          TextSpan(
                            text: (rod.toY).toDouble().formatAmount(),
                            style: TextStyle(
                              color: Color(0xFFFEDB65),
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

  // 构建标题数据，包括X轴和Y轴
  FlTitlesData _buildTitlesData() {
    return FlTitlesData(
      show: true,
      bottomTitles: AxisTitles(
        sideTitles: widget.labels.isEmpty
            ? SideTitles(showTitles: false)
            : SideTitles(
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
          showTitles: true,
          reservedSize: 40,
          maxIncluded: false,
          minIncluded: true,
          getTitlesWidget: (value, meta) {
            final style = TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w400,
              fontSize: 8,
            );
            final style2 = TextStyle(
              color: Color(0xFFFEDB65),
              fontWeight: FontWeight.w400,
              fontSize: 10,
            );

            //bool isShow = (value == widget.minY) || (value == widget.maxY);
            bool isShow = false;
            return SideTitleWidget(
              space: 1,
              meta: meta,
              child: Text("$value", style: isShow ? style2 : style),
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
        barsSpace: 4,
        barRods: [
          BarChartRodData(
            fromY: 0,
            toY: widget.data[index],
            gradient: LinearGradient(
              colors: [Color(0xFFFEDB65), Color(0xFFFFA600)],
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
        ],
      );
    });
  }
}
