import 'package:cescpro/page/station/detail/monitor/detail/widget/line_bar/f_line_chart.dart';
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
  });

  final List<FastLineSeries<ChartData, DateTime>> data;
  final DateTime minT;
  final DateTime maxT;
  final AxisConfig axis;

  @override
  Widget build(BuildContext context) {
    return (minT.isAtSameMomentAs(maxT))
        ? buildUnableToDraw()
        : Container(
            padding: EdgeInsetsDirectional.only(top: 10),
            child: Container(
              margin: EdgeInsetsDirectional.only(top: 0),
              width: double.maxFinite,
              height: double.maxFinite,
              child: SfCartesianChart(
                margin: EdgeInsets.all(0),
                plotAreaBorderWidth: 0.0,
                primaryXAxis: DateTimeAxis(
                  title: AxisTitle(text: ''),
                  dateFormat: DateFormat('HH:mm'),
                  enableAutoIntervalOnZooming: true,
                  intervalType: DateTimeIntervalType.minutes,
                  minimum: minT,
                  maximum: maxT,
                  edgeLabelPlacement: EdgeLabelPlacement.shift,
                  majorGridLines: const MajorGridLines(width: 0),
                  labelStyle: TextStyle(fontSize: 8, color: Color(0x80FFFFFF)),
                ),
                primaryYAxis: const NumericAxis(
                  title: AxisTitle(text: ''),
                  axisLine: AxisLine(width: 0, color: Colors.transparent),
                  labelStyle: TextStyle(color: Color(0x80FFFFFF), fontSize: 8),
                  majorGridLines: MajorGridLines(
                    width: 0.5,
                    dashArray: <double>[5, 5],
                    color: Color(0x80FFFFFF),
                  ),
                  majorTickLines: MajorTickLines(size: 0),
                ),
                trackballBehavior: trackballBehavior,
                zoomPanBehavior: zoomPanBehavior,
                series: data,
              ),
            ),
          );
  }
}

/// not draw
Widget buildUnableToDraw() => Center(
  child: Text(
    'Unable to draw',
    style: TextStyle(color: Colors.white, fontSize: 12),
  ),
);

///trackballBehavior
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
);

///zoomPanBehavior
ZoomPanBehavior get zoomPanBehavior => ZoomPanBehavior(
  enablePanning: true,
  enablePinching: true,
  zoomMode: ZoomMode.x,
);
