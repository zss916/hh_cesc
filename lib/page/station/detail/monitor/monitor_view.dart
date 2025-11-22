import 'package:cescpro/components/common_app_bar.dart';
import 'package:cescpro/core/enum/app_enum.dart';
import 'package:cescpro/core/router/index.dart';
import 'package:cescpro/core/translations/en.dart';
import 'package:cescpro/generated/assets.dart';
import 'package:cescpro/page/station/detail/monitor/monitor_logic.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class MonitorView extends StatelessWidget {
  const MonitorView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: baseAppBar(title: TKey.monitor.tr),
      backgroundColor: Color(0xFF23282E),
      body: GetBuilder<MonitorLogic>(
        init: MonitorLogic(),
        builder: (logic) {
          return buildBody(viewState: logic.viewState, logic: logic);
        },
      ),
    );
  }

  Widget buildBody({required int viewState, required MonitorLogic logic}) {
    return switch (viewState) {
      _ when viewState == ViewStateEnum.common.index => buildList(logic: logic),
      _ when viewState == ViewStateEnum.empty.index => buildEmpty(),
      _ when viewState == ViewStateEnum.loading.index => Container(
        margin: EdgeInsetsDirectional.only(bottom: 50.h),
        child: Center(child: CircularProgressIndicator()),
      ),
      _ => SizedBox.shrink(),
    };
  }

  Widget buildList({required MonitorLogic logic}) => GridView.builder(
    itemCount: logic.data.length,
    padding: EdgeInsetsDirectional.only(
      top: 12.h,
      start: 14.w,
      end: 14.w,
      bottom: 150.h,
    ),
    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: 2,
      mainAxisSpacing: 16.r,
      crossAxisSpacing: 16.r,
      childAspectRatio: 163 / 62,
    ),
    itemBuilder: (BuildContext context, int index) {
      return GestureDetector(
        onTap: () {
          PageTools.toMonitorDetail(
            siteId: "${logic.site?.id}",
            devType: logic.data[index].type,
            title: logic.data[index].title,
          );
        },
        child: Container(
          width: double.maxFinite,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0x99767E8A), Color(0x99414852)],
            ),
            borderRadius: BorderRadius.circular(10.r),
          ),
          child: Center(
            child: Text(
              logic.data[index].title,
              style: TextStyle(
                color: Colors.white,
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
      );
    },
  );

  Widget buildEmpty() => SizedBox(
    width: double.maxFinite,
    height: double.maxFinite,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(Assets.imgEmpty, width: 200, height: 95),
        Text(
          TKey.noDataAvailable.tr,
          style: TextStyle(fontSize: 18, color: Color(0xFF909399)),
        ),
        Container(
          margin: EdgeInsetsDirectional.only(top: 17.h, bottom: 120.h),
          child: Text(
            TKey.noDataAvailableTip.tr,
            style: TextStyle(fontSize: 14, color: Color(0xFF909399)),
          ),
        ),
      ],
    ),
  );
}
