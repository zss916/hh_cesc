part of 'index.dart';

class ReportDetailPage extends StatefulWidget {
  const ReportDetailPage({super.key});

  @override
  State<ReportDetailPage> createState() => _ReportDetailPageState();
}

class _ReportDetailPageState extends State<ReportDetailPage>
    with SingleTickerProviderStateMixin {
  late final TabController tabCtrl;

  @override
  void initState() {
    super.initState();
    tabCtrl = TabController(length: 2, vsync: this);
    tabCtrl.addListener(() {
      if (tabCtrl.index == tabCtrl.animation?.value) {
        int reportType = (tabCtrl.index + 1);
      }
    });
  }

  @override
  void dispose() {
    tabCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_new_rounded, color: Colors.white),
          onPressed: () => Get.back(),
        ),
        centerTitle: true,
        title: KuGouTabBar(
          tabs: [
            Tab(text: TKey.powerLevel.tr),
            Tab(text: TKey.stopDegree.tr),
          ],
          controller: tabCtrl,
          labelStyle: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: Color(0xFF42FDFE),
          ),
          unselectedLabelStyle: const TextStyle(
            fontSize: 14,
            color: Colors.white,
            fontWeight: FontWeight.w500,
          ),
          isScrollable: false,
          padding: EdgeInsetsDirectional.only(end: 35),
          labelColor: Color(0xFF43FFFF),
          unselectedLabelColor: Colors.white,
          indicator: const RRecTabIndicator(
            radius: 10,
            insets: EdgeInsets.only(bottom: 0),
            color: Color(0xFF43FFFF),
          ),
          indicatorMinWidth: 40,
        ),
        backgroundColor: Colors.transparent,
      ),
      backgroundColor: Color(0xFF23282E),
      body: TabBarView(
        controller: tabCtrl,
        children: [PowerLevelView(), StopDegreeView()],
      ),
    );
  }
}
