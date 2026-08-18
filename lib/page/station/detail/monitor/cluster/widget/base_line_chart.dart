import 'package:cescpro/core/translations/en.dart';
import 'package:cescpro/http/bean/soc_entity.dart';
import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class BaseLineChart extends StatelessWidget {
  final List<SocEntity> socList;
  const BaseLineChart({super.key, required this.socList});

  @override
  Widget build(BuildContext context) {
    return SfCartesianChart(
      margin: EdgeInsets.all(0),
      plotAreaBorderWidth: 0.0,
      legend: Legend(
        isVisible: true,
        position: LegendPosition.bottom,
        itemPadding: 12.0,
        overflowMode: LegendItemOverflowMode.wrap,
        orientation: LegendItemOrientation.horizontal,
        textStyle: TextStyle(fontSize: 12),
        legendItemBuilder:
            (String name, dynamic series, dynamic point, int index) =>
                buildLegendItem(
                  name: name,
                  color: name.toLowerCase() == "soc"
                      ? Colors.blue
                      : Color(0xFF0BC3C4),
                ),
      ),
      primaryXAxis: DateTimeAxis(
        title: AxisTitle(text: ''),
        dateFormat: DateFormat('HH:mm'),
        enableAutoIntervalOnZooming: true,
        intervalType: DateTimeIntervalType.minutes,
        //minimum: minT,
        //maximum: maxT,
        edgeLabelPlacement: EdgeLabelPlacement.shift,
        majorGridLines: const MajorGridLines(width: 0),
        labelStyle: TextStyle(fontSize: 8, color: Color(0x80FFFFFF)),
      ),
      primaryYAxis: const NumericAxis(
        title: AxisTitle(text: ''),
        axisLine: AxisLine(width: 0, color: Colors.transparent),
        labelStyle: TextStyle(color: Colors.white, fontSize: 8),
        majorGridLines: MajorGridLines(
          width: 0.5,
          dashArray: <double>[5, 5],
          color: Colors.white,
        ),
        majorTickLines: MajorTickLines(size: 0),
      ),
      axes: const <ChartAxis>[
        NumericAxis(
          name: 'secondaryYAxis',
          opposedPosition: true,
          title: AxisTitle(text: ''),
          axisLine: AxisLine(color: Colors.blue, width: 0),
          maximum: 100,
          minimum: 0,
          labelStyle: TextStyle(color: Colors.blue, fontSize: 8),
          majorTickLines: MajorTickLines(size: 0),
          majorGridLines: MajorGridLines(
            width: 0.5,
            dashArray: <double>[5, 5],
            color: Colors.blue,
          ),
        ),
      ],
      trackballBehavior: trackballBehavior,
      zoomPanBehavior: zoomPanBehavior,
      series: [
        ///功率
        FastLineSeries<SocEntity, DateTime>(
          name: TKey.power.tr,
          dataSource: socList,
          xValueMapper: (p, _) =>
              DateTime.fromMillisecondsSinceEpoch(p.time ?? 0),
          yValueMapper: (p, _) => (p.power ?? 0),
          color: Colors.blue,
          width: 1,
          markerSettings: MarkerSettings(
            isVisible: true,
            shape: DataMarkerType.circle,
            borderWidth: 0.0,
            height: 0.0,
            width: 0.0,
          ),
        ),

        ///soc
        FastLineSeries<SocEntity, DateTime>(
          name: 'SOC',
          yAxisName: 'secondaryYAxis',
          dataSource: socList,
          xValueMapper: (p, _) =>
              DateTime.fromMillisecondsSinceEpoch(p.time ?? 0),
          yValueMapper: (p, _) => (p.soc ?? 0),
          color: Color(0xFF0BC3C4),
          width: 1,
          markerSettings: MarkerSettings(
            isVisible: true,
            shape: DataMarkerType.circle,
            borderWidth: 0.0,
            height: 0.0,
            width: 0.0,
          ),
        ),
      ],
    );
  }

  ///trackballBehavior
  TrackballBehavior get trackballBehavior => TrackballBehavior(
    enable: true,
    shouldAlwaysShow: true,
    activationMode: ActivationMode.singleTap,
    tooltipDisplayMode: TrackballDisplayMode.groupAllPoints,
    hideDelay: 8000,
    tooltipSettings: InteractiveTooltip(textStyle: TextStyle(fontSize: 10)),
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

  /// legend item
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
}
