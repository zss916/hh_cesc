part of 'index.dart';

class HistoryAlarmView extends StatelessWidget {
  const HistoryAlarmView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HistoryAlarmLogic>(
      init: HistoryAlarmLogic(),
      builder: (logic) => buildBodyUI(state: logic.state, logic: logic),
    );
  }

  ///建立Body
  Widget buildBodyUI({
    required UiState state,
    required HistoryAlarmLogic logic,
  }) {
    return switch (state) {
      Success(:final data) => buildPage(
        child: buildList(data: data, logic: logic),
        logic: logic,
      ),
      Empty() => buildPage(
        child: buildEmpty(logic: logic),
        logic: logic,
      ),
      Loading() => BuildLoading(),
      Offline() => BuildOffline(),
      Failure() => SizedBox.shrink(),
    };
  }

  Widget buildPage({required Widget child, required HistoryAlarmLogic logic}) {
    return Column(
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
                    logic.update();
                    logic.toFilter();
                  },
                ),
              ),
              AlarmFilterWidget(
                alarmLevel: logic.alarmLevel,
                onFilter: () {
                  AppEventBus.eventBus.fire(
                    OpenDrawerEvent(
                      DrawerTypeEnum.historyAlarm.index,
                      alarmLevel: logic.alarmLevel,
                    ),
                  );
                },
              ),
            ],
          ),
        ),
        Expanded(child: child),
      ],
    );
  }

  Widget buildList({
    required List<AlarmItemEntity> data,
    required HistoryAlarmLogic logic,
  }) => SmartRefresher(
    header: MaterialClassicHeader(),
    footer: BuildFooter(),
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
      itemCount: data.length,
      itemBuilder: (BuildContext context, int index) {
        AlarmItemEntity item = data[index];
        return AlarmItem(item: item, isLast: (index + 1 == data.length));
      },
      separatorBuilder: (BuildContext context, int index) =>
          const Divider(height: 16, color: Colors.transparent),
    ),
  );

  Widget buildEmpty({required HistoryAlarmLogic logic}) => SizedBox(
    width: double.maxFinite,
    height: double.maxFinite,
    child: Column(
      children: [
        Divider(height: 100.h, color: Colors.transparent),
        GestureDetector(
          onTap: () {
            AppEventBus.eventBus.fire(NetWorkRefresh());
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
