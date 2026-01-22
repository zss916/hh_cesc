part of 'index.dart';

class MainPage extends StatefulWidget {
  MainPage({super.key});

  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> with WidgetsBindingObserver {
  int select = 0;

  late StreamSubscription<OpenDrawerEvent> event;
  int drawerIndex = DrawerTypeEnum.site.index;
  int? siteStatus;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    event = AppEventBus.eventBus.on<OpenDrawerEvent>().listen((event) {
      openDrawer();
      safeSetState(() {
        drawerIndex = event.index;
        siteStatus = event.siteStatus;
      });
    });
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    switch (state) {
      case AppLifecycleState.resumed:
        debugPrint("Lifecycle resumed ==>");
        break;
      case AppLifecycleState.inactive:
        debugPrint("Lifecycle inactive ==>");
        break;
      case AppLifecycleState.hidden:
        debugPrint("Lifecycle hidden ==>");
        break;
      case AppLifecycleState.paused:
        debugPrint("Lifecycle paused ==>");
        break;
      case AppLifecycleState.detached:
        debugPrint("Lifecycle detached ==>");
        break;
    }
  }

  @override
  void dispose() {
    super.dispose();
    WidgetsBinding.instance.removeObserver(this);
    event.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MainLogic>(
      init: MainLogic(),
      builder: (logic) {
        return MediaQuery.removePadding(
          context: context,
          removeBottom: true,
          child: SafeArea(
            top: false,
            bottom: AppInfoService.to.isBottomPadding,
            child: Scaffold(
              key: widget.scaffoldKey,
              backgroundColor: Color(0xFF23282E),
              endDrawer: buildEndDrawer(index: drawerIndex),
              extendBody: true,
              body: IndexedStack(
                index: select,
                children: [
                  HomePage(),
                  StationPage(),
                  AlarmPage(),
                  ServicePage(),
                ],
              ),
              bottomNavigationBar: Container(
                clipBehavior: Clip.hardEdge,
                constraints: BoxConstraints(maxHeight: 65.h),
                margin: EdgeInsetsDirectional.only(
                  bottom: 20,
                  start: 20,
                  end: 20,
                ),
                decoration: BoxDecoration(
                  color: Color(0xFF474F59),
                  border: Border.all(width: 1.5, color: Color(0x59666B73)),
                  borderRadius: BorderRadiusDirectional.all(
                    Radius.circular(50),
                  ),
                ),
                child: CustomNavigationBar(
                  currentIndex: select,
                  elevation: 0,
                  backgroundColor: Colors.transparent,
                  strokeColor: Colors.transparent,
                  scaleFactor: 0.01,
                  iconSize: 34,
                  items: [
                    CustomNavigationBarItem(
                      icon: Image.asset(
                        Assets.imgHome,
                        matchTextDirection: true,
                      ),
                      selectedIcon: Image.asset(
                        Assets.imgHomeS,
                        matchTextDirection: true,
                      ),
                      title: Text(
                        TKey.home.tr,
                        style: TextStyle(color: Colors.white, fontSize: 10.sp),
                      ),
                      selectedTitle: Text(
                        TKey.home.tr,
                        style: TextStyle(
                          color: Color(0xFF52D5F9),
                          fontSize: 10.sp,
                        ),
                      ),
                    ),
                    CustomNavigationBarItem(
                      icon: Image.asset(
                        Assets.imgStation,
                        matchTextDirection: true,
                      ),
                      selectedIcon: Image.asset(
                        Assets.imgStationS,
                        matchTextDirection: true,
                      ),
                      title: Text(
                        TKey.station.tr,
                        style: TextStyle(color: Colors.white, fontSize: 10.sp),
                      ),
                      selectedTitle: Text(
                        TKey.station.tr,
                        style: TextStyle(
                          color: Color(0xFF52D5F9),
                          fontSize: 10.sp,
                        ),
                      ),
                    ),
                    CustomNavigationBarItem(
                      icon: Image.asset(
                        Assets.imgAlarm,
                        matchTextDirection: true,
                      ),
                      selectedIcon: Image.asset(
                        Assets.imgAlarmS,
                        matchTextDirection: true,
                      ),
                      title: Text(
                        TKey.alarm.tr,
                        style: TextStyle(color: Colors.white, fontSize: 10.sp),
                      ),
                      selectedTitle: Text(
                        TKey.alarm.tr,
                        style: TextStyle(
                          color: Color(0xFF52D5F9),
                          fontSize: 10.sp,
                        ),
                      ),
                    ),
                    CustomNavigationBarItem(
                      icon: Image.asset(
                        Assets.imgService,
                        matchTextDirection: true,
                      ),
                      selectedIcon: Image.asset(
                        Assets.imgServiceS,
                        matchTextDirection: true,
                      ),
                      title: Text(
                        TKey.service.tr,
                        style: TextStyle(color: Colors.white, fontSize: 10.sp),
                      ),
                      selectedTitle: Text(
                        TKey.service.tr,
                        style: TextStyle(
                          color: Color(0xFF52D5F9),
                          fontSize: 10.sp,
                        ),
                      ),
                    ),
                  ],
                  onTap: (i) {
                    safeSetState(() {
                      select = i;
                    });
                  },
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  /// 侧边栏
  Widget buildEndDrawer({required int index}) => Drawer(
    backgroundColor: Color(0x99222222),
    child: BlurWidget(
      isBlur: true,
      child: SafeArea(
        child: Container(
          padding: EdgeInsetsDirectional.only(
            start: 16.w,
            end: 16.w,
            top: 22.h,
            bottom: 17.h,
          ),
          width: double.maxFinite,
          height: double.maxFinite,
          child: Stack(
            alignment: AlignmentDirectional.topCenter,
            children: [
              if (index == DrawerTypeEnum.site.index)
                StationDrawer(
                  status: siteStatus,
                  onReset: () {
                    closeDrawer();
                  },
                  onConfirm: () {
                    closeDrawer();
                  },
                ),
              if (index == DrawerTypeEnum.alarm.index)
                AlarmDrawer(
                  onReset: () {
                    closeDrawer();
                  },
                  onConfirm: () {
                    closeDrawer();
                  },
                ),
            ],
          ),
        ),
      ),
    ),
  );

  /// 打开抽屉
  void openDrawer() {
    widget.scaffoldKey.currentState!.openEndDrawer();
  }

  /// 关闭抽屉
  void closeDrawer() {
    widget.scaffoldKey.currentState!.closeEndDrawer();
  }

  void safeSetState(VoidCallback fn) {
    if (mounted) setState(fn);
  }
}
