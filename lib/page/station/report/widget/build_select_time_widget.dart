import 'package:cescpro/core/translations/en.dart';
import 'package:cescpro/page/station/report/widget/select_date_widget.dart';
import 'package:cescpro/page/station/report/widget/select_month_widget.dart';
import 'package:cescpro/page/station/report/widget/select_year_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class BuildSelectTimeWidget extends StatefulWidget {
  const BuildSelectTimeWidget({super.key});

  @override
  State<BuildSelectTimeWidget> createState() => _BuildSelectTimeWidgetState();
}

class _BuildSelectTimeWidgetState extends State<BuildSelectTimeWidget> {
  int _selectedIndex = 0;

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
                });
              },
            ),
          ),
        ),
        Divider(height: 4.h, color: Colors.transparent),
        if (_selectedIndex == 0) SelectDateWidget(),
        if (_selectedIndex == 1) SelectMonthWidget(),
        if (_selectedIndex == 2) SelectYearWidget(),
        Divider(height: 4.h, color: Colors.transparent),
      ],
    );
  }
}
