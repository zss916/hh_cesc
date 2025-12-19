import 'package:cescpro/core/translations/en.dart';
import 'package:cescpro/http/bean/child_item_info.dart';
import 'package:cescpro/page/station/detail/monitor/v1/monitor_detail_v1_logic.dart';
import 'package:cescpro/page/station/detail/monitor/v1/widget/sheet/top_item_widget2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';

class DidoView extends StatelessWidget {
  final MonitorDetailV1Logic logic;
  const DidoView({super.key, required this.logic});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TopItemWidget2(logic: logic),
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
            if (logic.didoValue?.alarmStatus != null)
              Row(
                children: [
                  Text(
                    "${TKey.alarmStatus.tr}:",
                    style: TextStyle(fontSize: 14, color: Color(0xA6FFFFFF)),
                  ),
                  Spacer(),
                  Text(
                    logic.didoValue?.showAlarmStatus ?? "-",
                    style: TextStyle(
                      fontSize: 14,
                      color: (logic.didoValue?.alarmStatus == true)
                          ? Color(0xFFFF4C7B)
                          : Color(0xFF46F9EC),
                    ),
                  ),
                ],
              ),

            Divider(height: 16.h, color: Colors.transparent),

            if (logic.didoValue?.communicationStatus != null)
              Row(
                children: [
                  Text(
                    "${TKey.communicationStatus.tr}:",
                    style: TextStyle(fontSize: 14, color: Color(0xA6FFFFFF)),
                  ),
                  Spacer(),
                  Text(
                    logic.didoValue?.showCommunicationStatus ?? "-",
                    style: TextStyle(
                      fontSize: 14,
                      color: (logic.didoValue?.communicationStatus == true)
                          ? Color(0xFFFF4C7B)
                          : Color(0xFF46F9EC),
                    ),
                  ),
                ],
              ),

            Divider(height: 16.h, color: Colors.transparent),

            if (logic.didoValue?.statusEnNameDesc != null)
              Row(
                children: [
                  Text(
                    "${TKey.runStatus.tr}:",
                    style: TextStyle(fontSize: 14, color: Color(0xA6FFFFFF)),
                  ),
                  Spacer(),
                  Text(
                    logic.didoValue?.showRunStatus ?? "-",
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
        SliverToBoxAdapter(child: buildStatusItem(logic)),
        SliverToBoxAdapter(
          child: Divider(height: 12.h, color: Colors.transparent),
        ),
        SliverToBoxAdapter(
          child: Container(
            padding: EdgeInsetsDirectional.only(
              bottom: 16.h,
              start: 18.w,
              end: 18.w,
            ),
            alignment: AlignmentDirectional.centerStart,
            child: Row(
              children: [
                Container(
                  margin: REdgeInsetsDirectional.only(end: 10.w),
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(60),
                  ),
                  width: 10,
                  height: 10,
                ),
                Text(
                  "DI",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                  ),
                ),
                VerticalDivider(width: 10.w, color: Colors.transparent),
                Spacer(),
                Wrap(
                  spacing: 10.w,
                  children: [
                    buildTitle(
                      title: TKey.notTriggered.tr,
                      color: Colors.green,
                    ),

                    buildTitle(title: TKey.triggered.tr, color: Colors.red),

                    buildTitle(title: TKey.unknown.tr, color: Colors.grey),
                  ],
                ),
              ],
            ),
          ),
        ),
        SliverList.separated(
          itemCount: (logic.didoValue?.diList ?? []).length,
          itemBuilder: (_, i) {
            ChildItemInfo item = (logic.didoValue?.diList ?? [])[i];
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
              child: Row(
                children: [
                  Text(
                    item.name ?? "-",
                    style: TextStyle(color: Colors.white, fontSize: 14),
                  ),
                  Spacer(),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: colorMap[item.value],
                    ),
                    width: 10,
                    height: 10,
                  ),
                ],
              ),
            );
          },
          separatorBuilder: (_, int index) =>
              Divider(height: 20.h, color: Colors.transparent),
        ),
        SliverToBoxAdapter(
          child: Divider(height: 12.h, color: Colors.transparent),
        ),
        SliverToBoxAdapter(
          child: Container(
            padding: EdgeInsetsDirectional.only(
              bottom: 16.h,
              start: 18.w,
              end: 18.w,
            ),
            alignment: AlignmentDirectional.centerStart,
            child: Row(
              children: [
                Container(
                  margin: REdgeInsetsDirectional.only(end: 10.w),
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(60),
                  ),
                  width: 10,
                  height: 10,
                ),
                Text(
                  "DO",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                  ),
                ),
                Spacer(),
                Wrap(
                  spacing: 10.w,
                  children: [
                    buildTitle(
                      title: TKey.notTriggered.tr,
                      color: Colors.green,
                    ),

                    buildTitle(title: TKey.triggered.tr, color: Colors.red),

                    buildTitle(title: TKey.unknown.tr, color: Colors.grey),
                  ],
                ),
              ],
            ),
          ),
        ),
        SliverList.separated(
          itemCount: (logic.didoValue?.doList ?? []).length,
          itemBuilder: (_, i) {
            ChildItemInfo item = (logic.didoValue?.doList ?? [])[i];
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
              child: Row(
                children: [
                  Text(
                    item.name ?? "-",
                    style: TextStyle(color: Colors.white, fontSize: 14),
                  ),
                  Spacer(),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: colorMap[item.value],
                    ),
                    width: 10,
                    height: 10,
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

const colorMap = {2: Colors.grey, 1: Colors.red, 0: Colors.green};

Widget buildTitle({required String title, required Color color}) => Row(
  children: [
    Container(
      margin: EdgeInsetsDirectional.only(end: 5.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        color: color,
      ),
      width: 6,
      height: 6,
    ),
    Text(title, style: TextStyle(color: color, fontSize: 10)),
  ],
);
