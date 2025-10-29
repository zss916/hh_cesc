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
            Tab(text: "电量"),
            Tab(text: "止度"),
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
        children: [
          SingleChildScrollView(
            child: Container(
              width: double.maxFinite,
              padding: EdgeInsetsDirectional.symmetric(
                horizontal: 10.w,
                vertical: 15.h,
              ),
              margin: EdgeInsetsDirectional.only(
                top: 12.h,
                bottom: 100.h,
                start: 16.w,
                end: 16.w,
              ),
              decoration: BoxDecoration(
                color: Color(0xFF313540),
                borderRadius: BorderRadius.circular(14.r),
              ),
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsetsDirectional.only(bottom: 15.h),
                    width: double.maxFinite,
                    child: Text(
                      "新城区党政机关办公区源网荷储一体江苏某XXXXXXXXX站点",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ),
                  BuildSelectTimeWidget(),
                  TableWidget(),
                ],
              ),
            ),
          ),

          Container(),
        ],
      ),
    );
  }
}
