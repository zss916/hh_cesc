part of 'index.dart';

class StrategyHistoryPage extends StatelessWidget {
  const StrategyHistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: baseAppBar(title: TKey.strategyHistory.tr),
      backgroundColor: Color(0xFF23282E),
      body: GetBuilder<StrategyHistoryLogic>(
        init: StrategyHistoryLogic(),
        builder: (logic) => buildBodyUI(state: logic.state, logic: logic),
      ),
    );
  }

  Widget buildBodyUI({
    required UiState state,
    required StrategyHistoryLogic logic,
  }) {
    return switch (state) {
      Success(:final data) => buildRefresherList(data, logic),
      Empty() => buildEmpty,
      Loading() => buildLoading,
      Offline() => buildOffline,
      Failure() => SizedBox.shrink(),
    };
  }

  Widget buildRefresherList(
    List<List<StrategyHistoryEntity>> data,
    StrategyHistoryLogic logic,
  ) {
    return SmartRefresher(
      header: MaterialClassicHeader(),
      footer: BuildFooter(),
      enableSmartPreload: true,
      enablePullDown: true,
      enablePullUp: true,
      controller: logic.refreshCtrl,
      onRefresh: () {
        logic.refreshData();
      },
      onLoading: () {
        logic.loadMoreData();
      },
      child: buildList(data),
    );
  }

  Widget buildList(List<List<StrategyHistoryEntity>> data) =>
      ListView.separated(
        itemCount: data.length,
        padding: EdgeInsetsDirectional.only(top: 10, bottom: 10),
        shrinkWrap: true,
        itemBuilder: (BuildContext context, int index) {
          List<StrategyHistoryEntity> items = data[index];
          return _buildHistoryItems(items);
        },
        separatorBuilder: (BuildContext context, int index) =>
            Divider(height: 16, color: Colors.transparent),
      );

  Widget _buildHistoryItems(List<StrategyHistoryEntity> items) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          margin: EdgeInsetsDirectional.only(bottom: 8, start: 14, end: 14),
          width: double.maxFinite,
          child: Text(
            items.first.toDate(),
            style: TextStyle(fontSize: 11, color: const Color(0xff888888)),
          ),
        ),

        ListView.builder(
          itemCount: items.length,
          padding: EdgeInsetsDirectional.zero,
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemBuilder: (BuildContext context, int index) {
            StrategyHistoryEntity item = items[index];
            return _buildHistoryItem(item);
          },
        ),
      ],
    );
  }

  Widget _buildHistoryItem(StrategyHistoryEntity item) {
    return Container(
      margin: EdgeInsetsDirectional.only(bottom: 8, start: 14, end: 14),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Color(0xFF313540),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                item.toTime(),
                style: TextStyle(fontSize: 11, color: const Color(0xff888888)),
              ),
              _buildTag(item.actionTypeEnum),
            ],
          ),
          Divider(height: 6, color: Colors.transparent),
          Text(
            item.title ?? "",
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: Colors.white,
            ),
          ),
          if (false) Divider(height: 6, color: Colors.transparent),
          if (false)
            Text(
              item.content ?? "",
              style: TextStyle(fontSize: 12, color: const Color(0xff888888)),
            ),
          if (item.reason != null)
            Container(
              margin: EdgeInsetsDirectional.only(top: 6),
              width: double.maxFinite,
              child: Text(
                "${TKey.reason.tr} ${(item.reason ?? "")}",
                style: TextStyle(fontSize: 12, color: const Color(0xff888888)),
              ),
            ),
          if (item.operatorName != null)
            Container(
              margin: EdgeInsetsDirectional.only(top: 6),
              width: double.maxFinite,
              child: Text(
                "${TKey.operator.tr} ${(item.operatorName ?? "")}",
                style: TextStyle(fontSize: 12, color: const Color(0xff888888)),
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildTag(ActionType type) {
    Color bgColor;
    Color textColor;
    Color borderColor;
    switch (type) {
      case ActionType.none:
        bgColor = Colors.transparent;
        textColor = Colors.transparent;
        borderColor = Colors.transparent;
        break;
      case ActionType.open:
        bgColor = const Color(0x2622EEBD);
        textColor = const Color(0xff22EEBD);
        borderColor = const Color(0x7322eebd);
        break;
      case ActionType.adjust:
        bgColor = const Color(0x2622EEBD);
        textColor = const Color(0xff22EEBD);
        borderColor = const Color(0x7322eebd);
        break;
      case ActionType.switchMode:
        bgColor = const Color(0x2628CCFF);
        textColor = const Color(0xff28CCFF);
        borderColor = Color(0x7328CCFF);
        break;
      case ActionType.discontinue:
        bgColor = const Color(0x26ff9933);
        textColor = const Color(0xffff9933);
        borderColor = const Color(0x73ff9933);
        break;
    }
    return Container(
      alignment: AlignmentDirectional.center,
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
      decoration: BoxDecoration(
        color: bgColor,
        border: Border.all(color: borderColor),
        borderRadius: BorderRadius.circular(50),
      ),
      child: Text(
        type.title,
        textAlign: .center,
        style: TextStyle(fontSize: 10, height: 1.2, color: textColor),
      ),
    );
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

  Widget get buildEmpty => Container(
    width: double.maxFinite,
    height: double.maxFinite,
    padding: EdgeInsetsDirectional.only(bottom: 150),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: () {
            AppEventBus.eventBus.fire(NetWorkRefresh());
          },
          child: Image.asset(Assets.imgEmpty, width: 200, height: 95),
        ),
        Text(
          TKey.noDataAvailable.tr,
          style: TextStyle(fontSize: 18, color: Color(0xFF909399)),
        ),
      ],
    ),
  );
}

