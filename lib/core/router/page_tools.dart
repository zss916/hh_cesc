part of 'index.dart';

class PageTools {
  static toWeb({required String url, required String title}) =>
      Get.toNamed(APages.web, arguments: {"url": url, "title": title});

  ///登录
  static toLogin() => Get.toNamed(APages.login);

  // static offAndToNamedMain() => Get.offAndToNamed(APages.main);

  static offAndToNamedLogin() => Get.offAndToNamed(APages.login);

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
  static toMonitorDetail({required String siteId, MonitorModel? data}) =>
      Get.toNamed(
        APages.monitorDetail,
        arguments: {"data": data, 'siteId': siteId},
      );

  static toMonitorDetailV1({required String siteId, MonitorModel? data}) =>
      Get.toNamed(
        APages.monitorDetailV1,
        arguments: {"data": data, 'siteId': siteId},
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
  // static toMain() => Get.toNamed(APages.main);

  static offAllNamedMain() => Get.offAllNamed(APages.main);

  static offAndToNamedMain() => Get.offAndToNamed(APages.main);

  ///直接到站点详情
  static offAllNamedStation({int? siteId, SiteEntity? site}) => Get.offAllNamed(
    APages.stationDetail,
    arguments: {"siteId": siteId, "site": site, "toMain": true},
  );

  ///站点详情
  static toStationDetail({int? siteId, SiteEntity? site}) => Get.toNamed(
    APages.stationDetail,
    arguments: {"siteId": siteId, "site": site, "toMain": false},
  );

  ///跳到登录
  static offAllNamedSplash() => Get.offAllNamed(APages.splash);

  ///收益
  static toRevenue({int? siteId, String? location, bool? isShowTimeSlot}) =>
      Get.toNamed(
        APages.revenue,
        arguments: {
          "siteId": siteId,
          "location": location,
          "isShowTimeSlot": isShowTimeSlot,
        },
      );

  ///报告详情
  static toReportDetail({int? siteId, String? location}) => Get.toNamed(
    APages.reportDetail,
    arguments: {"siteId": siteId, "location": location},
  );

  static toEleReport({int? siteId, String? location}) => Get.toNamed(
    APages.eleReport,
    arguments: {"siteId": siteId, "location": location},
  );

  ///首页告警详情
  static toAlarmDetails(AlarmItemEntity item) =>
      Get.toNamed(APages.alarmDetails, arguments: item);
}
