import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class FMonitorLineChartWidget extends StatelessWidget {
  const FMonitorLineChartWidget({
    super.key,
    required this.data,
    required this.maxT,
    required this.minT,
    required this.axis,
    required this.isH,
  });

  final List<FastLineSeries<ChartData, DateTime>> data;

  final DateTime minT;
  final DateTime maxT;
  final AxisConfig axis;
  final bool isH;

  @override
  Widget build(BuildContext context) {
    return (minT.isAtSameMomentAs(maxT))
        ? buildUnableToDraw()
        : Container(
            padding: EdgeInsetsDirectional.only(
              top: 18,
              bottom: 0,
              start: 6,
              end: 8,
            ),
            child: Container(
              margin: EdgeInsetsDirectional.only(top: isH ? 0 : 8),
              width: double.maxFinite,
              height: double.maxFinite,
              child: SfCartesianChart(
                margin: EdgeInsets.all(0),
                plotAreaBorderWidth: 0.0,
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
                            color: name.toLowerCase() == "soc"
                                ? Color(0x800BC3C4)
                                : paletteF[index],
                          ),
                  textStyle: TextStyle(fontSize: 12),
                ),
                primaryXAxis: DateTimeAxis(
                  title: AxisTitle(text: ''),
                  dateFormat: axis.format,
                  intervalType: axis.intervalType,
                  interval: axis.interval,
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
                axes: const <ChartAxis>[
                  NumericAxis(
                    name: 'secondaryYAxis',
                    opposedPosition: true,
                    title: AxisTitle(text: ''),
                    axisLine: AxisLine(color: Color(0x800BC3C4), width: 0),
                    maximum: 100,
                    minimum: 0,
                    labelStyle: TextStyle(
                      color: Color(0x800BC3C4),
                      fontSize: 8,
                    ),
                    majorTickLines: MajorTickLines(size: 0),
                    majorGridLines: MajorGridLines(
                      width: 0.5,
                      dashArray: <double>[5, 5],
                      color: Color(0x800BC3C4),
                    ),
                  ),
                ],
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
    Text(name, style: TextStyle(color: Color(0xD9FFFFFF), fontSize: 8)),
  ],
);

///trackballBehavior
TrackballBehavior get trackballBehavior => TrackballBehavior(
  enable: true,
  activationMode: ActivationMode.singleTap,
  tooltipDisplayMode: TrackballDisplayMode.groupAllPoints,
  tooltipSettings: InteractiveTooltip(
    textStyle: TextStyle(fontSize: 10),
    color: Colors.white38,
  ),
);

///zoomPanBehavior
ZoomPanBehavior get zoomPanBehavior => ZoomPanBehavior(
  enablePanning: true,
  enablePinching: true,
  zoomMode: ZoomMode.x,
);

// 数据模型
class ChartData {
  ChartData({required this.time, required this.value});

  /// Unix 秒（10 位）或毫秒（13 位）都会自动识别
  factory ChartData.fromJson(Map<String, dynamic> json) {
    final dynamic raw = json['time'];
    final num n = raw as num;
    final DateTime parsed = n > 1e12
        ? DateTime.fromMillisecondsSinceEpoch(n.toInt())
        : DateTime.fromMillisecondsSinceEpoch((n.toInt() * 1000));
    final num rawValue = (json['value'] ?? json['v'] ?? json['y']) as num;
    return ChartData(time: parsed, value: rawValue.toDouble());
  }

  final DateTime time;
  final double value;
}

/// X 轴自适应：根据数据时间范围自动决定间隔和格式
class AxisConfig {
  const AxisConfig({
    required this.interval,
    required this.intervalType,
    required this.format,
  });

  final double interval;
  final DateTimeIntervalType intervalType;
  final DateFormat format;

  static AxisConfig fromRange(Duration range) {
    final hours = range.inHours;
    if (hours <= 1) {
      return AxisConfig(
        interval: 2,
        intervalType: DateTimeIntervalType.minutes,
        format: DateFormat('HH:mm'),
      );
    }
    if (hours <= 6) {
      return AxisConfig(
        interval: 5,
        intervalType: DateTimeIntervalType.minutes,
        format: DateFormat('HH:mm'),
      );
    }
    if (hours <= 24) {
      return AxisConfig(
        interval: 3,
        intervalType: DateTimeIntervalType.hours,
        format: DateFormat('HH:mm'),
      );
    }
    if (hours <= 24 * 3) {
      return AxisConfig(
        interval: 6,
        intervalType: DateTimeIntervalType.hours,
        format: DateFormat('MM-dd HH:mm'),
      );
    }
    if (hours <= 24 * 14) {
      return AxisConfig(
        interval: 1,
        intervalType: DateTimeIntervalType.days,
        format: DateFormat('MM-dd'),
      );
    }
    if (hours <= 24 * 60) {
      return AxisConfig(
        interval: 7,
        intervalType: DateTimeIntervalType.days,
        format: DateFormat('yyyy-MM-dd'),
      );
    }
    return AxisConfig(
      interval: 30,
      intervalType: DateTimeIntervalType.days,
      format: DateFormat('yyyy-MM-dd'),
    );
  }
}

///palette
const paletteF = <Color>[Color(0xFF3874F2), Color(0xFF0BC3C4)];
