import 'dart:math';

import 'package:cescpro/core/translations/en.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class PieChartLineWidget extends StatelessWidget {
  final int total;
  final int normalNum;

  ///正常站点数
  final int faultNum;

  ///故障站点数
  final int alarmNum;

  ///告警站点数
  final int cutOffNum;
  const PieChartLineWidget({
    super.key,
    required this.total,
    required this.normalNum,
    required this.faultNum,
    required this.alarmNum,
    required this.cutOffNum,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CustomPaint(
        size: Size(220.w, 0),
        painter: PieChartPainter(
          total: total,
          models: [
            PieChartModel(
              name: '故障',
              data: faultNum,
              value: (faultNum / total),
              color: Color(0xFFF8D834),
              radius: 60.0,
              startAngle: 0.0,
            ),
            PieChartModel(
              name: '告警',
              value: (alarmNum / total),
              data: alarmNum,
              color: Color(0xFFFF9C4A),
              radius: 60.0,
              startAngle: 0.0,
            ),
            PieChartModel(
              name: '正常',
              value: (normalNum / total),
              data: normalNum,
              color: Color(0xFF3BFFC5),
              radius: 60.0,
              startAngle: 0.0,
            ),
            PieChartModel(
              name: '中断',
              value: (cutOffNum / total),
              data: cutOffNum,
              color: Color(0xFF44A7FF),
              radius: 60.0,
              startAngle: 0.0,
            ),
          ],
        ),
      ),
    );
  }
}

/// Pie Chart Model
class PieChartPainter extends CustomPainter {
  final List<PieChartModel> models /*= [
    PieChartModel(
      name: '故障',
      data: 4,
      value: 32.1,
      color: Color(0xFFF8D834),
      radius: 60.0,
      startAngle: 0.0,
    ),
    PieChartModel(
      name: '告警',
      value: 1.6,
      data: 4,
      color: Color(0xFFFF9C4A),
      radius: 60.0,
      startAngle: 0.0,
    ),
    PieChartModel(
      name: '正常',
      value: 30.0,
      data: 4,
      color: Color(0xFF3BFFC5),
      radius: 60.0,
      startAngle: 0.0,
    ),
    PieChartModel(
      name: '中断',
      value: 20.0,
      data: 4,
      color: Color(0xFF44A7FF),
      radius: 60.0,
      startAngle: 0.0,
    ),
  ]*/;

  final int total;

  PieChartPainter({required this.total, required this.models});

  @override
  void paint(Canvas canvas, Size size) {
    // 移动到中心点
    canvas.translate(size.width / 2, size.height / 2);
    // 绘制饼状图
    _drawPie(canvas, size);

    // 绘制扇形分割线
    //_drawSpaceLines(canvas);

    // 绘制中心圆
    /*if (total > 0)*/
    _drawHole(canvas, size);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return oldDelegate != this;
  }

  void _drawPie(Canvas canvas, Size size) {
    // 开始起点角度
    var startAngle = 0.0;
    var sumValue = models.fold<double>(0.0, (sum, model) => sum + model.value);

    if (total > 0) {
      for (var model in models) {
        Paint paint = Paint()
          ..style = PaintingStyle.fill
          ..color = model.color;

        var sweepAngle = model.value / sumValue * 360;

        canvas.drawArc(
          Rect.fromCircle(radius: model.radius, center: Offset.zero),
          startAngle * pi / 180,
          sweepAngle * pi / 180,
          true,
          paint,
        );

        // 为每一个区域绘制延长线和文字
        if (model.value > 0) {
          _drawLineAndText(
            canvas,
            size,
            model.radius,
            startAngle,
            sweepAngle,
            model,
          );
        }

        startAngle += sweepAngle;
      }
    } else {
      Paint paint = Paint()
        ..style = PaintingStyle.fill
        ..color = Colors.white30;

      var sweepAngle = 360;

      canvas.drawArc(
        Rect.fromCircle(radius: 60, center: Offset.zero),
        startAngle * pi / 180,
        sweepAngle * pi / 180,
        true,
        paint,
      );
    }
  }

