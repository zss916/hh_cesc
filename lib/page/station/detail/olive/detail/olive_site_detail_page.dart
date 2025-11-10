import 'package:cescpro/components/common_app_bar.dart';
import 'package:cescpro/core/translations/en.dart';
import 'package:cescpro/http/bean/statistic_record_entity.dart';
import 'package:cescpro/page/station/detail/olive/detail/olive_site_detail_logic.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class OliveSiteDetailPage extends StatelessWidget {
  const OliveSiteDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: baseAppBar(title: TKey.oliveSiteDetails.tr),
      backgroundColor: Color(0xFF23282E),
      body: GetBuilder<OliveSiteDetailLogic>(
        init: OliveSiteDetailLogic(),
        builder: (logic) {
          return SingleChildScrollView(
            child: Column(
              children: [
                if (logic.index == 0)
                  Divider(height: 16.h, color: Colors.transparent),
                if (logic.index == 0)
                  buildChargingCapacityItem(logic.statisticRecord),
                if (logic.index == 2)
                  Divider(height: 16.h, color: Colors.transparent),
                if (logic.index == 2) buildRevenueItem(logic.statisticRecord),
                if (logic.index == 1)
                  Divider(height: 16.h, color: Colors.transparent),
                if (logic.index == 1)
                  buildDischargeCapacityItem(logic.statisticRecord),
                if (logic.index == 3)
                  Divider(height: 16.h, color: Colors.transparent),
                if (logic.index == 3)
                  buildPowerGenerationItem(logic.statisticRecord),
                Divider(height: 16.h, color: Colors.transparent),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget buildChargingCapacityItem(StatisticRecordEntity? value) {
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
                "${TKey.todayChargingData.tr}:",
                style: TextStyle(fontSize: 14, color: Color(0xA6FFFFFF)),
              ),
              Spacer(),
              Text(
                "${value?.todayTotalPos ?? 0}kwh",
                style: TextStyle(fontSize: 14, color: Color(0xFFFFFFFF)),
              ),
            ],
          ),
          Divider(height: 16.h, color: Colors.transparent),
          Row(
            children: [
              Text(
                "${TKey.monthChargingData.tr}:",
                style: TextStyle(fontSize: 14, color: Color(0xA6FFFFFF)),
              ),
              Spacer(),
              Text(
                "${value?.currentMonthTotalPos ?? 0}kwh",
                style: TextStyle(fontSize: 14, color: Color(0xFFFFFFFF)),
              ),
            ],
          ),
          Divider(height: 16.h, color: Colors.transparent),
          Row(
            children: [
              Text(
                "${TKey.yearChargingData.tr}:",
                style: TextStyle(fontSize: 14, color: Color(0xA6FFFFFF)),
              ),
              Spacer(),
              Text(
                "${value?.currentYearTotalPos ?? 0}kwh",
                style: TextStyle(fontSize: 14, color: Color(0xFFFFFFFF)),
              ),
            ],
          ),
          Divider(height: 16.h, color: Colors.transparent),
          Row(
            children: [
              Text(
                "${TKey.totalChargingData.tr}:",
                style: TextStyle(fontSize: 14, color: Color(0xA6FFFFFF)),
              ),
              Spacer(),
              Text(
                "${value?.todayTotalPos ?? 0}kwh",
                style: TextStyle(fontSize: 14, color: Color(0xFFFFFFFF)),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget buildRevenueItem(StatisticRecordEntity? value) {
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
                "${TKey.lastDayIncome.tr}:",
                style: TextStyle(fontSize: 14, color: Color(0xA6FFFFFF)),
              ),
              Spacer(),
              Text(
                "${value?.lastDayIncome ?? 0}¥",
                style: TextStyle(fontSize: 14, color: Color(0xFFFFFFFF)),
              ),
            ],
          ),
          Divider(height: 16.h, color: Colors.transparent),
          Row(
            children: [
              Text(
                "${TKey.currentMonthIncome.tr}:",
                style: TextStyle(fontSize: 14, color: Color(0xA6FFFFFF)),
              ),
              Spacer(),
              Text(
                "${value?.currentMonthIncome ?? 0}¥",
                style: TextStyle(fontSize: 14, color: Color(0xFFFFFFFF)),
              ),
            ],
          ),
          Divider(height: 16.h, color: Colors.transparent),
          Row(
            children: [
              Text(
                "${TKey.currentYearIncome.tr}:",
                style: TextStyle(fontSize: 14, color: Color(0xA6FFFFFF)),
              ),
              Spacer(),
              Text(
                "${value?.currentYearIncome ?? 0}¥",
                style: TextStyle(fontSize: 14, color: Color(0xFFFFFFFF)),
              ),
            ],
          ),
          Divider(height: 16.h, color: Colors.transparent),
          Row(
            children: [
              Text(
                "${TKey.totalRevenueTitle.tr}:",
                style: TextStyle(fontSize: 14, color: Color(0xA6FFFFFF)),
              ),
              Spacer(),
              Text(
                "${value?.todayIncome ?? 0}¥",
                style: TextStyle(fontSize: 14, color: Color(0xFFFFFFFF)),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget buildDischargeCapacityItem(StatisticRecordEntity? value) {
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
                "${TKey.todayNeg.tr}:",
                style: TextStyle(fontSize: 14, color: Color(0xA6FFFFFF)),
              ),
              Spacer(),
              Text(
                "${value?.todayPvTotalNeg ?? 0}kwh",
                style: TextStyle(fontSize: 14, color: Color(0xFFFFFFFF)),
              ),
            ],
          ),
          Divider(height: 16.h, color: Colors.transparent),
          Row(
            children: [
              Text(
                "${TKey.currentMonthNeg.tr}:",
                style: TextStyle(fontSize: 14, color: Color(0xA6FFFFFF)),
              ),
              Spacer(),
              Text(
                "${value?.currentMonthTotalNeg ?? 0}kwh",
                style: TextStyle(fontSize: 14, color: Color(0xFFFFFFFF)),
              ),
            ],
          ),
          Divider(height: 16.h, color: Colors.transparent),
          Row(
            children: [
              Text(
                "${TKey.currentYearNeg.tr}:",
                style: TextStyle(fontSize: 14, color: Color(0xA6FFFFFF)),
              ),
              Spacer(),
              Text(
                "${value?.currentYearTotalNeg ?? 0}kwh",
                style: TextStyle(fontSize: 14, color: Color(0xFFFFFFFF)),
              ),
            ],
          ),
          Divider(height: 16.h, color: Colors.transparent),
          Row(
            children: [
              Text(
                "${TKey.totalNeg.tr}:",
                style: TextStyle(fontSize: 14, color: Color(0xA6FFFFFF)),
              ),
              Spacer(),
              Text(
                "${value?.totalNeg ?? 0}kwh",
                style: TextStyle(fontSize: 14, color: Color(0xFFFFFFFF)),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget buildPowerGenerationItem(StatisticRecordEntity? value) {
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
                "${TKey.todayPVNeg.tr}:",
                style: TextStyle(fontSize: 14, color: Color(0xA6FFFFFF)),
              ),
              Spacer(),
              Text(
                "${value?.todayPvTotalNeg ?? 0}kwh",
                style: TextStyle(fontSize: 14, color: Color(0xFFFFFFFF)),
              ),
            ],
          ),
          Divider(height: 16.h, color: Colors.transparent),
          Row(
            children: [
              Text(
                "${TKey.currentMonthPVNeg.tr}:",
                style: TextStyle(fontSize: 14, color: Color(0xA6FFFFFF)),
              ),
              Spacer(),
              Text(
                "${value?.monthPvTotalNeg ?? 0}kwh",
                style: TextStyle(fontSize: 14, color: Color(0xFFFFFFFF)),
              ),
            ],
          ),
          Divider(height: 16.h, color: Colors.transparent),
          Row(
            children: [
              Text(
                "${TKey.currentYearPVNeg.tr}:",
                style: TextStyle(fontSize: 14, color: Color(0xA6FFFFFF)),
              ),
              Spacer(),
              Text(
                "${value?.yearPvTotalNeg ?? 0}kwh",
                style: TextStyle(fontSize: 14, color: Color(0xFFFFFFFF)),
              ),
            ],
          ),
          Divider(height: 16.h, color: Colors.transparent),
          Row(
            children: [
              Text(
                "${TKey.totalPVNeg.tr}:",
                style: TextStyle(fontSize: 14, color: Color(0xA6FFFFFF)),
              ),
              Spacer(),
              Text(
                "${value?.todayPvTotalNeg ?? 0}kwh",
                style: TextStyle(fontSize: 14, color: Color(0xFFFFFFFF)),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
