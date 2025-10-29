part of 'index.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 0,
        leading: SizedBox.shrink(),
        backgroundColor: Colors.transparent,
      ),
      backgroundColor: Color(0xFF23282E),
      body: SingleChildScrollView(
        child: GetBuilder<HomeLogic>(
          init: HomeLogic(),
          builder: (logic) {
            return Column(
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
                Divider(height: 200, color: Colors.transparent),
              ],
            );
          },
        ),
      ),
    );
  }
}
