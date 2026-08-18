part of 'index.dart';

class DistributionMapPage extends StatelessWidget {
  const DistributionMapPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      bottom: DeviceService.to.isBottomPadding,
      child: GetBuilder<DistributionMapLogic>(
        init: DistributionMapLogic(),
        builder: (logic) {
          return Scaffold(
            appBar: baseAppBar(title: logic.title ?? ""),
            backgroundColor: Color(0xFF23282E),
            body: Column(
              children: [
                if ((logic.content ?? "").isNotEmpty)
                  Container(
                    margin: EdgeInsetsDirectional.only(
                      start: 20.w,
                      end: 20.w,
                      top: 12.h,
                      bottom: 15.h,
                    ),
                    width: double.maxFinite,
                    child: Text(
                      logic.content ?? "",
                      style: TextStyle(color: Colors.white, fontSize: 12),
                    ),
                  ),
                Expanded(
                  child: buildBodyUI(state: logic.state, logic: logic),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget buildBodyUI({
    required UiState state,
    required DistributionMapLogic logic,
  }) {
    return switch (state) {
      Success(:final data) => BuildBody(type: logic.type, value: data),
      Loading() => buildLoading,
      Failure() => SizedBox.shrink(),
    };
  }

  Widget get buildLoading => Container(
    margin: EdgeInsetsDirectional.only(bottom: 150),
    child: Center(child: CescGlowLoading()),
  );
}
