part of 'index.dart';

class PageTools {
  ///登录
  static toLogin() => Get.toNamed(APages.login);

  static offAndToNamedMain() => Get.offAndToNamed(APages.main);

  static offAndToNamedLogin() => Get.offAndToNamed(APages.login);

  ///站点详情
  static toStationDetail({int? siteId, SiteEntity? site}) => Get.toNamed(
    APages.stationDetail,
    arguments: {"siteId": siteId, "site": site},
  );

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
  static toMonitorDetail({
    required String siteId,
    required String devType,
    required String title,
  }) => Get.toNamed(
    APages.monitorDetail,
    arguments: {"title": title, "devType": devType, 'siteId': siteId},
  );

  ///监控详情
  static toBatteryCluster({
    String? siteId,
    int? did,
    int? nodeNo,
    int? devNo,
  }) => Get.toNamed(
    APages.batteryCluster,
    arguments: {
      "devType": "CLU",
      'siteId': siteId,
      "did": did,
      "nodeNo": nodeNo,
      "devNo": devNo,
    },
  );

  ///分布图
  static toDistributionMap({
    required String title,
    required String content,
    String? siteId,
    int? did,
    int? nodeNo,
    int? devNo,
    int? type,
  }) => Get.toNamed(
    APages.distributionMap,
    arguments: {
      "title": title,
      "content": content,
      "siteId": siteId,
      "did": did,
      "nodeNo": nodeNo,
      "devNo": devNo,
      "type": type,
    },
  );

  ///概览电站详情
  static toOliveSiteDetail({
    required int index,
    required StatisticRecordEntity statisticRecord,
  }) => Get.toNamed(
    APages.oliveSiteDetail,
    arguments: {"index": index, "statisticRecord": statisticRecord},
  );

  ///首页
  static toMain() => Get.toNamed(APages.main);

  static offAllNamedMain() => Get.offAllNamed(APages.main);

  ///跳到登录
  static offAllNamedSplash() => Get.offAllNamed(APages.splash);

  ///收益
  static toRevenue({int? siteId, String? location}) => Get.toNamed(
    APages.revenue,
    arguments: {"siteId": siteId, "location": location},
  );

  ///报告详情
  static toReportDetail({int? siteId, String? location}) => Get.toNamed(
    APages.reportDetail,
    arguments: {"siteId": siteId, "location": location},
  );
}
