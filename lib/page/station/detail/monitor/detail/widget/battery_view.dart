import 'package:cescpro/core/helper/extension_helper.dart';
import 'package:cescpro/core/router/index.dart';
import 'package:cescpro/core/translations/en.dart';
import 'package:cescpro/http/bean/com_type_list_entity.dart';
import 'package:cescpro/page/station/detail/monitor/detail/monitor_detail_logic.dart';
import 'package:cescpro/page/station/detail/monitor/detail/widget/child/real_time_data_widget.dart';
import 'package:cescpro/page/station/detail/monitor/detail/widget/child/top_item_widget.dart';
import 'package:cescpro/page/station/detail/monitor/detail/widget/line_bar/base_line_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

///电池系统
class BatteryView extends StatelessWidget {
  final MonitorDetailLogic logic;

  const BatteryView({super.key, required this.logic});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (logic.titles.isNotEmpty) TopItemWidget(logic: logic),
        Divider(height: 12.h, color: Colors.transparent),

        ///状态
        buildBatteryStatusItem(logic.comTypeList),
        Divider(height: 12.h, color: Colors.transparent),

        ///基础数据
        buildBatteryBaseInfoItem(logic.comTypeList),
        Divider(height: 12.h, color: Colors.transparent),

        ///簇
        buildInfoList(logic.comTypeList?.otherList ?? []),
        Divider(height: 12.h, color: Colors.transparent),

        ///实时曲线
        buildLineChartWidget(),
        Divider(height: 12.h, color: Colors.transparent),

