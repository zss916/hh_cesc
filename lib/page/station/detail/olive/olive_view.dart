import 'package:cescpro/components/tab/kugou_tabbar.dart';
import 'package:cescpro/components/tab/rrect_indicator.dart';
import 'package:cescpro/core/translations/en.dart';
import 'package:cescpro/page/station/detail/olive/widget/olive_item_view.dart';
import 'package:cescpro/page/station/detail/statistics/widget/line_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class OliveView extends StatefulWidget {
  const OliveView({super.key});

  @override
  State<OliveView> createState() => _OliveViewState();
}

class _OliveViewState extends State<OliveView>
    with SingleTickerProviderStateMixin {
  late final TabController tabCtrl;

  @override
  void initState() {
    super.initState();
    tabCtrl = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    tabCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_new_rounded, color: Colors.white),
          onPressed: () => Get.back(),
        ),
        centerTitle: true,
        title: KuGouTabBar(
          tabs: [
            Tab(text: TKey.oliveView.tr),
            Tab(text: TKey.statistics.tr),
          ],
          controller: tabCtrl,
          labelStyle: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: Color(0xFF42FDFE),
          ),
          unselectedLabelStyle: const TextStyle(
            fontSize: 14,
            color: Colors.white,
            fontWeight: FontWeight.w500,
          ),
          isScrollable: false,
          padding: EdgeInsetsDirectional.only(end: 35),
          labelColor: Color(0xFF43FFFF),
          unselectedLabelColor: Colors.white,
          indicator: const RRecTabIndicator(
            radius: 10,
            insets: EdgeInsets.only(bottom: 0),
            color: Color(0xFF43FFFF),
          ),
          indicatorMinWidth: 40,
        ),
        backgroundColor: Colors.transparent,
      ),
      backgroundColor: Color(0xFF23282E),
      body: TabBarView(
        controller: tabCtrl,
        children: [
          OliveItemView(),
          Container(
            child: SingleChildScrollView(
              child: Column(children: [buildLineChartWidget()]),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildLineChartWidget() {
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
                  ///
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
                        "2025年1月",
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
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    color: Colors.transparent,
                    height: 270,
                    width: double.maxFinite,
                    child: LineChartWidget(),
                  ),
                  Divider(height: 5.h, color: Colors.transparent),
                  Row(
                    children: [
                      Spacer(),
                      Row(
                        children: [
                          Container(
                            width: 7,
                            height: 7,
                            margin: EdgeInsets.only(right: 5.w),
                            decoration: BoxDecoration(
                              color: Color(0xFF3874F2),
                              borderRadius: BorderRadius.circular(2),
                            ),
                          ),
                          Text(
                            "功率",
                            style: TextStyle(
                              color: Color(0xD9FFFFFF),
                              fontSize: 12.sp,
                            ),
                          ),
                        ],
                      ),
                      VerticalDivider(width: 16.w, color: Colors.transparent),
                      Row(
                        children: [
                          Container(
                            width: 7,
                            height: 7,
                            margin: EdgeInsets.only(right: 5.w),
                            decoration: BoxDecoration(
                              color: Color(0xFF0BC3C4),
                              borderRadius: BorderRadius.circular(2),
                            ),
                          ),
                          Text(
                            "SOC",
                            style: TextStyle(
                              color: Color(0xD9FFFFFF),
                              fontSize: 12.sp,
                            ),
                          ),
                        ],
                      ),
                      Spacer(),
                    ],
                  ),
                ],
              ),
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
}
