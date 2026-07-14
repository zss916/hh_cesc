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
  }
}
