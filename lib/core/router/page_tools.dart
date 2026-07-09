part of 'index.dart';

class PageTools {
  static Future<dynamic>? toWeb({required String url, required String title}) =>
      Get.toNamed(APages.web, arguments: {"url": url, "title": title});

  ///登录
  static Future<dynamic>? toLogin() => Get.toNamed(APages.login);

  // static offAndToNamedMain() => Get.offAndToNamed(APages.main);

  static Future<dynamic>? offAndToNamedLogin() =>
      Get.offAndToNamed(APages.login);

  ///告警详情
  static Future<dynamic>? toAlarmDetail({int? siteId}) =>
      Get.toNamed(APages.alarmDetail, arguments: {"siteId": siteId});

  ///切换语言
  static Future<dynamic>? toChangeLanguage() =>
      Get.toNamed(APages.changeLanguage);

  ///消息中心
  static Future<dynamic>? toMessageCenter() =>
      Get.toNamed(APages.messageCenter);

  ///关于我们
  static Future<dynamic>? toAbout() => Get.toNamed(APages.about);

  ///反馈
  static Future<dynamic>? toFeedback() => Get.toNamed(APages.feedback);

  ///启动页
  static Future<dynamic>? toSplash() => Get.toNamed(APages.splash);

  ///监控详情
  static Future<dynamic>? toMonitorDetail({
    required String siteId,
    MonitorModel? data,
  }) => Get.toNamed(
    APages.monitorDetail,
    arguments: {"data": data, 'siteId': siteId},
  );

  static Future<dynamic>? toMonitorDetailV1({
    required String siteId,
    MonitorModel? data,
  }) => Get.toNamed(
    APages.monitorDetailV1,
    arguments: {"data": data, 'siteId': siteId},
  );

  ///监控详情
  static Future<dynamic>? toBatteryCluster({
    String? siteId,
    int? did,
    int? nodeNo,
    int? devNo,
    String? labelName,
  }) => Get.toNamed(
    APages.batteryCluster,
    arguments: {
      "devType": "CLU",
      'siteId': siteId,
      "did": did,
      "nodeNo": nodeNo,
      "devNo": devNo,
      "labelName": labelName,
    },
  );

  ///分布图
  static Future<dynamic>? toDistributionMap({
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
  static Future<dynamic>? toOliveSiteDetail({
    required int index,
    required StatisticRecordEntity statisticRecord,
  }) => Get.toNamed(
    APages.oliveSiteDetail,
    arguments: {"index": index, "statisticRecord": statisticRecord},
  );

  ///首页
  // static toMain() => Get.toNamed(APages.main);

  static Future<dynamic>? offAllNamedMain() => Get.offAllNamed(APages.main);

  static Future<dynamic>? offAndToNamedMain() => Get.offAndToNamed(APages.main);

  ///直接到站点详情
  static Future<dynamic>? offAllNamedStation({int? siteId, SiteEntity? site}) =>
      Get.offAllNamed(
        APages.stationDetail,
        arguments: {"siteId": siteId, "site": site, "toMain": true},
      );

  ///站点详情
  static Future<dynamic>? toStationDetail({int? siteId, SiteEntity? site}) =>
      Get.toNamed(
        APages.stationDetail,
        arguments: {"siteId": siteId, "site": site, "toMain": false},
      );

  ///跳到登录
  static Future<dynamic>? offAllNamedSplash() => Get.offAllNamed(APages.splash);

  ///收益
  static void toRevenue({
    int? siteId,
    String? location,
    String? siteName,
    bool? isShowTimeSlot,
    bool? isShowPv,
  }) => Get.toNamed(
    APages.revenue,
    arguments: {
      "siteId": siteId,
      "location": location,
      "name": siteName,
      "isShowTimeSlot": isShowTimeSlot,
      "isShowPv": isShowPv,
    },
  );

  ///报告详情
  static void toReportDetail({
    int? siteId,
    String? location,
    String? siteName,
  }) => Get.toNamed(
    APages.reportDetail,
    arguments: {"siteId": siteId, "location": location, "name": siteName},
  );

  static void toEleReport({
    int? siteId,
    String? location,
    String? siteName,
    bool? isShowPv,
  }) => Get.toNamed(
    APages.eleReport,
    arguments: {
      "siteId": siteId,
      "location": location,
      "name": siteName,
      'isShowPv': isShowPv,
    },
  );

  ///首页告警详情
  static void toAlarmDetails(AlarmItemEntity item) =>
      Get.toNamed(APages.alarmDetails, arguments: item);

  static void toStrategyHistory() => Get.toNamed(APages.strategyHistory);

  static void toAiPreview() => Get.toNamed(APages.aiPreview);
}
