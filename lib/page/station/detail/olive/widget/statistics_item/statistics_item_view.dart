import 'package:cescpro/core/translations/en.dart';
import 'package:cescpro/page/station/detail/olive/widget/statistics_item/ele/ele_bar_chart_widget.dart';
import 'package:cescpro/page/station/detail/olive/widget/statistics_item/power/power_analysis_widget.dart';
import 'package:cescpro/page/station/detail/olive/widget/statistics_item/pv/build_bar_chart_widget_pv.dart';
import 'package:cescpro/page/station/detail/olive/widget/statistics_item/revenue/revenue_bar_chart_widget.dart';
import 'package:cescpro/page/station/detail/olive/widget/statistics_item/statistics_item_logic.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class StatisticsItemView extends StatelessWidget {
  const StatisticsItemView({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          ///功率折线
          GetBuilder<StatisticsItemLogic>(
            id: "powerGraph",
            init: StatisticsItemLogic(),
            builder: (logic) {
              return PowerAnalysisWidget(logic: logic);
            },
          ),

          ///收益统计
          GetBuilder<StatisticsItemLogic>(
            id: 'revenue',
            init: StatisticsItemLogic(),
            builder: (logic) {
              return RevenueBarChartWidget(
                title: TKey.revenueStatistics.tr,
                logic: logic,
              );
            },
          ),

          ///电量
          GetBuilder<StatisticsItemLogic>(
            id: 'ele',
            init: StatisticsItemLogic(),
            builder: (logic) {
              return EleBarChartWidget(
                title: TKey.energySChaAndDischa.tr,
                logic: logic,
              );
            },
          ),

          ///光伏发电量
          GetBuilder<StatisticsItemLogic>(
            id: "pv",
            init: StatisticsItemLogic(),
            builder: (logic) {
              return BuildBarChartWidgetPV(
                title: TKey.photovoltaicPowerGeneration.tr,
                logic: logic,
              );
            },
          ),
          SizedBox(height: 200.h),
        ],
      ),
    );
  }
}
