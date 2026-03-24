import 'package:cescpro/components/tab/kugou_tabbar.dart';
import 'package:cescpro/components/tab/rrect_indicator.dart';
import 'package:flutter/material.dart';

class AlarmView extends StatefulWidget {
  const AlarmView({super.key});

  @override
  State<AlarmView> createState() => _AlarmViewState();
}

class _AlarmViewState extends State<AlarmView>
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
    return Column(
      children: [
        KuGouTabBar(
          physics: NeverScrollableScrollPhysics(),
          tabs: [
            Tab(text: "Real-time Alarms"),
            Tab(text: "History Alarms"),
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
          padding: EdgeInsetsDirectional.only(end: 35),
          labelColor: Color(0xFF43FFFF),
          unselectedLabelColor: Colors.white,
          indicator: const RRecTabIndicator(
            radius: 10,
            insets: EdgeInsets.only(bottom: 0),
            color: Color(0xFF43FFFF),
          ),
          indicatorMinWidth: 40,
        ),
        Expanded(
          child: TabBarView(
            // physics: NeverScrollableScrollPhysics(),
            controller: tabCtrl,
            children: [SizedBox(), SizedBox()],
          ),
        ),
      ],
    );
  }
}
