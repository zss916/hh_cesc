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
        builder: (logic) {
          return RefreshIndicator(
            onRefresh: () => refresh(logic),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  IncomeWidget(
                    totalIncome: logic.totalIncome,
                    todayIncome: logic.todayIncome,
                  ),
                  BuildStationOverview(
                    capacity: logic.capacity,
                    totalPos: logic.totalPos,
                    totalNeg: logic.totalNeg,
                    totalPvNeg: logic.totalPvNeg,
                  ),
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
              ),
            ),
          );
        },
      ),
    );
  }

  Future<void> refresh(HomeLogic logic) async {
    logic.loadHome(loading: false);
    await Future.delayed(const Duration(seconds: 2));
  }
}
