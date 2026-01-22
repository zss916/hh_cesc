import 'package:cescpro/components/common_app_bar.dart';
import 'package:cescpro/core/service/app_info_service.dart';
import 'package:cescpro/http/bean/cell_data_entity.dart';
import 'package:cescpro/page/station/detail/monitor/distribution/distribution_map_logic.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class DistributionMapPage extends StatelessWidget {
  const DistributionMapPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      bottom: AppInfoService.to.isBottomPadding,
      child: GetBuilder<DistributionMapLogic>(
        init: DistributionMapLogic(),
        builder: (logic) {
          return Scaffold(
            appBar: baseAppBar(title: logic.title ?? ""),
            backgroundColor: Color(0xFF23282E),
            body: Column(
              children: [
                if ((logic.content ?? "").isNotEmpty)
                  Container(
                    margin: EdgeInsetsDirectional.only(
                      start: 20.w,
                      end: 20.w,
                      top: 12.h,
                      bottom: 15.h,
                    ),
                    width: double.maxFinite,
                    child: Text(
                      logic.content ?? "",
                      style: TextStyle(color: Colors.white, fontSize: 12),
                    ),
                  ),

                Expanded(
                  child: Stack(
                    alignment: Alignment.topCenter,
                    children: [
                      if (logic.type == 1) buildTemp(logic),
                      if (logic.type == 2) buildSoc(logic),
                      if (logic.type == 3) buildV(logic),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget buildTemp(DistributionMapLogic logic) => ListView.separated(
    shrinkWrap: true,
    itemCount: logic.cells.length,
    padding: EdgeInsetsDirectional.only(bottom: 60.h),
    separatorBuilder: (_, i) =>
        Divider(height: 20.h, color: Colors.transparent),
    itemBuilder: (_, i) => Container(
      margin: EdgeInsets.symmetric(horizontal: 15.w),
      padding: EdgeInsetsDirectional.only(
        start: 16.w,
        end: 16.w,
        top: 20.h,
        bottom: 20.h,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Color(0xFF313540),
      ),
      width: double.maxFinite,
      child: Column(
        children: [
          Row(
            children: [
              Text(
                "Pack${i + 1}",
                style: TextStyle(fontSize: 14, color: Color(0xFFFFFFFF)),
              ),
              Spacer(),
            ],
          ),
          Divider(height: 12.h, color: Colors.transparent),
          GridView.builder(
            shrinkWrap: true,
            padding: EdgeInsets.zero,
            physics: NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4,
              mainAxisSpacing: 5.r,
              crossAxisSpacing: 5.r,
              childAspectRatio: 74 / 29,
            ),
            itemCount: (logic.cells[i].cells ?? []).length,
            itemBuilder: (context, index) {
              CellDataCells? item = (logic.cells[i].cells ?? [])[index];
              double tempColorValue =
                  ((item.temp ?? 0) - logic.cells[i].minTemp) /
                  (logic.cells[i].maxTemp - logic.cells[i].minTemp);
              return Container(
                width: double.maxFinite,
                alignment: AlignmentDirectional.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Colors.white,
                ),
                child: Container(
                  width: double.maxFinite,
                  alignment: AlignmentDirectional.center,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Colors.red.withValues(alpha: tempColorValue),
                  ),
                  child: FittedBox(
                    child: Text(
                      "${item.no}# ${item.temp}°C",
                      style: TextStyle(color: Color(0xFF1D1D1D), fontSize: 12),
                    ),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    ),
  );

  Widget buildSoc(DistributionMapLogic logic) => ListView.separated(
    shrinkWrap: true,
    itemCount: logic.cells.length,
    padding: EdgeInsetsDirectional.only(bottom: 60.h),
    separatorBuilder: (_, i) =>
        Divider(height: 20.h, color: Colors.transparent),
    itemBuilder: (_, i) => Container(
      margin: EdgeInsets.symmetric(horizontal: 15.w),
      padding: EdgeInsetsDirectional.only(
        start: 16.w,
        end: 16.w,
        top: 20.h,
        bottom: 20.h,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Color(0xFF313540),
      ),
      width: double.maxFinite,
      child: Column(
        children: [
          Row(
            children: [
              Text(
                "Pack${i + 1}",
                style: TextStyle(fontSize: 14, color: Color(0xFFFFFFFF)),
              ),
              Spacer(),
            ],
          ),
          Divider(height: 12.h, color: Colors.transparent),
          GridView.builder(
            shrinkWrap: true,
            padding: EdgeInsets.zero,
            physics: NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4,
              mainAxisSpacing: 5.r,
              crossAxisSpacing: 5.r,
              childAspectRatio: 74 / 29,
            ),
            itemCount: (logic.cells[i].cells ?? []).length,
            itemBuilder: (context, index) {
              CellDataCells? item = (logic.cells[i].cells ?? [])[index];
              return Container(
                width: double.maxFinite,
                alignment: AlignmentDirectional.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Colors.white,
                ),
                child: Container(
                  width: double.maxFinite,
                  alignment: AlignmentDirectional.center,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Color(0xFF86A3C1),
                  ),
                  child: FittedBox(
                    child: Text(
                      "${item.no}# ${item.soc}%",
                      style: TextStyle(color: Colors.white, fontSize: 12),
                    ),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    ),
  );

  Widget buildV(DistributionMapLogic logic) => ListView.separated(
    shrinkWrap: true,
    itemCount: logic.cells.length,
    padding: EdgeInsetsDirectional.only(bottom: 60.h),
    separatorBuilder: (_, i) =>
        Divider(height: 20.h, color: Colors.transparent),
    itemBuilder: (_, i) => Container(
      margin: EdgeInsets.symmetric(horizontal: 15.w),
      padding: EdgeInsetsDirectional.only(
        start: 16.w,
        end: 16.w,
        top: 20.h,
        bottom: 20.h,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Color(0xFF313540),
      ),
      width: double.maxFinite,
      child: Column(
        children: [
          Row(
            children: [
              Text(
                "Pack${i + 1}",
                style: TextStyle(fontSize: 14, color: Color(0xFFFFFFFF)),
              ),
              Spacer(),
            ],
          ),
          Divider(height: 12.h, color: Colors.transparent),
          GridView.builder(
            shrinkWrap: true,
            padding: EdgeInsets.zero,
            physics: NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4,
              mainAxisSpacing: 5.r,
              crossAxisSpacing: 5.r,
              childAspectRatio: 74 / 29,
            ),
            itemCount: (logic.cells[i].cells ?? []).length,
            itemBuilder: (context, index) {
              CellDataCells? item = (logic.cells[i].cells ?? [])[index];
              return Container(
                width: double.maxFinite,
                alignment: AlignmentDirectional.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Colors.white,
                ),
                child: Container(
                  width: double.maxFinite,
                  alignment: AlignmentDirectional.center,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Color(0xFF86A3C1),
                  ),
                  child: FittedBox(
                    child: Text(
                      "${item.no}# ${item.voltage}V",
                      style: TextStyle(color: Colors.white, fontSize: 12),
                    ),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    ),
  );
}