/*
class StrategyHistoryPage2 extends StatefulWidget {
  const StrategyHistoryPage2({super.key});

  @override
  State<StrategyHistoryPage2> createState() => _StrategyHistoryPageState();
}

class _StrategyHistoryPageState extends State<StrategyHistoryPage2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: baseAppBar(title: TKey.strategyHistory.tr),
      backgroundColor: Color(0xFF23282E),
      body: GetBuilder<StrategyHistoryLogic>(
        init: StrategyHistoryLogic(),
        builder: (logic) {
          return buildBody(viewState: logic.viewState, logic: logic);
        },
      ),
    );
  }

  Widget buildBody({
    required ViewStateEnum viewState,
    required StrategyHistoryLogic logic,
  }) {
    return switch (viewState) {
      ViewStateEnum.common => buildList(logic),
      ViewStateEnum.empty => buildEmpty(logic: logic),
      ViewStateEnum.loading => Container(
        margin: EdgeInsetsDirectional.only(bottom: 50.h),
        child: Center(
          child: CircularProgressIndicator(color: Color(0xFF168FED)),
        ),
      ),
      _ => SizedBox.shrink(),
    };
  }

  Widget buildEmpty({required StrategyHistoryLogic logic}) => SizedBox(
    width: double.maxFinite,
    height: double.maxFinite,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: () {
            logic.fetchStrategyHistory();
          },
          child: Image.asset(Assets.imgEmpty, width: 200, height: 95),
        ),
        Text(
          TKey.noDataAvailable.tr,
          style: TextStyle(fontSize: 18, color: Color(0xFF909399)),
        ),
      ],
    ),
  );

  Widget buildList(StrategyHistoryLogic logic) => ListView.separated(
    itemCount: logic.list.length,
    padding: EdgeInsetsDirectional.only(top: 10, bottom: 50),
    shrinkWrap: true,
    itemBuilder: (BuildContext context, int index) {
      List<StrategyHistoryEntity> items = logic.list[index];
      return _buildHistoryItems(items);
    },
    separatorBuilder: (BuildContext context, int index) =>
        Divider(height: 16, color: Colors.transparent),
  );

  Widget _buildHistoryItems(List<StrategyHistoryEntity> items) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          margin: EdgeInsetsDirectional.only(bottom: 8, start: 14, end: 14),
          width: double.maxFinite,
          child: Text(
            items.first.toDate(),
            style: TextStyle(fontSize: 11, color: const Color(0xff888888)),
          ),
        ),

        ListView.builder(
          itemCount: items.length,
          padding: EdgeInsetsDirectional.zero,
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemBuilder: (BuildContext context, int index) {
            StrategyHistoryEntity item = items[index];
            return _buildHistoryItem(item);
          },
        ),
      ],
    );
  }

  Widget _buildHistoryItem(StrategyHistoryEntity item) {
    return Container(
      margin: EdgeInsetsDirectional.only(bottom: 8, start: 14, end: 14),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Color(0xFF313540),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                item.toTime(),
                style: TextStyle(fontSize: 11, color: const Color(0xff888888)),
              ),
              _buildTag(item.actionTypeEnum),
            ],
          ),
          Divider(height: 6, color: Colors.transparent),
          Text(
            item.title ?? "",
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: Colors.white,
            ),
          ),
          Divider(height: 6, color: Colors.transparent),
          Text(
            item.content ?? "",
            style: TextStyle(fontSize: 12, color: const Color(0xff888888)),
          ),
          if (item.reason != null)
            Container(
              margin: EdgeInsetsDirectional.only(top: 6),
              width: double.maxFinite,
              child: Text(
                "${TKey.reason.tr} ${(item.reason ?? "")}",
                style: TextStyle(fontSize: 12, color: const Color(0xff888888)),
              ),
            ),
          if (item.operatorName != null)
            Container(
              margin: EdgeInsetsDirectional.only(top: 6),
              width: double.maxFinite,
              child: Text(
                "${TKey.operator.tr} ${(item.operatorName ?? "")}",
                style: TextStyle(fontSize: 12, color: const Color(0xff888888)),
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildTag(ActionType type) {
    Color bgColor;
    Color textColor;
    Color borderColor;
    switch (type) {
      case ActionType.none:
        bgColor = Colors.transparent;
        textColor = Colors.transparent;
        borderColor = Colors.transparent;
        break;
      case ActionType.open:
        bgColor = const Color(0x2622EEBD);
        textColor = const Color(0xff22EEBD);
        borderColor = const Color(0x7322eebd);
        break;
      case ActionType.adjust:
        bgColor = const Color(0x2622EEBD);
        textColor = const Color(0xff22EEBD);
        borderColor = const Color(0x7322eebd);
        break;
      case ActionType.switchMode:
        bgColor = const Color(0x2628CCFF);
        textColor = const Color(0xff28CCFF);
        borderColor = Color(0x7328CCFF);
        break;
      case ActionType.discontinue:
        bgColor = const Color(0x26ff9933);
        textColor = const Color(0xffff9933);
        borderColor = const Color(0x73ff9933);
        break;
    }
    return Container(
      alignment: AlignmentDirectional.center,
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
      decoration: BoxDecoration(
        color: bgColor,
        border: Border.all(color: borderColor),
        borderRadius: BorderRadius.circular(50),
      ),
      child: Text(
        type.title,
        textAlign: .center,
        style: TextStyle(fontSize: 10, height: 1.2, color: textColor),
      ),
    );
  }

  */
/* Widget buildList2(StrategyHistoryLogic logic) => ListView.separated(
    itemCount: logic.data.length,
    padding: EdgeInsetsDirectional.only(top: 10, bottom: 50),
    shrinkWrap: true,
    itemBuilder: (BuildContext context, int index) {
      StrategyHistoryEntity item = logic.data[index];
      return _buildHistoryItem(item, index);
    },
    separatorBuilder: (BuildContext context, int index) =>
        Divider(height: 16, color: Colors.transparent),
  );
*/ /*

}
*/
