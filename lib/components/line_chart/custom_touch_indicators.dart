import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

List<LineTooltipItem> customLineTooltipItem(List<LineBarSpot> touchedSpots) =>
    touchedSpots.map((LineBarSpot touchedSpot) {
      final textStyle = TextStyle(
        color:
            touchedSpot.bar.gradient?.colors.first ??
            touchedSpot.bar.color ??
            Colors.blueGrey,
        fontWeight: FontWeight.bold,
        fontSize: 14,
      );
      return LineTooltipItem(touchedSpot.y.toString(), textStyle);
    }).toList();

///自定义触摸指示器
List<TouchedSpotIndicatorData> customTouchedIndicators(
  LineChartBarData barData,
  List<int> indicators,
) => indicators.map((int index) {
  /// Indicator Line
  var lineColor = barData.gradient?.colors.first ?? barData.color;
  if (barData.dotData.show) {
    lineColor = _defaultGetDotColor(barData.spots[index], 0, barData);
  }
  const lineStrokeWidth = 1.0;
  final flLine = FlLine(color: lineColor, strokeWidth: lineStrokeWidth);

  var dotSize = 5.0;
  if (barData.dotData.show) {
    dotSize = 4.0 * 1.8;
  }

  final dotData = FlDotData(
    getDotPainter: (spot, percent, bar, index) =>
        _defaultGetDotPainter(spot, percent, bar, index, size: dotSize),
  );

  return TouchedSpotIndicatorData(flLine, dotData);
}).toList();

Color _defaultGetDotColor(FlSpot _, double xPercentage, LineChartBarData bar) {
  if (bar.gradient != null && bar.gradient is LinearGradient) {
    return lerpGradient(
      bar.gradient!.colors,
      bar.gradient!.getSafeColorStops(),
      xPercentage / 100,
    );
  }
  return bar.gradient?.colors.first ?? bar.color ?? Colors.blueGrey;
}

FlDotPainter _defaultGetDotPainter(
  FlSpot spot,
  double xPercentage,
  LineChartBarData bar,
  int index, {
  double? size,
}) => FlDotCirclePainter(
  radius: size,
  color: _defaultGetDotColor(spot, xPercentage, bar),
  strokeColor: _defaultGetDotStrokeColor(spot, xPercentage, bar),
);

Color lerpGradient(List<Color> colors, List<double> stops, double t) {
  final length = colors.length;
  if (stops.length != length) {
    /// provided gradientColorStops is invalid and we calculate it here
    stops = List.generate(length, (i) => (i + 1) / length);
  }

  for (var s = 0; s < stops.length - 1; s++) {
    final leftStop = stops[s];
    final rightStop = stops[s + 1];

    final leftColor = colors[s];
    final rightColor = colors[s + 1];

    if (t <= leftStop) {
      return leftColor;
    } else if (t < rightStop) {
      final sectionT = (t - leftStop) / (rightStop - leftStop);
      return Color.lerp(leftColor, rightColor, sectionT)!;
    }
  }
  return colors.last;
}

Color _defaultGetDotStrokeColor(
  FlSpot spot,
  double xPercentage,
  LineChartBarData bar,
) {
  Color color;
  if (bar.gradient != null && bar.gradient is LinearGradient) {
    color = lerpGradient(
      bar.gradient!.colors,
      bar.gradient!.getSafeColorStops(),
      xPercentage / 100,
    );
  } else {
    color = bar.gradient?.colors.first ?? bar.color ?? Colors.blueGrey;
  }
  return color.darken();
}

extension GradientExtension on Gradient {
  /// Returns color stops.
  ///
  /// If [stops] has the same length as [colors], returns it directly.
  /// Otherwise, calculates stops linearly between 0.0 and 1.0.
  ///
  /// Throws [ArgumentError] if [colors] has less than 2 colors.
  List<double> getSafeColorStops() {
    if (stops?.length == colors.length) {
      return stops!;
    }

    if (colors.length <= 1) {
      throw ArgumentError('"colors" must have length > 1.');
    }

    final stopsStep = 1.0 / (colors.length - 1);
    return [
      for (var index = 0; index < colors.length; index++) index * stopsStep,
    ];
  }
}

extension ColorExtension on Color {
  /// Convert the color to a darken color based on the [percent]
  Color darken([int percent = 40]) {
    assert(1 <= percent && percent <= 100);
    final value = 1 - percent / 100;
    return Color.fromARGB(
      _floatToInt8(a),
      (_floatToInt8(r) * value).round(),
      (_floatToInt8(g) * value).round(),
      (_floatToInt8(b) * value).round(),
    );
  }

  // Int color components were deprecated in Flutter 3.27.0.
  // This method is used to convert the new double color components to the
  // old int color components.
  //
  // Taken from the Color class.
  int _floatToInt8(double x) {
    return (x * 255.0).round() & 0xff;
  }
}
