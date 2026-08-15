import 'package:cescpro/core/user/user.dart';
import 'package:cescpro/http/bean/elec_graph_entity.dart';
import 'package:cescpro/page/station/detail/olive/widget/statistics_item/revenue/base_bar_chart.dart';
import 'package:flutter/material.dart';

class HRevenueBarchartWidget extends StatelessWidget {
  final List<ElecGraphEntity> list;
  const HRevenueBarchartWidget({super.key, required this.list});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.centerStart,
      children: [
        Container(
          margin: EdgeInsetsDirectional.only(top: 15),
          padding: const EdgeInsetsDirectional.only(
            start: 8,
            end: 10,
            top: 12,
            bottom: 0,
          ),
          height: double.maxFinite,
          width: double.maxFinite,
          child: buildBarChart(list),
        ),
        PositionedDirectional(
          start: 10,
          top: 5,
          child: Text(
            "(${User.to.getCurrencyUnit()})",
            style: TextStyle(color: Color(0x80FFFFFF), fontSize: 12),
          ),
        ),
      ],
    );
  }

  Widget buildBarChart(List<ElecGraphEntity> list) {
    return SizedBox(
      height: double.maxFinite,
      width: double.maxFinite,
      child: BaseBarChart(list: list, maximumZoomLevel: getLevel(list.length)),
    );
  }

  ///获取level
  double getLevel(int len) {
    if (len >= 0 && len <= 7) {
      return 1;
    } else if (len > 7 && len <= 15) {
      return 0.7;
    } else if (len > 15 && len <= 25) {
      return 0.3;
    } else if (len > 25 && len <= 31) {
      return 0.25;
    } else {
      return 0.01;
    }
  }
}
