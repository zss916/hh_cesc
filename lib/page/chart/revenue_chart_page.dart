import 'package:cescpro/page/chart/widget/horizontal_chart_view.dart';
import 'package:cescpro/page/chart/widget/revenue/h_revenue_barchart_widget.dart';
import 'package:cescpro/page/station/detail/olive/widget/statistics_item/statistics_item_logic.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RevenueChartPage extends StatelessWidget {
  const RevenueChartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return HorizontalChartView(
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios_new_rounded, color: Colors.white),
            onPressed: () => Get.back(),
          ),
          centerTitle: true,
          backgroundColor: Colors.transparent,
        ),
        backgroundColor: Color(0xFF23282E),
        body: SafeArea(
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 16),
            padding: EdgeInsetsDirectional.only(start: 5, end: 10, bottom: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Color(0xFF313540),
            ),
            width: double.maxFinite,
            child: GetBuilder<StatisticsItemLogic>(
              id: 'revenue',
              init: StatisticsItemLogic(),
              builder: (logic) {
                return HRevenueBarchartWidget(
                  data: logic.revenueList
                      .map((e) => (e.totalIncome ?? 0))
                      .toList(),
                  labels: logic.labels,
                  maxY: logic.revenueMaxY ?? 0,
                  minY: logic.revenueMinY ?? 0,
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
