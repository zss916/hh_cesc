class ApiPath {
  ///国外版本
  //static const String baseUrl = "https://cloud.honghede.com/api/v1";

  ///国内版本
  static const String baseUrl = "https://ems.cescpower.com/api/v1";

  ///站点首页信息展信(海外版本)
  static const String postStatisticRecord2 =
      "/business/v2/statisticRecordAbroadApp";

  ///站点首页信息展信(国内版本)
  static const String postStatisticRecord = "/business/app/statisticRecord";

  ///获取当前登录用户信息
  static const String getInfoApp = "/business/admin/infoApp";

  static const String getInfoApp2 = "/business/admin/info";

  ///货币列表
  static const String getCurrencyList = "/business/custom/getCurrencyList";

  ///登录
  static const String postLogin = "/admin/login";

  ///登录用户下的站点列表
  static const String postPointList = "/business/site/listAllApp";

  ///站点详情
  static const String getPointDetails = "/business/site/siteInfoApp";

  /// 海外版本（昨日收益，今日放电量，今日冲电量，今日光伏发电量）
  static const String getSiteStatisticRecord2 =
      "/business/site/siteStatisticRecordAbroad";

  ///站点列表
  static const String postSiteList = "/business/site/listApp";

  static const String postSiteList2 = "/business/site/listAll";

  ///站点拓扑图
  static const String getSiteTopology = "/business/site/siteTopology";

  ///站点数据统计
  static const String getSiteStatisticRecord =
      "/business/site/siteStatisticRecord";

  ///获取光伏发电趋势数据
  static const String postPvTrend = "/business/site/getPvTrend";

  ///查询收益，充放电统计以及效率
  static const String postElecGraph = "/business/site/elecGraph";

  ///查询收益，充放电统计以及效率
  static const String postElecGraph2 = "/business/site/elecGraphAbroad";

  ///功率分析
  static const String postPowerGraph = "/business/site/powerGraph";

  ///查询告警图
  static const String postAlarmGraph = "/business/site/alarmGraph";

  ///获取组件树
  static const String getCompTree = "/business/site/compTree";

  ///电量、止度、收益报表
  static const String postStatisticReportApp =
      "/business/v2/statisticReportApp";

  ///海外版本 电量/收益报表
  static const String postStatisticReportApp2 = "/business/timePrice/list";

  ///获取协议支持的设备类型列表
  static const String getSupportDevTypesV2 =
      "/business/protocol/supportDevTypesV2";

  ///v1 版本的设备类型
  static const String getSupportDevTypesV1 =
      "/business/protocol/supportDevTypes";

  ///天气信息
  static const String postForecastApp = "/business/weather/site/forecastApp";

  ///获取单体数据
  static const String postCellData = "/business/real-time/getCellData";

  ///获取soc power曲线图数据
  static const String postSocGraph = "/business/real-time/soc-power/graph";

  ///获取power曲线图数据
  static const String postGraph = "/business/real-time/power/graph";

  ///获取实时数据组件类型列表
  static const String postComponentTypeList =
      "/business/real-time/componentTypeList";

  ///获取实时数据组卡片列表
  static const String postComponentListByDev =
      "/business/real-time/componentListByDev";

  ///实时告警数据
  static const String postRealTimePage = "/business/alarm/realTimePage";

  ///告警列表，全量
  static const String getListPageApp = "/business/alarm/listPageApp";

  ///实时告警数据分析
  static const String getAnalysis = "/business/alarm/realTimeData/analysis";

  ///获取重要告警列表
  static const String getImportantList =
      "/business/alarmSubscribe/getImportantList";

  ///查询用户消息列表
  static const String postQueryMessage = "/business/message/queryMessage";

  ///查询用户某个渠道的指定位置的未读消息
  static const String getUnreadNum = "/business/message/unreadNum";

  ///v1 获取arr
  static const String getArrInfo = "/business/device/getArrInfo";

  ///v1 获取clu
  static const String getCluInfo = "/business/device/getCluInfo";

  ///v1
  static const String getPcsInfo = "/business/device/getPcsInfo";

  ///v1
  static const String getHotMg = "/business/device/hotmg";

  ///v1
  static const String getMeterInfo = "/business/device/getMeterInfo";

  ///v1
  static const String getDidoInfo = "/business/device/getDidoInfo";

  ///v1
  static const String getCellInfo = "/business/device/getCellInfo";

  ///v1
  static const String getIdsTree = "/business/site/getIdsTree";

  ///v1
  static const String getStatsMeterInfo = "/business/device/getStatsMeterInfo";

  ///v1
  static const String getFireInfo = "/business/device/getFireInfo";
}
