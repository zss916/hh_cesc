import 'package:cescpro/components/common_app_bar.dart';
import 'package:cescpro/core/enum/app_enum.dart';
import 'package:cescpro/core/translations/en.dart';
import 'package:cescpro/generated/assets.dart';
import 'package:cescpro/http/bean/strategy_history_entity.dart';
import 'package:cescpro/page/station/detail/strategy/history/strategy_history_logic.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';

class StrategyHistoryPage extends StatefulWidget {
  const StrategyHistoryPage({super.key});

  @override
  State<StrategyHistoryPage> createState() => _StrategyHistoryPageState();
}

class _StrategyHistoryPageState extends State<StrategyHistoryPage> {
  /* final List<DayGroup> _historyData = [
    DayGroup(
      title: '今天 · 2026-07-01',
      items: [
        HistoryItem(
          time: '16:32',
          tag: '调整',
          tagType: TagType.adjust,
          title: '削峰填谷 · 参数微调',
          desc: '最大功率 <b>500kW → 600kW</b>，SOC 上限 <b>80% → 85%</b>',
        ),
        HistoryItem(
          time: '09:15',
          tag: '切换',
          tagType: TagType.switchMode,
          title: '切换为 削峰填谷 模式',
          desc: '由 <b>自发自用</b> 切换为 <b>削峰填谷</b>，操作人：张工',
        ),
      ],
    ),
    DayGroup(
      title: '昨天 · 2026-06-30',
      items: [
        HistoryItem(
          time: '18:42',
          tag: '停用',
          tagType: TagType.cancel,
          title: '临时停用 需量响应',
          desc: '手动停用，持续 <b>2 小时</b>，原因：设备检修',
        ),
        HistoryItem(
          time: '14:08',
          tag: '切换',
          tagType: TagType.switchMode,
          title: '切换为 需量响应 模式',
          desc: '检测到尖峰电价时段，自动触发切换',
        ),
        HistoryItem(
          time: '08:20',
          tag: '调整',
          tagType: TagType.adjust,
          title: '自发自用 · 参数调整',
          desc: 'SOC 下限由 <b>15% → 20%</b>',
        ),
      ],
    ),
    DayGroup(
      title: '2026-06-29',
      items: [
        HistoryItem(
          time: '10:05',
          tag: '切换',
          tagType: TagType.switchMode,
          title: '切换为 自发自用 模式',
          desc: '由 <b>恒功率</b> 切换为 <b>自发自用</b>',
        ),
        HistoryItem(
          time: '00:30',
          tag: '调整',
          tagType: TagType.adjust,
          title: '恒功率 · 创建',
          desc: '创建新策略，设定功率 <b>200kW</b>，操作人：系统',
        ),
      ],
    ),
  ];*/

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

  Widget buildList(StrategyHistoryLogic logic) => ListView.builder(
    itemCount: logic.data.length,
    padding: EdgeInsetsDirectional.only(top: 10),
    shrinkWrap: true,
    itemBuilder: (BuildContext context, int index) {
      StrategyHistoryEntity item = logic.data[index];
      return _buildHistoryItem(item);
    },
  );

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
                item.createTime ?? "",
                style: TextStyle(fontSize: 11, color: const Color(0xff888888)),
              ),
              _buildTag(item.actionTypeEnum),
            ],
          ),
          const SizedBox(height: 4),
          Text(
            item.title ?? "",
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            item.content ?? "",
            style: TextStyle(fontSize: 12, color: const Color(0xff888888)),
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
}
