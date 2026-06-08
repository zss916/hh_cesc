import 'package:cescpro/page/chart/widget/horizontal_chart_view.dart';
import 'package:cescpro/page/chart/widget/horizontal_power_chart/h_power_analysis_widget2.dart';
import 'package:cescpro/page/station/detail/olive/widget/statistics_item/statistics_item_logic.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PowerGraphChartPage2 extends StatelessWidget {
  const PowerGraphChartPage2({super.key});

  @override
  Widget build(BuildContext context) {
    return HorizontalChartView(
      child: GetBuilder<StatisticsItemLogic>(
        id: "powerGraph2",
        init: StatisticsItemLogic(),
        builder: (logic) {
          return HPowerAnalysisWidget2(logic: logic);
        },
      ),
    );
  }
}
