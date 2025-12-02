part of 'index.dart';

class APages {
  static const login = '/login';
  static const stationDetail = '/station_detail';
  static const messageCenter = '/message_center';
  static const webview = '/webview';
  static const changeLanguage = '/change_language';
  static const about = '/about';
  static const feedback = '/feedback';
  static const splash = '/splash';
  static const alarmDetail = '/alarmDetail';
  static const monitorDetail = '/monitorDetail';
  static const batteryCluster = '/batteryCluster';
  static const distributionMap = '/distributionMap';
  static const oliveSiteDetail = '/oliveSiteDetail';
  static const reportDetail = '/reportDetail';
  static const main = '/main';
  static const revenue = '/revenue';
  static const web = '/web';

  static final List<GetPage> routes = [
    /// 登录
    GetPage(name: login, page: () => LoginPage()),

    /// 站点详情
    GetPage(name: stationDetail, page: () => StationDetailPage()),

    /// 消息中心
    GetPage(name: messageCenter, page: () => MessageCenterPage()),

    /// 切换语言
    GetPage(name: changeLanguage, page: () => ChangeLanguagePage()),

    ///关于我们
    GetPage(name: about, page: () => AboutPage()),

    ///问题反馈
    GetPage(name: feedback, page: () => FeedbackPage()),

    ///启动页
    GetPage(name: splash, page: () => SplashPage(), binding: SplashBinding()),

    ///告警详情数据
    GetPage(name: alarmDetail, page: () => AlarmDetailPage()),

    ///监控详情
    GetPage(name: monitorDetail, page: () => MonitorDetailPage()),

    ///电池集群
    GetPage(name: batteryCluster, page: () => BatteryClusterPage()),

    ///分布图
    GetPage(name: distributionMap, page: () => DistributionMapPage()),

    ///概览电站详情
    GetPage(name: oliveSiteDetail, page: () => OliveSiteDetailPage()),

    ///报告详情
    GetPage(name: reportDetail, page: () => ReportDetailPage()),

    /// 首页
    GetPage(name: main, page: () => MainPage()),

    /// 收益
    GetPage(name: revenue, page: () => RevenuePage()),

    ///web
    GetPage(name: web, page: () => WebPage()),
  ];
}
