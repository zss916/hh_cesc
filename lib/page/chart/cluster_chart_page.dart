import 'package:cescpro/core/translations/en.dart';
import 'package:cescpro/page/chart/widget/horizontal_chart_view.dart';
import 'package:cescpro/page/station/detail/monitor/cluster/index.dart';
import 'package:cescpro/page/station/detail/monitor/cluster/widget/base_line_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ClusterChartPage extends StatelessWidget {
  const ClusterChartPage({super.key});

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
              child: GetBuilder<BatteryClusterLogic>(
                id: "realTimeData",
                init: BatteryClusterLogic(),
                builder: (logic) {
                  return buildContent(logic.viewStatus, logic);
                  //return BaseLineChart(socList: logic.arrList);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildContent(ViewType viewState, BatteryClusterLogic logic) {
    return switch (viewState) {
      _ when viewState == ViewType.loading => buildLoading,
      _ when viewState == ViewType.common => BaseLineChart(
        socList: logic.arrList,
      ),
      _ when viewState == ViewType.empty => buildEmpty,
      _ => buildEmpty,
    };
  }

  Widget get buildLoading =>
      Center(child: CircularProgressIndicator(color: Colors.white));

  Widget get buildEmpty => Center(
    child: Text(TKey.noDataAvailable.tr, style: TextStyle(color: Colors.white)),
  );
}
