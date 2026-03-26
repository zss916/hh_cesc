import 'package:cescpro/core/enum/app_enum.dart';
import 'package:cescpro/core/translations/en.dart';
import 'package:cescpro/generated/assets.dart';
import 'package:cescpro/http/bean/alarm_item_entity.dart';
import 'package:cescpro/page/alarm/index/widget/alarm_item.dart';
import 'package:cescpro/page/alarm/tab/view/history/history_alarm_logic.dart';
import 'package:cescpro/page/alarm/tab/view/widget/alarm_filter_widget.dart';
import 'package:cescpro/page/alarm/tab/view/widget/select_level_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh_simple/pull_to_refresh_simple.dart';

class HistoryAlarmView extends StatelessWidget {
  const HistoryAlarmView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HistoryAlarmLogic>(
      init: HistoryAlarmLogic(),
      builder: (logic) => Column(
        children: [
          Container(
            height: 42,
            margin: EdgeInsetsDirectional.only(top: 8.h, bottom: 8.h, start: 5),
            child: Row(
              children: [
                Expanded(
                  child: SelectLevelWidget(
                    alarmLevel: logic.alarmLevel,
                    onCall: (int? value) {
                      logic.alarmLevel = value;
                      logic.toFilter();
                    },
                  ),
                ),
                AlarmFilterWidget(alarmLevel: logic.alarmLevel),
              ],
            ),
          ),
          Expanded(
            child: buildBody(viewState: logic.viewState, logic: logic),
          ),
        ],
      ),
    );
  }

  ///建立Body
  Widget buildBody({required int viewState, required HistoryAlarmLogic logic}) {
    return switch (viewState) {
      _ when viewState == ViewStateEnum.common.index => buildList(logic: logic),
      _ when viewState == ViewStateEnum.empty.index => buildEmpty(logic: logic),
      _ when viewState == ViewStateEnum.loading.index => Container(
        margin: EdgeInsetsDirectional.only(bottom: 50.h),
        child: Center(child: CircularProgressIndicator()),
      ),
      _ => SizedBox.shrink(),
    };
  }

  Widget buildList({required HistoryAlarmLogic logic}) => SmartRefresher(
    header: MaterialClassicHeader(),
    enablePullDown: true,
    enablePullUp: true,
    enableSmartPreload: true,
    controller: logic.refreshCtrl,
    onRefresh: () {
      logic.refreshData();
    },
    onLoading: () {
      logic.loadMoreData();
    },
    child: ListView.separated(
      padding: EdgeInsetsDirectional.only(top: 10.h, bottom: 0.h),
      itemCount: logic.data.length,
      itemBuilder: (BuildContext context, int index) {
        AlarmItemEntity item = logic.data[index];
        return AlarmItem(item: item, isLast: (index + 1 == logic.data.length));
      },
      separatorBuilder: (BuildContext context, int index) =>
          const Divider(height: 16, color: Colors.transparent),
    ),
  );

  Widget buildEmpty({required HistoryAlarmLogic logic}) => SizedBox(
    width: double.maxFinite,
    height: double.maxFinite,
    child: Column(
      //mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Divider(height: 100.h, color: Colors.transparent),
        GestureDetector(
          onTap: () {
            logic.refreshData(isLoading: true);
          },
          child: Image.asset(Assets.imgEmpty, width: 200, height: 95),
        ),
        Divider(height: 10.h, color: Colors.transparent),
        Text(
          TKey.noDataAvailable.tr,
          style: TextStyle(fontSize: 20.sp, color: Color(0xFF909399)),
        ),
      ],
    ),
  );
}
