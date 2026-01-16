part of 'index.dart';

class StationDetailPage extends StatefulWidget {
  const StationDetailPage({super.key});

  @override
  State<StationDetailPage> createState() => _StationDetailState();
}

class _StationDetailState extends State<StationDetailPage> {
  int select = 0;
  // PageController pageCtrl = PageController(initialPage: 0);

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    // pageCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF23282E),
      extendBody: true,
      body: IndexedStack(
        index: select,
        /*  pageSnapping: false,
        scrollBehavior: null,
        physics: const NeverScrollableScrollPhysics(),
        controller: pageCtrl,*/
        children: [OliveView(), MonitorView(), RealAlarmView()],
      ),
      bottomNavigationBar: Container(
        clipBehavior: Clip.hardEdge,
        constraints: BoxConstraints(maxHeight: 65.h),
        margin: EdgeInsetsDirectional.only(bottom: 20, start: 20, end: 20),
        decoration: BoxDecoration(
          color: Color(0xFF474F59),
          border: Border.all(width: 1.5, color: Color(0x59666B73)),
          borderRadius: BorderRadiusDirectional.all(Radius.circular(50)),
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
              icon: Image.asset(Assets.imgOliveView, matchTextDirection: true),
              selectedIcon: Image.asset(
                Assets.imgOliveViewS,
                matchTextDirection: true,
              ),
              title: Text(
                TKey.oliveView.tr,
                style: TextStyle(color: Colors.white, fontSize: 10.sp),
              ),
              selectedTitle: Text(
                TKey.oliveView.tr,
                style: TextStyle(color: Color(0xFF52D5F9), fontSize: 10.sp),
              ),
            ),
            CustomNavigationBarItem(
              icon: Image.asset(Assets.imgMonitor, matchTextDirection: true),
              selectedIcon: Image.asset(
                Assets.imgMonitorS,
                matchTextDirection: true,
              ),
              title: Text(
                TKey.monitor.tr,
                style: TextStyle(color: Colors.white, fontSize: 10.sp),
              ),
              selectedTitle: Text(
                TKey.station.tr,
                style: TextStyle(color: Color(0xFF52D5F9), fontSize: 10.sp),
              ),
            ),
            CustomNavigationBarItem(
              icon: Image.asset(Assets.imgAlarm, matchTextDirection: true),
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
                style: TextStyle(color: Color(0xFF52D5F9), fontSize: 10.sp),
              ),
            ),
            /*CustomNavigationBarItem(
              icon: Image.asset(Assets.imgControl, matchTextDirection: true),
              selectedIcon: Image.asset(
                Assets.imgControlS,
                matchTextDirection: true,
              ),
              title: Text(
                TKey.control.tr,
                style: TextStyle(color: Colors.white, fontSize: 10.sp),
              ),
              selectedTitle: Text(
                TKey.control.tr,
                style: TextStyle(color: Color(0xFF52D5F9), fontSize: 10.sp),
              ),
            ),*/
          ],
          onTap: (i) {
            if(mounted){
              setState(() {
                select = i;
                // pageCtrl.jumpToPage(i);
              });
            }
          },
        ),
      ),
    );
  }
}
