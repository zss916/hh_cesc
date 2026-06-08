import 'package:cescpro/core/helper/extension_helper.dart';
import 'package:cescpro/core/router/index.dart';
import 'package:cescpro/core/translations/en.dart';
import 'package:cescpro/http/bean/power_graph_entity.dart';
import 'package:cescpro/page/station/detail/olive/widget/statistics_item/power/power_line_chart.dart';
import 'package:cescpro/page/station/detail/olive/widget/statistics_item/power/power_line_chart2.dart';
import 'package:cescpro/page/station/detail/olive/widget/statistics_item/power/power_line_chart3.dart';
import 'package:cescpro/page/station/detail/olive/widget/statistics_item/statistics_item_logic.dart';
import 'package:flutter/material.dart' hide DatePickerTheme;
import 'package:flutter_datetime_picker_plus/flutter_datetime_picker_plus.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class PowerAnalysisWidget2 extends StatefulWidget {
  final StatisticsItemLogic logic;
  const PowerAnalysisWidget2({super.key, required this.logic});

  @override
  State<PowerAnalysisWidget2> createState() => _PowerAnalysisWidgetState();
}

class _PowerAnalysisWidgetState extends State<PowerAnalysisWidget2> {
  String currentTime = DateFormat('yyyy-MM-dd').format(DateTime.now());

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: double.maxFinite,
          height: 52.h,
          padding: EdgeInsetsDirectional.only(start: 18.w, end: 13.w),
          alignment: AlignmentDirectional.centerStart,
          child: Row(
            children: [
              Text(
                TKey.powerAnalysis.tr,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                  fontSize: 16.sp,
                ),
              ),
              Spacer(),
              InkWell(
                borderRadius: BorderRadius.circular(5),
                onTap: () {
                  showDateTimePicker(widget.logic);
                },
                child: Container(
                  padding: EdgeInsetsDirectional.symmetric(
                    horizontal: 5.w,
                    vertical: 5.h,
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        currentTime,
                        style: TextStyle(
                          color: Color(0xFFFFFFFF),
                          fontSize: 12.sp,
                        ),
                      ),
                      Icon(
                        Icons.arrow_drop_down_rounded,
                        color: Colors.white,
                        size: 15,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        Stack(
          alignment: AlignmentDirectional.center,
          children: [
            Container(
              margin: EdgeInsets.symmetric(horizontal: 16.w),
              padding: EdgeInsetsDirectional.only(top: 25, bottom: 15.h),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Color(0xFF313540),
              ),
              width: double.maxFinite,
              child: Stack(
                alignment: AlignmentDirectional.topCenter,
                children: [
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Divider(height: 10.h, color: Colors.transparent),
                          Container(
                            color: Colors.transparent,
                            height: 355.h,
                            width: double.maxFinite,
                            child: buildBody(
                              viewState: widget.logic.powerViewStatus,
                            ),
                          ),
                        ],
                      ),
                      if (widget.logic.series.isNotEmpty)
                        PositionedDirectional(
                          top: 10.h,
                          start: 10.w,
                          child: Text(
                            "(kW)",
                            style: TextStyle(
                              color: Color(0x80FFFFFF),
                              fontSize: 12.sp,
                            ),
                          ),
                        ),

                      if (widget.logic.series.isNotEmpty)
                        PositionedDirectional(
                          top: 10.h,
                          end: 10.w,
                          child: Text(
                            "(%)",
                            style: TextStyle(
                              color: Colors.blue,
                              fontSize: 12.sp,
                            ),
                          ),
                        ),
                    ],
                  ),
                ],
              ),
            ),
            if (widget.logic.series.isNotEmpty &&
                ViewType.common.index == widget.logic.powerViewStatus)
              PositionedDirectional(
                top: 5,
                end: 5 + 16.w,
                child: InkWell(
                  onTap: () {
                    Get.toNamed(APages.hPowerGraphChart);
                  },
                  child: Icon(
                    Icons.zoom_out_map_rounded,
                    size: 20,
                    color: Colors.white,
                  ),
                ),
              ),
          ],
        ),
      ],
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
    return PowerLineChart(
      list: widget.logic.powerLines,
      maxX: widget.logic.maxX,
      minY: widget.logic.minY,
      maxY: widget.logic.maxY,
      isEmptyView: false,
    );
  }

  Widget buildPowerLineChart2() {
    return PowerLineChart2(
      list: widget.logic.powerLines,
      socList: widget.logic.socPowerLines,
      maxX: widget.logic.maxX,
      minY: widget.logic.minY,
      maxY: widget.logic.maxY,
      isEmptyView: false,
    );
  }

  Widget buildPowerLineChart3() {
    return PowerLineChart3(
      data: widget.logic.series,
      minT: widget.logic.minT,
      maxT: widget.logic.maxT,
      axis: widget.logic.axis,
      isH: false,
    );
  }

  ///empty
  Widget buildEmpty() => PowerLineChart(
    list: [
      (
        [
          PowerGraphList()
            ..time = 0
            ..val = 0.0,
        ],
        Colors.transparent,
      ),
      (
        [
          PowerGraphList()
            ..time = 0
            ..val = 0.0,
        ],
        Colors.transparent,
      ),
      (
        [
          PowerGraphList()
            ..time = 0
            ..val = 0.0,
        ],
        Colors.transparent,
      ),
      (
        [
          PowerGraphList()
            ..time = 0
            ..val = 0.0,
        ],
        Colors.transparent,
      ),
    ],
    maxX: 0.0,
    minY: 0.0,
    maxY: 100.0,
    isEmptyView: true,
  );

  void showDateTimePicker(StatisticsItemLogic logic) {
    DatePicker.showDatePicker(
      context,
      showTitleActions: true,
      minTime: DateTime(2010, 1, 1),
      maxTime: DateTime.now(),
      currentTime: DateTime.parse(currentTime),
      locale: LocaleUtils.fromLanguageCode(Get.locale?.languageCode),
      //locale: Get.isEn ? LocaleType.en : LocaleType.zh,
      theme: DatePickerTheme(
        backgroundColor: Color(0xFF23282E),
        itemStyle: TextStyle(
          color: Color(0xFFFFFFFF),
          fontSize: 15,
          fontWeight: FontWeight.w500,
        ),
        cancelStyle: TextStyle(color: Color(0xA6FFFFFF), fontSize: 14),
        doneStyle: TextStyle(color: Color(0xFF13D4D2), fontSize: 14),
      ),

      onChanged: (date) {
        debugPrint('change $date');
      },
      onConfirm: (date) {
        debugPrint('confirm $date');
        String formatted = DateFormat('yyyy-MM-dd').format(date);
        setState(() {
          currentTime = formatted;
          int? powerStartTime = DateTime(
            date.year,
            date.month,
            date.day,
            0,
            0,
            0,
          ).millisecondsSinceEpoch;
          int? powerEndTime = DateTime(
            date.year,
            date.month,
            date.day,
            24,
            0,
            0,
          ).subtract(Duration(microseconds: 1)).millisecondsSinceEpoch;

          logic.powerStartTime = powerStartTime;
          logic.powerEndTime = powerEndTime;
          logic.loadPower2(
            startTimeStamp: powerStartTime,
            endTimeStamp: powerEndTime,
          );
        });
      },
    );
  }
}
