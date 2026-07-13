import 'package:cescpro/page/chart/widget/horizontal_power_chart/h_power_line_chart.dart';
import 'package:cescpro/page/chart/widget/horizontal_power_chart/h_power_line_chart2.dart';
import 'package:cescpro/page/station/detail/olive/widget/statistics_item/line_title_widget.dart';
import 'package:cescpro/page/station/detail/olive/widget/statistics_item/power/power_line_chart3.dart';
import 'package:cescpro/page/station/detail/olive/widget/statistics_item/statistics_item_logic.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart' hide DatePickerTheme;

class HPowerAnalysisWidget2 extends StatefulWidget {
  final StatisticsItemLogic logic;
  const HPowerAnalysisWidget2({super.key, required this.logic});

  @override
  State<HPowerAnalysisWidget2> createState() => _PowerAnalysisWidgetState();
}

class _PowerAnalysisWidgetState extends State<HPowerAnalysisWidget2> {
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
          Row(
            children: [
              if (widget.logic.series.isNotEmpty)
                Container(
                  margin: EdgeInsetsDirectional.only(start: 10, top: 5),
                  child: Text(
                    "(KW)",
                    style: TextStyle(color: Color(0x80FFFFFF), fontSize: 10),
                  ),
                ),
              Spacer(),
              if (widget.logic.series.isNotEmpty)
                Container(
                  margin: EdgeInsetsDirectional.only(start: 10, top: 5),
                  child: Text(
                    "(%)",
                    style: TextStyle(color: Colors.blue, fontSize: 10),
                  ),
                ),
            ],
          ),
          Expanded(
            child: Container(
              color: Colors.transparent,
              height: double.maxFinite,
              width: double.maxFinite,
              child: buildBody(viewState: widget.logic.powerViewStatus),
            ),
          ),

          if (false)
            Container(
              padding: EdgeInsetsDirectional.only(start: 10, end: 10, top: 10),
              width: double.maxFinite,
              child: Wrap(
                spacing: 15,
                runSpacing: 8,
                children: [
                  ...widget.logic.series
                      .map((a) => (a.name ?? ""))
                      .toList()
                      .mapIndexed(
                        (i, e) => LineTitleWidget(
                          color: e.toLowerCase() == "soc"
                              ? Colors.blue
                              : palette[i],
                          title: e,
                        ),
                      ),
                ],
              ),
            ),

          /* Divider(height: 5, color: Colors.transparent),
          SizedBox(
            width: double.maxFinite,
            height: 20,
            child: ListView.separated(
              padding: EdgeInsetsDirectional.only(start: 15, end: 15),
              scrollDirection: Axis.horizontal,
              itemCount: widget.logic.titles.length,
              itemBuilder: (_, i) {
                return HLineTitleWidget(
                  color: widget.logic.titles[i].$2,
                  title: widget.logic.titles[i].$1,
                );
              },
              separatorBuilder: (_, i) =>
                  VerticalDivider(width: 15, color: Colors.transparent),
            ),
          ),*/
        ],
      ),
    );
  }

  Widget buildBody({required int viewState}) {
    return switch (viewState) {
      _ when viewState == ViewType.loading.index => buildLoading(),
      _ when viewState == ViewType.common.index =>
        widget.logic.series.isEmpty
            ? buildPowerLineChart()
            : buildPowerLineChart3(),
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

  Widget buildPowerLineChart2() {
    return HPowerLineChart2(
      list: widget.logic.powerLines,
      socList: widget.logic.socPowerLines,
      maxX: widget.logic.maxX,
      minY: widget.logic.minY,
      maxY: widget.logic.maxY,
    );
  }

  Widget buildPowerLineChart3() {
    return PowerLineChart3(
      data: widget.logic.series,
      minT: widget.logic.minT,
      maxT: widget.logic.maxT,
      axis: widget.logic.axis,
      isH: true,
    );
  }

  ///empty
  Widget buildEmpty() =>
      HPowerLineChart(list: [], maxX: 0.0, minY: 0.0, maxY: 100.0);
}
