import 'package:cescpro/components/tab/kugou_tabbar.dart';
import 'package:cescpro/components/tab/rrect_indicator.dart';
import 'package:cescpro/core/translations/en.dart';
import 'package:cescpro/page/station/detail/olive/widget/olive_item/olive_item_view.dart';
import 'package:cescpro/page/station/detail/olive/widget/statistics_item/statistics_item_view.dart';
import 'package:flutter/material.dart' hide DatePickerTheme;
import 'package:get/get.dart';

class OliveView extends StatefulWidget {
  const OliveView({super.key});

  @override
  State<OliveView> createState() => _OliveViewState();
}

class _OliveViewState extends State<OliveView>
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
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_new_rounded, color: Colors.white),
          onPressed: () => Get.back(),
        ),
        centerTitle: true,
        title: KuGouTabBar(
          physics: NeverScrollableScrollPhysics(),
          tabs: [
            Tab(text: TKey.oliveView.tr),
            Tab(text: TKey.statistics.tr),
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
        backgroundColor: Colors.transparent,
      ),
      backgroundColor: Color(0xFF23282E),
      body: TabBarView(
        physics: NeverScrollableScrollPhysics(),
        controller: tabCtrl,
        children: [OliveItemView(), StatisticsItemView()],
      ),
    );
  }
}
