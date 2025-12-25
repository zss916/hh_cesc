import 'package:cescpro/core/helper/extension_helper.dart';
import 'package:cescpro/core/translations/en.dart';
import 'package:cescpro/page/station/detail/olive/widget/statistics_item/ele/widget/ele_barchart_widget.dart';
import 'package:cescpro/page/station/detail/olive/widget/statistics_item/line_title_widget.dart';
import 'package:cescpro/page/station/detail/olive/widget/statistics_item/statistics_item_logic.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class EleBarChartWidget extends StatefulWidget {
  final String title;
  final StatisticsItemLogic logic;

  const EleBarChartWidget({
    super.key,
    required this.title,
    required this.logic,
  });

  @override
  State<EleBarChartWidget> createState() => _RevenueBarChartWidget();
}

class _RevenueBarChartWidget extends State<EleBarChartWidget>
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
          child: Text(
            widget.title,
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w500,
              fontSize: 16.sp,
            ),
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
                  Divider(height: 60.h, color: Colors.transparent),

                  buildBody(viewState: widget.logic.eleViewStatus),

                  Divider(height: 5.h, color: Colors.transparent),

                  if (widget.logic.revenueList.isNotEmpty)
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
                    physics: NeverScrollableScrollPhysics(),
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
                    indicatorSize: TabBarIndicatorSize.tab,
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
                      if (index == 0) {
                        ///周
                        DateTime now = DateTime.now().toUtc();
                        DateTime end = DateTime(
                          now.year,
                          now.month,
                          now.day + 1,
                          24,
                          0,
                          0,
                        ).subtract(Duration(microseconds: 1));
                        DateTime startsSubtract = end.subtract(
                          Duration(days: 7),
                        );
                        DateTime start = DateTime(
                          startsSubtract.year,
                          startsSubtract.month,
                          startsSubtract.day,
                          0,
                          0,
                          0,
                        );
                        widget.logic.loadRevenue(
                          type: DataType.ele,
                          queryType: index,
                          startTimeStamp: start.millisecondsSinceEpoch,
                          endTimeStamp: end.millisecondsSinceEpoch,
                        );
                      } else if (index == 1) {
                        ///月
                        DateTime now = DateTime.now().toUtc();
                        DateTime start = DateTime(now.year, now.month, 1);
                        DateTime end = DateTime(
                          now.year,
                          now.month + 1,
                          0,
                          24,
                          0,
                          0,
                        ).subtract(Duration(microseconds: 1));
                        widget.logic.loadRevenue(
                          type: DataType.ele,
                          queryType: index,
                          startTimeStamp: start.millisecondsSinceEpoch,
                          endTimeStamp: end.millisecondsSinceEpoch,
                        );
                      } else if (index == 2) {
                        ///年
                        DateTime now = DateTime.now().toUtc();
                        DateTime start = DateTime(now.year, 1, 1);
                        DateTime end = DateTime(
                          now.year,
                          13,
                          0,
                          24,
                          0,
                          0,
                        ).subtract(Duration(microseconds: 1));
                        debugPrint(
                          "start:${start.timestampFormat},end:${end.timestampFormat}",
                        );
                        widget.logic.loadRevenue(
                          type: DataType.ele,
                          queryType: index,
                          startTimeStamp: start.millisecondsSinceEpoch,
                          endTimeStamp: end.millisecondsSinceEpoch,
                        );
                      }
                    },
                  ),
                ),
              ),

              if (widget.logic.revenueList.isNotEmpty)
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

  Widget buildBody({required int viewState}) {
    return switch (viewState) {
      _ when viewState == ViewType.loading.index => buildLoading(),
      _ when viewState == ViewType.common.index => buildEle(),
      _ when viewState == ViewType.empty.index => buildEmpty(),
      _ => buildEmpty(),
    };
  }

  Widget buildEle() {
    return Container(
      color: Colors.transparent,
      height: 280.h,
      width: double.maxFinite,
      child: TabBarView(
        physics: NeverScrollableScrollPhysics(),
        controller: tabCtrl,
        children: [
          ///周
          EleBarchartItemWidget(
            data: widget.logic.revenueList
                .map((e) => (e.totalCharge ?? 0))
                .toList(),
            data2: widget.logic.revenueList
                .map((e) => (e.totalRecharge ?? 0))
                .toList(),
            labels: widget.logic.eleLabels,
            maxY: widget.logic.eleMaxY ?? 0,
          ),

          ///月
          EleBarchartItemWidget(
            data: widget.logic.revenueList
                .map((e) => (e.totalCharge ?? 0))
                .toList(),
            data2: widget.logic.revenueList
                .map((e) => (e.totalRecharge ?? 0))
                .toList(),
            labels: widget.logic.eleLabels,
            maxY: widget.logic.eleMaxY ?? 0,
          ),

          ///年
          EleBarchartItemWidget(
            data: widget.logic.revenueList
                .map((e) => (e.totalCharge ?? 0))
                .toList(),
            data2: widget.logic.revenueList
                .map((e) => (e.totalRecharge ?? 0))
                .toList(),
            labels: widget.logic.eleLabels,
            maxY: widget.logic.eleMaxY ?? 0,
          ),
        ],
      ),
    );
  }

  Widget buildLoading() => SizedBox(
    height: 280.h,
    width: double.maxFinite,
    child: Center(child: CircularProgressIndicator(color: Colors.white)),
  );

  Widget buildEmpty() => Container(
    color: Colors.transparent,
    height: 280.h,
    width: double.maxFinite,
    child: TabBarView(
      physics: NeverScrollableScrollPhysics(),
      controller: tabCtrl,
      children: [
        ///周
        EleBarchartItemWidget(data: [], data2: [], labels: [], maxY: 0),

        ///月
        EleBarchartItemWidget(data: [], data2: [], labels: [], maxY: 0),

        ///年
        EleBarchartItemWidget(data: [], data2: [], labels: [], maxY: 0),
      ],
    ),
  );
}
