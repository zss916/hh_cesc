import 'package:cescpro/components/common_app_bar.dart';
import 'package:cescpro/core/router/index.dart';
import 'package:cescpro/core/translations/en.dart';
import 'package:cescpro/http/bean/com_card_vo_entity.dart';
import 'package:cescpro/page/station/detail/monitor/cluster/line_chart.dart';
import 'package:cescpro/page/station/detail/monitor/detail/monitor_detail_logic.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class MonitorDetailPage extends StatelessWidget {
  const MonitorDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MonitorDetailLogic>(
      init: MonitorDetailLogic(),
      builder: (logic) {
        return Scaffold(
          appBar: baseAppBar(title: logic.title),
          backgroundColor: Color(0xFF23282E),
          body: SingleChildScrollView(
            child: Stack(
              alignment: Alignment.topCenter,
              children: [
                if (logic.devType == "PCS") buildPCS(logic),

                if (logic.devType == "ARR" || logic.devType == "CLU")
                  buildBatterySystem(logic),
              ],
            ),
          ),
        );
      },
    );
  }

  ///PCS
  Widget buildPCS(MonitorDetailLogic logic) {
    return Column(
      children: [
        buildTopItem(title: logic.compTree),
        Divider(height: 12.h, color: Colors.transparent),

        ///状态
        buildPCSSatusItem(logic),
        Divider(height: 12.h, color: Colors.transparent),

        ///基础数据
        buildPCSBaseInfoItem(logic),
        Divider(height: 12.h, color: Colors.transparent),

        ///AC
        buildACSide(logic),
        Divider(height: 12.h, color: Colors.transparent),

        ///todo 实时曲线
        buildLineChartWidget(),
        Divider(height: 12.h, color: Colors.transparent),

        ///实时数据
        buildRealTimeData(logic.comCardVoList),
        Divider(height: 120.h, color: Colors.transparent),
      ],
    );
  }

  ///电池系统
  Widget buildBatterySystem(MonitorDetailLogic logic) {
    return Column(
      children: [
        buildTopItem(title: logic.compTree),
        Divider(height: 12.h, color: Colors.transparent),

        ///状态
        buildBatterySatusItem(logic),
        Divider(height: 12.h, color: Colors.transparent),

        ///基础数据
        buildBatteryBaseInfoItem(logic),
        Divider(height: 12.h, color: Colors.transparent),

        ///ComponentTypeList
        // buildDirectFlowMeasurement(),
        // Divider(height: 12.h, color: Colors.transparent),

        ///AC
        /// buildACSide(),
        /// Divider(height: 12.h, color: Colors.transparent),

        ///???
        // buildInfoList(),
        // Divider(height: 12.h, color: Colors.transparent),

        ///todo 实时曲线
        buildLineChartWidget(),
        Divider(height: 12.h, color: Colors.transparent),

        ///实时数据
        buildRealTimeData(logic.comCardVoList),
        Divider(height: 120.h, color: Colors.transparent),
      ],
    );
  }

  Widget buildTopItem({required String title}) => Container(
    decoration: BoxDecoration(color: Color(0xFF313540)),
    width: double.maxFinite,
    child: Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () {
          PageTools.toBatteryCluster();
        },
        child: Container(
          width: double.maxFinite,
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          child: Row(
            children: [
              Text(title, style: TextStyle(color: Colors.white, fontSize: 14)),
              Spacer(),
              Icon(
                Icons.arrow_right_rounded,
                color: Color(0xA6FFFFFF),
                size: 25,
              ),
            ],
          ),
        ),
      ),
    ),
  );

  ///电池状态
  Widget buildBatterySatusItem(MonitorDetailLogic logic) => Column(
    children: [
      Container(
        padding: EdgeInsetsDirectional.only(
          start: 18.w,
          end: 18.w,
          bottom: 16.h,
        ),
        alignment: AlignmentDirectional.centerStart,
        child: Text(
          TKey.status.tr,
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w500,
            fontSize: 16,
          ),
        ),
      ),
      Container(
        margin: EdgeInsets.symmetric(horizontal: 16.w),
        padding: EdgeInsetsDirectional.all(16.r),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Color(0xFF313540),
        ),
        width: double.maxFinite,
        child: Column(
          children: [
            Row(
              children: [
                Text(
                  "${logic.comTypeList?.signalStatus?.showFieldName ?? "--"}:",
                  style: TextStyle(fontSize: 14, color: Color(0xA6FFFFFF)),
                ),
                Spacer(),
                Text(
                  logic.comTypeList?.signalStatus?.value ?? "--",
                  style: TextStyle(fontSize: 14, color: Color(0xFFFFFFFF)),
                ),
              ],
            ),

            Divider(height: 16.h, color: Colors.transparent),

            Row(
              children: [
                Text(
                  "${logic.comTypeList?.runStatus?.showFieldName ?? ""}:",
                  style: TextStyle(fontSize: 14, color: Color(0xA6FFFFFF)),
                ),
                Spacer(),
                Text(
                  logic.comTypeList?.runStatus?.value ?? "--",
                  style: TextStyle(fontSize: 14, color: Color(0xFFFFFFFF)),
                ),
              ],
            ),

            Divider(height: 16.h, color: Colors.transparent),

            Row(
              children: [
                Text(
                  "${logic.comTypeList?.alarmStatus?.showFieldName ?? ""}:",
                  style: TextStyle(fontSize: 14, color: Color(0xA6FFFFFF)),
                ),
                Spacer(),
                Text(
                  logic.comTypeList?.alarmStatus?.value ?? "--",
                  style: TextStyle(fontSize: 14, color: Color(0xFFFFFFFF)),
                ),
              ],
            ),
          ],
        ),
      ),
    ],
  );

  ///PCS状态
  Widget buildPCSSatusItem(MonitorDetailLogic logic) => Column(
    children: [
      Container(
        padding: EdgeInsetsDirectional.only(
          start: 18.w,
          end: 18.w,
          bottom: 16.h,
        ),
        alignment: AlignmentDirectional.centerStart,
        child: Text(
          TKey.status.tr,
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w500,
            fontSize: 16,
          ),
        ),
      ),
      Container(
        margin: EdgeInsets.symmetric(horizontal: 16.w),
        padding: EdgeInsetsDirectional.all(16.r),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Color(0xFF313540),
        ),
        width: double.maxFinite,
        child: Column(
          children: [
            Row(
              children: [
                Text(
                  "${logic.comTypeList?.signalStatus?.showFieldName ?? "--"}:",
                  style: TextStyle(fontSize: 14, color: Color(0xA6FFFFFF)),
                ),
                Spacer(),
                Text(
                  logic.comTypeList?.signalStatus?.value ?? "--",
                  style: TextStyle(fontSize: 14, color: Color(0xFFFFFFFF)),
                ),
              ],
            ),

            Divider(height: 16.h, color: Colors.transparent),

            Row(
              children: [
                Text(
                  "${logic.comTypeList?.runStatus?.showFieldName ?? ""}:",
                  style: TextStyle(fontSize: 14, color: Color(0xA6FFFFFF)),
                ),
                Spacer(),
                Text(
                  logic.comTypeList?.runStatus?.value ?? "--",
                  style: TextStyle(fontSize: 14, color: Color(0xFFFFFFFF)),
                ),
              ],
            ),

            Divider(height: 16.h, color: Colors.transparent),

            Row(
              children: [
                Text(
                  "${logic.comTypeList?.gridStatus?.showFieldName ?? ""}:",
                  style: TextStyle(fontSize: 14, color: Color(0xA6FFFFFF)),
                ),
                Spacer(),
                Text(
                  logic.comTypeList?.gridStatus?.value ?? "--",
                  style: TextStyle(fontSize: 14, color: Color(0xFFFFFFFF)),
                ),
              ],
            ),
          ],
        ),
      ),
    ],
  );

  ///电池基础信息
  Widget buildBatteryBaseInfoItem(MonitorDetailLogic logic) => Column(
    children: [
      Container(
        padding: EdgeInsetsDirectional.only(
          start: 18.w,
          end: 18.w,
          bottom: 16.h,
        ),
        alignment: AlignmentDirectional.centerStart,
        child: Text(
          TKey.basicInformation.tr,
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w500,
            fontSize: 16,
          ),
        ),
      ),
      Container(
        margin: EdgeInsets.symmetric(horizontal: 16.w),
        padding: EdgeInsetsDirectional.all(16.r),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Color(0xFF313540),
        ),
        width: double.maxFinite,
        child: Column(
          children: [
            Row(
              children: [
                Text(
                  "${logic.comTypeList?.soc?.showFieldName ?? ""}:",
                  style: TextStyle(fontSize: 14, color: Color(0xA6FFFFFF)),
                ),
                Spacer(),
                Text(
                  "${logic.comTypeList?.soc?.value ?? "0"}${logic.comTypeList?.soc?.unit ?? ""}",
                  style: TextStyle(fontSize: 14, color: Color(0xFFFFFFFF)),
                ),
              ],
            ),
            Divider(height: 16.h, color: Colors.transparent),
            Row(
              children: [
                Text(
                  "${logic.comTypeList?.voltage?.showFieldName ?? ""}:",
                  style: TextStyle(fontSize: 14, color: Color(0xA6FFFFFF)),
                ),
                Spacer(),
                Text(
                  "${logic.comTypeList?.voltage?.value ?? "0"}${logic.comTypeList?.voltage?.unit ?? ""}",
                  style: TextStyle(fontSize: 14, color: Color(0xFFFFFFFF)),
                ),
              ],
            ),
            Divider(height: 16.h, color: Colors.transparent),
            Row(
              children: [
                Text(
                  "${logic.comTypeList?.current?.showFieldName ?? ""}:",
                  style: TextStyle(fontSize: 14, color: Color(0xA6FFFFFF)),
                ),
                Spacer(),
                Text(
                  "${logic.comTypeList?.current?.value ?? "0"}${logic.comTypeList?.current?.unit ?? ""}",
                  style: TextStyle(fontSize: 14, color: Color(0xFFFFFFFF)),
                ),
              ],
            ),
            Divider(height: 16.h, color: Colors.transparent),
            Row(
              children: [
                Text(
                  "${logic.comTypeList?.singleMaxVoltage?.showFieldName ?? ""}:",
                  style: TextStyle(fontSize: 14, color: Color(0xA6FFFFFF)),
                ),
                Spacer(),
                Text(
                  "${logic.comTypeList?.singleMaxVoltage?.value ?? "0"}${logic.comTypeList?.singleMaxVoltage?.unit ?? ""}",
                  style: TextStyle(fontSize: 14, color: Color(0xFFFFFFFF)),
                ),
              ],
            ),
            Divider(height: 16.h, color: Colors.transparent),
            Row(
              children: [
                Text(
                  "${logic.comTypeList?.singleMinVoltage?.showFieldName ?? ""}:",
                  style: TextStyle(fontSize: 14, color: Color(0xA6FFFFFF)),
                ),
                Spacer(),
                Text(
                  "${logic.comTypeList?.singleMinVoltage?.value ?? "0"}${logic.comTypeList?.singleMinVoltage?.unit ?? ""}",
                  style: TextStyle(fontSize: 14, color: Color(0xFFFFFFFF)),
                ),
              ],
            ),
            Divider(height: 16.h, color: Colors.transparent),
            Row(
              children: [
                Text(
                  "${logic.comTypeList?.singleMaxTemp?.showFieldName ?? ""}:",
                  style: TextStyle(fontSize: 14, color: Color(0xA6FFFFFF)),
                ),
                Spacer(),
                Text(
                  "${logic.comTypeList?.singleMaxTemp?.value ?? 0}${logic.comTypeList?.singleMaxTemp?.unit ?? ""}",
                  style: TextStyle(fontSize: 14, color: Color(0xFFFFFFFF)),
                ),
              ],
            ),
            Divider(height: 16.h, color: Colors.transparent),
            Row(
              children: [
                Text(
                  "${logic.comTypeList?.singleMinTemp?.showFieldName ?? ""}:",
                  style: TextStyle(fontSize: 14, color: Color(0xA6FFFFFF)),
                ),
                Spacer(),
                Text(
                  "${logic.comTypeList?.singleMinTemp?.value ?? 0}${logic.comTypeList?.singleMinTemp?.unit ?? ""}",
                  style: TextStyle(fontSize: 14, color: Color(0xFFFFFFFF)),
                ),
              ],
            ),
            Divider(height: 16.h, color: Colors.transparent),
            Row(
              children: [
                Text(
                  "${logic.comTypeList?.maxChargePower?.showFieldName ?? ""}:",
                  style: TextStyle(fontSize: 14, color: Color(0xA6FFFFFF)),
                ),
                Spacer(),
                Text(
                  "${logic.comTypeList?.maxChargePower?.value ?? "0"}${logic.comTypeList?.maxChargePower?.unit ?? ""}",
                  style: TextStyle(fontSize: 14, color: Color(0xFFFFFFFF)),
                ),
              ],
            ),
            Divider(height: 16.h, color: Colors.transparent),
            Row(
              children: [
                Text(
                  "${logic.comTypeList?.maxOutPower?.showFieldName ?? ""}:",
                  style: TextStyle(fontSize: 14, color: Color(0xA6FFFFFF)),
                ),
                Spacer(),
                Text(
                  "${logic.comTypeList?.maxOutPower?.value ?? "0"}${logic.comTypeList?.maxOutPower?.unit ?? ""}",
                  style: TextStyle(fontSize: 14, color: Color(0xFFFFFFFF)),
                ),
              ],
            ),
          ],
        ),
      ),
    ],
  );

  ///PCS基础信息
  Widget buildPCSBaseInfoItem(MonitorDetailLogic logic) => Column(
    children: [
      Container(
        padding: EdgeInsetsDirectional.only(
          start: 18.w,
          end: 18.w,
          bottom: 16.h,
        ),
        alignment: AlignmentDirectional.centerStart,
        child: Text(
          TKey.basicInformation.tr,
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w500,
            fontSize: 16,
          ),
        ),
      ),
      Container(
        margin: EdgeInsets.symmetric(horizontal: 16.w),
        padding: EdgeInsetsDirectional.all(16.r),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Color(0xFF313540),
        ),
        width: double.maxFinite,
        child: Column(
          children: [
            Row(
              children: [
                Text(
                  logic.comTypeList?.totalChargeElectric?.showFieldName ?? "--",
                  style: TextStyle(fontSize: 14, color: Color(0xA6FFFFFF)),
                ),
                Spacer(),
                Text(
                  "${logic.comTypeList?.totalChargeElectric?.value ?? "0"}${logic.comTypeList?.totalChargeElectric?.unit ?? ""}",
                  style: TextStyle(fontSize: 14, color: Color(0xFFFFFFFF)),
                ),
              ],
            ),
            Divider(height: 16.h, color: Colors.transparent),
            Row(
              children: [
                Text(
                  logic.comTypeList?.totalOutElectric?.showFieldName ?? "--",
                  style: TextStyle(fontSize: 14, color: Color(0xA6FFFFFF)),
                ),
                Spacer(),
                Text(
                  "${logic.comTypeList?.totalOutElectric?.value ?? "0"}${logic.comTypeList?.totalOutElectric?.unit ?? ""}",
                  style: TextStyle(fontSize: 14, color: Color(0xFFFFFFFF)),
                ),
              ],
            ),
            Divider(height: 16.h, color: Colors.transparent),
            Row(
              children: [
                Text(
                  logic.comTypeList?.hz?.showFieldName ?? "--",
                  style: TextStyle(fontSize: 14, color: Color(0xA6FFFFFF)),
                ),
                Spacer(),
                Text(
                  "${logic.comTypeList?.hz?.value ?? "0"}${logic.comTypeList?.hz?.unit ?? ""}",
                  style: TextStyle(fontSize: 14, color: Color(0xFFFFFFFF)),
                ),
              ],
            ),
            Divider(height: 16.h, color: Colors.transparent),
            Row(
              children: [
                Text(
                  logic.comTypeList?.temp?.showFieldName ?? "--",
                  style: TextStyle(fontSize: 14, color: Color(0xA6FFFFFF)),
                ),
                Spacer(),
                Text(
                  "${logic.comTypeList?.temp?.value ?? "0"}${logic.comTypeList?.temp?.unit ?? ""}",
                  style: TextStyle(fontSize: 14, color: Color(0xFFFFFFFF)),
                ),
              ],
            ),
            Divider(height: 16.h, color: Colors.transparent),
            Row(
              children: [
                Text(
                  logic.comTypeList?.activePowerT?.showFieldName ?? "--",
                  style: TextStyle(fontSize: 14, color: Color(0xA6FFFFFF)),
                ),
                Spacer(),
                Text(
                  "${logic.comTypeList?.activePowerT?.value ?? "0"}${logic.comTypeList?.activePowerT?.unit ?? ""}",
                  style: TextStyle(fontSize: 14, color: Color(0xFFFFFFFF)),
                ),
              ],
            ),
            Divider(height: 16.h, color: Colors.transparent),
            Row(
              children: [
                Text(
                  logic.comTypeList?.reactivePowerT?.showFieldName ?? "--",
                  style: TextStyle(fontSize: 14, color: Color(0xA6FFFFFF)),
                ),
                Spacer(),
                Text(
                  "${logic.comTypeList?.reactivePowerT?.value ?? "0"}${logic.comTypeList?.reactivePowerT?.unit ?? ""}",
                  style: TextStyle(fontSize: 14, color: Color(0xFFFFFFFF)),
                ),
              ],
            ),
            Divider(height: 16.h, color: Colors.transparent),
            Row(
              children: [
                Text(
                  logic.comTypeList?.powerTFactor?.showFieldName ?? "--",
                  style: TextStyle(fontSize: 14, color: Color(0xA6FFFFFF)),
                ),
                Spacer(),
                Text(
                  "${logic.comTypeList?.powerTFactor?.value ?? "0"}${logic.comTypeList?.powerTFactor?.unit ?? ""}",
                  style: TextStyle(fontSize: 14, color: Color(0xFFFFFFFF)),
                ),
              ],
            ),
            Divider(height: 16.h, color: Colors.transparent),
            Row(
              children: [
                Text(
                  logic.comTypeList?.apparentPowerT?.showFieldName ?? "--",
                  style: TextStyle(fontSize: 14, color: Color(0xA6FFFFFF)),
                ),
                Spacer(),
                Text(
                  "${logic.comTypeList?.apparentPowerT?.value ?? "0"}${logic.comTypeList?.apparentPowerT?.unit ?? ""}",
                  style: TextStyle(fontSize: 14, color: Color(0xFFFFFFFF)),
                ),
              ],
            ),
            Divider(height: 16.h, color: Colors.transparent),
            Row(
              children: [
                Text(
                  logic.comTypeList?.powerAFactor?.showFieldName ?? "--",
                  style: TextStyle(fontSize: 14, color: Color(0xA6FFFFFF)),
                ),
                Spacer(),
                Text(
                  "${logic.comTypeList?.powerAFactor?.value ?? "0"}${logic.comTypeList?.powerAFactor?.unit ?? ""}",
                  style: TextStyle(fontSize: 14, color: Color(0xFFFFFFFF)),
                ),
              ],
            ),
            Divider(height: 16.h, color: Colors.transparent),
            Row(
              children: [
                Text(
                  logic.comTypeList?.powerBFactor?.showFieldName ?? "--",
                  style: TextStyle(fontSize: 14, color: Color(0xA6FFFFFF)),
                ),
                Spacer(),
                Text(
                  "${logic.comTypeList?.powerBFactor?.value ?? "0"}${logic.comTypeList?.powerBFactor?.unit ?? ""}",
                  style: TextStyle(fontSize: 14, color: Color(0xFFFFFFFF)),
                ),
              ],
            ),
            Divider(height: 16.h, color: Colors.transparent),
            Row(
              children: [
                Text(
                  logic.comTypeList?.powerCFactor?.showFieldName ?? "--",
                  style: TextStyle(fontSize: 14, color: Color(0xA6FFFFFF)),
                ),
                Spacer(),
                Text(
                  "${logic.comTypeList?.powerCFactor?.value ?? "0"}${logic.comTypeList?.powerCFactor?.unit ?? ""}",
                  style: TextStyle(fontSize: 14, color: Color(0xFFFFFFFF)),
                ),
              ],
            ),
            Divider(height: 16.h, color: Colors.transparent),
          ],
        ),
      ),
    ],
  );

  ///实时数据
  Widget buildRealTimeData(List<ComCardVoEntity> comCardVoList) {
    return Column(
      children: [
        Container(
          padding: EdgeInsetsDirectional.only(
            start: 18.w,
            end: 18.w,
            bottom: 16.h,
          ),
          alignment: AlignmentDirectional.centerStart,
          child: Text(
            TKey.realTimeData.tr,
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w500,
              fontSize: 16,
            ),
          ),
        ),
        comCardVoList.length == 1
            ? Container(
                margin: EdgeInsets.symmetric(horizontal: 16.w),
                padding: EdgeInsetsDirectional.all(16.r),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Color(0xFF313540),
                ),
                width: double.maxFinite,
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text(
                          comCardVoList.first.cardName ?? "",
                          style: TextStyle(
                            fontSize: 14,
                            color: Color(0xFFFFFFFF),
                          ),
                        ),
                        Spacer(),
                      ],
                    ),
                    Divider(height: 16.h, color: Colors.transparent),
                    ListView.separated(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: (comCardVoList.first.defaultList ?? []).length,
                      itemBuilder: (BuildContext context, int index) {
                        ComCardVoDefaultList item =
                            (comCardVoList.first.defaultList ?? [])[index];
                        return Container(
                          margin: EdgeInsets.symmetric(horizontal: 16.w),
                          padding: EdgeInsetsDirectional.all(16.r),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Color(0xFF313540),
                          ),
                          width: double.maxFinite,
                          child: Row(
                            children: [
                              Text(
                                item.showFieldName,
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Color(0xA6FFFFFF),
                                ),
                              ),
                              Spacer(),
                              Text(
                                "${item.showValue}${item.unit}",
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Color(0xFFFFFFFF),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                      separatorBuilder: (BuildContext context, int index) =>
                          Divider(color: Colors.transparent, height: 16.h),
                    ),
                  ],
                ),
              )
            : ListView.separated(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: comCardVoList.length,
                itemBuilder: (BuildContext context, int index) {
                  ComCardVoEntity item = comCardVoList[index];
                  return Container(
                    margin: EdgeInsets.symmetric(horizontal: 16.w),
                    padding: EdgeInsetsDirectional.all(16.r),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Color(0xFF313540),
                    ),
                    width: double.maxFinite,
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Text(
                              item.cardName ?? "--",
                              style: TextStyle(
                                fontSize: 14,
                                color: Color(0xFFFFFFFF),
                              ),
                            ),
                            Spacer(),
                          ],
                        ),
                        Divider(height: 16.h, color: Colors.transparent),
                        if ((item.items ?? []).isNotEmpty)
                          ListView.separated(
                            physics: NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: (item.items ?? []).length,
                            separatorBuilder: (_, i) => Divider(
                              height: 16.h,
                              color: Colors.transparent,
                            ),
                            itemBuilder: (_, index) {
                              ComCardVoItems comItem =
                                  (item.items ?? [])[index];
                              return Row(
                                children: [
                                  Text(
                                    comItem.showFieldName,
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: Color(0xA6FFFFFF),
                                    ),
                                  ),
                                  Spacer(),
                                  Text(
                                    "${comItem.showValue}${comItem.unit}",
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: Color(0xFFFFFFFF),
                                    ),
                                  ),
                                ],
                              );
                            },
                          ),
                      ],
                    ),
                  );
                },
                separatorBuilder: (BuildContext context, int index) =>
                    Divider(color: Colors.transparent, height: 16.h),
              ),
      ],
    );
  }

  ///todo
  Widget buildInfoList() => Column(
    children: [
      Container(
        padding: EdgeInsetsDirectional.only(
          start: 18.w,
          end: 18.w,
          bottom: 16.h,
        ),
        alignment: AlignmentDirectional.centerStart,
        child: Text(
          "基础信息2",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w500,
            fontSize: 16,
          ),
        ),
      ),
      SizedBox(
        width: double.maxFinite,
        height: 186.h,
        child: ListView.separated(
          padding: EdgeInsetsDirectional.only(start: 16.w, end: 16.w),
          separatorBuilder: (BuildContext context, int index) =>
              VerticalDivider(color: Colors.transparent, width: 8.w),
          itemCount: 6,
          scrollDirection: Axis.horizontal,
          itemBuilder: (BuildContext context, int index) {
            return AspectRatio(
              aspectRatio: 140 / 186,
              child: Container(
                width: double.maxFinite,
                height: double.maxFinite,
                clipBehavior: Clip.hardEdge,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.r),
                  color: Color(0xFF313540),
                ),
                child: Material(
                  color: Colors.transparent,
                  child: InkWell(
                    onTap: () {
                      ////
                    },
                    child: Container(
                      padding: EdgeInsets.all(14.r),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Text(
                                "簇3",
                                style: TextStyle(
                                  fontSize: 14.sp,
                                  color: Color(0xFFFFFFFF),
                                ),
                              ),
                              Spacer(),
                              Icon(
                                Icons.arrow_forward_ios_rounded,
                                color: Colors.white,
                                size: 12,
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Text(
                                "SOC:",
                                style: TextStyle(
                                  fontSize: 14.sp,
                                  color: Color(0xA6FFFFFF),
                                ),
                              ),
                              Spacer(),
                              Text(
                                "5%",
                                style: TextStyle(
                                  fontSize: 14.sp,
                                  color: Color(0xFFFFFFFF),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Text(
                                "电压：",
                                style: TextStyle(
                                  fontSize: 14.sp,
                                  color: Color(0xA6FFFFFF),
                                ),
                              ),
                              Spacer(),
                              Text(
                                "834.7V",
                                style: TextStyle(
                                  fontSize: 14.sp,
                                  color: Color(0xFFFFFFFF),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Text(
                                "电流：",
                                style: TextStyle(
                                  fontSize: 14.sp,
                                  color: Color(0xA6FFFFFF),
                                ),
                              ),
                              Spacer(),
                              Text(
                                "0.0A",
                                style: TextStyle(
                                  fontSize: 14.sp,
                                  color: Color(0xFFFFFFFF),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Text(
                                "功率：",
                                style: TextStyle(
                                  fontSize: 14.sp,
                                  color: Color(0xA6FFFFFF),
                                ),
                              ),
                              Spacer(),
                              Text(
                                "0.0A",
                                style: TextStyle(
                                  fontSize: 14.sp,
                                  color: Color(0xFFFFFFFF),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    ],
  );

  Widget buildLineChartWidget() {
    return Column(
      children: [
        Container(
          padding: EdgeInsetsDirectional.only(
            start: 18.w,
            end: 18.w,
            bottom: 16.h,
          ),
          alignment: AlignmentDirectional.centerStart,
          child: Text(
            "实时曲线",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w500,
              fontSize: 16,
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 16.w),
          padding: EdgeInsetsDirectional.only(
            start: 5.w,
            end: 10.w,
            bottom: 15.h,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Color(0xFF313540),
          ),
          width: double.maxFinite,
          child: Stack(
            alignment: AlignmentDirectional.topCenter,
            children: [
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    color: Colors.transparent,
                    height: 270,
                    width: double.maxFinite,
                    child: LineChartWidget(),
                  ),
                  Divider(height: 5.h, color: Colors.transparent),
                  Row(
                    children: [
                      Spacer(),
                      Row(
                        children: [
                          Container(
                            width: 7,
                            height: 7,
                            margin: EdgeInsets.only(right: 5.w),
                            decoration: BoxDecoration(
                              color: Color(0xFF3874F2),
                              borderRadius: BorderRadius.circular(2),
                            ),
                          ),
                          Text(
                            "功率",
                            style: TextStyle(
                              color: Color(0xD9FFFFFF),
                              fontSize: 12.sp,
                            ),
                          ),
                        ],
                      ),
                      VerticalDivider(width: 16.w, color: Colors.transparent),
                      Row(
                        children: [
                          Container(
                            width: 7,
                            height: 7,
                            margin: EdgeInsets.only(right: 5.w),
                            decoration: BoxDecoration(
                              color: Color(0xFF0BC3C4),
                              borderRadius: BorderRadius.circular(2),
                            ),
                          ),
                          Text(
                            "SOC",
                            style: TextStyle(
                              color: Color(0xD9FFFFFF),
                              fontSize: 12.sp,
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
                start: 0.w,
                top: 15.h,
                child: Text(
                  "(KW)",
                  style: TextStyle(color: Color(0x80FFFFFF), fontSize: 12.sp),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  /// 直测流
  Widget buildDirectFlowMeasurement() => Container(
    margin: EdgeInsets.symmetric(horizontal: 16.w),
    padding: EdgeInsetsDirectional.all(16.r),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(10),
      color: Color(0xFF313540),
    ),
    width: double.maxFinite,
    child: Column(
      children: [
        Container(
          alignment: AlignmentDirectional.centerStart,
          child: Text(
            "直测流",
            style: TextStyle(
              fontSize: 14,
              color: Color(0xFFFFFFFF),
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        Divider(height: 16.h, color: Colors.transparent),
        Row(
          children: [
            Text(
              "功率：",
              style: TextStyle(fontSize: 14, color: Color(0xA6FFFFFF)),
            ),
            Spacer(),
            Text(
              "0.0kW",
              style: TextStyle(fontSize: 14, color: Color(0xFFFFFFFF)),
            ),
          ],
        ),
        Divider(height: 16.h, color: Colors.transparent),
        Row(
          children: [
            Text(
              "电压：",
              style: TextStyle(fontSize: 14, color: Color(0xA6FFFFFF)),
            ),
            Spacer(),
            Text(
              "8.3V",
              style: TextStyle(fontSize: 14, color: Color(0xFFFFFFFF)),
            ),
          ],
        ),
        Divider(height: 16.h, color: Colors.transparent),
        Row(
          children: [
            Text(
              "电流：",
              style: TextStyle(fontSize: 14, color: Color(0xA6FFFFFF)),
            ),
            Spacer(),
            Text(
              "0.0A",
              style: TextStyle(fontSize: 14, color: Color(0xFFFFFFFF)),
            ),
          ],
        ),
      ],
    ),
  );

  ///交流侧
  Widget buildACSide(MonitorDetailLogic logic) => Container(
    margin: EdgeInsets.symmetric(horizontal: 16.w),
    padding: EdgeInsetsDirectional.only(
      start: 16.w,
      top: 16.h,
      bottom: 4.h,
      end: 16.w,
    ),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(10),
      color: Color(0xFF313540),
    ),
    width: double.maxFinite,
    child: Column(
      children: [
        Container(
          alignment: AlignmentDirectional.centerStart,
          child: Text(
            TKey.acSide.tr,
            style: TextStyle(
              fontSize: 14,
              color: Color(0xFFFFFFFF),
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        Container(
          width: double.maxFinite,
          margin: EdgeInsets.only(top: 12.h),
          padding: EdgeInsetsDirectional.only(
            top: 8.h,
            bottom: 8.h,
            start: 0.w,
            end: 0.w,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4.r),
            color: Color(0x2686A3C1),
          ),
          child: Row(
            children: [
              Expanded(
                child: Container(
                  width: double.maxFinite,
                  alignment: AlignmentDirectional.center,
                  child: Text(
                    TKey.electricalPhase.tr,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500,
                      color: Color(0xA6FFFFFF),
                    ),
                  ),
                ),
              ),
              VerticalDivider(width: 2.w, color: Colors.transparent),
              Expanded(
                child: Container(
                  width: double.maxFinite,
                  alignment: AlignmentDirectional.center,
                  child: Text(
                    "${TKey.voltage.tr}(${logic.comTypeList?.voltageA?.unit ?? ""})",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500,
                      color: Color(0xA6FFFFFF),
                    ),
                  ),
                ),
              ),
              VerticalDivider(width: 2.w, color: Colors.transparent),
              Expanded(
                child: Container(
                  width: double.maxFinite,
                  alignment: AlignmentDirectional.center,
                  child: Text(
                    "${TKey.current.tr}(${logic.comTypeList?.currentA?.unit ?? ""})",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500,
                      color: Color(0xA6FFFFFF),
                    ),
                  ),
                ),
              ),
              VerticalDivider(width: 2.w, color: Colors.transparent),
              Expanded(
                child: Container(
                  width: double.maxFinite,
                  alignment: AlignmentDirectional.center,
                  child: Text(
                    "${TKey.power.tr}${logic.comTypeList?.activePowerA?.unit ?? ""}",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500,
                      color: Color(0xA6FFFFFF),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        Container(
          width: double.maxFinite,
          padding: EdgeInsetsDirectional.only(
            top: 12.h,
            bottom: 12.h,
            start: 0.w,
            end: 0.w,
          ),
          child: Row(
            children: [
              Expanded(
                child: Container(
                  width: double.maxFinite,
                  alignment: AlignmentDirectional.center,
                  child: Text(
                    logic.comTypeList?.voltageA?.showFieldName ?? "--",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 14.sp, color: Color(0xA6FFFFFF)),
                  ),
                ),
              ),
              VerticalDivider(width: 2.w, color: Colors.transparent),
              Expanded(
                child: Container(
                  width: double.maxFinite,
                  alignment: AlignmentDirectional.center,
                  child: Text(
                    logic.comTypeList?.voltageA?.value ?? "--",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 14.sp, color: Color(0xA6FFFFFF)),
                  ),
                ),
              ),
              VerticalDivider(width: 2.w, color: Colors.transparent),
              Expanded(
                child: Container(
                  width: double.maxFinite,
                  alignment: AlignmentDirectional.center,
                  child: Text(
                    logic.comTypeList?.currentA?.value ?? "--",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 14.sp, color: Color(0xA6FFFFFF)),
                  ),
                ),
              ),
              VerticalDivider(width: 2.w, color: Colors.transparent),
              Expanded(
                child: Container(
                  width: double.maxFinite,
                  alignment: AlignmentDirectional.center,
                  child: Text(
                    logic.comTypeList?.activePowerA?.value ?? "--",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 14.sp, color: Color(0xA6FFFFFF)),
                  ),
                ),
              ),
            ],
          ),
        ),
        Divider(height: 1, color: Color(0xA64F5C6D)),
        Container(
          width: double.maxFinite,
          padding: EdgeInsetsDirectional.only(
            top: 12.h,
            bottom: 12.h,
            start: 0.w,
            end: 0.w,
          ),
          child: Row(
            children: [
              Expanded(
                child: Container(
                  width: double.maxFinite,
                  alignment: AlignmentDirectional.center,
                  child: Text(
                    logic.comTypeList?.voltageB?.showFieldName ?? "--",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 14.sp, color: Color(0xA6FFFFFF)),
                  ),
                ),
              ),
              VerticalDivider(width: 2.w, color: Colors.transparent),
              Expanded(
                child: Container(
                  width: double.maxFinite,
                  alignment: AlignmentDirectional.center,
                  child: Text(
                    logic.comTypeList?.voltageB?.value ?? "--",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 14.sp, color: Color(0xA6FFFFFF)),
                  ),
                ),
              ),
              VerticalDivider(width: 2.w, color: Colors.transparent),
              Expanded(
                child: Container(
                  width: double.maxFinite,
                  alignment: AlignmentDirectional.center,
                  child: Text(
                    logic.comTypeList?.currentB?.value ?? "--",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 14.sp, color: Color(0xA6FFFFFF)),
                  ),
                ),
              ),
              VerticalDivider(width: 2.w, color: Colors.transparent),
              Expanded(
                child: Container(
                  width: double.maxFinite,
                  alignment: AlignmentDirectional.center,
                  child: Text(
                    logic.comTypeList?.activePowerB?.value ?? "--",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 14.sp, color: Color(0xA6FFFFFF)),
                  ),
                ),
              ),
            ],
          ),
        ),
        Divider(height: 1, color: Color(0xA64F5C6D)),
        Container(
          width: double.maxFinite,
          padding: EdgeInsetsDirectional.only(
            top: 12.h,
            bottom: 12.h,
            start: 0.w,
            end: 0.w,
          ),
          child: Row(
            children: [
              Expanded(
                child: Container(
                  width: double.maxFinite,
                  alignment: AlignmentDirectional.center,
                  child: Text(
                    logic.comTypeList?.voltageC?.showFieldName ?? "--",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 14.sp, color: Color(0xA6FFFFFF)),
                  ),
                ),
              ),
              VerticalDivider(width: 2.w, color: Colors.transparent),
              Expanded(
                child: Container(
                  width: double.maxFinite,
                  alignment: AlignmentDirectional.center,
                  child: Text(
                    logic.comTypeList?.voltageC?.value ?? "--",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 14.sp, color: Color(0xA6FFFFFF)),
                  ),
                ),
              ),
              VerticalDivider(width: 2.w, color: Colors.transparent),
              Expanded(
                child: Container(
                  width: double.maxFinite,
                  alignment: AlignmentDirectional.center,
                  child: Text(
                    logic.comTypeList?.currentC?.value ?? "--",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 14.sp, color: Color(0xA6FFFFFF)),
                  ),
                ),
              ),
              VerticalDivider(width: 2.w, color: Colors.transparent),
              Expanded(
                child: Container(
                  width: double.maxFinite,
                  alignment: AlignmentDirectional.center,
                  child: Text(
                    logic.comTypeList?.activePowerC?.value ?? "--",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 14.sp, color: Color(0xA6FFFFFF)),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}
