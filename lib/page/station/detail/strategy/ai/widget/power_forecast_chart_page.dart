import 'package:cescpro/page/chart/widget/horizontal_chart_view.dart';
import 'package:cescpro/page/station/detail/strategy/ai/ai_strategy_preview_logic.dart';
import 'package:cescpro/page/station/detail/strategy/widget/strategy_power_line_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PowerForecastChartPage extends StatelessWidget {
  const PowerForecastChartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return HorizontalChartView(
      child: Container(
        width: double.maxFinite,
        height: double.maxFinite,
        margin: EdgeInsetsDirectional.only(end: 15),
        child: GetBuilder<AIStrategyPreviewLogic>(
          init: AIStrategyPreviewLogic(),
          builder: (logic) {
            return Column(
              children: [
                Align(
                  alignment: AlignmentDirectional.centerStart,
                  child: Text(
                    "(kW)",
                    style: TextStyle(color: Color(0x80FFFFFF), fontSize: 12),
                  ),
                ),
                Expanded(
                  child: StrategyPowerLineChart(
                    data: logic.series,
                    minT: logic.minT,
                    maxT: logic.maxT,
                    axis: logic.axis,
                    colors: [
                      Color(0xFF3874F2),
                      Color(0xfffbbf24),
                      Color(0xffff9933),
                    ],
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
