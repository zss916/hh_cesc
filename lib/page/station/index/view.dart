part of 'index.dart';

class StationPage extends StatelessWidget {
  const StationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 0,
        title: Text(
          TKey.station.tr,
          style: TextStyle(color: Colors.white, fontSize: 18.sp),
        ),
        centerTitle: true,
        surfaceTintColor: Colors.transparent,
        leading: SizedBox.shrink(),
        backgroundColor: Colors.transparent,
      ),
      backgroundColor: Color(0xFF23282E),
      body: Column(
        children: [
          Container(
            width: double.maxFinite,
            margin: EdgeInsetsDirectional.only(start: 16, end: 11, bottom: 12),
            child: Row(
              children: [
                Expanded(child: SearchBarWidget(onInput: (_) {})),
                VerticalDivider(width: 9, color: Colors.transparent),
                InkWell(
                  borderRadius: BorderRadius.circular(50),
                  onTap: () {
                    AppEventBus.eventBus.fire(OpenDrawerEvent(1));
                  },
                  child: Container(
                    width: 36,
                    height: 36,
                    alignment: AlignmentDirectional.center,
                    decoration: BoxDecoration(
                      color: Color(0x99484D55),
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: UnconstrainedBox(
                      child: Image.asset(
                        Assets.imgFilter,
                        width: 18,
                        height: 18,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.separated(
              padding: EdgeInsetsDirectional.only(top: 0, bottom: 30),
              itemCount: 10,
              itemBuilder: (BuildContext context, int index) {
                return buildItem();
              },
              separatorBuilder: (BuildContext context, int index) =>
                  const Divider(height: 16, color: Colors.transparent),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildItem() {
    return GestureDetector(
      onTap: () {
        PageTools.toStationDetail();
      },
      child: Container(
        width: double.maxFinite,
        padding: EdgeInsetsDirectional.only(
          start: 8.w,
          end: 8.w,
          top: 14.h,
          bottom: 14.h,
        ),
        margin: EdgeInsetsDirectional.only(start: 16.w, end: 16.w),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(14),
          color: Color(0xFF313540),
        ),
        child: Column(
          children: [
            Container(
              width: double.maxFinite,
              margin: EdgeInsetsDirectional.only(
                bottom: 12.h,
                start: 8.w,
                end: 8.w,
              ),
              child: Row(
                children: [
                  Container(
                    constraints: BoxConstraints(maxWidth: 150.w),
                    child: Text(
                      "上海绿电",
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(color: Colors.white, fontSize: 18.sp),
                    ),
                  ),
                  Spacer(),
                  CommonTag(title: "储能"),
                  SizedBox(width: 10),
                  StatusTag(title: "正常"),
                ],
              ),
            ),
            Divider(height: 1, color: Color(0x14EEF2F8)),
            Container(
              margin: EdgeInsetsDirectional.only(
                top: 10.h,
                start: 8.w,
                end: 8.w,
              ),
              width: double.maxFinite,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "SOC：",
                        textAlign: TextAlign.start,
                        style: TextStyle(
                          fontSize: 12.sp,
                          color: Color(0xA6FFFFFF),
                        ),
                      ),
                      Divider(height: 8.h, color: Colors.transparent),
                      Text(
                        "储能功率：",
                        textAlign: TextAlign.start,
                        style: TextStyle(
                          fontSize: 12.sp,
                          color: Color(0xA6FFFFFF),
                        ),
                      ),
                      Divider(height: 8.h, color: Colors.transparent),
                      Text(
                        "光伏功率：",
                        textAlign: TextAlign.start,
                        style: TextStyle(
                          fontSize: 12.sp,
                          color: Color(0xA6FFFFFF),
                        ),
                      ),
                      Divider(height: 8.h, color: Colors.transparent),
                      Text(
                        "今日充放电：",
                        textAlign: TextAlign.start,
                        style: TextStyle(
                          fontSize: 12.sp,
                          color: Color(0xA6FFFFFF),
                        ),
                      ),
                    ],
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "10%",
                          textAlign: TextAlign.start,
                          style: TextStyle(
                            fontSize: 12.sp,
                            color: Color(0xFFFFFFFF),
                          ),
                        ),
                        Divider(height: 8.h, color: Colors.transparent),
                        Text(
                          "10kW",
                          textAlign: TextAlign.start,
                          style: TextStyle(
                            fontSize: 12.sp,
                            color: Color(0xFFFFFFFF),
                          ),
                        ),
                        Divider(height: 8.h, color: Colors.transparent),
                        Text(
                          "10kW",
                          textAlign: TextAlign.start,
                          style: TextStyle(
                            fontSize: 12.sp,
                            color: Color(0xFFFFFFFF),
                          ),
                        ),
                        Divider(height: 8.h, color: Colors.transparent),
                        Text(
                          "100kW/193kw",
                          textAlign: TextAlign.start,
                          style: TextStyle(
                            fontSize: 12.sp,
                            color: Color(0xFFFFFFFF),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(width: 90.w, height: 90.h, color: Colors.white12),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
