import 'package:cescpro/generated/assets.dart';
import 'package:cescpro/http/bean/site_topology_entity.dart';
import 'package:cescpro/page/station/detail/olive/widget/olive_item/line/gplot_line_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class TopologyWidget extends StatelessWidget {
  final SiteTopologyEntity? topology;
  const TopologyWidget({super.key, this.topology});

  List<SiteTopologyLine> get line => topology?.line ?? [];
  double get pvPower => topology?.pv?.power ?? 0;
  double get gridPower => topology?.grid?.power ?? 0;
  double get loadPower => topology?.load?.power ?? 0;
  double get storagePower => topology?.storage?.power ?? 0;
  double get storageSoc => topology?.storage?.soc ?? 0;
  bool get isHasPv => topology?.hasPv ?? false;

  @override
  Widget build(BuildContext context) {
    if (topology != null) {
      return (isHasPv) ? _buildPvTopology() : _buildTopology();
    } else {
      return _buildProgress();
    }
  }

  Widget _buildProgress() => Container(
    decoration: BoxDecoration(
      color: Color(0xFF313540),
      borderRadius: BorderRadius.circular(8),
    ),
    padding: EdgeInsetsDirectional.only(
      start: 5.r,
      end: 5.r,
      top: 0,
      bottom: 8.r,
    ),
    margin: EdgeInsets.only(top: 16.h, left: 16.w, right: 16.w),
    width: double.maxFinite,
    height: (Get.width - 110.w),
    child: Stack(
      alignment: Alignment.center,
      children: [
        SizedBox(
          width: 42,
          height: 42,
          child: CircularProgressIndicator(color: Colors.white, strokeWidth: 3),
        ),
      ],
    ),
  );

  Widget _buildPvTopology() {
    return Container(
      decoration: BoxDecoration(
        color: Color(0xFF313540),
        borderRadius: BorderRadius.circular(8),
      ),
      padding: EdgeInsetsDirectional.only(top: 0, bottom: 8, start: 0, end: 0),
      margin: EdgeInsets.only(top: 16.h, left: 16.w, right: 16.w),
      width: double.maxFinite,
      height: Get.width,
      child: Stack(
        alignment: AlignmentDirectional.center,
        children: [
          GplotLineWidget(
            defaultLines: [
              [
                {
                  'start': Offset(70.r, (Get.width - 32.w) / 2),
                  'end': Offset(125.r, (Get.width - 32.w) / 2),
                },
              ],
              [
                {
                  'start': Offset(70.r + 150.r, (Get.width - 32.w) / 2),
                  'end': Offset(125.r + 150.r, (Get.width - 32.w) / 2),
                },
              ],
              if (isHasPv)
                [
                  {
                    'start': Offset((Get.width - 32.w) / 2 - 4.r, 70.r + 30.r),
                    'end': Offset((Get.width - 32.w) / 2 - 4.r, 70.r + 85.r),
                  },
                ],
              [
                {
                  'start': Offset((Get.width - 32.w) / 2 - 4.r, 70.r + 175.r),
                  'end': Offset(
                    (Get.width - 32.w) / 2 - 4.r,
                    70.r + 75.r + 120.r + 10.r,
                  ),
                },
              ],
            ],
            lines: line.isEmpty
                ? []
                : [
                    if (topology?.load != null && topology?.isHasLoad == true)
                      [
                        ///load <- ems
                        {
                          'end': Offset(70.r, (Get.width - 32.w) / 2),
                          'start': Offset(125.r, (Get.width - 32.w) / 2),
                        },
                      ],

                    if (topology?.grid != null && topology?.isHasGrid == true)
                      [
                        ///grid <->ems
                        if (topology?.isGridOut == true)
                          {
                            'end': Offset(70.r + 150.r, (Get.width - 32.w) / 2),
                            'start': Offset(
                              125.r + 150.r,
                              (Get.width - 32.w) / 2,
                            ),
                          },

                        if (topology?.isGridOut == false)
                          {
                            'start': Offset(
                              70.r + 150.r,
                              (Get.width - 32.w) / 2,
                            ),
                            'end': Offset(
                              125.r + 150.r,
                              (Get.width - 32.w) / 2,
                            ),
                          },
                      ],
                    if (isHasPv && pvPower != 0)
                      [
                        ///pv -> ems
                        {
                          'start': Offset(
                            (Get.width - 32.w) / 2 - 4.r,
                            70.r + 30.r,
                          ),
                          'end': Offset(
                            (Get.width - 32.w) / 2 - 4.r,
                            70.r + 85.r,
                          ),
                        },
                      ],

                    if (topology?.storage != null &&
                        topology?.isHasStorage == true)
                      [
                        ///ems <-> battery
                        if (topology?.isBatteryOut == false)
                          {
                            'start': Offset(
                              (Get.width - 32.w) / 2 - 4.r,
                              70.r + 175.r,
                            ),
                            'end': Offset(
                              (Get.width - 32.w) / 2 - 4.r,
                              70.r + 75.r + 120.r + 10.r,
                            ),
                          },

                        if (topology?.isBatteryOut == true)
                          {
                            'end': Offset(
                              (Get.width - 32.w) / 2 - 4.r,
                              70.r + 175.r,
                            ),
                            'start': Offset(
                              (Get.width - 32.w) / 2 - 4.r,
                              70.r + 75.r + 120.r + 10.r,
                            ),
                          },
                      ],
                  ],
          ),

          Center(
            child: Stack(
              alignment: AlignmentDirectional.center,
              children: [
                Image.asset(Assets.gplotInverter, width: 110.r, height: 110.r),
                PositionedDirectional(
                  bottom: 0,
                  child: Container(
                    margin: EdgeInsetsDirectional.only(end: 6),
                    child: Text(
                      "EMS",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),

          ///battery
          PositionedDirectional(
            bottom: 0,
            end: 0,
            start: 0,
            child: Column(
              children: [
                Transform.scale(
                  scale: 0.9,
                  child: Image.asset(
                    Assets.gplotBattery,
                    width: 75.r,
                    height: 75.r,
                  ),
                ),
                Container(
                  margin: EdgeInsetsDirectional.only(start: 5.w, end: 5.w),
                  child: Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: "Battery: ",
                          children: [
                            TextSpan(
                              style: TextStyle(
                                fontSize: 12,
                                color: Color(0xFFFFFFFF),
                              ),
                              text: "${storagePower}",
                              children: [
                                TextSpan(
                                  style: TextStyle(
                                    fontSize: 8,
                                    color: Color(0xFFFFFFFF),
                                  ),
                                  text: "kW",
                                ),
                              ],
                            ),
                          ],
                          style: TextStyle(
                            fontSize: 12,
                            color: Color(0x99FFFFFF),
                          ),
                        ),
                        WidgetSpan(child: SizedBox(width: 10.w)),
                        TextSpan(
                          text: "SOC: ",
                          children: [
                            TextSpan(
                              style: TextStyle(
                                fontSize: 12,
                                color: Color(0xFFFFFFFF),
                              ),
                              text: "${storageSoc}%",
                            ),
                          ],
                          style: TextStyle(
                            fontSize: 12,
                            color: Color(0x99FFFFFF),
                          ),
                        ),
                      ],
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ),

          ///load
          PositionedDirectional(
            top: 0,
            bottom: 10,
            start: 0,
            child: Stack(
              alignment: AlignmentDirectional.center,
              children: [
                Image.asset(Assets.gplotLoad, width: 75.r, height: 75.r),
              ],
            ),
          ),

          ///load text
          PositionedDirectional(
            top: (Get.width - 32.w) / 2 + 35.r,
            start: 0,
            child: Container(
              padding: EdgeInsetsDirectional.only(start: 6.w),
              width: (Get.width / 2 - 50.w),
              child: Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: "Load: ",
                      children: [
                        TextSpan(
                          style: TextStyle(
                            fontSize: 12,
                            color: Color(0xFFFFFFFF),
                          ),
                          text: "${loadPower}",
                          children: [
                            TextSpan(
                              style: TextStyle(
                                fontSize: 8,
                                color: Color(0xFFFFFFFF),
                              ),
                              text: "kW",
                            ),
                          ],
                        ),
                      ],
                      style: TextStyle(fontSize: 12, color: Color(0x99FFFFFF)),
                    ),
                  ],
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.start,
              ),
            ),
          ),

          ///grid
          PositionedDirectional(
            top: 0,
            end: 0,
            bottom: 10,
            child: Stack(
              alignment: AlignmentDirectional.center,
              children: [
                Image.asset(
                  Assets.gplotPowerGrid,
                  width: 75.r,
                  height: 75.r,
                  scale: 0.9,
                ),
              ],
            ),
          ),

          ///grid text
          PositionedDirectional(
            top: (Get.width - 32.w) / 2 + 35.r,
            end: 0,
            child: Container(
              padding: EdgeInsetsDirectional.only(end: 6.w),
              width: (Get.width / 2 - 50.w),
              child: Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: "Grid: ",
                      children: [
                        TextSpan(
                          style: TextStyle(
                            fontSize: 12,
                            color: Color(0xFFFFFFFF),
                          ),
                          text: "${gridPower}",
                          children: [
                            TextSpan(
                              style: TextStyle(
                                fontSize: 8,
                                color: Color(0xFFFFFFFF),
                              ),
                              text: "kW",
                            ),
                          ],
                        ),
                      ],
                      style: TextStyle(fontSize: 12, color: Color(0x99FFFFFF)),
                    ),
                  ],
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.end,
              ),
            ),
          ),

          ///pv
          if (isHasPv)
            PositionedDirectional(
              top: 0,
              start: 0,
              end: 0,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.asset(
                    Assets.gplotPv,
                    scale: 0.9,
                    width: 75.r,
                    height: 75.r,
                  ),

                  Container(
                    padding: EdgeInsetsDirectional.only(start: 5.w, end: 5.w),
                    child: Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: "PV: ",
                            children: [
                              TextSpan(
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Color(0xFFFFFFFF),
                                ),
                                text: "${pvPower}",
                                children: [
                                  TextSpan(
                                    style: TextStyle(
                                      fontSize: 8,
                                      color: Color(0xFFFFFFFF),
                                    ),
                                    text: "kW",
                                  ),
                                ],
                              ),
                            ],
                            style: TextStyle(
                              fontSize: 12,
                              color: Color(0x99FFFFFF),
                            ),
                          ),
                        ],
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildTopology() {
    return Container(
      decoration: BoxDecoration(
        color: Color(0xFF313540),
        borderRadius: BorderRadius.circular(8),
      ),
      padding: EdgeInsetsDirectional.only(
        start: 5.r,
        end: 5.r,
        top: 0,
        bottom: 8.r,
      ),
      margin: EdgeInsets.only(top: 16.h, left: 16.w, right: 16.w),
      width: double.maxFinite,
      height: (Get.width - 110.w),
      child: Stack(
        alignment: AlignmentDirectional.topCenter,
        children: [
          GplotLineWidget(
            defaultLines: [
              [
                {
                  'start': Offset(70.r, 20 + (75.r / 2)),
                  'end': Offset(125.r, 20 + (75.r / 2)),
                },
              ],
              [
                {
                  'start': Offset(75.r + 150.r, 20 + (75.r / 2)),
                  'end': Offset(130.r + 150.r, 20 + (75.r / 2)),
                },
              ],
              [
                {
                  'start': Offset((Get.width - 32.w) / 2 - 4.r, 20 + 95.r),
                  'end': Offset(
                    (Get.width - 32.w) / 2 - 4.r,
                    20 + 100.r + 40.r,
                  ),
                },
              ],
            ],
            lines: line.isEmpty
                ? []
                : [
                    if (topology?.load != null && topology?.isHasLoad == true)
                      [
                        ///load <- ems
                        {
                          'end': Offset(70.r, 20 + (75.r / 2)),
                          'start': Offset(125.r, 20 + (75.r / 2)),
                        },
                      ],

                    if (topology?.grid != null && topology?.isHasGrid == true)
                      [
                        ///grid <->ems
                        if (topology?.isGridOut == true)
                          {
                            'end': Offset(70.r + 150.r, 20 + (75.r / 2)),
                            'start': Offset(125.r + 150.r, 20 + (75.r / 2)),
                          },

                        if (topology?.isGridOut == false)
                          {
                            'start': Offset(70.r + 150.r, 20 + (75.r / 2)),
                            'end': Offset(125.r + 150.r, 20 + (75.r / 2)),
                          },
                      ],

                    if (topology?.storage != null &&
                        topology?.isHasStorage == true)
                      [
                        ///ems <-> battery
                        if (topology?.isBatteryOut == false)
                          {
                            'start': Offset(
                              (Get.width - 32.w) / 2 - 4.r,
                              20 + 95.r,
                            ),
                            'end': Offset(
                              (Get.width - 32.w) / 2 - 4.r,
                              20 + 100.r + 40.r,
                            ),
                          },

                        if (topology?.isBatteryOut == true)
                          {
                            'end': Offset(
                              (Get.width - 32.w) / 2 - 4.r,
                              20 + 95.r,
                            ),
                            'start': Offset(
                              (Get.width - 32.w) / 2 - 4.r,
                              20 + 100.r + 40.r,
                            ),
                          },
                      ],
                  ],
          ),

          Stack(
            alignment: AlignmentDirectional.center,
            children: [
              Image.asset(Assets.gplotInverter, width: 110.r, height: 110.r),
              PositionedDirectional(
                bottom: 0,
                child: Container(
                  margin: EdgeInsetsDirectional.only(end: 6),
                  child: Text(
                    "EMS",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 12.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),

          ///battery
          PositionedDirectional(
            bottom: 0,
            end: 0,
            start: 0,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Transform.scale(
                  scale: 0.9,
                  child: Image.asset(
                    Assets.gplotBattery,
                    width: 75.r,
                    height: 75.r,
                  ),
                ),
                Container(
                  margin: EdgeInsetsDirectional.only(start: 5.w, end: 5.w),
                  child: Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: "Battery: ",
                          children: [
                            TextSpan(
                              style: TextStyle(
                                fontSize: 12,
                                color: Color(0xFFFFFFFF),
                              ),
                              text: "${storagePower}",
                              children: [
                                TextSpan(
                                  style: TextStyle(
                                    fontSize: 8,
                                    color: Color(0xFFFFFFFF),
                                  ),
                                  text: "kW",
                                ),
                              ],
                            ),
                          ],
                          style: TextStyle(
                            fontSize: 12,
                            color: Color(0x99FFFFFF),
                          ),
                        ),
                        WidgetSpan(child: SizedBox(width: 10.w)),
                        TextSpan(
                          text: "SOC: ",
                          children: [
                            TextSpan(
                              style: TextStyle(
                                fontSize: 12,
                                color: Color(0xFFFFFFFF),
                              ),
                              text: "${storageSoc}%",
                            ),
                          ],
                          style: TextStyle(
                            fontSize: 12,
                            color: Color(0x99FFFFFF),
                          ),
                        ),
                      ],
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ),

          ///load
          PositionedDirectional(
            top: 20,
            start: 0,
            child: Stack(
              alignment: AlignmentDirectional.center,
              children: [
                Image.asset(Assets.gplotLoad, width: 75.r, height: 75.r),
              ],
            ),
          ),

          ///load text
          PositionedDirectional(
            top: 75.r + 20,
            start: 6.w,
            child: SizedBox(
              width: (Get.width / 2 - 50.w),
              child: Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: "Load: ",
                      children: [
                        TextSpan(
                          style: TextStyle(
                            fontSize: 12,
                            color: Color(0xFFFFFFFF),
                          ),
                          text: "${loadPower}",
                          children: [
                            TextSpan(
                              style: TextStyle(
                                fontSize: 8,
                                color: Color(0xFFFFFFFF),
                              ),
                              text: "kW",
                            ),
                          ],
                        ),
                      ],
                      style: TextStyle(fontSize: 12, color: Color(0x99FFFFFF)),
                    ),
                  ],
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.start,
              ),
            ),
          ),

          ///grid
          PositionedDirectional(
            top: 25,
            end: 0,
            child: Stack(
              alignment: AlignmentDirectional.center,
              children: [
                Image.asset(Assets.gplotPowerGrid, width: 75.r, height: 75.r),
              ],
            ),
          ),

          ///grid text
          PositionedDirectional(
            top: 75.r + 25,
            end: 6.r,
            child: SizedBox(
              width: (Get.width / 2 - 50.w),
              child: Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: "Grid: ",
                      children: [
                        TextSpan(
                          style: TextStyle(
                            fontSize: 12,
                            color: Color(0xFFFFFFFF),
                          ),
                          text: "${gridPower}",
                          children: [
                            TextSpan(
                              style: TextStyle(
                                fontSize: 8,
                                color: Color(0xFFFFFFFF),
                              ),
                              text: "kW",
                            ),
                          ],
                        ),
                      ],
                      style: TextStyle(fontSize: 12, color: Color(0x99FFFFFF)),
                    ),
                  ],
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.end,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
