import 'package:cescpro/page/chart/widget/horizontal_chart_view.dart';
import 'package:cescpro/page/chart/widget/pv/h_pv_barchart_widget.dart';
import 'package:cescpro/page/station/detail/olive/widget/statistics_item/pv/base_bar_chart.dart';
import 'package:cescpro/page/station/detail/olive/widget/statistics_item/statistics_item_logic.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HPVChartPage extends StatelessWidget {
  const HPVChartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return HorizontalChartView(
      child: Container(
        width: double.maxFinite,
        height: double.maxFinite,
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

        child: Column(
          children: [
            Align(
              alignment: AlignmentDirectional.topStart,
              child: Text(
                "(kWh)",
                style: TextStyle(color: Color(0x80FFFFFF), fontSize: 12),
              ),
            ),
            Expanded(
              child: Container(
                color: Colors.transparent,
                width: double.maxFinite,
                child: GetBuilder<StatisticsItemLogic>(
                  id: "pv",
                  init: StatisticsItemLogic(),
                  builder: (logic) {
                    return SizedBox(
                      width: double.maxFinite,
                      height: double.maxFinite,
                      child: BaseBarChart(
                        list: logic.pvList,
                        maximumZoomLevel: getLevel(logic.pvList.length),
                      ),
                    );
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
            ),
          ],
        ),
      ),
    );
  }

  ///获取level
  double getLevel(int len) {
    if (len >= 0 && len <= 7) {
      return 1;
    } else if (len > 7 && len <= 15) {
      return 0.7;
    } else if (len > 15 && len <= 25) {
      return 0.3;
    } else if (len > 25 && len <= 31) {
      return 0.25;
    } else {
      return 0.01;
    }
  }
}
