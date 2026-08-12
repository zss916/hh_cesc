import 'package:cescpro/page/chart/widget/horizontal_chart_view.dart';
import 'package:cescpro/page/station/detail/strategy/ai/ai_strategy_preview_logic.dart';
import 'package:cescpro/page/station/detail/strategy/widget/strategy_power_line_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class PriceForecastChartPage extends StatelessWidget {
  const PriceForecastChartPage({super.key});

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
                    logic.priceCurrencyUnit,
                    style: TextStyle(color: Color(0x80FFFFFF), fontSize: 12),
                  ),
                ),
                Expanded(
                  child: StrategyPowerLineChart(
                    data: logic.priceSeries,
                    minT: logic.minT,
                    maxT: logic.maxT,
                    axis: logic.axis,
                    colors: [Color(0xff2dd4bf), Color(0xffecc207)],
                    numberFormat: NumberFormat.compactCurrency(symbol: ""),
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
