import 'package:cescpro/core/translations/en.dart';
import 'package:cescpro/page/chart/widget/horizontal_chart_view.dart';
import 'package:cescpro/page/chart/widget/horizontal_meter/h_line_chart2.dart';
import 'package:cescpro/page/station/detail/monitor/detail/monitor_detail_logic.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MeterChartPage extends StatelessWidget {
  const MeterChartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return HorizontalChartView(
      child: Container(
        margin: EdgeInsets.only(right: 20),
        padding: EdgeInsetsDirectional.only(start: 5, end: 10, bottom: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Color(0xFF313540),
        ),
        width: double.maxFinite,
        height: double.maxFinite,
        child: Stack(
          alignment: AlignmentDirectional.topCenter,
          children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Divider(height: 5, color: Colors.transparent),
                GetBuilder<MonitorDetailLogic>(
                  id: "realTimeData",
                  init: MonitorDetailLogic(),
                  builder: (logic) {
                    return Container(
                      color: Colors.transparent,
                      height: 210,
                      width: double.maxFinite,
                      child: logic.powerList.isEmpty
                          ? Center(
                              child: CircularProgressIndicator(
                                color: Colors.white,
                              ),
                            )
                          : HMonitorLineChartWidget2(
                              powerList: logic.powerList,
                              maxY: logic.powerMaxY,
                              minY: logic.powerMinY,
                              maxX: logic.powerMaxX,
                            ),
                    );
                  },
                ),
                Divider(height: 5, color: Colors.transparent),
                Row(
                  children: [
                    Spacer(),
                    Row(
                      children: [
                        Container(
                          width: 7,
                          height: 7,
                          margin: EdgeInsets.only(right: 5),
                          decoration: BoxDecoration(
                            color: Color(0xFF3874F2),
                            borderRadius: BorderRadius.circular(2),
                          ),
                        ),
                        Text(
                          TKey.power.tr,
                          style: TextStyle(
                            color: Color(0xD9FFFFFF),
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                    Spacer(),
                  ],
                ),
              ],
            ),
            PositionedDirectional(
              start: 0,
              top: 15,
              child: Text(
                "(kW)",
                style: TextStyle(color: Color(0x80FFFFFF), fontSize: 12),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
