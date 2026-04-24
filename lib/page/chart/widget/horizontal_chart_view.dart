import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HorizontalChartView extends StatefulWidget {
  final Widget child;
  const HorizontalChartView({super.key, required this.child});

  @override
  State<HorizontalChartView> createState() => _HorizontalChartViewState();
}

class _HorizontalChartViewState extends State<HorizontalChartView> {
  @override
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
    ]);
  }

  @override
  void dispose() {
    // 页面销毁时恢复竖屏
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}
