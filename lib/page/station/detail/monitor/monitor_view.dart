part of 'index.dart';

class MonitorView extends StatelessWidget {
  const MonitorView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Scaffold(
        appBar: baseAppBar(
          title: TKey.monitor.tr,
          onBack: () {
            Map<String, dynamic> map = Get.arguments as Map<String, dynamic>;
            bool? toMain = map['toMain'] as bool?;
            if (toMain == true) {
              PageTools.offAndToNamedMain();
            } else {
              Get.back();
            }
          },
        ),
        backgroundColor: Color(0xFF23282E),
        body: GetBuilder<MonitorLogic>(
          init: MonitorLogic(),
          builder: (logic) => buildBodyUI(state: logic.state, logic: logic),
        ),
      ),
    );
  }

  Widget buildBodyUI({required UiState state, required MonitorLogic logic}) {
    return switch (state) {
      Success(:final data) => buildList(data: data, logic: logic),
      Empty() => buildEmpty,
      Loading() => buildLoading,
      Offline() => buildOffline,
      Failure() => buildError,
    };
  }

  Widget buildList({
    required List<MonitorModel> data,
    required MonitorLogic logic,
  }) => GridView.builder(
    itemCount: data.length,
    padding: EdgeInsetsDirectional.only(
      top: 12.h,
      start: 14.w,
      end: 14.w,
      bottom: 150.h,
    ),
    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: 2,
      mainAxisSpacing: 16.r,
      crossAxisSpacing: 16.r,
      childAspectRatio: 163 / 62,
    ),
    itemBuilder: (BuildContext context, int index) {
      return GestureDetector(
        onTap: () {
          logic.toDetail(index);
        },
        child: Container(
          width: double.maxFinite,
          alignment: Alignment.center,
          padding: EdgeInsets.all(5),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0x99767E8A), Color(0x99414852)],
            ),
            borderRadius: BorderRadius.circular(10.r),
          ),
          child: Center(
            child: Text(
              data[index].title,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
      );
    },
  );

  Widget get buildLoading => Container(
    margin: EdgeInsetsDirectional.only(bottom: 50.h),
    child: Center(child: CescGlowLoading()),
  );

  Widget get buildOffline => Center(
    child: OfflineOnRefresh(
      onCall: () {
        AppEventBus.eventBus.fire(NetWorkRefresh());
      },
    ),
  );

  Widget get buildError => SizedBox(
    width: double.maxFinite,
    height: double.maxFinite,
    child: GestureDetector(
      onTap: () {
        AppEventBus.eventBus.fire(NetWorkRefresh());
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(Assets.imgEmpty2, width: 200, height: 95),
          SizedBox(height: 20),
          Text(
            TKey.refresh.tr,
            style: TextStyle(fontSize: 16, color: Color(0xFF909399)),
          ),
        ],
      ),
    ),
  );

  Widget get buildEmpty => SizedBox(
    width: double.maxFinite,
    height: double.maxFinite,
    child: GestureDetector(
      onTap: () {
        AppEventBus.eventBus.fire(NetWorkRefresh());
      },
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
    ),
  );
}
