part of 'index.dart';

class HomeLogic extends GetxController {
  num totalIncome = 0.0;
  num todayIncome = 0.0;
  bool isExceedThousand = false;
  int deviceNum = 0; //设备数量
  int siteNum = 0; //站点数量
  num capacity = 0.0; //站点容量
  num totalPos = 0.0; //累计充电
  num totalNeg = 0.0; //累计放电
  num totalPvNeg = 0.0; //累计光伏发电
  num co2 = 0.0;
  num coal = 0.0;
  int normalNum = 0; //正常站点数
  int faultNum = 0; //故障站点数
  int alarmNum = 0; //告警站点数
  int cutOffNum = 0; //中断告警数

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
      totalIncome = value.totalIncome ?? 0.0;
      todayIncome = value.todayIncome ?? 0.0;
      capacity = value.capacity ?? 0.0;
      totalPos = value.totalPos ?? 0.0;
      totalNeg = value.totalNeg ?? 0.0;
      totalPvNeg = value.totalPvNeg ?? 0.0;
      deviceNum = value.deviceNum ?? 0;
      siteNum = value.siteNum ?? 0;
      co2 = value.co2 ?? 0.0;
      coal = value.coal ?? 0.0;
      normalNum = value.normalNum ?? 0;
      faultNum = value.faultNum ?? 0;
      alarmNum = value.alarmNum ?? 0;
      cutOffNum = value.cutOffNum ?? 0;
      update();
    }
  }
}
