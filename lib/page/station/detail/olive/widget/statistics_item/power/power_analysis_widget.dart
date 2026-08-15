import 'package:cescpro/core/helper/extension_helper.dart';
import 'package:cescpro/core/router/index.dart';
import 'package:cescpro/core/translations/en.dart';
import 'package:cescpro/page/station/detail/olive/widget/statistics_item/power/power_line_chart.dart';
import 'package:cescpro/page/station/detail/olive/widget/statistics_item/statistics_item_logic.dart';
import 'package:flutter/material.dart' hide DatePickerTheme;
import 'package:flutter_datetime_picker_plus/flutter_datetime_picker_plus.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class PowerAnalysisWidget extends StatefulWidget {
  final StatisticsItemLogic logic;
  const PowerAnalysisWidget({super.key, required this.logic});

  @override
  State<PowerAnalysisWidget> createState() => _PowerAnalysisWidgetState();
}

class _PowerAnalysisWidgetState extends State<PowerAnalysisWidget> {
  String currentTime = DateFormat('yyyy-MM-dd').format(DateTime.now());

  final palette = <Color>[
    Colors.red, // line2
    Colors.green, // line3
    Colors.orange, // line4 (右轴)
    Colors.purple, // line5
    Colors.teal, // line6
    Colors.brown, // line7
    Colors.pink, // line8
    Colors.indigo, // line9
    Colors.lime, // line10
    Colors.cyan, // line11
    Colors.amber, // line12
  ];

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
        Container(
          margin: EdgeInsets.symmetric(horizontal: 16.w),
          padding: EdgeInsetsDirectional.only(
            top: 10,
            bottom: 10,
            start: 8,
            end: 8,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Color(0xFF313540),
          ),
          width: double.maxFinite,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (widget.logic.series.isNotEmpty &&
                  ViewType.common.index == widget.logic.powerViewStatus)
                Align(
                  alignment: AlignmentDirectional.centerEnd,
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

              Divider(height: 8.h, color: Colors.transparent),
              if (widget.logic.series.isNotEmpty)
                Row(
                  children: [
                    Container(
                      margin: EdgeInsetsDirectional.only(start: 0),
                      child: Text(
                        "(kW)",
                        style: TextStyle(
                          color: Color(0x80FFFFFF),
                          fontSize: 12.sp,
                        ),
                      ),
                    ),
                    Spacer(),
                    Container(
                      margin: EdgeInsetsDirectional.only(end: 0),
                      child: Text(
                        "(%)",
                        style: TextStyle(color: Colors.blue, fontSize: 12.sp),
                      ),
                    ),
                  ],
                ),

              Container(
                color: Colors.transparent,
                height: 355.h,
                width: double.maxFinite,
                child: buildBody(viewState: widget.logic.powerViewStatus),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget buildBody({required int viewState}) {
    return switch (viewState) {
      _ when viewState == ViewType.loading.index => buildLoading,
      _ when viewState == ViewType.empty.index => buildEmpty,
      _ when viewState == ViewType.common.index =>
        widget.logic.series.isEmpty ? buildEmpty : buildPowerLineChart(),
      _ when viewState == ViewType.empty.index => buildEmpty,
      _ => buildEmpty,
    };
  }

  ///loading
  Widget get buildLoading =>
      Center(child: CircularProgressIndicator(color: Colors.white));

  ///empty
  Widget get buildEmpty => Center(
    child: Text(TKey.noDataAvailable.tr, style: TextStyle(color: Colors.white)),
  );

  ///line chart
  Widget buildPowerLineChart() {
    return PowerLineChart(
      data: widget.logic.series,
      minT: widget.logic.minT,
      maxT: widget.logic.maxT,
      axis: widget.logic.axis,
      isH: false,
    );
  }

  void showDateTimePicker(StatisticsItemLogic logic) {
    DatePicker.showDatePicker(
      context,
      showTitleActions: true,
      minTime: DateTime(2010, 1, 1),
      maxTime: DateTime.now(),
      currentTime: DateTime.parse(currentTime),
      locale: LocaleUtils.fromLanguageCode(Get.locale?.languageCode),
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
          logic.loadPower(
            startTimeStamp: powerStartTime,
            endTimeStamp: powerEndTime,
          );
        });
      },
    );
  }
}
