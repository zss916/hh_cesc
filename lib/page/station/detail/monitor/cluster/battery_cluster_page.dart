part of 'index.dart';

class BatteryClusterPage extends StatelessWidget {
  const BatteryClusterPage({super.key});

  //电池集群
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: GetBuilder<BatteryClusterLogic>(
        init: BatteryClusterLogic(),
        builder: (logic) {
          return Scaffold(
            appBar: baseAppBar(
              title: "${TKey.batteryCluster.tr}${logic.labelName ?? ""}",
            ),
            backgroundColor: Color(0xFF23282E),
            body: buildBodyUI(state: logic.state, logic: logic),
          );
        },
      ),
    );
  }

  Widget buildBodyUI({
    required UiState state,
    required BatteryClusterLogic logic,
  }) {
    return switch (state) {
      Complete() => BuildBody(logic: logic),
      Loading() => buildLoading,
      Offline() => buildOffline,
      Failure() => SizedBox.shrink(),
    };
  }

  Widget get buildOffline => Container(
    alignment: AlignmentDirectional.center,
    margin: EdgeInsetsDirectional.only(bottom: 150),
    child: OfflineOnRefresh(
      onCall: () {
        AppEventBus.eventBus.fire(NetWorkRefresh());
      },
    ),
  );

  Widget get buildLoading => Container(
    margin: EdgeInsetsDirectional.only(bottom: 150),
    child: Center(child: CescGlowLoading()),
  );
}
