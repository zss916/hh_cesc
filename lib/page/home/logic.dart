part of 'index.dart';

class HomeLogic extends GetxController {
  //累计收益
  num totalIncome = 0.0;
  //当日收益
  num todayIncome = 0.0;
  //设备数量
  int deviceNum = 0;
  //站点数量
  int siteNum = 0;
  //站点容量
  num capacity = 0.0;
  //累计充电
  num totalPos = 0.0;
  //累计放电
  num totalNeg = 0.0;
  //累计光伏发电
  num totalPvNeg = 0.0;
  //co2 减排
  num co2 = 0.0;
  //煤炭
  num coal = 0.0;
  //正常站点数
  int normalNum = 0;
  //故障站点数
  int faultNum = 0;
  //告警站点数
  int alarmNum = 0;
  //中断告警数
  int cutOffNum = 0;

  @override
  void onReady() {
    super.onReady();
    loadHome();
  }

  @override
  void onClose() {
    super.onClose();
    AppLoading.dismiss();
  }

  Future<void> loadHome({bool loading = true}) async {
    if (loading) AppLoading.show();
    final (HomeStatisticEntity? data, HomeData2Entity? data2) =
        await HomeAPI.loadHomeData().whenComplete(() => AppLoading.dismiss());

    if (data != null) {
      totalIncome = data.totalIncome ?? 0.0;
      todayIncome = data.todayIncome ?? 0.0;
      deviceNum = data.deviceNum ?? 0;
      siteNum = data.siteNum ?? 0;
      capacity = data.capacity ?? 0.0;
      totalPos = data.totalPos ?? 0.0;
      totalNeg = data.totalNeg ?? 0.0;
      totalPvNeg = data.totalPvNeg ?? 0.0;
      co2 = data.co2 ?? 0.0;
      coal = data.coal ?? 0.0;
      normalNum = data.normalNum ?? 0;
      faultNum = data.faultNum ?? 0;
      alarmNum = data.alarmNum ?? 0;
      cutOffNum = data.cutOffNum ?? 0;
      update();
    }

    if (data2 != null) {
      totalIncome = data2.totalIncome ?? 0.0;
      todayIncome = data2.todayIncome ?? 0.0;
      deviceNum = data2.deviceNum ?? 0;
      siteNum = data2.siteNum ?? 0;
      capacity = data2.capacity ?? 0.0;
      totalPos = data2.totalPos ?? 0.0;
      totalNeg = data2.totalNeg ?? 0.0;
      totalPvNeg = data2.totalPvTotalNeg ?? 0.0;
      co2 = data2.co2 ?? 0.0;
      coal = data2.coal ?? 0.0;
      normalNum = data2.normalNum ?? 0;
      faultNum = data2.faultNum ?? 0;
      alarmNum = data2.alarmNum ?? 0;
      cutOffNum = data2.cutOffNum ?? 0;
      update();
    }
  }
}
