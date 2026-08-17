part of 'index.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 0,
        leading: SizedBox.shrink(),
        backgroundColor: Colors.transparent,
      ),
      backgroundColor: Color(0xFF23282E),
      body: GetBuilder<HomeLogic>(
        init: HomeLogic(),
        builder: (logic) => buildBody(viewState: logic.viewState, logic: logic),
      ),
    );
  }

  Widget buildBody({
    required ViewStateEnum viewState,
    required HomeLogic logic,
  }) {
    return switch (viewState) {
      ViewStateEnum.common => RefreshIndicator(
        color: Colors.white,
        backgroundColor: Colors.black,
        onRefresh: () => refresh(logic),
        child: SingleChildScrollView(child: buildContent(logic)),
      ),
      ViewStateEnum.loading => buildLoading,
      ViewStateEnum.offline => buildOffline,
      ViewStateEnum.error => SizedBox.shrink(),
      ViewStateEnum.empty => SizedBox.shrink(),
    };
  }

  Widget buildContent(HomeLogic logic) {
    return Column(
      children: [
        if (AppState.instance.isShowRevenue())
          IncomeWidget(
            totalIncome: logic.totalIncome,
            todayIncome: logic.todayIncome,
            lastDayIncome: logic.lastDayIncome,
          ),
        BuildStationOverview3(
          capacity: logic.capacity,
          totalPos: logic.totalPos,
          totalNeg: logic.totalNeg,
          totalPvNeg: logic.totalPvNeg,
        ),
        Divider(height: 10.h, color: Colors.transparent),
        BuildDeviceAndSiteCount(
          deviceNum: logic.deviceNum,
          siteNum: logic.siteNum,
        ),
        BuildStationStatus(
          normalNum: logic.normalNum,
          faultNum: logic.faultNum,
          alarmNum: logic.alarmNum,
          cutOffNum: logic.cutOffNum,
        ),
        BuildEnvironmental(co2: logic.co2, coal: logic.coal),
        Divider(height: 150.h, color: Colors.transparent),
      ],
    );
  }

  Widget get buildLoading => Container(
    alignment: AlignmentDirectional.center,
    margin: EdgeInsetsDirectional.only(bottom: 50.h),
    child: CescGlowLoading(),
  );

  Widget get buildOffline => Center(
    child: OfflineOnRefresh(
      onCall: () {
        AppEventBus.eventBus.fire(NetWorkRefresh());
      },
    ),
  );

  Future<void> refresh(HomeLogic logic) async {
    logic.loadData(loading: false);
    await Future.delayed(const Duration(seconds: 2));
  }
}
