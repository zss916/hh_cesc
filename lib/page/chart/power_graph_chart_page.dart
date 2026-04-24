import 'package:cescpro/page/chart/widget/horizontal_chart_view.dart';
import 'package:cescpro/page/chart/widget/horizontal_power_chart/h_power_analysis_widget.dart';
import 'package:cescpro/page/station/detail/olive/widget/statistics_item/statistics_item_logic.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PowerGraphChartPage extends StatelessWidget {
  const PowerGraphChartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return HorizontalChartView(
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios_new_rounded, color: Colors.white),
            onPressed: () => Get.back(),
          ),
          centerTitle: true,
          backgroundColor: Colors.transparent,
        ),
        backgroundColor: Color(0xFF23282E),
        body: SafeArea(
          child: GetBuilder<StatisticsItemLogic>(
            id: "powerGraph",
            init: StatisticsItemLogic(),
            builder: (logic) {
              return HPowerAnalysisWidget(logic: logic);
            },
          ),
        ),
      ),
    );
  }
}
