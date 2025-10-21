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
        child: Column(
          children: [
            buildTotal(),
            buildStationOverview(),
            buildDeviceAndStationNum(),
            buildStationStatus(),
            buildEnvironmentalValue(),
            Divider(height: 200, color: Colors.transparent),
          ],
        ),
      ),
    );
  }

  Widget buildTotal() {
    return Container(
      width: double.maxFinite,
      height: 125,
      padding: EdgeInsetsDirectional.all(15),
      margin: EdgeInsetsDirectional.only(
        start: 16.w,
        end: 16.w,
        top: 16.h,
        bottom: 16.h,
      ),
      decoration: BoxDecoration(
        color: Color(0xFF313540),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          Expanded(
            child: Container(
              //color: Colors.amber,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "56.3700011111",
                    maxLines: 1,
                    style: TextStyle(
                      fontSize: 36.sp,
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    TKey.totalRevenue.trArgs([TKey.moneyWUnit.tr]),
                    style: TextStyle(fontSize: 14.sp, color: Color(0xA6FFFFFF)),
                  ),
                ],
              ),
            ),
          ),
          VerticalDivider(width: 10, color: Colors.transparent),
          Expanded(
            child: Container(
              //color: Colors.blue,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "4827.21",
                    maxLines: 1,
                    style: TextStyle(
                      fontSize: 36.sp,
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    TKey.currentRevenue.trArgs([TKey.moneyUnit.tr]),
                    style: TextStyle(fontSize: 14.sp, color: Color(0xA6FFFFFF)),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildStationOverview() {
    return Column(
      children: [
        Container(
          margin: EdgeInsetsDirectional.only(start: 18.w, end: 18.w, top: 9.h),
          width: double.maxFinite,
          child: Text(
            TKey.stationOverview.tr,
            style: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.w500,
              color: Colors.white,
            ),
          ),
        ),
        Container(
          width: double.maxFinite,
          height: 126.h,
          margin: EdgeInsetsDirectional.only(top: 10.h, bottom: 10.h),
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              SizedBox(width: 16),
              buildItem(),

              SizedBox(width: 8),

              buildItem2(),

              SizedBox(width: 8),

              buildItem3(),

              SizedBox(width: 8),

              buildItem4(),

              SizedBox(width: 16),
            ],
          ),
        ),
      ],
    );
  }

  Widget buildItem() {
    return Container(
      margin: EdgeInsetsDirectional.only(top: 6.h, bottom: 6.h),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: AlignmentDirectional.topStart,
          end: AlignmentDirectional.bottomEnd,
          colors: [Color(0xFFFE7016), Color(0xFFF79A4C)],
        ),
        borderRadius: BorderRadius.circular(18),
        boxShadow: [
          BoxShadow(
            color: Color(0xFFFD7821),
            offset: Offset(0.1, 0.1),
            blurRadius: 8,
          ),
        ],
      ),
      width: 148.w,
      height: 126.h,
      child: Stack(
        alignment: Alignment.center,
        children: [
          PositionedDirectional(
            bottom: -8,
            end: -5,
            child: Image.asset(
              Assets.imgEnergyStorage,
              width: 78,
              height: 79,
              matchTextDirection: true,
            ),
          ),

          Container(
            padding: EdgeInsetsDirectional.all(14),
            child: Column(
              children: [
                Container(
                  margin: EdgeInsetsDirectional.only(top: 2),
                  width: double.maxFinite,
                  child: Text(
                    TKey.energyStorageInstalledCapacity.tr,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(color: Color(0xCCFFFFFF), fontSize: 14.sp),
                  ),
                ),
                SizedBox(
                  width: double.maxFinite,
                  child: Text(
                    "(kWh)",
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(color: Color(0xCCFFFFFF), fontSize: 14.sp),
                  ),
                ),
                Spacer(),
                Container(
                  margin: EdgeInsetsDirectional.only(top: 0.h),
                  width: double.maxFinite,
                  child: Text(
                    "1045.0",
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      color: Color(0xFFFFFFFF),
                      fontSize: 26.sp,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildItem2() {
    return Container(
      margin: EdgeInsetsDirectional.only(top: 6.h, bottom: 6.h),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: AlignmentDirectional.topStart,
          end: AlignmentDirectional.bottomEnd,
          colors: [Color(0xFF1788FA), Color(0xFF33BDFD)],
        ),
        borderRadius: BorderRadius.circular(18),
        boxShadow: [
          BoxShadow(
            color: Color(0xFF1788FA),
            offset: Offset(0.1, 0.1),
            blurRadius: 8,
          ),
        ],
      ),
      width: 148.w,
      height: 126.h,
      child: Stack(
        alignment: Alignment.center,
        children: [
          PositionedDirectional(
            bottom: -8,
            end: -5,
            child: Image.asset(
              Assets.imgCumulativeCharging,
              width: 78,
              height: 79,
              matchTextDirection: true,
            ),
          ),

          Container(
            padding: EdgeInsetsDirectional.all(14),
            child: Column(
              children: [
                Container(
                  margin: EdgeInsetsDirectional.only(top: 2),
                  width: double.maxFinite,
                  child: Text(
                    TKey.cumulativeChargingCapacity.tr,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(color: Color(0xCCFFFFFF), fontSize: 14.sp),
                  ),
                ),
                SizedBox(
                  width: double.maxFinite,
                  child: Text(
                    "(kWh)",
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(color: Color(0xCCFFFFFF), fontSize: 14.sp),
                  ),
                ),
                Spacer(),
                Container(
                  margin: EdgeInsetsDirectional.only(top: 0),
                  width: double.maxFinite,
                  child: Text(
                    "1045.0",
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      color: Color(0xFFFFFFFF),
                      fontSize: 26.sp,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildItem3() {
    return Container(
      margin: EdgeInsetsDirectional.only(top: 6.h, bottom: 6.h),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: AlignmentDirectional.topStart,
          end: AlignmentDirectional.bottomEnd,
          colors: [Color(0xFF2FC4AF), Color(0xFF1EFBC2)],
        ),
        borderRadius: BorderRadius.circular(18),
        boxShadow: [
          BoxShadow(
            color: Color(0xFF2FC4AF),
            offset: Offset(0.1, 0.1),
            blurRadius: 8,
          ),
        ],
      ),
      width: 148.w,
      height: 126.h,
      child: Stack(
        alignment: Alignment.center,
        children: [
          PositionedDirectional(
            bottom: -8,
            end: -5,
            child: Image.asset(
              Assets.imgCumulativeDischarge,
              width: 78,
              height: 79,
              matchTextDirection: true,
            ),
          ),

          Container(
            padding: EdgeInsetsDirectional.all(14),
            child: Column(
              children: [
                Container(
                  margin: EdgeInsetsDirectional.only(top: 2),
                  width: double.maxFinite,
                  child: Text(
                    TKey.cumulativeDischargeCapacity.tr,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(color: Color(0xCCFFFFFF), fontSize: 14.sp),
                  ),
                ),
                SizedBox(
                  width: double.maxFinite,
                  child: Text(
                    "(kWh)",
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(color: Color(0xCCFFFFFF), fontSize: 14.sp),
                  ),
                ),
                Spacer(),
                Container(
                  margin: EdgeInsetsDirectional.only(top: 0),
                  width: double.maxFinite,
                  child: Text(
                    "1045.0",
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      color: Color(0xFFFFFFFF),
                      fontSize: 26.sp,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildItem4() {
    return Container(
      margin: EdgeInsetsDirectional.only(top: 6.h, bottom: 6.h),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: AlignmentDirectional.topStart,
          end: AlignmentDirectional.bottomEnd,
          colors: [Color(0xFFFFB22A), Color(0xFFF6D961)],
        ),
        borderRadius: BorderRadius.circular(18),
        boxShadow: [
          BoxShadow(
            color: Color(0xFFFFB22A),
            offset: Offset(0.1, 0.1),
            blurRadius: 8,
          ),
        ],
      ),
      width: 148.w,
      height: 126.h,
      child: Stack(
        alignment: Alignment.center,
        children: [
          PositionedDirectional(
            bottom: -8,
            end: -5,
            child: Image.asset(
              Assets.imgAccumulatedPhotovoltaic,
              width: 78,
              height: 79,
              matchTextDirection: true,
            ),
          ),

          Container(
            padding: EdgeInsetsDirectional.all(14),
            child: Column(
              children: [
                Container(
                  margin: EdgeInsetsDirectional.only(top: 2),
                  width: double.maxFinite,
                  child: Text(
                    TKey.accumulatedPhotovoltaicPowerGeneration.tr,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(color: Color(0xCCFFFFFF), fontSize: 14.sp),
                  ),
                ),
                SizedBox(
                  width: double.maxFinite,
                  child: Text(
                    "(kWh)",
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(color: Color(0xCCFFFFFF), fontSize: 14.sp),
                  ),
                ),
                Spacer(),
                Container(
                  margin: EdgeInsetsDirectional.only(top: 0),
                  width: double.maxFinite,
                  child: Text(
                    "1045.0",
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      color: Color(0xFFFFFFFF),
                      fontSize: 26.sp,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildDeviceAndStationNum() {
    return Container(
      width: double.maxFinite,
      padding: EdgeInsetsDirectional.all(15),
      margin: EdgeInsetsDirectional.only(start: 16.w, end: 16.w, bottom: 16.h),
      decoration: BoxDecoration(
        color: Color(0xFF313540),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          Expanded(
            child: Container(
              //color: Colors.amber,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "0",
                    maxLines: 1,
                    style: TextStyle(
                      fontSize: 26.sp,
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                    ),
                  ),
                  Divider(height: 7, color: Colors.transparent),
                  Text(
                    TKey.stationNum.tr,
                    style: TextStyle(fontSize: 14.sp, color: Color(0xA6FFFFFF)),
                  ),
                ],
              ),
            ),
          ),
          Container(
            margin: EdgeInsetsDirectional.symmetric(horizontal: 5),
            width: 1,
            height: 40,
            color: Colors.white30,
          ),
          Expanded(
            child: Container(
              //color: Colors.blue,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "0",
                    maxLines: 1,
                    style: TextStyle(
                      fontSize: 26.sp,
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                    ),
                  ),
                  Divider(height: 7, color: Colors.transparent),
                  Text(
                    TKey.deviceNum.tr,
                    style: TextStyle(fontSize: 14.sp, color: Color(0xA6FFFFFF)),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  //https://juejin.cn/post/6901828472142823438?searchId=2025092022502584005D1D54B5DA9A6D9C
  Widget buildStationStatus() {
    return Column(
      children: [
        Container(
          margin: EdgeInsetsDirectional.only(start: 18.w, end: 18.w, top: 9.h),
          width: double.maxFinite,
          child: Text(
            TKey.stationStatus.tr,
            style: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.w500,
              color: Colors.white,
            ),
          ),
        ),
        Container(
          width: double.maxFinite,
          height: 220.h,
          clipBehavior: Clip.hardEdge,
          decoration: BoxDecoration(
            color: Color(0xFF313540),
            borderRadius: BorderRadius.circular(20),
          ),
          margin: EdgeInsetsDirectional.only(
            top: 16.h,
            bottom: 16.h,
            start: 16.w,
            end: 16.w,
          ),
          padding: EdgeInsetsDirectional.all(16.r),
          child: buildPieChatWidget(),
        ),
      ],
    );
  }

  ///饼状图
  List<EChartPieBean> _dataList = [
    EChartPieBean(title: "生活费", number: 100, color: Colors.lightBlueAccent),
    EChartPieBean(title: "游玩费", number: 100, color: Colors.deepOrangeAccent),
    EChartPieBean(title: "交通费", number: 100, color: Colors.green),
    EChartPieBean(title: "贷款费", number: 100, color: Colors.amber),
    EChartPieBean(title: "电话费", number: 600, color: Colors.orange),
  ];

  PieChatWidget buildPieChatWidget() {
    return PieChatWidget(
      dataList: _dataList,
      //是否输出日志
      isLog: true,
      //是否需要背景
      isBackground: false,
      //是否画直线
      isLineText: true,
      //背景
      bgColor: Color(0xFF313540),
      //是否显示最前面的内容
      isFrontgText: true,
      //默认选择放大的块
      initSelect: -1,
      //初次显示以动画方式展开
      openType: OpenType.ANI,
      //旋转类型
      loopType: LoopType.NON,
      //点击回调
      clickCallBack: (int value) {
        //print("当前点击显示 $value");
      },
    );
  }

  Widget buildEnvironmentalValue() {
    return Column(
      children: [
        Container(
          margin: EdgeInsetsDirectional.only(start: 18.w, end: 18.w, top: 9.h),
          width: double.maxFinite,
          child: Text(
            TKey.environmentalValue.tr,
            style: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.w500,
              color: Colors.white,
            ),
          ),
        ),
        Container(
          width: double.maxFinite,
          margin: EdgeInsetsDirectional.only(
            top: 16.h,
            bottom: 16.h,
            start: 16.w,
            end: 16.w,
          ),
          child: Row(
            children: [
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    color: Color(0xFF313540),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Stack(
                    alignment: AlignmentDirectional.center,
                    children: [
                      PositionedDirectional(
                        end: 4,
                        bottom: 2,
                        child: Image.asset(
                          Assets.imgCo2Reduction,
                          width: 60,
                          height: 60,
                          matchTextDirection: true,
                        ),
                      ),
                      Container(
                        padding: EdgeInsetsDirectional.all(16),
                        child: Column(
                          children: [
                            Container(
                              margin: EdgeInsetsDirectional.only(bottom: 6),
                              width: double.maxFinite,
                              child: Text(
                                TKey.co2EmissionReduction.tr,
                                style: TextStyle(
                                  fontSize: 14.sp,
                                  color: Color(0x7DFFFFFF),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: double.maxFinite,
                              child: Text(
                                "23.7",
                                style: TextStyle(
                                  fontSize: 24.sp,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              VerticalDivider(width: 13, color: Colors.transparent),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    color: Color(0xFF313540),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Stack(
                    alignment: AlignmentDirectional.center,
                    children: [
                      PositionedDirectional(
                        end: 4,
                        bottom: 2,
                        child: Image.asset(
                          Assets.imgResolveNum,
                          width: 60,
                          height: 60,
                          matchTextDirection: true,
                        ),
                      ),
                      Container(
                        padding: EdgeInsetsDirectional.all(16),
                        child: Column(
                          children: [
                            Container(
                              margin: EdgeInsetsDirectional.only(bottom: 6),
                              width: double.maxFinite,
                              child: Text(
                                TKey.resolveStandardCoal.tr,
                                style: TextStyle(
                                  fontSize: 14.sp,
                                  color: Color(0x7DFFFFFF),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: double.maxFinite,
                              child: Text(
                                "23.7",
                                style: TextStyle(
                                  fontSize: 24.sp,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
