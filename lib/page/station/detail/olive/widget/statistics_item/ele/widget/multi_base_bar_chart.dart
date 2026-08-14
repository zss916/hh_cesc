import 'package:cescpro/http/bean/elec_graph_entity.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class MultiBaseBarChart extends StatelessWidget {
  final List<ElecGraphEntity> list;
  final double maximumZoomLevel;
  const MultiBaseBarChart({
    super.key,
    required this.list,
    required this.maximumZoomLevel,
  });

  @override
  Widget build(BuildContext context) {
    return SfCartesianChart(
      plotAreaBorderWidth: 0,
      margin: const EdgeInsets.only(left: 5, right: 5, top: 5, bottom: 0),
      zoomPanBehavior: ZoomPanBehavior(
        enablePinching: true,
        enablePanning: true,
        enableDoubleTapZooming: false,
        zoomMode: ZoomMode.x,
        enableSelectionZooming: false,
        maximumZoomLevel: maximumZoomLevel,
      ),
      trackballBehavior: trackballBehavior,
      primaryXAxis: DateTimeCategoryAxis(
        dateFormat: dateFormat(list.first.dateTime ?? ''),
        labelRotation: 0,
        majorTickLines: MajorTickLines(color: Colors.transparent),
        labelStyle: const TextStyle(fontSize: 8, color: Color(0xA8FFFFFF)),
        autoScrollingMode: AutoScrollingMode.start,
        intervalType: DateTimeIntervalType.auto,
        majorGridLines: MajorGridLines(width: 0, color: Colors.transparent),
      ),
      primaryYAxis: NumericAxis(
        axisLine: const AxisLine(width: 1, color: Colors.transparent),
        majorTickLines: const MajorTickLines(
          size: 0,
          width: 0,
          color: Colors.transparent,
        ),
        majorGridLines: const MajorGridLines(
          color: Color(0xA8FFFFFF),
          dashArray: <double>[7, 7],
          width: 0.5,
        ),
        labelStyle: const TextStyle(color: Color(0xA8FFFFFF), fontSize: 9),
      ),
      series: <CartesianSeries<ElecGraphEntity, DateTime>>[
        ///充电
        ColumnSeries<ElecGraphEntity, DateTime>(
          name: "",
          legendIconType: LegendIconType.image,
          legendItemText: '',
          dataSource: list,
          xValueMapper: (ElecGraphEntity data, _) =>
              getXValue(data.dateTime ?? ""),
          yValueMapper: (ElecGraphEntity data, _) => data.totalCharge ?? 0,
          width: 0.4,
          spacing: 0.1,
          dataLabelSettings: const DataLabelSettings(isVisible: false),
          animationDuration: 0,
          enableTooltip: true,
          borderRadius: BorderRadius.circular(4),
          color: Color(0xFF39FFEF),
        ),

        ///放电
        ColumnSeries<ElecGraphEntity, DateTime>(
          name: "",
          legendIconType: LegendIconType.image,
          legendItemText: '',
          dataSource: list,
          xValueMapper: (ElecGraphEntity data, _) =>
              getXValue(data.dateTime ?? ""),
          yValueMapper: (ElecGraphEntity data, _) => data.totalRecharge ?? 0,
          width: 0.4,
          spacing: 0.1,
          dataLabelSettings: const DataLabelSettings(isVisible: false),
          animationDuration: 0,
          enableTooltip: true,
          borderRadius: BorderRadius.circular(4),
          color: Color(0xFFFFC08C),
        ),

        ///电网用电量
        ColumnSeries<ElecGraphEntity, DateTime>(
          name: "",
          legendIconType: LegendIconType.image,
          legendItemText: '',
          dataSource: list,
          xValueMapper: (ElecGraphEntity data, _) =>
              getXValue(data.dateTime ?? ""),
          yValueMapper: (ElecGraphEntity data, _) => data.gridPos ?? 0,
          width: 0.4,
          spacing: 0.1,
          dataLabelSettings: const DataLabelSettings(isVisible: false),
          animationDuration: 0,
          enableTooltip: true,
          borderRadius: BorderRadius.circular(4),
          color: Colors.yellowAccent,
        ),

        ///电网馈电量
        ColumnSeries<ElecGraphEntity, DateTime>(
          name: "",
          legendIconType: LegendIconType.image,
          legendItemText: '',
          dataSource: list,
          xValueMapper: (ElecGraphEntity data, _) =>
              getXValue(data.dateTime ?? ""),
          yValueMapper: (ElecGraphEntity data, _) => data.gridFeed ?? 0,
          width: 0.4,
          spacing: 0.1,
          dataLabelSettings: const DataLabelSettings(isVisible: false),
          animationDuration: 0,
          enableTooltip: true,
          borderRadius: BorderRadius.circular(4),
          color: Colors.deepOrangeAccent,
        ),
      ],
    );
  }

  ///trackballBehavior
  TrackballBehavior get trackballBehavior => TrackballBehavior(
    enable: true,
    shouldAlwaysShow: false,
    activationMode: ActivationMode.singleTap,
    tooltipDisplayMode: TrackballDisplayMode.groupAllPoints,
    hideDelay: 8000,
    tooltipSettings: InteractiveTooltip(textStyle: TextStyle(fontSize: 10)),
    lineColor: Colors.white54,
    markerSettings: TrackballMarkerSettings(
      markerVisibility: TrackballVisibilityMode.visible,
    ),
  );

  ///获取X轴值
  DateTime getXValue(String value) {
    bool isMatch = hasMatchDate(value);
    return isMatch ? DateTime.parse(value) : DateFormat('yyyy-MM').parse(value);
  }

  ///是否匹配
  bool hasMatchDate(String value) {
    bool isMatch = RegExp(r'^\d{4}-\d{2}-\d{2}$').hasMatch(value);
    return isMatch;
  }

  ///时间格式
  DateFormat dateFormat(String value) =>
      hasMatchDate(value) ? DateFormat('yyyy\nMM-dd') : DateFormat('yyyy-MM');

  ///最小时间
  DateTime? minDateTime(String input) {
    bool isMatch = RegExp(r'^\d{4}-\d{2}$').hasMatch(input);
    final current = DateFormat('yyyy-MM').parse(input);
    final previous = DateTime(current.year, current.month - 1);
    return isMatch ? previous : null;
  }
}
