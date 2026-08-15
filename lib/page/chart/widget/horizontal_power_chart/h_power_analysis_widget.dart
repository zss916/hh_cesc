import 'package:cescpro/core/translations/en.dart';
import 'package:cescpro/page/station/detail/olive/widget/statistics_item/power/power_line_chart.dart';
import 'package:cescpro/page/station/detail/olive/widget/statistics_item/statistics_item_logic.dart';
import 'package:flutter/material.dart' hide DatePickerTheme;
import 'package:get/get_utils/src/extensions/internacionalization.dart';

class HPowerAnalysisWidget extends StatelessWidget {
  final StatisticsItemLogic logic;
  const HPowerAnalysisWidget({super.key, required this.logic});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      height: double.maxFinite,
      margin: EdgeInsetsDirectional.only(end: 20),
      padding: EdgeInsetsDirectional.only(start: 5, end: 5, bottom: 0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Color(0xFF313540),
      ),
      child: Column(
        children: [
          if (logic.series.isNotEmpty)
            Row(
              children: [
                Container(
                  margin: EdgeInsetsDirectional.only(start: 5, top: 8),
                  child: Text(
                    "(KW)",
                    style: TextStyle(color: Color(0x80FFFFFF), fontSize: 10),
                  ),
                ),
                Spacer(),
                Container(
                  margin: EdgeInsetsDirectional.only(end: 5, top: 8),
                  child: Text(
                    "(%)",
                    style: TextStyle(color: Colors.blue, fontSize: 10),
                  ),
                ),
              ],
            ),
          Divider(height: 5, color: Colors.transparent),
          Expanded(child: buildBody(viewState: logic.powerViewStatus)),
        ],
      ),
    );
  }

  Widget buildBody({required int viewState}) {
    return switch (viewState) {
      _ when viewState == ViewType.loading.index => buildLoading,
      _ when viewState == ViewType.common.index =>
        logic.series.isEmpty ? buildEmpty : buildPowerLineChart(),
      _ when viewState == ViewType.empty.index => buildEmpty,
      _ => buildEmpty,
    };
  }

  Widget buildPowerLineChart() {
    return PowerLineChart(
      data: logic.series,
      minT: logic.minT,
      maxT: logic.maxT,
      axis: logic.axis,
      isH: true,
    );
  }

  Widget get buildEmpty => Center(
    child: Text(TKey.noDataAvailable.tr, style: TextStyle(color: Colors.white)),
  );

  Widget get buildLoading =>
      Center(child: CircularProgressIndicator(color: Colors.white));
}
