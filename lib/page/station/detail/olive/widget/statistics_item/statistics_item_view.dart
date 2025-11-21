import 'package:cescpro/core/translations/en.dart';
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
          /*GetBuilder<StatisticsItemLogic>(
            id: "powerGraph",
            init: StatisticsItemLogic(),
            builder: (logic) {
              return PowerAnalysisWidget(logic: logic);
            },
          ),*/

          //收益统计
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

          /* BuildBarChartWidget(
            title: TKey.electricityIndicatorsAndEfficiency.tr,
            logic: StatisticsItemLogic(),
          ),*/

          /*BuildBarChartWidgetPV(
            title: TKey.photovoltaicPowerGeneration.tr,
            logic: StatisticsItemLogic(),
          ),*/
          SizedBox(height: 200.h),
        ],
      ),
    );
    /* return GetBuilder<StatisticsItemLogic>(
      init: StatisticsItemLogic(),
      builder: (logic) {
        return SingleChildScrollView(
          child: Column(
            children: [
              GetBuilder<StatisticsItemLogic>(
                id: "powerGraph",
                init: StatisticsItemLogic(),
                builder: (logic) {
                  return PowerAnalysisWidget(logic: logic);
                },
              ),

              BuildBarChartWidget(
                title: TKey.revenueStatistics.tr,
                logic: logic,
              ),

              BuildBarChartWidget(
                title: TKey.electricityIndicatorsAndEfficiency.tr,
                logic: logic,
              ),

              BuildBarChartWidgetPV(
                title: TKey.photovoltaicPowerGeneration.tr,
                logic: logic,
              ),

              SizedBox(height: 200.h),
            ],
          ),
        );
      },
    );*/
  }
}
