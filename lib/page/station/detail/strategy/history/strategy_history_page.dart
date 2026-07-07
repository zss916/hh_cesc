import 'package:cescpro/components/common_app_bar.dart';
import 'package:cescpro/core/translations/en.dart';
import 'package:cescpro/page/station/detail/strategy/history/widget/filter_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';

class StrategyHistoryPage extends StatefulWidget {
  const StrategyHistoryPage({super.key});

  @override
  State<StrategyHistoryPage> createState() => _StrategyHistoryPageState();
}

class _StrategyHistoryPageState extends State<StrategyHistoryPage> {
  final List<DayGroup> _historyData = [
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
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: baseAppBar(title: TKey.strategyHistory.tr),
      backgroundColor: Color(0xFF23282E),
      body: Column(
        children: [
          FilterWidget(),
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.only(bottom: 100),
              child: _buildHistoryList(),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHistoryList() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 14),
      child: Column(
        children: _historyData.map((group) {
          return Column(
            children: [
              Container(
                width: double.maxFinite,
                padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 4),
                child: Text(
                  group.title,
                  style: TextStyle(
                    fontSize: 12,
                    color: const Color(0xff888888),
                  ),
                ),
              ),
              ...group.items.map((item) => _buildHistoryItem(item)).toList(),
            ],
          );
        }).toList(),
      ),
    );
  }

  Widget _buildHistoryItem(HistoryItem item) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
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
                item.time,
                style: TextStyle(fontSize: 11, color: const Color(0xff888888)),
              ),
              _buildTag(item.tag, item.tagType),
            ],
          ),
          const SizedBox(height: 4),
          Text(
            item.title,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            item.desc,
            style: TextStyle(fontSize: 12, color: const Color(0xff888888)),
          ),
        ],
      ),
    );
  }

  Widget _buildTag(String tag, TagType type) {
    Color bgColor;
    Color textColor;
    Color borderColor;

    switch (type) {
      case TagType.adjust:
        bgColor = const Color(0x2622EEBD);
        textColor = const Color(0xff22EEBD);
        borderColor = const Color(0x7322eebd);
        break;
      case TagType.switchMode:
        bgColor = const Color(0x2628CCFF);
        textColor = const Color(0xff28CCFF);
        borderColor = Color(0x7328CCFF);
        break;
      case TagType.cancel:
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
        tag,
        textAlign: .center,
        style: TextStyle(fontSize: 10, height: 1.2, color: textColor),
      ),
    );
  }
}

enum TagType { adjust, switchMode, cancel }

class DayGroup {
  final String title;
  final List<HistoryItem> items;

  DayGroup({required this.title, required this.items});
}

class HistoryItem {
  final String time;
  final String tag;
  final TagType tagType;
  final String title;
  final String desc;

  HistoryItem({
    required this.time,
    required this.tag,
    required this.tagType,
    required this.title,
    required this.desc,
  });
}
