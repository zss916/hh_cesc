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
        builder: (logic) => buildBodyUI(state: logic.state, logic: logic),
      ),
    );
  }

  Widget buildBodyUI({required UiState state, required HomeLogic logic}) {
    return switch (state) {
      Success(:final data) => AppRefreshIndicator(
        onRefresh: () => refresh(logic),
        child: SingleChildScrollView(child: buildContent(data)),
      ),
      Loading() => BuildLoading(),
      Offline() => BuildOffline(),
      _ => buildEmpty(logic),
    };
  }

  Future<void> refresh(HomeLogic logic) async {
    logic.loadData(loading: false);
    await Future.delayed(const Duration(seconds: 2));
  }

  Widget buildContent(HomeStatisticsModel data) {
    return Column(
      children: [
        if (AppState.instance.isShowRevenue())
          IncomeWidget(
            totalIncome: data.totalIncome,
            todayIncome: data.todayIncome,
            lastDayIncome: data.lastDayIncome,
          ),
        BuildStationOverview3(
          capacity: data.capacity,
          totalPos: data.totalPos,
          totalNeg: data.totalNeg,
          totalPvNeg: data.totalPvNeg,
        ),
        Divider(height: 10.h, color: Colors.transparent),
        BuildDeviceAndSiteCount(
          deviceNum: data.deviceNum,
          siteNum: data.siteNum,
        ),
        BuildStationStatus(
          normalNum: data.normalNum,
          faultNum: data.faultNum,
          alarmNum: data.alarmNum,
          cutOffNum: data.cutOffNum,
        ),
        BuildEnvironmental(co2: data.co2, coal: data.coal),
        Divider(height: 150.h, color: Colors.transparent),
      ],
    );
  }

  Widget buildEmpty(HomeLogic logic) => AppRefreshIndicator(
    onRefresh: () => refresh(logic),
    child: SingleChildScrollView(child: buildContent(HomeStatisticsModel())),
  );
}
