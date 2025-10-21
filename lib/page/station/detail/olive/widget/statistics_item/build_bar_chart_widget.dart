import 'package:cescpro/core/translations/en.dart';
import 'package:cescpro/page/station/detail/olive/widget/statistics_item/bar_chart.dart';
import 'package:cescpro/page/station/detail/olive/widget/statistics_item/line_title_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class BuildBarChartWidget extends StatefulWidget {
  final String title;
  const BuildBarChartWidget({super.key, required this.title});

  @override
  State<BuildBarChartWidget> createState() => _BuildBarChartWidget();
}

class _BuildBarChartWidget extends State<BuildBarChartWidget>
    with SingleTickerProviderStateMixin {
  late final TabController tabCtrl;

  @override
  void initState() {
    super.initState();
    tabCtrl = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    tabCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: double.maxFinite,
          padding: EdgeInsetsDirectional.only(
            start: 18.w,
            end: 18.w,
            top: 16.h,
            bottom: 16.h,
          ),
          alignment: AlignmentDirectional.centerStart,
          child: Row(
            children: [
              Text(
                widget.title,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                  fontSize: 16.sp,
                ),
              ),
              Spacer(),
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
              Column(
                children: [
                  Divider(height: 30.h, color: Colors.transparent),
                  Container(
                    color: Colors.transparent,
                    height: 270,
                    width: double.maxFinite,
                    child: TabBarView(
                      controller: tabCtrl,
                      children: [
                        BarChartWidget(),
                        BarChartWidget(),
                        BarChartWidget(),
                      ],
                    ),
                  ),
                  Divider(height: 5.h, color: Colors.transparent),
                  Row(
                    children: [
                      Spacer(),
                      LineTitleWidget(
                        title: TKey.charge.tr,
                        color: Color(0xFF39FFEF),
                      ),
                      VerticalDivider(width: 16.w, color: Colors.transparent),
                      LineTitleWidget(
                        title: TKey.discharge.tr,
                        color: Color(0xFFFFC08C),
                      ),
                      Spacer(),
                    ],
                  ),
                ],
              ),

              PositionedDirectional(
                end: 10.w,
                start: 10.w,
                top: 10.h,
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
                    controller: tabCtrl,
                    tabs: [
                      Tab(
                        child: Container(
                          width: 120.w,
                          height: 28.h,
                          padding: EdgeInsetsDirectional.symmetric(
                            horizontal: 2,
                          ),
                          alignment: Alignment.center,
                          child: Text(TKey.day.tr),
                        ),
                      ),

                      Tab(
                        child: Container(
                          width: 120.w,
                          height: 28.h,
                          padding: EdgeInsetsDirectional.symmetric(
                            horizontal: 2,
                          ),
                          alignment: Alignment.center,
                          child: Text(TKey.month.tr),
                        ),
                      ),

                      Tab(
                        child: Container(
                          width: 120.w,
                          height: 28.h,
                          padding: EdgeInsetsDirectional.symmetric(
                            horizontal: 2,
                          ),
                          alignment: Alignment.center,
                          child: Text(TKey.year.tr),
                        ),
                      ),
                    ],
                    indicatorColor: Colors.white,
                    indicatorWeight: 0,
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
                      debugPrint("index ==> $index");
                    },
                  ),
                ),
              ),

              PositionedDirectional(
                start: 0.w,
                top: 50.h,
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
}
