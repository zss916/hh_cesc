import 'package:cescpro/core/translations/en.dart';
import 'package:cescpro/page/chart/widget/battery/h_line_chart.dart';
import 'package:cescpro/page/chart/widget/horizontal_chart_view.dart';
import 'package:cescpro/page/station/detail/monitor/cluster/battery_cluster_logic.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ClusterChartPage extends StatelessWidget {
  const ClusterChartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return HorizontalChartView(
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 16),
        padding: EdgeInsetsDirectional.only(start: 5, end: 5, bottom: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Color(0xFF313540),
        ),
        width: double.maxFinite,
        child: Stack(
          alignment: AlignmentDirectional.topCenter,
          children: [
            GetBuilder<BatteryClusterLogic>(
              id: "realTimeData",
              init: BatteryClusterLogic(),
              builder: (logic) {
                return Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Divider(height: 5, color: Colors.transparent),
                    Row(
                      children: [
                        Text(
                          "(kW)",
                          style: TextStyle(
                            color: Color(0x80FFFFFF),
                            fontSize: 12,
                          ),
                        ),
                        Spacer(),
                        Text(
                          "(%)",
                          style: TextStyle(
                            color: Color(0xFF0BC3C4),
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                    Expanded(
                      child: HMonitorLineChartWidget(
                        arrList: logic.arrList,
                        maxX: logic.arrMaxX.toDouble(),
                        maxY: logic.arrMaxY,
                        minY: logic.arrMinY,
                        maxYR: logic.arrMaxYR,
                        minYR: logic.arrMinYR,
                        isDiffL: logic.isDiffL,
                        isDiffR: logic.isDiffR,
                      ),
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
                        VerticalDivider(width: 16, color: Colors.transparent),
                        Row(
                          children: [
                            Container(
                              width: 7,
                              height: 7,
                              margin: EdgeInsets.only(right: 5),
                              decoration: BoxDecoration(
                                color: Color(0xFF0BC3C4),
                                borderRadius: BorderRadius.circular(2),
                              ),
                            ),
                            Text(
                              "SOC",
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
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
