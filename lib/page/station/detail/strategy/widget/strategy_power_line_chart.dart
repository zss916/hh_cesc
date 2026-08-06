import 'package:cescpro/page/station/detail/monitor/detail/widget/line_bar/f_line_chart.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class StrategyPowerLineChart extends StatelessWidget {
  const StrategyPowerLineChart({
    super.key,
    required this.data,
    required this.maxT,
    required this.minT,
    required this.axis,
    this.numberFormat,
    required this.colors,
  });

  final List<XyDataSeries<ChartData, DateTime>> data;
  final DateTime minT;
  final DateTime maxT;
  final AxisConfig axis;
  final NumberFormat? numberFormat;
  final List<Color> colors;

  @override
  Widget build(BuildContext context) {
    return (minT.isAtSameMomentAs(maxT))
        ? buildUnableToDraw()
        : Container(
            margin: EdgeInsetsDirectional.only(top: 10),
            width: double.maxFinite,
            height: double.maxFinite,
            child: SfCartesianChart(
              margin: EdgeInsets.all(0),
              plotAreaBorderWidth: 0.0,
              primaryXAxis: DateTimeAxis(
                title: AxisTitle(text: ''),
                axisLine: AxisLine(color: Colors.white10, width: 1),
                dateFormat: DateFormat('HH:mm'),
                enableAutoIntervalOnZooming: true,
                intervalType: DateTimeIntervalType.minutes,
                minimum: minT,
                maximum: maxT,
                edgeLabelPlacement: EdgeLabelPlacement.shift,
                majorGridLines: const MajorGridLines(width: 0),
                labelStyle: TextStyle(fontSize: 8, color: Color(0x80FFFFFF)),
              ),
              primaryYAxis: NumericAxis(
                title: AxisTitle(text: ''),
                numberFormat: numberFormat,
                axisLine: AxisLine(width: 0, color: Colors.transparent),
                labelStyle: TextStyle(color: Color(0x80FFFFFF), fontSize: 8),
                majorGridLines: MajorGridLines(
                  width: 0.5,
                  dashArray: <double>[5, 5],
                  color: Color(0x80FFFFFF),
                ),
                majorTickLines: MajorTickLines(size: 0),
              ),
              trackballBehavior: buildTrackballBehavior(colors),
              zoomPanBehavior: zoomPanBehavior,
              series: data,
              legend: Legend(
                isVisible: true,
                position: LegendPosition.bottom,
                itemPadding: 12.0,
                overflowMode: LegendItemOverflowMode.scroll,
                orientation: LegendItemOrientation.horizontal,
                legendItemBuilder:
                    (String name, dynamic series, dynamic point, int index) =>
                        buildLegendItem(
                          name: name,
                          color: colors.isEmpty
                              ? Colors.white24
                              : colors[index],
                        ),
                textStyle: TextStyle(fontSize: 12),
              ),
              //tooltipBehavior: _tooltip,
            ),
          );
  }
}

Widget buildLegendItem({required String name, required Color color}) => Row(
  mainAxisSize: MainAxisSize.min,
  children: [
    Container(
      width: 7,
      height: 7,
      margin: EdgeInsetsDirectional.only(end: 4),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(2),
        color: color,
        shape: BoxShape.rectangle,
      ),
    ),
    Text(name, style: TextStyle(color: Color(0xD9FFFFFF), fontSize: 12)),
  ],
);

/// not draw
Widget buildUnableToDraw() => Center(
  child: Text(
    'Unable to draw',
    style: TextStyle(color: Colors.white, fontSize: 12),
  ),
);

///trackballBehavior
TrackballBehavior buildTrackballBehavior(List<Color> colors) {
  return TrackballBehavior(
    enable: true,
    shouldAlwaysShow: true,
    activationMode: ActivationMode.singleTap,
    tooltipDisplayMode: TrackballDisplayMode.groupAllPoints,
    hideDelay: 8000,
    tooltipSettings: InteractiveTooltip(
      textStyle: TextStyle(fontSize: 10),
      color: Colors.black38,
    ),
    markerSettings: TrackballMarkerSettings(
      markerVisibility: TrackballVisibilityMode.visible,
    ),

    builder: (BuildContext context, TrackballDetails trackballDetails) {
      num? timestamp = trackballDetails.groupingModeInfo?.points.first.xValue;
      List<num?> values = (trackballDetails.groupingModeInfo?.points ?? [])
          .map((e) => e.y)
          .toList();

      return Container(
        constraints: BoxConstraints(maxWidth: 160),
        padding: EdgeInsetsDirectional.symmetric(horizontal: 5, vertical: 6),
        decoration: BoxDecoration(
          color: Colors.black38,
          borderRadius: BorderRadius.circular(5),
          boxShadow: const [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 8,
              offset: Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsetsDirectional.only(bottom: 3),
              child: Text(
                DateFormat(
                  'yyyy-MM-dd HH:mm',
                ).format((ChartData.toDateTime(timestamp ?? 0))),
                style: const TextStyle(color: Colors.white60, fontSize: 11),
              ),
            ),
            ...values.mapIndexed(
              (i, e) => Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    width: 8,
                    height: 8,
                    decoration: BoxDecoration(
                      color: colors[i],
                      shape: BoxShape.circle,
                    ),
                  ),
                  const SizedBox(width: 3),
                  Text(
                    '$e',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 11,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    },
  );
}

///trackballBehavior
/*
TrackballBehavior get trackballBehavior => TrackballBehavior(
  enable: true,
  shouldAlwaysShow: true,
  activationMode: ActivationMode.singleTap,
  tooltipDisplayMode: TrackballDisplayMode.groupAllPoints,
  hideDelay: 8000,
  tooltipSettings: InteractiveTooltip(
    textStyle: TextStyle(fontSize: 10),
    color: Colors.black38,
  ),
  markerSettings: TrackballMarkerSettings(
    markerVisibility: TrackballVisibilityMode.visible,
  ),

  builder: (BuildContext context, TrackballDetails trackballDetails) {
    num? timestamp = trackballDetails.groupingModeInfo?.points.first.xValue;
    List<num?> values = (trackballDetails.groupingModeInfo?.points ?? [])
        .map((e) => e.y)
        .toList();

    return Container(
      constraints: BoxConstraints(maxWidth: 160),
      padding: EdgeInsetsDirectional.symmetric(horizontal: 5, vertical: 6),
      decoration: BoxDecoration(
        color: Colors.black38,
        borderRadius: BorderRadius.circular(5),
        boxShadow: const [
          BoxShadow(color: Colors.black26, blurRadius: 8, offset: Offset(0, 4)),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsetsDirectional.only(bottom: 3),
            child: Text(
              DateFormat(
                'yyyy-MM-dd HH:mm',
              ).format((ChartData.toDateTime(timestamp ?? 0))),
              style: const TextStyle(color: Colors.white60, fontSize: 11),
            ),
          ),
          ...values.mapIndexed(
            (i,e) => Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: 8,
                  height: 8,
                  decoration: const BoxDecoration(
                    color: colors,
                    shape: BoxShape.circle,
                  ),
                ),
                const SizedBox(width: 3),
                Text(
                  '${e}',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 11,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  },
);
*/

///zoomPanBehavior
ZoomPanBehavior get zoomPanBehavior => ZoomPanBehavior(
  enablePanning: true,
  enablePinching: true,
  zoomMode: ZoomMode.x,
);
