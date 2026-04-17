import 'package:cescpro/core/router/index.dart';
import 'package:cescpro/core/translations/en.dart';
import 'package:cescpro/generated/assets.dart';
import 'package:cescpro/http/bean/site_detail_entity.dart';
import 'package:cescpro/http/bean/statistic_record_entity.dart';
import 'package:cescpro/page/station/detail/olive/widget/olive_item/widget/station_overview_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class GridViewWidget2 extends StatelessWidget {
  final String todayCharging;
  final String todayChargingUnit;
  final String todayDischarge;
  final String todayDischargeUnit;
  final String showTodayIncome;
  final String todayPVPowerEarnings;
  final String todayPVPowerEarningsUnit;
  final SiteDetailEntity? siteDetail;
  final StatisticRecordEntity? statisticRecord;
  final String currencyUnit;
  final bool isShow;

  const GridViewWidget2({
    super.key,
    required this.todayCharging,
    required this.todayChargingUnit,
    required this.todayDischarge,
    required this.todayDischargeUnit,
    required this.showTodayIncome,
    required this.currencyUnit,
    required this.todayPVPowerEarnings,
    required this.todayPVPowerEarningsUnit,
    required this.isShow,
    this.siteDetail,
    this.statisticRecord,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Divider(height: 16.h, color: Colors.transparent),

        Row(
          children: [
            VerticalDivider(width: 16.w, color: Colors.transparent),

            Expanded(
              child: GestureDetector(
                onTap: () {
                  if (statisticRecord != null) {
                    PageTools.toOliveSiteDetail(
                      index: 0,
                      statisticRecord: statisticRecord!,
                    );
                  }
                },
                child: StationOverviewItemWidget(
                  icon: Assets.imgCumulativeCharging2,
                  value: '$todayCharging ',
                  unit: todayChargingUnit,
                  title: TKey.todayCharging.tr,
                  image: Assets.imgTodayCharging2,
                ),
              ),
            ),

            VerticalDivider(width: 2.w, color: Colors.transparent),

            Expanded(
              child: GestureDetector(
                onTap: () {
                  if (statisticRecord != null) {
                    PageTools.toOliveSiteDetail(
                      index: 1,
                      statisticRecord: statisticRecord!,
                    );
                  }
                },
                child: StationOverviewItemWidget(
                  icon: Assets.imgCumulativeDischarge2,
                  value: "$todayDischarge ",
                  unit: todayDischargeUnit,
                  title: TKey.todayDischarge.tr,
                  image: Assets.imgTodayDisCharging2,
                ),
              ),
            ),

            VerticalDivider(width: 16.w, color: Colors.transparent),
          ],
        ),

        Divider(height: 8.h, color: Colors.transparent),

        if (isShow)
          Row(
            children: [
              VerticalDivider(width: 16.w, color: Colors.transparent),

              Expanded(
                child: GestureDetector(
                  onTap: () {
                    if (siteDetail != null && statisticRecord != null) {
                      PageTools.toOliveSiteDetail(
                        index: 2,
                        statisticRecord: statisticRecord!,
                      );
                    }
                  },
                  child: StationOverviewItemWidget(
                    icon: Assets.imgLastDayRecharge,
                    value: "$currencyUnit$showTodayIncome",
                    unit: '',
                    title: TKey.lastDayIncome.tr,
                    image: Assets.lastDayIncome2,
                  ),
                ),
              ),

              VerticalDivider(width: 2.w, color: Colors.transparent),

              Expanded(
                child: GestureDetector(
                  onTap: () {
                    if (siteDetail != null && statisticRecord != null) {
                      PageTools.toOliveSiteDetail(
                        index: 3,
                        statisticRecord: statisticRecord!,
                      );
                    }
                  },
                  child: StationOverviewItemWidget(
                    icon: Assets.imgAccumulatedPhotovoltaic2,
                    value: "$todayPVPowerEarnings ",
                    unit: todayPVPowerEarningsUnit,
                    title: TKey.todayPVNeg.tr,
                    image: Assets.todayPvGeneration2,
                  ),
                ),
              ),

              VerticalDivider(width: 16.w, color: Colors.transparent),
            ],
          )
        else
          Row(
            children: [
              VerticalDivider(width: 16.w, color: Colors.transparent),
              Expanded(child: buildPV()),
              VerticalDivider(width: 16.w, color: Colors.transparent),
            ],
          ),

        Divider(height: 10.h, color: Colors.transparent),
      ],
    );
  }

  Widget buildPV() {
    return GestureDetector(
      onTap: () {
        if (siteDetail != null && statisticRecord != null) {
          PageTools.toOliveSiteDetail(
            index: 3,
            statisticRecord: statisticRecord!,
          );
        }
      },
      child: StationOverviewItemWidget(
        icon: Assets.imgAccumulatedPhotovoltaic2,
        value: "$todayPVPowerEarnings ",
        unit: todayPVPowerEarningsUnit,
        title: TKey.todayPVNeg.tr,
        image: Assets.imgPvBg,
      ),
    );
  }

  /*  String get showTotalPos =>
      AppSetting.isOverseas ? totalPos.formatPowerValue() : "$totalPos";

  String get showTotalPosUnit =>
      AppSetting.isOverseas ? totalPos.formatPowerValueUnit() : "MWh";

  String get showTotalNeg =>
      AppSetting.isOverseas ? totalNeg.formatPowerValue() : "$totalNeg";

  String get showTotalNegUnit =>
      AppSetting.isOverseas ? totalNeg.formatPowerValueUnit() : "MWh";

  String get showTotalPvNeg =>
      AppSetting.isOverseas ? totalPvNeg.formatPowerValue() : "$totalPvNeg";

  String get showTotalPvNegUnit =>
      AppSetting.isOverseas ? totalPvNeg.formatPowerValueUnit() : "MWh";*/
}
