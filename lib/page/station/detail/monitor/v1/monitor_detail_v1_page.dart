import 'package:cescpro/components/common_app_bar.dart';
import 'package:cescpro/page/station/detail/monitor/v1/monitor_detail_v1_logic.dart';
import 'package:cescpro/page/station/detail/monitor/v1/widget/arr/arr_view.dart';
import 'package:cescpro/page/station/detail/monitor/v1/widget/cell/cell_view.dart';
import 'package:cescpro/page/station/detail/monitor/v1/widget/clu/clu_view.dart';
import 'package:cescpro/page/station/detail/monitor/v1/widget/cool/air_cool_view.dart';
import 'package:cescpro/page/station/detail/monitor/v1/widget/dido/dido_view.dart';
import 'package:cescpro/page/station/detail/monitor/v1/widget/meter/meter_view.dart';
import 'package:cescpro/page/station/detail/monitor/v1/widget/pcs/pcs_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MonitorDetailV1Page extends StatelessWidget {
  const MonitorDetailV1Page({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MonitorDetailV1Logic>(
      init: MonitorDetailV1Logic(),
      builder: (logic) {
        return Scaffold(
          appBar: baseAppBar(title: logic.title),
          backgroundColor: Color(0xFF23282E),
          body: Stack(
            alignment: Alignment.topCenter,
            children: [
              if (logic.devType == "ARR") ArrView(logic: logic),

              if (logic.devType == "CLU") CluView(logic: logic),

              if (logic.devType == "PCS") PcsView(logic: logic),

              if (logic.devType == "AIR_COOL") AirCoolView(logic: logic),

              if (logic.devType == "METER") MeterView(logic: logic),

              if (logic.devType == "DIDO") DidoView(logic: logic),

              if (logic.devType == "CELL") CellView(logic: logic),
            ],
          ),
        );
      },
    );
  }
}
