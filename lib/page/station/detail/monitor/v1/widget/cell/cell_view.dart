import 'package:cescpro/core/translations/en.dart';
import 'package:cescpro/http/bean/v1_cell_info_entity.dart';
import 'package:cescpro/page/station/detail/monitor/v1/monitor_detail_v1_logic.dart';
import 'package:cescpro/page/station/detail/monitor/v1/widget/sheet/top_item_widget2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';

class CellView extends StatelessWidget {
  final MonitorDetailV1Logic logic;
  const CellView({super.key, required this.logic});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (logic.cellValue != null) TopItemWidget2(logic: logic),
        Divider(height: 12.h, color: Colors.transparent),
        Expanded(child: buildListData(logic)),
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
            if (logic.cellValue?.alarmStatus != null)
              Row(
                children: [
                  Text(
                    "${TKey.alarmStatus.tr}:",
                    style: TextStyle(fontSize: 14, color: Color(0xA6FFFFFF)),
                  ),
                  Spacer(),
                  Text(
                    logic.cellValue?.showAlarmStatus ?? "-",
                    style: TextStyle(
                      fontSize: 14,
                      color: (logic.cellValue?.alarmStatus == true)
                          ? Color(0xFFFF4C7B)
                          : Color(0xFF46F9EC),
                    ),
                  ),
                ],
              ),

            Divider(height: 16.h, color: Colors.transparent),

            if (logic.cellValue?.communicationStatus != null)
              Row(
                children: [
                  Text(
                    "${TKey.communicationStatus.tr}:",
                    style: TextStyle(fontSize: 14, color: Color(0xA6FFFFFF)),
                  ),
                  Spacer(),
                  Text(
                    logic.cellValue?.showCommunicationStatus ?? "-",
                    style: TextStyle(
                      fontSize: 14,
                      color: (logic.cellValue?.communicationStatus == true)
                          ? Color(0xFFFF4C7B)
                          : Color(0xFF46F9EC),
                    ),
                  ),
                ],
              ),

            Divider(height: 16.h, color: Colors.transparent),

            if (logic.cellValue?.statusEnNameDesc != null)
              Row(
                children: [
                  Text(
                    "${TKey.runStatus.tr}:",
                    style: TextStyle(fontSize: 14, color: Color(0xA6FFFFFF)),
                  ),
                  Spacer(),
                  Text(
                    logic.cellValue?.showRunStatus ?? "-",
                    style: TextStyle(fontSize: 14, color: Color(0xFFFFFFFF)),
                  ),
                ],
              ),
          ],
        ),
      ),
    ],
  );

  ///列表
  Widget buildListData(MonitorDetailV1Logic logic) {
    return CustomScrollView(
      slivers: [
        if (logic.cellValue != null)
          SliverToBoxAdapter(child: buildStatusItem(logic)),
        SliverToBoxAdapter(
          child: Divider(height: 12.h, color: Colors.transparent),
        ),
        if ((logic.cellValue?.list ?? []).isNotEmpty)
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
        if ((logic.cellValue?.list ?? []).isNotEmpty)
          SliverList.separated(
            itemCount: (logic.cellValue?.list ?? []).length,
            itemBuilder: (_, i) {
              V1CellInfoList item = (logic.cellValue?.list ?? [])[i];
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
                child: Column(
                  spacing: 10.h,
                  children: [
                    Row(
                      children: [
                        Text(
                          "本地EMS",
                          style: TextStyle(color: Colors.white, fontSize: 14),
                        ),
                        Spacer(),
                        Text(
                          "${item.sn}",
                          style: TextStyle(color: Colors.white, fontSize: 14),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          "PACK",
                          style: TextStyle(color: Colors.white, fontSize: 14),
                        ),
                        Spacer(),
                        Text(
                          item.packNo ?? "-",
                          style: TextStyle(color: Colors.white, fontSize: 14),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          "单体",
                          style: TextStyle(color: Colors.white, fontSize: 14),
                        ),
                        Spacer(),
                        Text(
                          "${item.cellNo}",
                          style: TextStyle(color: Colors.white, fontSize: 14),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          "电压(V)",
                          style: TextStyle(color: Colors.white, fontSize: 14),
                        ),
                        Spacer(),
                        Text(
                          "${item.cellVol}",
                          style: TextStyle(color: Colors.white, fontSize: 14),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          "温度(°C)",
                          style: TextStyle(color: Colors.white, fontSize: 14),
                        ),
                        Spacer(),
                        Text(
                          "${item.cellTemp}",
                          style: TextStyle(color: Colors.white, fontSize: 14),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          "SOC(%)",
                          style: TextStyle(color: Colors.white, fontSize: 14),
                        ),
                        Spacer(),
                        Text(
                          "${item.cellSoc}",
                          style: TextStyle(color: Colors.white, fontSize: 14),
                        ),
                      ],
                    ),
                  ],
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
