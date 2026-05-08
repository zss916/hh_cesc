import 'package:cescpro/core/setting/app_setting.dart';
import 'package:cescpro/core/translations/en.dart';
import 'package:cescpro/page/chart/widget/ele/h_ele_barchart_widget.dart';
import 'package:cescpro/page/chart/widget/horizontal_chart_view.dart';
import 'package:cescpro/page/chart/widget/horizontal_power_chart/h_line_title_widget.dart';
import 'package:cescpro/page/station/detail/olive/widget/statistics_item/statistics_item_logic.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HEleChartPage extends StatelessWidget {
  const HEleChartPage({super.key});

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
                    id: 'ele',
                    init: StatisticsItemLogic(),
                    builder: (logic) {
                      return HEleBarchartItemWidget(
                        data: logic.eleList
                            .map((e) => (e.totalCharge ?? 0))
                            .toList(),
                        data2: logic.eleList
                            .map((e) => (e.totalRecharge ?? 0))
                            .toList(),
                        data3: logic.eleList
                            .map((e) => (e.pvGeneration ?? 0))
                            .toList(),
                        labels: logic.eleLabels,
                        maxY: logic.eleMaxY ?? 0,
                        minY: logic.eleMinY ?? 0,
                      );
                    },
                  ),
                ),
                Wrap(
                  spacing: 16,
                  children: [
                    HLineTitleWidget(
                      title: TKey.charge.tr,
                      color: Color(0xFF39FFEF),
                    ),
                    HLineTitleWidget(
                      title: TKey.discharge.tr,
                      color: Color(0xFFFFC08C),
                    ),
                    if (AppSetting.isOverseas)
                      HLineTitleWidget(
                        title: TKey.powerGeneration.tr,
                        color: Colors.blueAccent,
                      ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
