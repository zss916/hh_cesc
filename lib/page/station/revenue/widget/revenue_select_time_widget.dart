import 'package:cescpro/core/helper/extension_helper.dart';
import 'package:cescpro/core/setting/app_setting.dart';
import 'package:cescpro/core/translations/en.dart';
import 'package:cescpro/page/station/report/widget/custom_month_picker.dart';
import 'package:cescpro/page/station/report/widget/custom_year_picker.dart';
import 'package:cescpro/page/station/report/widget/select_date_widget.dart';
import 'package:cescpro/page/station/report/widget/select_month_widget.dart';
import 'package:cescpro/page/station/report/widget/select_year_widget.dart';
import 'package:cescpro/page/station/revenue/index.dart';
import 'package:flutter/material.dart' hide DatePickerTheme;
import 'package:flutter_datetime_picker_plus/flutter_datetime_picker_plus.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class RevenueSelectTimeWidget extends StatefulWidget {
  final RevenueLogic logic;
  const RevenueSelectTimeWidget({super.key, required this.logic});

  @override
  State<RevenueSelectTimeWidget> createState() => _BuildSelectTimeWidgetState();
}

class _BuildSelectTimeWidgetState extends State<RevenueSelectTimeWidget> {
  int _selectedIndex = 0;
  DateTime dateTime = DateTime.now().toUtc();

  ///日
  DateTime startDateTimeDaily = DateTime(
    DateTime.now().year,
    DateTime.now().month,
    1,
  );
  DateTime endDateTimeDaily = DateTime.now();

  ///月
  DateTime selectDateTimeMonth = DateTime.now();

