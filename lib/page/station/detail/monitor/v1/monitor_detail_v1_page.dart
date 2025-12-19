import 'package:cescpro/components/common_app_bar.dart';
import 'package:cescpro/page/station/detail/monitor/v1/helper/device_view_enum.dart';
import 'package:cescpro/page/station/detail/monitor/v1/monitor_detail_v1_logic.dart';
import 'package:cescpro/page/station/detail/monitor/v1/widget/arr/arr_view.dart';
import 'package:cescpro/page/station/detail/monitor/v1/widget/cell/cell_view.dart';
import 'package:cescpro/page/station/detail/monitor/v1/widget/clu/clu_view.dart';
import 'package:cescpro/page/station/detail/monitor/v1/widget/cool/air_cool_view.dart';
import 'package:cescpro/page/station/detail/monitor/v1/widget/dido/dido_view.dart';
import 'package:cescpro/page/station/detail/monitor/v1/widget/fire/fire_view.dart';
import 'package:cescpro/page/station/detail/monitor/v1/widget/meter/meter_view.dart';
import 'package:cescpro/page/station/detail/monitor/v1/widget/pcs/pcs_view.dart';
import 'package:cescpro/page/station/detail/monitor/v1/widget/stats_meter/stats_meter.dart';
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
              if (logic.devType == DeviceEnum.arr.value) ArrView(logic: logic),

              if (logic.devType == DeviceEnum.clu.value) CluView(logic: logic),

              if (logic.devType == DeviceEnum.pcs.value) PcsView(logic: logic),

              if (logic.devType == DeviceEnum.airCool.value)
                AirCoolView(logic: logic),

              if (logic.devType == DeviceEnum.meter.value)
                MeterView(logic: logic),

              if (logic.devType == DeviceEnum.dido.value)
                DidoView(logic: logic),

              if (logic.devType == DeviceEnum.cell.value)
                CellView(logic: logic),

              if (logic.devType == DeviceEnum.statsMeter.value)
                StatsMeter(logic: logic),

              if (logic.devType == DeviceEnum.fire.value)
                FireView(logic: logic),
            ],
          ),
        );
      },
    );
  }
}
