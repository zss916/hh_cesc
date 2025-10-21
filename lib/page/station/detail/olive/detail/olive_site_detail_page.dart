import 'package:cescpro/components/common_app_bar.dart';
import 'package:cescpro/core/translations/en.dart';
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
      body: SingleChildScrollView(
        child: Column(
          children: [
            Divider(height: 16.h, color: Colors.transparent),
            buildChargingCapacityItem(),
            Divider(height: 16.h, color: Colors.transparent),
            buildRevenueItem(),
            Divider(height: 16.h, color: Colors.transparent),
            buildDischargeCapacityItem(),
            Divider(height: 16.h, color: Colors.transparent),
            buildPowerGenerationItem(),
            Divider(height: 16.h, color: Colors.transparent),
          ],
        ),
      ),
    );
  }

  Widget buildChargingCapacityItem() {
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
                "今日充电量:",
                style: TextStyle(fontSize: 14, color: Color(0xA6FFFFFF)),
              ),
              Spacer(),
              Text(
                "110kwh",
                style: TextStyle(fontSize: 14, color: Color(0xFFFFFFFF)),
              ),
            ],
          ),
          Divider(height: 16.h, color: Colors.transparent),
          Row(
            children: [
              Text(
                "本月充电量:",
                style: TextStyle(fontSize: 14, color: Color(0xA6FFFFFF)),
              ),
              Spacer(),
              Text(
                "111kwh",
                style: TextStyle(fontSize: 14, color: Color(0xFFFFFFFF)),
              ),
            ],
          ),
          Divider(height: 16.h, color: Colors.transparent),
          Row(
            children: [
              Text(
                "本年充电量:",
                style: TextStyle(fontSize: 14, color: Color(0xA6FFFFFF)),
              ),
              Spacer(),
              Text(
                "110kwh",
                style: TextStyle(fontSize: 14, color: Color(0xFFFFFFFF)),
              ),
            ],
          ),
          Divider(height: 16.h, color: Colors.transparent),
          Row(
            children: [
              Text(
                "累计充电量:",
                style: TextStyle(fontSize: 14, color: Color(0xA6FFFFFF)),
              ),
              Spacer(),
              Text(
                "110kwh",
                style: TextStyle(fontSize: 14, color: Color(0xFFFFFFFF)),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget buildRevenueItem() {
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
                "昨日收益:",
                style: TextStyle(fontSize: 14, color: Color(0xA6FFFFFF)),
              ),
              Spacer(),
              Text(
                "110kwh",
                style: TextStyle(fontSize: 14, color: Color(0xFFFFFFFF)),
              ),
            ],
          ),
          Divider(height: 16.h, color: Colors.transparent),
          Row(
            children: [
              Text(
                "本月收益:",
                style: TextStyle(fontSize: 14, color: Color(0xA6FFFFFF)),
              ),
              Spacer(),
              Text(
                "111kwh",
                style: TextStyle(fontSize: 14, color: Color(0xFFFFFFFF)),
              ),
            ],
          ),
          Divider(height: 16.h, color: Colors.transparent),
          Row(
            children: [
              Text(
                "本年收益:",
                style: TextStyle(fontSize: 14, color: Color(0xA6FFFFFF)),
              ),
              Spacer(),
              Text(
                "110kwh",
                style: TextStyle(fontSize: 14, color: Color(0xFFFFFFFF)),
              ),
            ],
          ),
          Divider(height: 16.h, color: Colors.transparent),
          Row(
            children: [
              Text(
                "累计收益:",
                style: TextStyle(fontSize: 14, color: Color(0xA6FFFFFF)),
              ),
              Spacer(),
              Text(
                "110kwh",
                style: TextStyle(fontSize: 14, color: Color(0xFFFFFFFF)),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget buildDischargeCapacityItem() {
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
                "今日放电量:",
                style: TextStyle(fontSize: 14, color: Color(0xA6FFFFFF)),
              ),
              Spacer(),
              Text(
                "110kwh",
                style: TextStyle(fontSize: 14, color: Color(0xFFFFFFFF)),
              ),
            ],
          ),
          Divider(height: 16.h, color: Colors.transparent),
          Row(
            children: [
              Text(
                "本月放电量:",
                style: TextStyle(fontSize: 14, color: Color(0xA6FFFFFF)),
              ),
              Spacer(),
              Text(
                "111kwh",
                style: TextStyle(fontSize: 14, color: Color(0xFFFFFFFF)),
              ),
            ],
          ),
          Divider(height: 16.h, color: Colors.transparent),
          Row(
            children: [
              Text(
                "本年放电量:",
                style: TextStyle(fontSize: 14, color: Color(0xA6FFFFFF)),
              ),
              Spacer(),
              Text(
                "110kwh",
                style: TextStyle(fontSize: 14, color: Color(0xFFFFFFFF)),
              ),
            ],
          ),
          Divider(height: 16.h, color: Colors.transparent),
          Row(
            children: [
              Text(
                "累计放电量:",
                style: TextStyle(fontSize: 14, color: Color(0xA6FFFFFF)),
              ),
              Spacer(),
              Text(
                "110kwh",
                style: TextStyle(fontSize: 14, color: Color(0xFFFFFFFF)),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget buildPowerGenerationItem() {
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
                "今日发电量:",
                style: TextStyle(fontSize: 14, color: Color(0xA6FFFFFF)),
              ),
              Spacer(),
              Text(
                "110kwh",
                style: TextStyle(fontSize: 14, color: Color(0xFFFFFFFF)),
              ),
            ],
          ),
          Divider(height: 16.h, color: Colors.transparent),
          Row(
            children: [
              Text(
                "本月放电量:",
                style: TextStyle(fontSize: 14, color: Color(0xA6FFFFFF)),
              ),
              Spacer(),
              Text(
                "111kwh",
                style: TextStyle(fontSize: 14, color: Color(0xFFFFFFFF)),
              ),
            ],
          ),
          Divider(height: 16.h, color: Colors.transparent),
          Row(
            children: [
              Text(
                "本年放电量:",
                style: TextStyle(fontSize: 14, color: Color(0xA6FFFFFF)),
              ),
              Spacer(),
              Text(
                "110kwh",
                style: TextStyle(fontSize: 14, color: Color(0xFFFFFFFF)),
              ),
            ],
          ),
          Divider(height: 16.h, color: Colors.transparent),
          Row(
            children: [
              Text(
                "累计放电量:",
                style: TextStyle(fontSize: 14, color: Color(0xA6FFFFFF)),
              ),
              Spacer(),
              Text(
                "110kwh",
                style: TextStyle(fontSize: 14, color: Color(0xFFFFFFFF)),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
