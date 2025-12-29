part of 'index.dart';

class ElePage extends StatefulWidget {
  const ElePage({super.key});

  @override
  State<ElePage> createState() => _ReportDetailPageState();
}

class _ReportDetailPageState extends State<ElePage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<EleLogic>(
      init: EleLogic(),
      builder: (logic) {
        return Scaffold(
          appBar: AppBar(
            leading: IconButton(
              icon: Icon(Icons.arrow_back_ios_new_rounded, color: Colors.white),
              onPressed: () => Get.back(),
            ),
            centerTitle: true,
            title: Text(
              TKey.electricity.tr,
              style: TextStyle(color: Colors.white, fontSize: 18.sp),
            ),
            backgroundColor: Colors.transparent,
          ),
          backgroundColor: Color(0xFF23282E),
          body: buildEle(logic),
        );
      },
    );
  }

  Widget buildEle(EleLogic logic) {
    return SingleChildScrollView(
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
                logic.location ?? "",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.normal,
                ),
              ),
            ),
            EleSelectTimeWidget(logic: logic),
            EleTableWidget(logic: logic, queryType: logic.queryType),
          ],
        ),
      ),
    );
  }
}
