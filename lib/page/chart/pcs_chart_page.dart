import 'package:cescpro/core/translations/en.dart';
import 'package:cescpro/page/chart/widget/horizontal_chart_view.dart';
import 'package:cescpro/page/station/detail/monitor/detail/index.dart';
import 'package:cescpro/page/station/detail/monitor/detail/widget/line_bar/base_single_line_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PCSChartPage extends StatelessWidget {
  const PCSChartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return HorizontalChartView(
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 16),
        padding: EdgeInsetsDirectional.only(
          top: 8,
          start: 8,
          end: 8,
          bottom: 0,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Color(0xFF313540),
        ),
        width: double.maxFinite,
        height: double.maxFinite,
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
                ],
              ),
            ),
            Expanded(
              child: GetBuilder<MonitorDetailLogic>(
                id: "realTimeData",
                init: MonitorDetailLogic(),
                builder: (logic) {
                  return buildContent(logic.powerViewStatus, logic);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildContent(ViewType viewState, MonitorDetailLogic logic) {
    return switch (viewState) {
      _ when viewState == ViewType.loading => buildLoading,
      _ when viewState == ViewType.common => BaseSingleLineChart(
        powerList: logic.powerList,
      ),
      _ when viewState == ViewType.empty => buildEmpty,
      _ => buildEmpty,
    };
  }

  Widget get buildEmpty => Center(
    child: Text(TKey.noDataAvailable.tr, style: TextStyle(color: Colors.white)),
  );

  Widget get buildLoading =>
      Center(child: CircularProgressIndicator(color: Colors.white));
}
