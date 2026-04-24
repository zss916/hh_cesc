import 'package:cescpro/core/color/colors.dart';
import 'package:cescpro/page/chart/widget/horizontal_power_chart/h_line_title_widget.dart';
import 'package:cescpro/page/chart/widget/horizontal_power_chart/h_power_line_chart.dart';
import 'package:cescpro/page/station/detail/olive/widget/statistics_item/statistics_item_logic.dart';
import 'package:flutter/material.dart' hide DatePickerTheme;

class HPowerAnalysisWidget extends StatefulWidget {
  final StatisticsItemLogic logic;
  const HPowerAnalysisWidget({super.key, required this.logic});

  @override
  State<HPowerAnalysisWidget> createState() => _PowerAnalysisWidgetState();
}

class _PowerAnalysisWidgetState extends State<HPowerAnalysisWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      height: double.maxFinite,
      margin: EdgeInsetsDirectional.only(end: 20),
      padding: EdgeInsetsDirectional.only(start: 0, end: 10, bottom: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Color(0xFF313540),
      ),
      child: Column(
        children: [
          if (widget.logic.powerLines.isNotEmpty)
            Align(
              alignment: AlignmentDirectional.centerStart,
              child: Container(
                margin: EdgeInsetsDirectional.only(start: 10, top: 5),
                child: Text(
                  "(KW)",
                  style: TextStyle(color: Color(0x80FFFFFF), fontSize: 10),
                ),
              ),
            ),
          Container(
            color: Colors.transparent,
            height: 200,
            width: double.maxFinite,
            child: buildBody(viewState: widget.logic.powerViewStatus),
          ),
          Divider(height: 5, color: Colors.transparent),
          SizedBox(
            width: double.maxFinite,
            height: 20,
            child: ListView.separated(
              padding: EdgeInsetsDirectional.only(start: 15, end: 15),
              scrollDirection: Axis.horizontal,
              itemCount: widget.logic.titles.length,
              itemBuilder: (_, i) {
                return HLineTitleWidget(
                  color: AppColors.colorList[i],
                  title: widget.logic.titles[i],
                );
              },
              separatorBuilder: (_, i) =>
                  VerticalDivider(width: 15, color: Colors.transparent),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildBody({required int viewState}) {
    return switch (viewState) {
      _ when viewState == ViewType.loading.index => buildLoading(),
      _ when viewState == ViewType.common.index => buildPowerLineChart(),
      _ when viewState == ViewType.empty.index => buildEmpty(),
      _ => buildEmpty(),
    };
  }

  ///loading
  Widget buildLoading() =>
      Center(child: CircularProgressIndicator(color: Colors.white));

  ///line chart
  Widget buildPowerLineChart() {
    return HPowerLineChart(
      list: widget.logic.powerLines,
      maxX: widget.logic.maxX,
      minY: widget.logic.minY,
      maxY: widget.logic.maxY,
    );
  }

  ///empty
  Widget buildEmpty() =>
      HPowerLineChart(list: [], maxX: 0.0, minY: 0.0, maxY: 100.0);
}
