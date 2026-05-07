import 'package:cescpro/page/chart/widget/horizontal_chart_view.dart';
import 'package:cescpro/page/chart/widget/pv/h_pv_barchart_widget.dart';
import 'package:cescpro/page/station/detail/olive/widget/statistics_item/statistics_item_logic.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HPVChartPage extends StatelessWidget {
  const HPVChartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return HorizontalChartView(
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 16),
        padding: EdgeInsetsDirectional.only(
          start: 10,
          end: 10,
          top: 10,
          bottom: 10,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Color(0xFF313540),
        ),
        width: double.maxFinite,
        child: Stack(
          alignment: AlignmentDirectional.topCenter,
          children: [
            Column(
              children: [
                Align(
                  alignment: AlignmentDirectional.topStart,
                  child: Text(
                    "(kWh)",
                    style: TextStyle(color: Color(0x80FFFFFF), fontSize: 12),
                  ),
                ),
                Container(
                  color: Colors.transparent,
                  height: 200,
                  width: double.maxFinite,
                  child: GetBuilder<StatisticsItemLogic>(
                    id: "pv",
                    init: StatisticsItemLogic(),
                    builder: (logic) {
                      return HPVBarchartItemWidget(
                        data: logic.pvList
                            .map((e) => (e.summaryValue ?? 0))
                            .toList(),
                        labels: logic.pvLabels,
                        maxY: logic.pvMaxY ?? 0,
                        minY: logic.pvMinY ?? 0,
                      );
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