  // 绘制延长线以及文本
  void _drawLineAndText(
    Canvas canvas,
    Size size,
    double radius,
    double startAngle,
    double sweepAngle,
    PieChartModel model,
  ) {
    var ratio = (sweepAngle / 360.0 * 100).toStringAsFixed(0);
    // 处理名称超长问题，最多2行，超出部分以省略号显示
    // 10 -> 最多10个字位数
    var top = Text(_getWrappedText("${model.name} ${model.data}", 20));
    var topTextPainter = getTextPainter(top, color: model.color);
    // 百分比显示
    var bottom = Text("$ratio%");
    var bottomTextPainter = getTextPainter(bottom);

    //var bottom = Text("${model.data}");
    //var bottomTextPainter = getTextPainter(bottom, color: model.color);

    var startX = radius * (cos((startAngle + (sweepAngle / 2)) * (pi / 180)));
    var startY = radius * (sin((startAngle + (sweepAngle / 2)) * (pi / 180)));

    // 第一段折线长度
    var firstLine = radius / 5;
    var secondLine =
        max(bottomTextPainter.width, topTextPainter.width) + radius / 4;

    var pointX =
        (radius + firstLine) *
        (cos((startAngle + (sweepAngle / 2)) * (pi / 180)));
    var pointY =
        (radius + firstLine) *
        (sin((startAngle + (sweepAngle / 2)) * (pi / 180)));

    // 第二段折线长度
    var marginOffset = 20.0;
    var endX = 0.0;

    if (pointX - startX > 0) {
      endX = min(pointX + secondLine, size.width / 2 - marginOffset);
      secondLine = endX - pointX;
    } else {
      endX = max(pointX - secondLine, -size.width / 2 + marginOffset);
      secondLine = pointX - endX;
    }

    Paint paint = Paint()
      ..style = PaintingStyle.fill
      ..strokeWidth = 1
      ..strokeCap = StrokeCap.round
      ..isAntiAlias = true
      ..color = model.color;

    // 绘制指引线
    canvas.drawLine(Offset(startX, startY), Offset(pointX, pointY), paint);
    canvas.drawLine(Offset(pointX, pointY), Offset(endX, pointY), paint);

    // 绘制显示文本
    var offset = 4;
    var textWidth = bottomTextPainter.width;
    var textStartX = 0.0;
    textStartX = _calculateTextStartX(
      pointX,
      startX,
      textWidth,
      secondLine,
      textStartX,
      offset.toDouble(),
    );
    bottomTextPainter.paint(canvas, Offset(textStartX, pointY + offset));

    textWidth = topTextPainter.width;
    var textHeight = topTextPainter.height;
    textStartX = _calculateTextStartX(
      pointX,
      startX,
      textWidth,
      secondLine,
      textStartX,
      offset.toDouble(),
    );
    topTextPainter.paint(
      canvas,
      Offset(textStartX, pointY - offset - textHeight),
    );
  }

  //处理名称超长问题，最多2行，超出部分以省略号显示
  String _getWrappedText(String text, int maxWidth) {
    if (text.length <= maxWidth) {
      return text;
    }

    String wrappedText = '';
    int startIndex = 0;
    int endIndex = maxWidth;
    int lineCount = 0;

    while (endIndex < text.length && lineCount < 2) {
      // 在endIndex处换行文本
      wrappedText += '${text.substring(startIndex, endIndex)}\n';
      startIndex = endIndex;
      endIndex += maxWidth;
      lineCount++;
    }

    // 修剪尾随空格和换行符
    wrappedText = wrappedText.trimRight();

    // 如果有剩余的文本，添加省略号
    if (endIndex < text.length) {
      wrappedText = '${wrappedText.substring(0, wrappedText.length - 3)}...';
    }

    return wrappedText;
  }

  // 文本样式绘制
  TextPainter getTextPainter(Text text, {Color? color}) {
    var inlineSpan = TextSpan(
      text: text.data,
      style: TextStyle(color: color ?? Colors.white),
    );
    var textPainter = TextPainter(
      // textAlign: TextAlign.center,
      text: inlineSpan,
      textDirection: TextDirection.ltr,
    );
    textPainter.layout();
    return textPainter;
  }

  // 文本显示起点位置
  double _calculateTextStartX(
    double pointX,
    double startX,
    double textWidth,
    double secondLine,
    double textStartX,
    double offset,
  ) {
    if (pointX - startX > 0) {
      textStartX = pointX + secondLine + offset;
    } else {
      textStartX = pointX - secondLine - textWidth - offset;
    }
    return textStartX;
  }

  // 绘制分割线
  void _drawSpaceLines(Canvas canvas) {
    var sumValue = models.fold<double>(0.0, (sum, model) => sum + model.value);
    var startAngle = 0.0;
    for (var model in models) {
      drawLine(canvas, startAngle, model.radius);
      startAngle += model.value / sumValue * 360;
    }
  }

  void drawLine(Canvas canvas, double angle, double radius) {
    var endX = cos(angle * pi / 180) * radius;
    var endY = sin(angle * pi / 180) * radius;
    Paint paint = Paint()
      ..style = PaintingStyle.fill
      ..color = Colors.white
      ..strokeWidth = 5; // 分割线大小
    canvas.drawLine(Offset.zero, Offset(endX, endY), paint);
  }

  /// 绘制中心空白区域 以及 显示文本
  void _drawHole(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..style = PaintingStyle.fill
      ..color = Color(0xFF313540);
    canvas.drawCircle(Offset.zero, 50.r, paint);

    double textSpacing = 1; // 中心文本上下间距

    TextPainter topTextPainter = TextPainter(
      text: TextSpan(
        text: '$total',
        style: TextStyle(
          color: Colors.white,
          fontSize: 30.sp,
          fontWeight: FontWeight.w600,
        ),
      ),
      textDirection: TextDirection.ltr,
    );

    topTextPainter.layout();
    Offset topTextOffset = Offset(
      -topTextPainter.width / 2,
      -topTextPainter.height - textSpacing + 5,
    );
    topTextPainter.paint(canvas, topTextOffset);

    TextPainter bottomTextPainter = TextPainter(
      text: TextSpan(
        text: TKey.total.tr,
        style: TextStyle(color: Color(0xA6FFFFFF), fontSize: 14.sp),
      ),
      textDirection: TextDirection.ltr,
    );
    bottomTextPainter.layout();
    Offset bottomTextOffset = Offset(
      -bottomTextPainter.width / 2,
      textSpacing + 5,
    );
    bottomTextPainter.paint(canvas, bottomTextOffset);
  }
}

class PieChartModel {
  final String name;
  final double value;
  final int data;
  final Color color;
  final double radius;
  final double startAngle;

  PieChartModel({
    required this.name,
    required this.value,
    required this.color,
    required this.radius,
    required this.startAngle,
    required this.data,
  });
}
