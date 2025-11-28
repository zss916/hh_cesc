import 'package:cescpro/core/color/colors.dart';
import 'package:cescpro/core/translations/en.dart';
import 'package:cescpro/page/station/detail/olive/widget/statistics_item/line_title_widget.dart';
import 'package:cescpro/page/station/detail/olive/widget/statistics_item/power/power_line_chart.dart';
import 'package:cescpro/page/station/detail/olive/widget/statistics_item/statistics_item_logic.dart';
import 'package:collection/collection.dart';
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
            start: 5.w,
            end: 10.w,
            bottom: 15.h,
          ),
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
                      Container(
                        color: Colors.transparent,
                        height: 300.h,
                        width: double.maxFinite,
                        child: widget.logic.powerLines.isEmpty
                            ? Center(
                                child: CircularProgressIndicator(
                                  color: Colors.white,
                                ),
                              )
                            : PowerLineChart(
                                list: widget.logic.powerLines,
                                maxX: widget.logic.maxX,
                                minY: widget.logic.minY,
                                maxY: widget.logic.maxY,
                              ),
                      ),
                      Divider(height: 5.h, color: Colors.transparent),
                      Container(
                        padding: EdgeInsetsDirectional.symmetric(
                          horizontal: 15.w,
                        ),
                        width: double.maxFinite,
                        child: Wrap(
                          spacing: 15.w,
                          runSpacing: 8.h,
                          children: [
                            ...widget.logic.titles.mapIndexed(
                              (i, e) => LineTitleWidget(
                                color: AppColors.colorList[i],
                                title: e,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              if (widget.logic.powerLines.isNotEmpty)
                PositionedDirectional(
                  start: 0.w,
                  top: 15.h,
                  child: Text(
                    "(KW)",
                    style: TextStyle(color: Color(0x80FFFFFF), fontSize: 12.sp),
                  ),
                ),
            ],
          ),
        ),
      ],
    );
  }

  void showDateTimePicker(StatisticsItemLogic logic) {
    DatePicker.showDatePicker(
      context,
      showTitleActions: true,
      minTime: DateTime(2010, 1, 1),
      maxTime: DateTime.now(),
      currentTime: DateTime.parse(currentTime),
      locale: LocaleType.zh,
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
          logic.startTimeStamp = date.millisecondsSinceEpoch;
          logic.endTimeStamp = date.millisecondsSinceEpoch;
          logic.loadPower();
        });
      },
    );
  }
}
