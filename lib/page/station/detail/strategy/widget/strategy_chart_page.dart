import 'package:cescpro/page/chart/widget/horizontal_chart_view.dart';
import 'package:cescpro/page/station/detail/strategy/logic.dart';
import 'package:cescpro/page/station/detail/strategy/widget/strategy_power_line_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class StrategyChartPage extends StatelessWidget {
  const StrategyChartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      height: double.maxFinite,
      padding: EdgeInsetsDirectional.only(end: 15),
      child: HorizontalChartView(
        child: GetBuilder<StrategyPageLogic>(
          init: StrategyPageLogic(),
          builder: (logic) {
            return Column(
              children: [
                Align(
                  alignment: AlignmentDirectional.centerStart,
                  child: Container(
                    margin: EdgeInsetsDirectional.only(top: 0),
                    child: Text(
                      "(kW)",
                      style: TextStyle(color: Color(0x80FFFFFF), fontSize: 12),
                    ),
                  ),
                ),

                Expanded(
                  child: StrategyPowerLineChart(
                    data: logic.series,
                    minT: logic.minT,
                    maxT: logic.maxT,
                    axis: logic.axis,
                    colors: [Color(0xff4a9eff), Color(0xff2dd4bf)],
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
