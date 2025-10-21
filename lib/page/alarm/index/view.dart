part of 'index.dart';

class AlarmPage extends StatelessWidget {
  const AlarmPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 0,
        title: Text(
          TKey.alarm.tr,
          style: TextStyle(color: Colors.white, fontSize: 18.sp),
        ),
        centerTitle: true,
        surfaceTintColor: Colors.transparent,
        leading: SizedBox.shrink(),
        backgroundColor: Colors.transparent,
        actions: [
          Container(
            margin: EdgeInsetsDirectional.only(end: 20.w),
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                borderRadius: BorderRadius.circular(100),
                onTap: () {
                  AppEventBus.eventBus.fire(OpenDrawerEvent(2));
                },
                child: Container(
                  width: 36,
                  height: 36,
                  alignment: AlignmentDirectional.center,
                  child: UnconstrainedBox(
                    child: Image.asset(Assets.imgFilter, width: 18, height: 18),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      backgroundColor: Color(0xFF23282E),
      body: buildBody(viewState: 2),
    );
  }

  Widget buildBody({required int viewState}) {
    return switch (viewState) {
      _ when viewState == 1 => buildList(),
      _ when viewState == 2 => buildEmpty(),
      _ => SizedBox(),
    };
  }

  Widget buildList() => ListView.separated(
    padding: EdgeInsetsDirectional.only(top: 0, bottom: 150),
    itemCount: 10,
    itemBuilder: (BuildContext context, int index) {
      return AlarmItem();
    },
    separatorBuilder: (BuildContext context, int index) =>
        const Divider(height: 16, color: Colors.transparent),
  );

  Widget buildEmpty() => SizedBox(
    width: double.maxFinite,
    height: double.maxFinite,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(Assets.imgEmpty, width: 200, height: 95),
        Text(
          TKey.noDataAvailable.tr,
          style: TextStyle(fontSize: 18, color: Color(0xFF909399)),
        ),
        Container(
          margin: EdgeInsetsDirectional.only(top: 17.h, bottom: 120.h),
          child: Text(
            TKey.noDataAvailableTip.tr,
            style: TextStyle(fontSize: 14, color: Color(0xFF909399)),
          ),
        ),
      ],
    ),
  );
}
