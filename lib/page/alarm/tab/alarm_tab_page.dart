import 'package:cescpro/components/keep_alive_page.dart';
import 'package:cescpro/components/tab/rrect_indicator.dart';
import 'package:cescpro/core/translations/en.dart';
import 'package:cescpro/page/alarm/tab/view/history/history_view.dart';
import 'package:cescpro/page/alarm/tab/view/realTime/real_time_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AlarmTabPage extends StatefulWidget {
  const AlarmTabPage({super.key});

  @override
  State<AlarmTabPage> createState() => _AlarmTabPageState();
}

class _AlarmTabPageState extends State<AlarmTabPage>
    with SingleTickerProviderStateMixin {
  late final TabController tabCtrl;

  @override
  void initState() {
    super.initState();
    tabCtrl = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    tabCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 0,
        leading: SizedBox.shrink(),
        backgroundColor: Colors.transparent,
      ),
      backgroundColor: Color(0xFF23282E),
      body: Column(
        children: [
          TabBar(
            physics: NeverScrollableScrollPhysics(),
            tabs: [
              Tab(text: TKey.realTimeAlarms.tr),
              Tab(text: TKey.historyAlarms.tr),
            ],
            controller: tabCtrl,
            labelStyle: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: Color(0xFF42FDFE),
            ),
            unselectedLabelStyle: const TextStyle(
              fontSize: 14,
              color: Colors.white,
              fontWeight: FontWeight.w500,
            ),
            isScrollable: false,
            labelColor: Color(0xFF43FFFF),
            unselectedLabelColor: Colors.white,
            indicator: const RRecTabIndicator(
              radius: 10,
              insets: EdgeInsets.only(bottom: 0),
              color: Color(0xFF43FFFF),
            ),
          ),
          Expanded(
            child: TabBarView(
              // physics: NeverScrollableScrollPhysics(),
              controller: tabCtrl,
              children: [
                AppKeepAlivePage(RealTimeAlarmView()),
                AppKeepAlivePage(HistoryAlarmView()),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
