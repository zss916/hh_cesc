import 'package:cescpro/page/chart/widget/mixin/land_scape_mixin.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class HorizontalChartView extends StatefulWidget {
  final Widget child;
  const HorizontalChartView({super.key, required this.child});

  @override
  State<HorizontalChartView> createState() => _HorizontalChartViewState();
}

class _HorizontalChartViewState extends State<HorizontalChartView>
    with LandscapeMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_new_rounded, color: Colors.white),
          onPressed: () {
            SystemChrome.setPreferredOrientations([
              DeviceOrientation.portraitUp,
              DeviceOrientation.portraitDown,
            ]).then((_) {
              Get.back();
            });
          },
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
      ),
      backgroundColor: Color(0xFF23282E),
      body: SafeArea(child: widget.child),
    );
  }
}
