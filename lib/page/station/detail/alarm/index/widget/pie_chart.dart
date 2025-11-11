import 'dart:math';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PieChartWidget extends StatefulWidget {
  final Size size;
  final String title;
  final String count;
  final List list;
  const PieChartWidget({
    super.key,
    required this.size,
    required this.title,
    required this.count,
    required this.list,
  });

  @override
  State<PieChartWidget> createState() => _PieChartWidgetState();
}

class _PieChartWidgetState extends State<PieChartWidget>
    with SingleTickerProviderStateMixin {
  //来个动画控制器
  late AnimationController _animationController;

  //控制饼图使用的
  late Animation<double> _progressAnimation;

  //控制数字使用的
  late Animation<double> _numberAnimation;

  List _list = [
    {"title": "一级告警", "number": 0, "color": Color(0xFFEE2727)},
    {"title": "二级告警", "number": 0, "color": Color(0xFFFFE725)},
    {"title": "三级告警", "number": 0, "color": Color(0xFF376FFF)},
    {"title": "其他", "number": 0, "color": Color(0xFF26FFBD)},
  ];

  @override
  void initState() {
    super.initState();
    //初始化一下
    _animationController = AnimationController(
      //执行时间为 1 秒
      duration: Duration(milliseconds: 1000),
      vsync: this,
    );

    //在 400 ~ 800 毫秒的区间内执行画饼的操作动画
    _progressAnimation = Tween(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _animationController,
        //执行时间 区间
        curve: Interval(0.4, 0.8, curve: Curves.bounceOut),
      ),
    );

    //在 700 ~ 1000 毫秒的区间 执行最上层的数字抬高的操作动画
    _numberAnimation = Tween(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _animationController,
        //执行时间 区间
        curve: Interval(0.7, 1.0, curve: Curves.bounceOut),
      ),
    );

    //添加 一个监听 刷新页面
    _animationController.addListener(() {
      setState(() {});
    });

    /// 开始执行动画
    _animationController.reset();
    _animationController.forward();

    _list = widget.list;
    //debugPrint("liat====>>> ${_list.toString()}");
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      //子 Widget 居中
      alignment: Alignment.center,
      children: [
        //第一层
        Container(
          //来个内边距
          padding: EdgeInsets.zero,
          //来个边框装饰
          decoration: BoxDecoration(
            color: Colors.transparent,
            shape: BoxShape.circle,
          ),
          //开始绘制神操作
          child: CustomPaint(
            size: widget.size,
            painter: CustomShapPainter(_list, _progressAnimation.value),
          ),
        ),
        //第二层
        Container(
          width: widget.size.width * 0.7,
          height: widget.size.height * 0.7,
          padding: EdgeInsets.all(8.r),
          decoration: BoxDecoration(
            color: Color(0xFF313540),
            shape: BoxShape.circle,
          ),
          child: Container(
            padding: EdgeInsets.all(12.r),
            decoration: BoxDecoration(
              color: Color(0x1FFFFFFF),
              shape: BoxShape.circle,
            ),
            child: FittedBox(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    widget.title,
                    style: TextStyle(color: Colors.white, fontSize: 12),
                  ),
                  AutoSizeText(
                    widget.count,
                    maxFontSize: 22,
                    minFontSize: 12,
                    maxLines: 1,
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 22,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

/// 自定义绘制
class CustomShapPainter extends CustomPainter {
  //数据内容
  List list;

  double progress;

  CustomShapPainter(this.list, this.progress);

  //来个画笔
  final Paint _paint = Paint()..isAntiAlias = true;

  //圆周率（Pi）是圆的周长与直径的比值，一般用希腊字母π表示
  //绘制内容
  @override
  void paint(Canvas canvas, Size size) {
    //中心
    Offset center = Offset(size.width / 2, size.height / 2);
    //半径  取宽高 一半 最小值
    double radius = min(size.width / 2, size.height / 2);

    //开始绘制的弧度
    double startRadian = -pi / 2;

    //总金额
    double total = 0.0;
    for (var element in list) {
      total += element["number"];
    }

    //开始绘制
    for (var i = 0; i < list.length; i++) {
      //当前要绘制的选项
      var item = list[i];

      //计算所占的比例
      double flag = item["number"] / total;

      //计算弧度
      double sweepRadin = flag * 2 * pi * progress;

      //开始绘制弧
      //设置一下画笔的颜色
      _paint.color = item["color"];
      canvas.drawArc(
        Rect.fromCircle(center: center, radius: radius),
        startRadian,
        sweepRadin,
        true,
        _paint,
      );

      //累加下次开始绘制的角度
      startRadian += sweepRadin;
    }
  }

  //返回true 刷新
  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
