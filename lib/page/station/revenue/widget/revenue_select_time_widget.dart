import 'package:cescpro/core/translations/en.dart';
import 'package:cescpro/page/station/report/widget/select_date_widget.dart';
import 'package:cescpro/page/station/report/widget/select_month_widget.dart';
import 'package:cescpro/page/station/report/widget/select_year_widget.dart';
import 'package:cescpro/page/station/revenue/index.dart';
import 'package:flutter/material.dart';
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
                    DateTime start = DateTime(dateTime.year, 1, 1);
                    widget.logic.startTimeStamp = start.millisecondsSinceEpoch;
                    DateTime end = DateTime(
                      dateTime.year,
                      dateTime.month,
                      dateTime.day + 1,
                    );
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
                  end.day + 1,
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
}
