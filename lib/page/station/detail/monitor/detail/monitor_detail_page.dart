part of 'index.dart';

class MonitorDetailPage extends StatelessWidget {
  const MonitorDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: GetBuilder<MonitorDetailLogic>(
        init: MonitorDetailLogic(),
        builder: (logic) {
          return Scaffold(
            appBar: baseAppBar(title: logic.title),
            backgroundColor: Color(0xFF23282E),
            body: buildBodyUI(state: logic.state, logic: logic),
          );
        },
      ),
    );
  }

  Widget buildBodyUI({
    required UiState state,
    required MonitorDetailLogic logic,
  }) {
    return switch (state) {
      Success() => SingleChildScrollView(
        child: buildContent(logic.deviceType, logic),
      ),
      Loading() => buildLoading,
      Offline() => buildOffline,
      Empty() => SizedBox.shrink(),
      Failure() => SizedBox.shrink(),
    };
  }

  Widget get buildOffline => Center(
    child: OfflineOnRefresh(
      onCall: () {
        AppEventBus.eventBus.fire(NetWorkRefresh());
      },
    ),
  );

  Widget get buildLoading => Container(
    margin: EdgeInsetsDirectional.only(bottom: 50),
    child: Center(child: CescGlowLoading()),
  );

  Widget buildContent(DeviceEnum? type, MonitorDetailLogic logic) {
    return switch (type) {
      DeviceEnum.arr => BatteryView(logic: logic),
      DeviceEnum.pcs => PcsView(logic: logic),
      DeviceEnum.meter => MeterView(logic: logic),
      DeviceEnum.cool => CoolView(logic: logic),
      DeviceEnum.drier => DrierView(logic: logic),
      DeviceEnum.dido => DidoView(logic: logic),
      DeviceEnum.pv => PVView(logic: logic),
      _ => SizedBox.shrink(),
    };
  }
}
