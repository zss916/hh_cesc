import 'package:cescpro/http/bean/elec_graph_entity.dart';
import 'package:cescpro/page/station/detail/olive/widget/statistics_item/ele/widget/multi_base_bar_chart.dart';
import 'package:flutter/material.dart';

class HEleBarchartItemWidget extends StatelessWidget {
  final List<ElecGraphEntity> list;
  final double maximumZoomLevel;
  const HEleBarchartItemWidget({
    super.key,
    required this.list,
    required this.maximumZoomLevel,
  });

  @override
  Widget build(BuildContext context) {
    return MultiBaseBarChart(list: list, maximumZoomLevel: maximumZoomLevel);
  }
}
