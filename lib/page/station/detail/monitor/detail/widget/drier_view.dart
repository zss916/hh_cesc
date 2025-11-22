import 'package:cescpro/page/station/detail/monitor/detail/monitor_detail_logic.dart';
import 'package:cescpro/page/station/detail/monitor/detail/widget/child/real_time_data_widget.dart';
import 'package:cescpro/page/station/detail/monitor/detail/widget/child/top_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DrierView extends StatelessWidget {
  final MonitorDetailLogic logic;
  const DrierView({super.key, required this.logic});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TopItemWidget(logic: logic),
        Divider(height: 12.h, color: Colors.transparent),

        ///实时数据
        RealTimeDataWidget(comCardVoList: logic.comCardVoList),
        Divider(height: 120.h, color: Colors.transparent),
      ],
    );
  }
}