        ///实时数据
        RealTimeDataWidget(comCardVoList: logic.comCardVoList),
        Divider(height: 120.h, color: Colors.transparent),
      ],
    );
  }

  ///电池状态
  Widget buildBatteryStatusItem(ComTypeListEntity? value) => Column(
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
        constraints: BoxConstraints(minHeight: 120.h),
        margin: EdgeInsets.symmetric(horizontal: 16.w),
        padding: EdgeInsetsDirectional.all(16.r),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Color(0xFF313540),
        ),
        width: double.maxFinite,
        child: Column(
          children: [
            if (value?.signalStatus?.showFieldName != null)
              Row(
                children: [
                  Text(
                    "${value?.signalStatus?.showFieldName ?? "--"} ",
                    style: TextStyle(fontSize: 14, color: Color(0xA6FFFFFF)),
                  ),
                  Spacer(),
                  Text(
                    value?.signalStatus?.showValue ?? "--",
                    style: TextStyle(fontSize: 14, color: Color(0xFFFFFFFF)),
                  ),
                ],
              ),

            Divider(height: 16.h, color: Colors.transparent),

            if (value?.runStatus?.showFieldName != null)
              Row(
                children: [
                  Text(
                    "${value?.runStatus?.showFieldName ?? ""} ",
                    style: TextStyle(fontSize: 14, color: Color(0xA6FFFFFF)),
                  ),
                  Spacer(),
                  Text(
                    value?.runStatus?.showValue ?? "--",
                    style: TextStyle(fontSize: 14, color: Color(0xFFFFFFFF)),
                  ),
                ],
              ),

            Divider(height: 16.h, color: Colors.transparent),

            if (value?.alarmStatus?.showFieldName != null)
              Row(
                children: [
                  Text(
                    "${value?.alarmStatus?.showFieldName ?? ""} ",
                    style: TextStyle(fontSize: 14, color: Color(0xA6FFFFFF)),
                  ),
                  Spacer(),
                  Text(
                    value?.alarmStatus?.showValue ?? "--",
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
  Widget buildBatteryBaseInfoItem(ComTypeListEntity? value) => Column(
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
        constraints: BoxConstraints(minHeight: 200.h),
        margin: EdgeInsets.symmetric(horizontal: 16.w),
        padding: EdgeInsetsDirectional.all(16.r),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Color(0xFF313540),
        ),
        width: double.maxFinite,
        child: Column(
          children: [
            if (value?.soc?.showFieldName != null)
              Row(
                children: [
                  Text(
                    "${value?.soc?.showFieldName ?? ""} ",
                    style: TextStyle(fontSize: 14, color: Color(0xA6FFFFFF)),
                  ),
                  Spacer(),
                  Text(
                    "${value?.soc?.value ?? "0"}${value?.soc?.unit ?? ""}",
                    style: TextStyle(fontSize: 14, color: Color(0xFFFFFFFF)),
                  ),
                ],
              ),
            Divider(height: 16.h, color: Colors.transparent),
            if (value?.voltage?.showFieldName != null)
              Row(
                children: [
                  Text(
                    "${value?.voltage?.showFieldName ?? ""} ",
                    style: TextStyle(fontSize: 14, color: Color(0xA6FFFFFF)),
                  ),
                  Spacer(),
                  Text(
                    "${value?.voltage?.value ?? "0"}${value?.voltage?.unit ?? ""}",
                    style: TextStyle(fontSize: 14, color: Color(0xFFFFFFFF)),
                  ),
                ],
              ),
            Divider(height: 16.h, color: Colors.transparent),
            if (value?.current?.showFieldName != null)
              Row(
                children: [
                  Text(
                    "${value?.current?.showFieldName ?? ""} ",
                    style: TextStyle(fontSize: 14, color: Color(0xA6FFFFFF)),
                  ),
                  Spacer(),
                  Text(
                    "${value?.current?.value ?? "0"}${value?.current?.unit ?? ""}",
                    style: TextStyle(fontSize: 14, color: Color(0xFFFFFFFF)),
                  ),
                ],
              ),
            Divider(height: 16.h, color: Colors.transparent),
            if (value?.singleMaxVoltage?.showFieldName != null)
              Row(
                children: [
                  Text(
                    "${value?.singleMaxVoltage?.showFieldName ?? ""} ",
                    style: TextStyle(fontSize: 14, color: Color(0xA6FFFFFF)),
                  ),
                  Spacer(),
                  Text(
                    "${value?.singleMaxVoltage?.value ?? "0"}${value?.singleMaxVoltage?.unit ?? ""}",
                    style: TextStyle(fontSize: 14, color: Color(0xFFFFFFFF)),
                  ),
                ],
              ),
            Divider(height: 16.h, color: Colors.transparent),
            if (value?.singleMinVoltage?.showFieldName != null)
              Row(
                children: [
                  Text(
                    "${value?.singleMinVoltage?.showFieldName ?? ""} ",
                    style: TextStyle(fontSize: 14, color: Color(0xA6FFFFFF)),
                  ),
                  Spacer(),
                  Text(
                    "${value?.singleMinVoltage?.value ?? "0"}${value?.singleMinVoltage?.unit ?? ""}",
                    style: TextStyle(fontSize: 14, color: Color(0xFFFFFFFF)),
                  ),
                ],
              ),
            Divider(height: 16.h, color: Colors.transparent),
            if (value?.singleMaxTemp?.showFieldName != null)
              Row(
                children: [
                  Text(
                    "${value?.singleMaxTemp?.showFieldName ?? ""} ",
                    style: TextStyle(fontSize: 14, color: Color(0xA6FFFFFF)),
                  ),
                  Spacer(),
                  Text(
                    "${value?.singleMaxTemp?.value ?? 0}${value?.singleMaxTemp?.unit ?? ""}",
                    style: TextStyle(fontSize: 14, color: Color(0xFFFFFFFF)),
                  ),
                ],
              ),
            Divider(height: 16.h, color: Colors.transparent),
            if (value?.singleMinTemp?.showFieldName != null)
              Row(
                children: [
                  Text(
                    "${value?.singleMinTemp?.showFieldName ?? ""} ",
                    style: TextStyle(fontSize: 14, color: Color(0xA6FFFFFF)),
                  ),
                  Spacer(),
                  Text(
                    "${value?.singleMinTemp?.value ?? 0}${value?.singleMinTemp?.unit ?? ""}",
                    style: TextStyle(fontSize: 14, color: Color(0xFFFFFFFF)),
                  ),
                ],
              ),
            Divider(height: 16.h, color: Colors.transparent),
            if (value?.maxChargePower?.showFieldName != null)
              Row(
                children: [
                  Text(
                    "${value?.maxChargePower?.showFieldName ?? ""} ",
                    style: TextStyle(fontSize: 14, color: Color(0xA6FFFFFF)),
                  ),
                  Spacer(),
                  Text(
                    "${value?.maxChargePower?.value ?? "0"}${value?.maxChargePower?.unit ?? ""}",
                    style: TextStyle(fontSize: 14, color: Color(0xFFFFFFFF)),
                  ),
                ],
              ),
            Divider(height: 16.h, color: Colors.transparent),
            if (value?.maxOutPower?.showFieldName != null)
              Row(
                children: [
                  Text(
                    "${value?.maxOutPower?.showFieldName ?? ""} ",
                    style: TextStyle(fontSize: 14, color: Color(0xA6FFFFFF)),
                  ),
                  Spacer(),
                  Text(
                    "${value?.maxOutPower?.value ?? "0"}${value?.maxOutPower?.unit ?? ""}",
                    style: TextStyle(fontSize: 14, color: Color(0xFFFFFFFF)),
                  ),
                ],
              ),
          ],
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
          child: Row(
            children: [
              Text(
                TKey.realTimeSoc.tr,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                ),
              ),
              Spacer(),
              GetBuilder<MonitorDetailLogic>(
                id: "realTimeData",
                init: MonitorDetailLogic(),
                builder: (logic) {
                  return logic.arrList.isEmpty
                      ? SizedBox.shrink()
                      : InkWell(
                          onTap: () {
                            ///电池系统 MonitorDetailLogic
                            Get.toNamed(APages.hBatteryChart);
                          },
                          child: Icon(
                            Icons.zoom_out_map_rounded,
                            size: 20,
                            color: Colors.white,
                          ),
                        );
                },
              ),
            ],
          ),
        ),
        Container(
          height: 320.h,
          width: double.maxFinite,
          margin: EdgeInsets.symmetric(horizontal: 16),
          padding: EdgeInsetsDirectional.only(
            start: 8,
            end: 8,
            top: 8,
            bottom: 8,
          ),
          alignment: AlignmentDirectional.center,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Color(0xFF313540),
          ),
          child: Stack(
            alignment: AlignmentDirectional.center,
            children: [
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    children: [
                      Text(
                        "(kW)",
                        style: TextStyle(
                          color: Color(0x80FFFFFF),
                          fontSize: 12.sp,
                        ),
                      ),
                      Spacer(),
                      Text(
                        "(%)",
                        style: TextStyle(
                          color: Color(0xFF0BC3C4),
                          fontSize: 12.sp,
                        ),
                      ),
                    ],
                  ),
                  Divider(height: 10.h, color: Colors.transparent),
                  Expanded(
                    child: GetBuilder<MonitorDetailLogic>(
                      id: "realTimeData",
                      init: MonitorDetailLogic(),
                      builder: (logic) =>
                          buildContent(logic.realTimeViewStatus),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget buildInfoList(List<List<ComTypeListItem>> list) => Column(
    children: [
      Container(
        padding: EdgeInsetsDirectional.only(
          start: 18.w,
          end: 18.w,
          bottom: 16.h,
        ),
        alignment: AlignmentDirectional.centerStart,
        child: Text(
          TKey.cluInformation.tr,
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
          itemCount: list.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (BuildContext context, int index) {
            List<ComTypeListItem> items = list[index];

            ComTypeListItem? current = items
                .where((e) => e.fieldName == "current")
                .firstOrNull;

            ComTypeListItem? soc = items
                .where((e) => e.fieldName == "soc")
                .firstOrNull;

            ComTypeListItem? power = items
                .where((e) => e.fieldName == "power")
                .firstOrNull;

            ComTypeListItem? voltage = items
                .where((e) => e.fieldName == "voltage")
                .firstOrNull;

            ComTypeListItem? label = items
                .where((e) => e.fieldName == "label")
                .firstOrNull;

            return AspectRatio(
              aspectRatio: Get.isZh ? (140 / 186) : (200 / 186),
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
                      PageTools.toBatteryCluster(
                        siteId: logic.siteId,
                        did: logic.did,
                        nodeNo: logic.nodeNo,
                        devNo: logic.devNo,
                        labelName: label?.value ?? "",
                      );
                    },
                    child: Container(
                      padding: EdgeInsets.all(14.r),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Text(
                                "CLU${label?.value ?? ""}",
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
                          if (soc != null)
                            Row(
                              children: [
                                Text(
                                  "${soc.showFieldName ?? ""} ",
                                  style: TextStyle(
                                    fontSize: 14.sp,
                                    color: Color(0xA6FFFFFF),
                                  ),
                                ),
                                Spacer(),
                                Text(
                                  "${soc.showValue ?? ""}${soc.unit ?? ""}",
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
                                "${voltage?.showFieldName ?? ""} ",
                                style: TextStyle(
                                  fontSize: 14.sp,
                                  color: Color(0xA6FFFFFF),
                                ),
                              ),
                              Spacer(),
                              Text(
                                "${voltage?.showValue ?? ""}${voltage?.unit ?? ""}",
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
                                "${current?.showFieldName ?? ""} ",
                                style: TextStyle(
                                  fontSize: 14.sp,
                                  color: Color(0xA6FFFFFF),
                                ),
                              ),
                              Spacer(),
                              Text(
                                "${current?.showValue ?? ""}${current?.unit ?? ""}",
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
                                "${power?.showFieldName ?? ""} ",
                                style: TextStyle(
                                  fontSize: 14.sp,
                                  color: Color(0xA6FFFFFF),
                                ),
                              ),
                              Spacer(),
                              Text(
                                "${power?.showValue ?? ""}${power?.unit ?? ""}",
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

  Widget buildContent(ViewType viewState) {
    return switch (viewState) {
      _ when viewState == ViewType.loading => buildLoading,
      _ when viewState == ViewType.common => BaseLineChart(
        socList: logic.arrList,
      ),
      _ when viewState == ViewType.empty => buildEmpty,
      _ => buildEmpty,
    };
  }

  Widget get buildLoading =>
      Center(child: CircularProgressIndicator(color: Colors.white));

  Widget get buildEmpty => Center(
    child: Text(TKey.noDataAvailable.tr, style: TextStyle(color: Colors.white)),
  );
}
