import 'package:cescpro/components/common_app_bar.dart';
import 'package:cescpro/core/enum/app_enum.dart';
import 'package:cescpro/core/helper/extension_helper.dart';
import 'package:cescpro/core/translations/en.dart';
import 'package:cescpro/core/widget/alarm_level_status_widget.dart';
import 'package:cescpro/generated/assets.dart';
import 'package:cescpro/http/bean/alarm_item_entity.dart';
import 'package:cescpro/page/main/sheet/alarm_select_sheet.dart';
import 'package:cescpro/page/station/detail/alarm/detail/alarm_detail_logic.dart';
import 'package:cescpro/page/station/detail/alarm/detail/sheet/device_select_sheet.dart';
import 'package:easy_refresh/easy_refresh.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class AlarmDetailPage extends StatelessWidget {
  const AlarmDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: baseAppBar(title: TKey.alarmDetailsData.tr),
      backgroundColor: Color(0xFF23282E),
      body: GetBuilder<AlarmDetailLogic>(
        init: AlarmDetailLogic(),
        builder: (logic) {
          return Column(
            children: [
              Container(
                decoration: BoxDecoration(color: Color(0xFF313540)),
                width: double.maxFinite,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    InkWell(
                      onTap: () {
                        showAlarmLevelSheet(
                          context: context,
                          selectLevel: logic.alarmLevel,
                          onSelect: (String alarmLevelTitle, int level) {
                            logic.alarmTitle = alarmLevelTitle;
                            logic.update();
                            logic.alarmLevel = level;
                            logic.loadData(pageNum: 1, isLoading: true);
                          },
                        );
                      },
                      child: Material(
                        color: Colors.transparent,
                        child: Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 12,
                          ),
                          child: Row(
                            children: [
                              Text(
                                logic.alarmTitle ?? TKey.alarmLevel.tr,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                ),
                              ),
                              Icon(
                                Icons.arrow_drop_down_rounded,
                                color: Color(0xA6FFFFFF),
                                size: 25,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),

                    Material(
                      color: Colors.transparent,
                      child: InkWell(
                        onTap: () {
                          showDeviceLevelSheet(
                            context: context,
                            deviceType: logic.compType,
                            onSelect: (String? deviceType) {
                              logic.compType = deviceType;
                              logic.update();
                              logic.loadData(pageNum: 1, isLoading: true);
                            },
                          );
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 12,
                          ),
                          child: Row(
                            children: [
                              Text(
                                logic.compType ?? TKey.deviceType.tr,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                ),
                              ),
                              Icon(
                                Icons.arrow_drop_down_rounded,
                                color: Color(0xA6FFFFFF),
                                size: 25,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: buildBody(viewState: logic.viewState, logic: logic),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget buildBody({required int viewState, required AlarmDetailLogic logic}) {
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

  Widget buildList({required AlarmDetailLogic logic}) => EasyRefresh(
    header: MaterialHeader(),
    onRefresh: () => logic.refreshData(),
    onLoad: () => logic.loadMoreData(),
    child: ListView.separated(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
      itemCount: logic.list.length,
      itemBuilder: (BuildContext context, int index) {
        AlarmItemEntity item = logic.list[index];
        return Container(
          width: double.maxFinite,
          padding: EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Color(0xFF313540),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Column(
            children: [
              Row(
                children: [
                  Text(
                    TKey.alarmDevice.tr,
                    style: TextStyle(fontSize: 14, color: Color(0xA6FFFFFF)),
                  ),
                  Spacer(),
                  Text(
                    item.name ?? "",
                    style: TextStyle(fontSize: 14, color: Color(0xFFFFFFFF)),
                  ),
                ],
              ),
              Divider(height: 16.h, color: Colors.transparent),
              Row(
                children: [
                  Text(
                    TKey.deviceSerialNumber.tr,
                    style: TextStyle(fontSize: 14, color: Color(0xA6FFFFFF)),
                  ),
                  Spacer(),
                  Text(
                    item.sn ?? "",
                    style: TextStyle(fontSize: 14, color: Color(0xFFFFFFFF)),
                  ),
                ],
              ),
              Divider(height: 16.h, color: Colors.transparent),
              Row(
                children: [
                  Text(
                    "${TKey.alarmLevel.tr}:",
                    style: TextStyle(fontSize: 14, color: Color(0xA6FFFFFF)),
                  ),
                  Spacer(),
                  if (item.alarmLevel != null)
                    AlarmLevelStatusWidget(level: item.alarmLevel ?? -1),
                  VerticalDivider(width: 2.w, color: Colors.transparent),
                  Text(
                    item.alarmLevelType ?? "",
                    style: TextStyle(fontSize: 14, color: Color(0xFFFFFFFF)),
                  ),
                ],
              ),
              Divider(height: 16.h, color: Colors.transparent),
              Row(
                children: [
                  Text(
                    TKey.alarmContent.tr,
                    style: TextStyle(fontSize: 14, color: Color(0xA6FFFFFF)),
                  ),
                  Spacer(),
                  Text(
                    item.content ?? "",
                    style: TextStyle(fontSize: 14, color: Color(0xFFFFFFFF)),
                  ),
                ],
              ),
              Divider(height: 16.h, color: Colors.transparent),
              Row(
                children: [
                  Text(
                    "${TKey.timeOfOccurrence.tr}:",
                    style: TextStyle(fontSize: 14, color: Color(0xA6FFFFFF)),
                  ),
                  Spacer(),
                  Text(
                    (item.startTimeMill ?? 0).timestampFormat,
                    style: TextStyle(fontSize: 14, color: Color(0xFFFFFFFF)),
                  ),
                ],
              ),
            ],
          ),
        );
      },
      separatorBuilder: (BuildContext context, int index) =>
          Divider(height: 12.h, color: Colors.transparent),
    ),
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
