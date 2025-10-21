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

                  DefaultTabController(
                    length: 3,
                    child: Container(
                      width: double.maxFinite,
                      height: 32.h,
                      clipBehavior: Clip.hardEdge,
                      decoration: BoxDecoration(
                        color: Colors.white12,
                        borderRadius: BorderRadius.circular(100),
                      ),
                      padding: EdgeInsetsDirectional.all(2),
                      child: TabBar(
                        tabs: [
                          Tab(
                            child: Container(
                              width: 120.w,
                              height: 28.h,
                              padding: EdgeInsetsDirectional.symmetric(
                                horizontal: 2,
                              ),
                              alignment: Alignment.center,
                              child: Text(TKey.day.tr),
                            ),
                          ),

                          Tab(
                            child: Container(
                              width: 120.w,
                              height: 28.h,
                              padding: EdgeInsetsDirectional.symmetric(
                                horizontal: 2,
                              ),
                              alignment: Alignment.center,
                              child: Text(TKey.month.tr),
                            ),
                          ),

                          Tab(
                            child: Container(
                              width: 120.w,
                              height: 28.h,
                              padding: EdgeInsetsDirectional.symmetric(
                                horizontal: 2,
                              ),
                              alignment: Alignment.center,
                              child: Text(TKey.year.tr),
                            ),
                          ),
                        ],
                        indicatorColor: Colors.white,
                        indicatorWeight: 0,
                        indicatorSize: TabBarIndicatorSize.tab,
                        indicatorPadding: EdgeInsets.zero,
                        indicator: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [Color(0xFF43FFFF), Color(0xFF0978E9)],
                          ),
                          borderRadius: BorderRadius.circular(50),
                        ),
                        labelColor: Colors.white,
                        unselectedLabelColor: Colors.white,
                        labelStyle: TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.normal,
                          fontSize: 14,
                        ),
                        unselectedLabelStyle: TextStyle(fontSize: 14),
                        onTap: (index) {
                          debugPrint("index ==> $index");
                        },
                      ),
                    ),
                  ),
                  Divider(height: 4.h, color: Colors.transparent),

                  Material(
                    color: Colors.transparent,
                    child: InkWell(
                      borderRadius: BorderRadius.circular(5),
                      onTap: () {
                        //  showYearSheet();
                        // showMonthSheet();
                        showDateRangeSheet();
                      },
                      child: Container(
                        width: double.maxFinite,
                        padding: EdgeInsetsDirectional.symmetric(
                          vertical: 10.h,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Icon(
                              Icons.arrow_back_ios,
                              size: 16,
                              color: Color(0xD9FFFFFF),
                            ),

                            Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  "2021/01/01",
                                  style: TextStyle(
                                    color: Color(0xD9FFFFFF),
                                    fontSize: 15.sp,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                Icon(
                                  Icons.arrow_drop_down_rounded,
                                  size: 22,
                                  color: Color(0xD9FFFFFF),
                                ),
                              ],
                            ),

                            Icon(
                              Icons.arrow_forward_ios,
                              size: 16,
                              color: Color(0xD9FFFFFF),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),

                  Divider(height: 4.h, color: Colors.transparent),

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

  ///年选择
  void showYearSheet() {
    Get.bottomSheet(
      CustomYearPicker(
        firstDate: DateTime(2020),
        lastDate: DateTime.now(),
        selectedDate: DateTime.now(),
        onChanged: (value) {
          debugPrint("value ==> ${value.year}");
        },
      ),
    );
  }

  ///月选择
  void showMonthSheet() {
    Get.bottomSheet(
      CustomMonthPicker(
        firstDate: DateTime(2020),
        lastDate: DateTime.now(),
        selectedDate: DateTime(2021, 1, 1),
        onChanged: (value) {
          debugPrint("value ==> ${value.year},${value.month}");
        },
      ),
    );
  }

  ///日期范围选择
  Future<void> showDateRangeSheet() async {
    DateRangePickerDialog dialog = DateRangePickerDialog(
      initialEntryMode: DatePickerEntryMode.calendarOnly,
      firstDate: DateTime(2000),
      lastDate: DateTime.now(),
      //currentDate: DateTime(2022, 1, 1),
      //range: range,
    );

    Get.bottomSheet(dialog);
  }
}
