import 'package:cescpro/core/helper/extension_helper.dart';
import 'package:cescpro/http/bean/soc_entity.dart';
import 'package:collection/collection.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

void showRealTimeDialog({
  required List<SocEntity> arrList,
  required double minY,
  required double maxY,
  required double maxX,
}) {
  Get.dialog(
    RealTimeDataLine(arrList: arrList, minY: minY, maxY: maxY, maxX: maxX),
  );
}

class RealTimeDataLine extends StatefulWidget {
  final List<SocEntity> arrList;
  final double maxX;
  final double maxY;
  final double minY;

  const RealTimeDataLine({
    super.key,
    required this.arrList,
    required this.minY,
    required this.maxY,
    required this.maxX,
  });

  @override
  State<RealTimeDataLine> createState() => _RealTimeDataLineState();
}

class _RealTimeDataLineState extends State<RealTimeDataLine> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    /*SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);*/

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _scrollToRight();
    });
  }

  void _scrollToRight() {
    _scrollController.animateTo(
      _scrollController.position.maxScrollExtent,
      duration: const Duration(milliseconds: 1000),
      curve: Curves.easeOut,
    );
  }

  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      height: double.maxFinite,
      color: Colors.black,
      child: Stack(
        fit: StackFit.expand,
        children: [
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            controller: _scrollController,
            child: Container(
              padding: const EdgeInsetsDirectional.only(
                start: 12,
                end: 12,
                top: 12 + 18,
                bottom: 0,
              ),
              height: double.maxFinite,
              // width: MediaQuery.of(context).size.width,
              width: widget.arrList.length * 1.0,
              child: LineChart(
                /* transformationConfig: FlTransformationConfig(
                    trackpadScrollCausesScale: true,
                  ),*/
                LineChartData(
                  lineTouchData: LineTouchData(enabled: false),
                  gridData: FlGridData(
                    show: true,
                    //verticalInterval: 50,
                    //horizontalInterval: 30,
                    drawHorizontalLine: true,
                    drawVerticalLine: false,
                    // horizontalInterval: ((widget.maxY) / 4),
                  ),
                  titlesData: FlTitlesData(
                    rightTitles: const AxisTitles(
                      sideTitles: SideTitles(showTitles: false),
                    ),
                    topTitles: AxisTitles(
                      sideTitles: SideTitles(showTitles: false),
                    ),
                    bottomTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        reservedSize: 25,
                        getTitlesWidget: (value, meta) {
                          return SideTitleWidget(
                            //axisSide: meta.axisSide,
                            //(widget.logic.arrList[value.toInt()].time ?? 0).hms
                            // space: 2,
                            meta: meta,
                            child: value.toInt() == widget.arrList.length
                                ? SizedBox.shrink()
                                : Text(
                                    "${(widget.arrList[value.toInt()].time ?? 0).hms}",
                                    style: TextStyle(
                                      color: Color(0xA8FFFFFF),
                                      fontWeight: FontWeight.w400,
                                      fontSize: 6.sp,
                                    ),
                                  ),
                          );
                        },
                      ),
                    ),
                    leftTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        reservedSize: 30,
                        getTitlesWidget: (value, meta) {
                          return SideTitleWidget(
                            //axisSide: meta.axisSide,
                            space: 2,
                            meta: meta,
                            child: Text(
                              "$value",
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
                  ),
                  borderData: FlBorderData(
                    show: true,
                    border: Border(
                      bottom: BorderSide(color: Color(0x33FFFFFF), width: 1),
                      left: const BorderSide(
                        color: Colors.transparent,
                        width: 0,
                      ),
                      right: const BorderSide(
                        color: Colors.transparent,
                        width: 0,
                      ),
                      top: const BorderSide(
                        color: Colors.transparent,
                        width: 0,
                      ),
                    ),
                  ),
                  lineBarsData: lineBarsData(widget.arrList),
                  minX: 0,
                  maxX: widget.maxX.toDouble(),
                  maxY: widget.maxY,
                  minY: widget.minY,
                  extraLinesData: ExtraLinesData(
                    horizontalLines: [
                      /* HorizontalLine(
                      y: widget.logic.minY,
                      // color: Colors.transparent, // 水平线颜色
                      // strokeWidth: 1, // 水平线宽度
                      color: Color(0xA8FFFFFF),
                      strokeWidth: 0.4,
                      dashArray: [8, 4],
                    ),*/
                      HorizontalLine(
                        y: 0,
                        color: Colors.transparent, // 水平线颜色
                        strokeWidth: 0.4, // 水平线宽度
                      ),
                      /*  HorizontalLine(
                      y: widget.logic.maxY,
                      // color: Colors.transparent, // 水平线颜色
                      // strokeWidth: 1, // 水平线宽度
                      color: Color(0xA8FFFFFF),
                      strokeWidth: 0.4,
                      dashArray: [8, 4],
                    ),*/
                    ],
                  ),
                ),
                duration: const Duration(milliseconds: 2000),
              ),
            ),
          ),
        ],
      ),
    );
  }

  ///折现数据列表
  List<LineChartBarData> lineBarsData(List<SocEntity> lines) {
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
  }
}