  ///年
  DateTime selectDateTimeYear = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        DefaultTabController(
          length: 3,
          child: Container(
            width: double.maxFinite,
            height: 32.h,
            clipBehavior: Clip.hardEdge,
            decoration: BoxDecoration(
              color: Colors.white12,
              borderRadius: BorderRadius.circular(100),
            ),
            padding: EdgeInsetsDirectional.all(2),
            child: TabBar(
              tabs: [
                Tab(
                  child: Container(
                    width: 120.w,
                    height: 28.h,
                    padding: EdgeInsetsDirectional.symmetric(horizontal: 2),
                    alignment: Alignment.center,
                    child: Text(TKey.day.tr),
                  ),
                ),

                Tab(
                  child: Container(
                    width: 120.w,
                    height: 28.h,
                    padding: EdgeInsetsDirectional.symmetric(horizontal: 2),
                    alignment: Alignment.center,
                    child: Text(TKey.month.tr),
                  ),
                ),

                Tab(
                  child: Container(
                    width: 120.w,
                    height: 28.h,
                    padding: EdgeInsetsDirectional.symmetric(horizontal: 2),
                    alignment: Alignment.center,
                    child: Text(TKey.year.tr),
                  ),
                ),
              ],
              indicatorColor: Colors.white,
              indicatorWeight: 0,
              indicatorSize: TabBarIndicatorSize.tab,
              indicatorPadding: EdgeInsets.zero,
              indicator: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color(0xFF43FFFF), Color(0xFF0978E9)],
                ),
                borderRadius: BorderRadius.circular(50),
              ),
              labelColor: Colors.white,
              unselectedLabelColor: Colors.white,
              labelStyle: TextStyle(
                color: Colors.blue,
                fontWeight: FontWeight.normal,
                fontSize: 14,
              ),
              unselectedLabelStyle: TextStyle(fontSize: 14),
              onTap: (index) {
                setState(() {
                  _selectedIndex = index;
                  widget.logic.queryType = QueryType.values[index];
                  dateTime = DateTime.now().toUtc();
                  if (widget.logic.queryType == QueryType.daily) {
                    setState(() {
                      startDateTimeDaily = DateTime(
                        DateTime.now().year,
                        DateTime.now().month,
                        1,
                      );
                      endDateTimeDaily = DateTime.now();
                    });
                    widget.logic.date = dateTime.millisecondsSinceEpoch;
                    DateTime start = DateTime(dateTime.year, dateTime.month, 1);
                    widget.logic.startTimeStamp = start.millisecondsSinceEpoch;
                    DateTime end = DateTime(
                      dateTime.year,
                      dateTime.month,
                      dateTime.day + 1,
                    );
                    widget.logic.endTimeStamp = end.millisecondsSinceEpoch;
                  } else if (widget.logic.queryType == QueryType.monthly) {
                    setState(() {
                      selectDateTimeMonth = DateTime.now();
                    });
                    widget.logic.date = dateTime.millisecondsSinceEpoch;
                    DateTime start = DateTime(dateTime.year, dateTime.month, 1);
                    widget.logic.startTimeStamp = start.millisecondsSinceEpoch;
                    DateTime end = DateTime(
                      dateTime.year,
                      dateTime.month + 1,
                      0,
                      24,
                      0,
                      0,
                    ).subtract(Duration(microseconds: 1));
                    widget.logic.endTimeStamp = end.millisecondsSinceEpoch;
                  } else if (widget.logic.queryType == QueryType.yearly) {
                    setState(() {
                      selectDateTimeYear = DateTime.now();
                    });
                    widget.logic.date = dateTime.millisecondsSinceEpoch;
                    DateTime start = DateTime(dateTime.year, 1, 1);
                    widget.logic.startTimeStamp = start.millisecondsSinceEpoch;
                    DateTime end = DateTime(
                      dateTime.year,
                      dateTime.month,
                      dateTime.day + 1,
                    );
                    widget.logic.endTimeStamp = end.millisecondsSinceEpoch;
                  }
                  widget.logic.loadData();
                });
              },
            ),
          ),
        ),
        Divider(height: 4.h, color: Colors.transparent),
        if (_selectedIndex == 0)
          Material(
            color: Colors.transparent,
            child: Container(
              width: double.maxFinite,
              padding: EdgeInsetsDirectional.symmetric(vertical: 5.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  InkWell(
                    borderRadius: BorderRadius.circular(5.r),
                    onTap: () {
                      showSelectTimePicker(
                        context: context,
                        initDateTime: DateTime(
                          DateTime.now().year,
                          DateTime.now().month,
                          1,
                        ),
                        onConfirm: (value) {
                          setState(() {
                            startDateTimeDaily = value;
                            widget.logic.queryType = QueryType.daily;
                            widget.logic.startTimeStamp =
                                startDateTimeDaily.millisecondsSinceEpoch;
                            widget.logic.endTimeStamp =
                                endDateTimeDaily.millisecondsSinceEpoch;
                            widget.logic.date = dateTime.millisecondsSinceEpoch;
                          });
                          widget.logic.loadData();
                        },
                      );
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 5.w,
                        vertical: 5.h,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Colors.transparent,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            startDateTimeDaily.dateFormatted,
                            style: TextStyle(
                              color: Color(0xD9FFFFFF),
                              fontSize: 15.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Icon(
                            Icons.arrow_drop_down_rounded,
                            size: 20,
                            color: Color(0xD9FFFFFF),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsetsDirectional.symmetric(horizontal: 8.w),
                    child: Text(
                      "-",
                      style: TextStyle(
                        color: Color(0xD9FFFFFF),
                        fontSize: 15.sp,
                      ),
                    ),
                  ),
                  InkWell(
                    borderRadius: BorderRadius.circular(5.r),
                    onTap: () {
                      showSelectTimePicker(
                        context: context,
                        initDateTime: DateTime.now(),
                        minTime: startDateTimeDaily,
                        onConfirm: (value) {
                          setState(() {
                            endDateTimeDaily = value;
                            widget.logic.queryType = QueryType.daily;
                            widget.logic.startTimeStamp =
                                startDateTimeDaily.millisecondsSinceEpoch;
                            widget.logic.endTimeStamp =
                                endDateTimeDaily.millisecondsSinceEpoch;
                            widget.logic.date = dateTime.millisecondsSinceEpoch;
                          });
                          widget.logic.loadData();
                        },
                      );
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 5.w,
                        vertical: 5.h,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Colors.transparent,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            endDateTimeDaily.dateFormatted,
                            style: TextStyle(
                              color: Color(0xD9FFFFFF),
                              fontSize: 15.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Icon(
                            Icons.arrow_drop_down_rounded,
                            size: 20,
                            color: Color(0xD9FFFFFF),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        if (_selectedIndex == 1)
          Material(
            color: Colors.transparent,
            child: InkWell(
              borderRadius: BorderRadius.circular(5),
              onTap: () {
                showMonthSheet(dateTime: selectDateTimeMonth);
              },
              child: Container(
                width: double.maxFinite,
                padding: EdgeInsetsDirectional.symmetric(vertical: 10.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(
                      Icons.arrow_back_ios,
                      size: 16,
                      color: Color(0xD9FFFFFF),
                    ),

                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          selectDateTimeMonth.monthFormatted,
                          style: TextStyle(
                            color: Color(0xD9FFFFFF),
                            fontSize: 15.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Icon(
                          Icons.arrow_drop_down_rounded,
                          size: 22,
                          color: Color(0xD9FFFFFF),
                        ),
                      ],
                    ),

                    Icon(
                      Icons.arrow_forward_ios,
                      size: 16,
                      color: Color(0xD9FFFFFF),
                    ),
                  ],
                ),
              ),
            ),
          ),
        if (_selectedIndex == 2)
          Material(
            color: Colors.transparent,
            child: InkWell(
              borderRadius: BorderRadius.circular(5),
              onTap: () {
                showYearSheet(dateTime: selectDateTimeYear);
              },
              child: Container(
                width: double.maxFinite,
                padding: EdgeInsetsDirectional.symmetric(vertical: 10.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(
                      Icons.arrow_back_ios,
                      size: 16,
                      color: Color(0xD9FFFFFF),
                    ),

                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          selectDateTimeYear.yearFormatted,
                          style: TextStyle(
                            color: Color(0xD9FFFFFF),
                            fontSize: 15.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Icon(
                          Icons.arrow_drop_down_rounded,
                          size: 22,
                          color: Color(0xD9FFFFFF),
                        ),
                      ],
                    ),

                    Icon(
                      Icons.arrow_forward_ios,
                      size: 16,
                      color: Color(0xD9FFFFFF),
                    ),
                  ],
                ),
              ),
            ),
          ),
        Divider(height: 4.h, color: Colors.transparent),
      ],
    );
  }

  ///年选择
  void showYearSheet({required DateTime dateTime}) {
    Get.bottomSheet(
      CustomYearPicker(
        firstDate: DateTime(2015),
        lastDate: DateTime.now(),
        selectedDate: dateTime,
        onChanged: (value) {
          setState(() {
            selectDateTimeYear = value;
            DateTime dateTime = value;
            widget.logic.queryType = QueryType.yearly;
            DateTime start = DateTime(dateTime.year, 1, 1);
            widget.logic.startTimeStamp = start.millisecondsSinceEpoch;
            DateTime end = DateTime(dateTime.year, 13, 0);
            widget.logic.endTimeStamp = end.millisecondsSinceEpoch;
            widget.logic.date = dateTime.millisecondsSinceEpoch;
          });
          widget.logic.loadData();
        },
      ),
      ignoreSafeArea: false,
    );
  }

  ///月选择
  void showMonthSheet({required DateTime dateTime}) {
    Get.bottomSheet(
      CustomMonthPicker(
        firstDate: DateTime(2015),
        lastDate: DateTime.now(),
        selectedDate: dateTime,
        onConfirm: (value) {
          setState(() {
            selectDateTimeMonth = value;
            DateTime dateTime = value;
            widget.logic.queryType = QueryType.monthly;
            DateTime start = DateTime(dateTime.year, dateTime.month, 1);
            widget.logic.startTimeStamp = start.millisecondsSinceEpoch;
            DateTime end = DateTime(dateTime.year, dateTime.month + 1, 0);
            widget.logic.endTimeStamp = end.millisecondsSinceEpoch;
            widget.logic.date = dateTime.millisecondsSinceEpoch;
          });
          widget.logic.loadData();
        },
        onChanged: (value) {
          setState(() {
            selectDateTimeMonth = value;
          });
        },
      ),
      ignoreSafeArea: false,
    );
  }

  /// 显示时间选择器
  void showSelectTimePicker({
    required BuildContext context,
    required DateTime initDateTime,
    DateTime? minTime,
    Function(DateTime)? onConfirm,
  }) {
    DatePicker.showDatePicker(
      context,
      showTitleActions: true,
      minTime: minTime ?? DateTime(2015, 1, 1),
      maxTime: DateTime.now(),
      currentTime: initDateTime,
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
        //debugPrint('change ===>>$date');
      },
      onConfirm: (date) {
        onConfirm?.call(date);
      },
    );
  }

  Widget buildOld() => Column(
    mainAxisSize: MainAxisSize.min,
    children: [
      DefaultTabController(
        length: 3,
        child: Container(
          width: double.maxFinite,
          height: 32.h,
          clipBehavior: Clip.hardEdge,
          decoration: BoxDecoration(
            color: Colors.white12,
            borderRadius: BorderRadius.circular(100),
          ),
          padding: EdgeInsetsDirectional.all(2),
          child: TabBar(
            tabs: [
              Tab(
                child: Container(
                  width: 120.w,
                  height: 28.h,
                  padding: EdgeInsetsDirectional.symmetric(horizontal: 2),
                  alignment: Alignment.center,
                  child: Text(TKey.day.tr),
                ),
              ),

              Tab(
                child: Container(
                  width: 120.w,
                  height: 28.h,
                  padding: EdgeInsetsDirectional.symmetric(horizontal: 2),
                  alignment: Alignment.center,
                  child: Text(TKey.month.tr),
                ),
              ),

              Tab(
                child: Container(
                  width: 120.w,
                  height: 28.h,
                  padding: EdgeInsetsDirectional.symmetric(horizontal: 2),
                  alignment: Alignment.center,
                  child: Text(TKey.year.tr),
                ),
              ),
            ],
            indicatorColor: Colors.white,
            indicatorWeight: 0,
            indicatorSize: TabBarIndicatorSize.tab,
            indicatorPadding: EdgeInsets.zero,
            indicator: BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xFF43FFFF), Color(0xFF0978E9)],
              ),
              borderRadius: BorderRadius.circular(50),
            ),
            labelColor: Colors.white,
            unselectedLabelColor: Colors.white,
            labelStyle: TextStyle(
              color: Colors.blue,
              fontWeight: FontWeight.normal,
              fontSize: 14,
            ),
            unselectedLabelStyle: TextStyle(fontSize: 14),
            onTap: (index) {
              setState(() {
                _selectedIndex = index;
                widget.logic.queryType = QueryType.values[index];
                dateTime = DateTime.now().toUtc();
                if (widget.logic.queryType == QueryType.daily) {
                  widget.logic.date = dateTime.millisecondsSinceEpoch;
                  DateTime start = DateTime(dateTime.year, dateTime.month, 1);
                  widget.logic.startTimeStamp = start.millisecondsSinceEpoch;
                  DateTime end = DateTime(
                    dateTime.year,
                    dateTime.month,
                    dateTime.day + 1,
                  );
                  widget.logic.endTimeStamp = end.millisecondsSinceEpoch;
                } else if (widget.logic.queryType == QueryType.monthly) {
                  widget.logic.date = dateTime.millisecondsSinceEpoch;
                  DateTime start = DateTime(dateTime.year, dateTime.month, 1);
                  widget.logic.startTimeStamp = start.millisecondsSinceEpoch;
                  DateTime end = DateTime(
                    dateTime.year,
                    dateTime.month + 1,
                    0,
                    24,
                    0,
                    0,
                  ).subtract(Duration(microseconds: 1));
                  widget.logic.endTimeStamp = end.millisecondsSinceEpoch;
                } else if (widget.logic.queryType == QueryType.yearly) {
                  widget.logic.date = dateTime.millisecondsSinceEpoch;
                  DateTime start = DateTime(dateTime.year, 1, 1);
                  widget.logic.startTimeStamp = start.millisecondsSinceEpoch;
                  DateTime end = DateTime(
                    dateTime.year,
                    dateTime.month,
                    dateTime.day + 1,
                  );
                  widget.logic.endTimeStamp = end.millisecondsSinceEpoch;
                }
                widget.logic.loadData();
              });
            },
          ),
        ),
      ),
      Divider(height: 4.h, color: Colors.transparent),
      if (_selectedIndex == 0)
        SelectDateWidget(
          onSelect: (DateTime start, DateTime end) {
            setState(() {
              dateTime = end;
              widget.logic.queryType = QueryType.daily;
              widget.logic.startTimeStamp = start.millisecondsSinceEpoch;
              widget.logic.endTimeStamp = DateTime(
                end.year,
                end.month,
                end.day,
              ).millisecondsSinceEpoch;
              widget.logic.date = dateTime.millisecondsSinceEpoch;
            });
            widget.logic.loadData();
          },
        ),
      if (_selectedIndex == 1)
        SelectMonthWidget(
          onSelect: (DateTime selectDateTime) {
            setState(() {
              dateTime = selectDateTime;
              widget.logic.queryType = QueryType.monthly;
              DateTime start = DateTime(dateTime.year, dateTime.month, 1);
              widget.logic.startTimeStamp = start.millisecondsSinceEpoch;
              DateTime end = DateTime(dateTime.year, dateTime.month + 1, 0);
              widget.logic.endTimeStamp = end.millisecondsSinceEpoch;
              widget.logic.date = dateTime.millisecondsSinceEpoch;
            });
            widget.logic.loadData();
          },
        ),
      if (_selectedIndex == 2)
        SelectYearWidget(
          onSelect: (DateTime selectDateTime) {
            setState(() {
              dateTime = selectDateTime;
              widget.logic.queryType = QueryType.yearly;
              DateTime start = DateTime(dateTime.year, 1, 1);
              widget.logic.startTimeStamp = start.millisecondsSinceEpoch;
              DateTime end = DateTime(dateTime.year, 13, 0);
              widget.logic.endTimeStamp = end.millisecondsSinceEpoch;
              widget.logic.date = dateTime.millisecondsSinceEpoch;
            });
            widget.logic.loadData();
          },
        ),
      Divider(height: 4.h, color: Colors.transparent),
    ],
  );
}
