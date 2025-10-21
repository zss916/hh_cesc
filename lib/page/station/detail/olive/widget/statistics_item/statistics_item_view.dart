import 'package:cescpro/core/translations/en.dart';
import 'package:cescpro/page/station/detail/olive/widget/statistics_item/build_bar_chart_widget.dart';
import 'package:cescpro/page/station/detail/olive/widget/statistics_item/power_analysis_widget.dart';
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
          PowerAnalysisWidget(),

          BuildBarChartWidget(title: TKey.revenueStatistics.tr),

          BuildBarChartWidget(
            title: TKey.electricityIndicatorsAndEfficiency.tr,
          ),

          BuildBarChartWidget(title: TKey.photovoltaicPowerGeneration.tr),

          SizedBox(height: 200.h),
        ],
      ),
    );
  }
}
