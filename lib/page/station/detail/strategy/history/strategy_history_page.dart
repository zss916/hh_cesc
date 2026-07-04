import 'package:flutter/material.dart';

class StrategyHistoryPage extends StatefulWidget {
  const StrategyHistoryPage({super.key});

  @override
  State<StrategyHistoryPage> createState() => _StrategyHistoryPageState();
}

class _StrategyHistoryPageState extends State<StrategyHistoryPage> {
  String _selectedFilter = '全部';
  final List<String> _filters = ['全部', '切换', '调整参数', '停用'];

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
      backgroundColor: const Color(0xff0a1428),
      body: SafeArea(
        child: Column(
          children: [
            // _buildStatusBar(),
            _buildTopNav(),
            _buildFilterBar(),
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.only(bottom: 100),
                child: _buildHistoryList(),
              ),
            ),
            // _buildTabBar(),
          ],
        ),
      ),
    );
  }

  Widget _buildStatusBar() {
    return Container(
      height: 44,
      padding: const EdgeInsets.symmetric(horizontal: 22),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            '16:40 📍',
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),
          ),
          Row(
            children: [
              const Text('📶', style: TextStyle(fontSize: 13)),
              const SizedBox(width: 6),
              const Text(
                '5G',
                style: TextStyle(fontSize: 13, color: Colors.white),
              ),
              const SizedBox(width: 6),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 1),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(4),
                ),
                child: const Text(
                  '69',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildTopNav() {
    return Container(
      width: double.maxFinite,
      height: 48,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
            left: 14,
            child: IconButton(
              icon: const Icon(Icons.arrow_back, color: Colors.white, size: 22),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
          const Text(
            '策略历史',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFilterBar() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
      child: Row(
        children: _filters.map((filter) {
          return GestureDetector(
            onTap: () {
              setState(() {
                _selectedFilter = filter;
              });
            },
            child: Container(
              margin: const EdgeInsets.only(right: 8),
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(
                gradient: _selectedFilter == filter
                    ? const LinearGradient(
                        colors: [Color(0xff4a9eff), Color(0xff2c6fd1)],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      )
                    : null,
                color: _selectedFilter == filter
                    ? null
                    : const Color.fromARGB(20, 74, 158, 255),
                border: Border.all(
                  color: _selectedFilter == filter
                      ? Colors.transparent
                      : const Color.fromARGB(46, 74, 158, 255),
                ),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text(
                filter,
                style: TextStyle(
                  fontSize: 12,
                  color: _selectedFilter == filter
                      ? Colors.white
                      : const Color(0xffaaaaaa),
                ),
              ),
            ),
          );
        }).toList(),
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
              Padding(
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
        gradient: const LinearGradient(
          colors: [Color(0xff1a2842), Color(0xff16213a)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        border: Border.all(color: const Color.fromARGB(31, 74, 158, 255)),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Container(
            width: 10,
            height: 10,
            decoration: BoxDecoration(
              color: const Color(0xff4a9eff),
              borderRadius: BorderRadius.circular(5),
              boxShadow: const [
                BoxShadow(color: Color(0xff4a9eff), blurRadius: 8),
              ],
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      item.time,
                      style: TextStyle(
                        fontSize: 11,
                        color: const Color(0xff888888),
                      ),
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
                  style: TextStyle(
                    fontSize: 12,
                    color: const Color(0xff888888),
                  ),
                ),
              ],
            ),
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
        bgColor = const Color.fromARGB(23, 45, 212, 191);
        textColor = const Color(0xff2dd4bf);
        borderColor = const Color.fromARGB(46, 45, 212, 191);
        break;
      case TagType.switchMode:
        bgColor = const Color.fromARGB(23, 45, 212, 191);
        textColor = const Color(0xff2dd4bf);
        borderColor = const Color.fromARGB(46, 45, 212, 191);
        break;
      case TagType.cancel:
        bgColor = const Color.fromARGB(23, 255, 153, 51);
        textColor = const Color(0xffff9933);
        borderColor = const Color.fromARGB(46, 255, 153, 51);
        break;
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
      decoration: BoxDecoration(
        color: bgColor,
        border: Border.all(color: borderColor),
        borderRadius: BorderRadius.circular(4),
      ),
      child: Text(tag, style: TextStyle(fontSize: 10, color: textColor)),
    );
  }

  Widget _buildTabBar() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        color: const Color.fromARGB(235, 15, 25, 45),
        border: const Border(
          top: BorderSide(color: Color.fromARGB(38, 74, 158, 255)),
        ),
      ),
      child: Row(
        children: [
          _buildTab('概览', Icons.home, false),
          _buildTab('监控', Icons.monitor, false),
          _buildTab('策略', Icons.show_chart, true),
          _buildTab('告警', Icons.notifications, false),
        ],
      ),
    );
  }

  Widget _buildTab(String label, IconData icon, bool active) {
    return Expanded(
      child: TextButton(
        onPressed: () {},
        child: Column(
          children: [
            Icon(
              icon,
              color: active ? const Color(0xff4a9eff) : const Color(0xff666666),
              size: 24,
            ),
            const SizedBox(height: 4),
            Text(
              label,
              style: TextStyle(
                fontSize: 12,
                color: active
                    ? const Color(0xff4a9eff)
                    : const Color(0xff888888),
              ),
            ),
          ],
        ),
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
