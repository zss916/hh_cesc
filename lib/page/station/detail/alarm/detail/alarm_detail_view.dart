part of 'index.dart';

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
              buildTopSelect(logic),
              Expanded(
                child: buildBodyUI(state: logic.state, logic: logic),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget buildBodyUI({
    required UiState state,
    required AlarmDetailLogic logic,
  }) {
    return switch (state) {
      Success(:final data) => buildContent(data: data, logic: logic),
      Empty() => buildEmpty,
      Loading() => buildLoading,
      Offline() => buildOffline,
      Failure() => SizedBox.shrink(),
    };
  }

  Widget buildTopSelect(AlarmDetailLogic logic) {
    return Container(
      decoration: BoxDecoration(color: Color(0xFF313540)),
      width: double.maxFinite,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          InkWell(
            onTap: () {
              showAlarmLevelSheet(
                selectLevel: logic.alarmLevel,
                onSelect: (String? alarmLevelTitle, int? level) {
                  logic.alarmTitle = alarmLevelTitle;
                  logic.update();
                  logic.alarmLevel = level;
                  logic.fetchData(pageNum: 1, isLoading: true);
                },
              );
            },
            child: Material(
              color: Colors.transparent,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                child: Row(
                  children: [
                    Text(
                      logic.alarmTitle ?? TKey.alarmLevel.tr,
                      style: TextStyle(color: Colors.white, fontSize: 14),
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
                  deviceType: logic.compType,
                  onSelect: (String? deviceType) {
                    logic.compType = deviceType;
                    logic.update();
                    logic.fetchData(pageNum: 1, isLoading: true);
                  },
                );
              },
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                child: Row(
                  children: [
                    Text(
                      logic.compType ?? TKey.deviceType.tr,
                      style: TextStyle(color: Colors.white, fontSize: 14),
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
    );
  }

  Widget buildContent({
    required List<AlarmItemEntity> data,
    required AlarmDetailLogic logic,
  }) => SmartRefresher(
    header: MaterialClassicHeader(),
    footer: BuildFooter(),
    enablePullDown: true,
    enablePullUp: true,
    controller: logic.refreshCtrl,
    onRefresh: () {
      logic.refreshData();
    },
    onLoading: () {
      logic.loadMoreData();
    },
    child: ListView.separated(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
      itemCount: data.length,
      separatorBuilder: (BuildContext context, int index) =>
          Divider(height: 12.h, color: Colors.transparent),
      itemBuilder: (BuildContext context, int index) {
        AlarmItemEntity item = data[index];
        return buildItem(item);
      },
    ),
  );

  Widget buildItem(AlarmItemEntity item) {
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
                item.showName,
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
                TKey.alarmLevel.tr,
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
          SizedBox(
            width: double.maxFinite,
            child: Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: TKey.alarmContent.tr,
                    children: [
                      WidgetSpan(child: SizedBox(width: 20.w)),
                      TextSpan(
                        style: TextStyle(
                          color: const Color(0xFFFFFFFF),
                          fontSize: 14,
                        ),
                        text: item.content ?? "",
                      ),
                    ],
                    style: TextStyle(fontSize: 14, color: Color(0xA6FFFFFF)),
                  ),
                ],
              ),
              textAlign: TextAlign.start,
            ),
          ),

          /*SizedBox(
                width: double.maxFinite,
                child: Wrap(
                  children: [
                    Container(
                      margin: EdgeInsetsDirectional.only(end: 20.w),
                      child: Text(
                        TKey.alarmContent.tr,
                        style: TextStyle(
                          fontSize: 14,
                          color: Color(0xA6FFFFFF),
                        ),
                      ),
                    ),
                    // Spacer(),
                    Text(

                      item.content ?? "",
                      style: TextStyle(fontSize: 14, color: Color(0xFFFFFFFF)),
                    ),
                  ],
                ),
              ),*/
          Divider(height: 16.h, color: Colors.transparent),
          Row(
            children: [
              Text(
                TKey.timeOfOccurrence.tr,
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
  }

  Widget get buildOffline => Container(
    alignment: AlignmentDirectional.center,
    margin: EdgeInsetsDirectional.only(bottom: 150),
    child: OfflineOnRefresh(
      onCall: () {
        AppEventBus.eventBus.fire(NetWorkRefresh());
      },
    ),
  );

  Widget get buildLoading => Container(
    margin: EdgeInsetsDirectional.only(bottom: 50.h),
    child: Center(child: CescGlowLoading()),
  );

  Widget get buildEmpty => SizedBox(
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
