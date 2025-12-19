import 'package:cescpro/core/translations/en.dart';
import 'package:cescpro/http/bean/child_item_info.dart';
import 'package:cescpro/page/station/detail/monitor/v1/monitor_detail_v1_logic.dart';
import 'package:cescpro/page/station/detail/monitor/v1/widget/sheet/top_item_widget2.dart';
import 'package:cescpro/page/station/detail/monitor/v1/widget/widget/real_time_child_time.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';

class StatsMeter extends StatelessWidget {
  final MonitorDetailV1Logic logic;
  const StatsMeter({super.key, required this.logic});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (logic.statsMeterValue != null) TopItemWidget2(logic: logic),
        Divider(height: 12.h, color: Colors.transparent),
        Expanded(child: buildRealTimeData(logic)),
      ],
    );
  }

  ///状态
  Widget buildStatusItem(MonitorDetailV1Logic logic) => Column(
    children: [
      Container(
        padding: EdgeInsetsDirectional.only(
          start: 18.w,
          end: 18.w,
          bottom: 16.h,
        ),
        alignment: AlignmentDirectional.centerStart,
        child: Text(
          TKey.status.tr,
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w500,
            fontSize: 16,
          ),
        ),
      ),
      Container(
        constraints: BoxConstraints(minHeight: 120.h),
        margin: EdgeInsets.symmetric(horizontal: 16.w),
        padding: EdgeInsetsDirectional.all(16.r),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Color(0xFF313540),
        ),
        width: double.maxFinite,
        child: Column(
          children: [
            if (logic.statsMeterValue?.alarmStatus != null)
              Row(
                children: [
                  Text(
                    "${TKey.alarmStatus.tr}:",
                    style: TextStyle(fontSize: 14, color: Color(0xA6FFFFFF)),
                  ),
                  Spacer(),
                  Text(
                    logic.statsMeterValue?.showAlarmStatus ?? "-",
                    style: TextStyle(
                      fontSize: 14,
                      color: (logic.statsMeterValue?.alarmStatus == true)
                          ? Color(0xFFFF4C7B)
                          : Color(0xFF46F9EC),
                    ),
                  ),
                ],
              ),

            Divider(height: 16.h, color: Colors.transparent),

            if (logic.statsMeterValue?.communicationStatus != null)
              Row(
                children: [
                  Text(
                    "${TKey.communicationStatus.tr}:",
                    style: TextStyle(fontSize: 14, color: Color(0xA6FFFFFF)),
                  ),
                  Spacer(),
                  Text(
                    logic.statsMeterValue?.showCommunicationStatus ?? "-",
                    style: TextStyle(
                      fontSize: 14,
                      color:
                          (logic.statsMeterValue?.communicationStatus == true)
                          ? Color(0xFFFF4C7B)
                          : Color(0xFF46F9EC),
                    ),
                  ),
                ],
              ),

            Divider(height: 16.h, color: Colors.transparent),

            if (logic.statsMeterValue?.statusEnNameDesc != null)
              Row(
                children: [
                  Text(
                    "${TKey.runStatus.tr}:",
                    style: TextStyle(fontSize: 14, color: Color(0xA6FFFFFF)),
                  ),
                  Spacer(),
                  Text(
                    logic.statsMeterValue?.showRunStatus ?? "-",
                    style: TextStyle(fontSize: 14, color: Color(0xFFFFFFFF)),
                  ),
                ],
              ),
          ],
        ),
      ),
    ],
  );

  ///实时数据
  Widget buildRealTimeData(MonitorDetailV1Logic logic) {
    return CustomScrollView(
      slivers: [
        if (logic.statsMeterValue != null)
          SliverToBoxAdapter(child: buildStatusItem(logic)),
        SliverToBoxAdapter(
          child: Divider(height: 12.h, color: Colors.transparent),
        ),
        if ((logic.statsMeterValue?.list ?? []).isNotEmpty)
          SliverToBoxAdapter(
            child: Container(
              padding: EdgeInsetsDirectional.only(
                bottom: 16.h,
                start: 18.w,
                end: 18.w,
              ),
              alignment: AlignmentDirectional.centerStart,
              child: Text(
                TKey.realTimeData.tr,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                ),
              ),
            ),
          ),
        if ((logic.statsMeterValue?.list ?? []).isNotEmpty)
          SliverList.separated(
            itemCount: (logic.statsMeterValue?.list ?? []).length,
            itemBuilder: (_, i) {
              ChildItemInfo item = (logic.statsMeterValue?.list ?? [])[i];
              return Container(
                width: double.maxFinite,
                margin: EdgeInsetsDirectional.symmetric(horizontal: 18.w),
                padding: EdgeInsetsDirectional.symmetric(
                  horizontal: 15,
                  vertical: 10,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Color(0xFF313540),
                ),
                child: RealTimeChildTime(
                  name: item.name,
                  value: "${item.value}",
                ),
              );
            },
            separatorBuilder: (_, int index) =>
                Divider(height: 20.h, color: Colors.transparent),
          ),
        SliverToBoxAdapter(
          child: Divider(height: 50.h, color: Colors.transparent),
        ),
      ],
    );
  }
}
