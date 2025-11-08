part of 'index.dart';

class HomeLogic extends GetxController {
  HomeStatisticEntity? homeData;
  // bool isExceedThousand = false;
  num get totalIncome => homeData?.totalIncome ?? 0.0;
  num get todayIncome => homeData?.todayIncome ?? 0.0;
  int get deviceNum => homeData?.deviceNum ?? 0; //设备数量
  int get siteNum => homeData?.siteNum ?? 0; //站点数量
  num get capacity => homeData?.capacity ?? 0.0; //站点容量
  num get totalPos => homeData?.totalPos ?? 0.0; //累计充电
  num get totalNeg => homeData?.totalNeg ?? 0.0; //累计放电
  num get totalPvNeg => homeData?.totalPvNeg ?? 0.0; //累计光伏发电
  num get co2 => homeData?.co2 ?? 0.0;
  num get coal => homeData?.coal ?? 0.0;
  int get normalNum => homeData?.normalNum ?? 0; //正常站点数
  int get faultNum => homeData?.faultNum ?? 0; //故障站点数
  int get alarmNum => homeData?.alarmNum ?? 0; //告警站点数
  int get cutOffNum => homeData?.cutOffNum ?? 0; //中断告警数

  @override
  void onReady() {
    super.onReady();
    loadHome();
  }

  Future<void> loadHome() async {
    AppLoading.show();
    HomeStatisticEntity? value = await HomeAPI.postStatisticRecord()
        .whenComplete(() {
          AppLoading.dismiss();
        });
    if (value != null) {
      homeData = value;
      update();
    }
  }
}
