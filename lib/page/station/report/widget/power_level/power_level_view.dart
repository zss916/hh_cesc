import 'package:cescpro/page/station/report/widget/power_level/build_select_time_widget.dart';
import 'package:cescpro/page/station/report/widget/power_level/power_level_logic.dart';
import 'package:cescpro/page/station/report/widget/power_level_table.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class PowerLevelView extends StatelessWidget {
  const PowerLevelView({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        width: double.maxFinite,
        padding: EdgeInsetsDirectional.symmetric(
          horizontal: 10.w,
          vertical: 15.h,
        ),
        margin: EdgeInsetsDirectional.only(
          top: 12.h,
          bottom: 100.h,
          start: 16.w,
          end: 16.w,
        ),
        decoration: BoxDecoration(
          color: Color(0xFF313540),
          borderRadius: BorderRadius.circular(14.r),
        ),
        child: GetBuilder<PowerLevelLogic>(
          init: PowerLevelLogic(),
          builder: (logic) {
            return Column(
              children: [
                Container(
                  margin: EdgeInsetsDirectional.only(bottom: 15.h),
                  width: double.maxFinite,
                  child: Text(
                    logic.location ?? "",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ),
                BuildSelectTimeWidget(logic: logic),
                PowerLevelTableWidget(
                  data: logic.list,
                  queryType: logic.queryType,
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
