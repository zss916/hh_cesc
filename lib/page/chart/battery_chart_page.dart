import 'package:cescpro/page/chart/widget/horizontal_chart_view.dart';
import 'package:cescpro/page/station/detail/monitor/detail/monitor_detail_logic.dart';
import 'package:cescpro/page/station/detail/monitor/detail/widget/line_bar/base_line_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

class BatteryChartPage extends StatelessWidget {
  const BatteryChartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return HorizontalChartView(
      child: Container(
        margin: EdgeInsetsDirectional.symmetric(horizontal: 10),
        width: double.maxFinite,
        height: double.maxFinite,
        padding: EdgeInsetsDirectional.only(
          start: 8,
          end: 8,
          bottom: 0,
          top: 8,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Color(0xFF313540),
        ),
        child: Column(
          children: [
            Container(
              margin: EdgeInsetsDirectional.only(bottom: 10),
              width: double.maxFinite,
              child: Row(
                children: [
                  Text(
                    "(kW)",
                    style: TextStyle(color: Color(0x80FFFFFF), fontSize: 12),
                  ),
                  Spacer(),
                  Text(
                    "(%)",
                    style: TextStyle(color: Color(0xFF0BC3C4), fontSize: 12),
                  ),
                ],
              ),
            ),
            Expanded(
              child: GetBuilder<MonitorDetailLogic>(
                id: "realTimeData",
                init: MonitorDetailLogic(),
                builder: (logic) {
                  return BaseLineChart(socList: logic.arrList);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
