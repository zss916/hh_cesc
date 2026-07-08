import 'package:cescpro/core/model/site_info_card_entity.dart';
import 'package:cescpro/core/router/index.dart';
import 'package:cescpro/http/bean/site_detail_entity.dart';
import 'package:cescpro/http/bean/statistic_record_entity.dart';
import 'package:cescpro/page/station/detail/olive/widget/olive_item/widget/station_overview_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GridViewWidget2 extends StatelessWidget {
  final List<SiteInfoCardEntity> data;
  final SiteDetailEntity? siteDetail;
  final StatisticRecordEntity? statisticRecord;
  final String currencyUnit;

  const GridViewWidget2({
    super.key,
    required this.currencyUnit,
    this.siteDetail,
    this.statisticRecord,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: EdgeInsetsDirectional.only(
        top: 16.h,
        start: 16.w,
        end: 16.w,
        bottom: 0,
      ),
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: data.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2, // 两列
        crossAxisSpacing: 4,
        mainAxisSpacing: 8,
        childAspectRatio: 166 / 116,
      ),
      itemBuilder: (context, index) {
        SiteInfoCardEntity item = data[index];
        return StationOverviewItemWidget(
          onCall: () {
            if (statisticRecord != null && item.id != null) {
              PageTools.toOliveSiteDetail(
                index: item.id!,
                statisticRecord: statisticRecord!,
              );
            }
          },
          iconColor: item.id == 4 ? Colors.blue : null,
          icon: item.icon ?? "",
          value: item.value ?? "0.00",
          unit: item.unit ?? "",
          title: item.title ?? "",
          image: item.image ?? "",
        );
      },
    );

    /* return Column(
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

        if (isShowIncome)
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

              ///hasPv
              if (siteDetail?.hasPv == true)
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
                )
              else
                Spacer(),

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

        Divider(height: 8.h, color: Colors.transparent),

        Row(
          children: [
            VerticalDivider(width: 16.w, color: Colors.transparent),

            Expanded(
              child: GestureDetector(
                onTap: () {
                  if (siteDetail != null && statisticRecord != null) {
                    PageTools.toOliveSiteDetail(
                      index: 4,
                      statisticRecord: statisticRecord!,
                    );
                  }
                },
                child: StationOverviewItemWidget(
                  title: TKey.todayGridPos.tr,
                  value: '$todayGridPos ',
                  iconColor: Colors.blue,
                  unit: todayGridPosUnit,
                  icon: Assets.imgEle,
                  image: Assets.imgTodayDisCharging2,
                ),
              ),
            ),

            VerticalDivider(width: 2.w, color: Colors.transparent),

            Expanded(
              child: GestureDetector(
                onTap: () {
                  if (siteDetail != null && statisticRecord != null) {
                    PageTools.toOliveSiteDetail(
                      index: 5,
                      statisticRecord: statisticRecord!,
                    );
                  }
                },
                child: StationOverviewItemWidget(
                  title: TKey.todayGridNeg.tr,
                  value: '$todayGridNeg ',
                  unit: todayGridNegUnit,
                  icon: Assets.imgGridExport,
                  image: Assets.imgTodayDisCharging2,
                ),
              ),
            ),

            VerticalDivider(width: 16.w, color: Colors.transparent),
          ],
        ),

        if (showLoadPos) Divider(height: 8.h, color: Colors.transparent),

        ///后期可能支持
        if (false)
          if (showLoadPos)
            Row(
              children: [
                VerticalDivider(width: 16.w, color: Colors.transparent),

                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      if (siteDetail != null && statisticRecord != null) {
                        PageTools.toOliveSiteDetail(
                          index: 6,
                          statisticRecord: statisticRecord!,
                        );
                      }
                    },
                    child: StationOverviewItemWidget(
                      title: TKey.loadElectricity.tr,
                      value: '$todayLoadPos ',
                      unit: todayLoadPosUnit,
                      icon: Assets.imgEle,
                      image: Assets.imgTodayDisCharging2,
                    ),
                  ),
                ),

                VerticalDivider(width: 2.w, color: Colors.transparent),

                Spacer(),

                VerticalDivider(width: 16.w, color: Colors.transparent),
              ],
            ),

        Divider(height: 10.h, color: Colors.transparent),
      ],
    );*/
  }

  /*Widget buildPV() {
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
  }*/
}
