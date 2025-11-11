part of 'index.dart';

class PageTools {
  ///登录
  static toLogin() => Get.toNamed(APages.login);

  static offAndToNamedLogin() => Get.offAndToNamed(APages.login);

  ///站点详情
  static toStationDetail({int? siteId}) =>
      Get.toNamed(APages.stationDetail, arguments: {"siteId": siteId});

  ///告警详情
  static toAlarmDetail({int? siteId}) =>
      Get.toNamed(APages.alarmDetail, arguments: {"siteId": siteId});

  ///切换语言
  static toChangeLanguage() => Get.toNamed(APages.changeLanguage);

  ///消息中心
  static toMessageCenter() => Get.toNamed(APages.messageCenter);

  ///关于我们
  static toAbout() => Get.toNamed(APages.about);

  ///反馈
  static toFeedback() => Get.toNamed(APages.feedback);

  ///启动页
  static toSplash() => Get.toNamed(APages.splash);

  ///监控详情
  static toMonitorDetail() => Get.toNamed(APages.monitorDetail);

  ///监控详情
  static toBatteryCluster() => Get.toNamed(APages.batteryCluster);

  ///分布图
  static toDistributionMap() => Get.toNamed(APages.distributionMap);

  ///概览电站详情
  static toOliveSiteDetail({
    required int index,
    required StatisticRecordEntity statisticRecord,
  }) => Get.toNamed(
    APages.oliveSiteDetail,
    arguments: {"index": index, "statisticRecord": statisticRecord},
  );

  ///报告详情
  static toReportDetail() => Get.toNamed(APages.reportDetail);

  ///首页
  static toMain() => Get.toNamed(APages.main);

  static offAllNamedMain() => Get.offAllNamed(APages.main);

  ///跳到登录
  static offAllNamedSplash() => Get.offAllNamed(APages.splash);
}
