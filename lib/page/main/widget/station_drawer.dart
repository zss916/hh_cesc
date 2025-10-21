import 'package:cescpro/components/warm_status_button.dart';
import 'package:cescpro/core/translations/en.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class StationDrawer extends StatelessWidget {
  final Function onReset;
  final Function onConfirm;
  const StationDrawer({
    super.key,
    required this.onReset,
    required this.onConfirm,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: EdgeInsetsDirectional.only(bottom: 20.h),
          width: double.maxFinite,
          child: Text(
            TKey.stationStatus.tr,
            textAlign: TextAlign.start,
            style: TextStyle(color: Colors.white, fontSize: 16),
          ),
        ),
        Container(
          margin: EdgeInsetsDirectional.only(bottom: 18.h),
          width: double.maxFinite,
          child: Wrap(
            runSpacing: 14.w,
            spacing: 14.w,
            children: [
              WarmStatusButton(title: "正常"),
              WarmStatusButton(title: "告警"),
              WarmStatusButton(title: "故障"),
              WarmStatusButton(title: "中断"),
            ],
          ),
        ),
        Divider(height: 1, color: Color(0x99313540)),
        Container(
          margin: EdgeInsetsDirectional.only(top: 20.h),
          width: double.maxFinite,
          child: Wrap(
            runSpacing: 14.w,
            spacing: 14.w,
            children: [
              WarmStatusButton(title: "充电"),
              WarmStatusButton(title: "放电"),
              WarmStatusButton(title: "待机"),
            ],
          ),
        ),
        Spacer(),
        Row(
          children: [
            Expanded(
              child: InkWell(
                borderRadius: BorderRadius.circular(50),
                onTap: () {
                  onReset.call();
                },
                child: Container(
                  width: double.maxFinite,
                  height: 40,
                  alignment: AlignmentDirectional.center,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: Color(0x5986A3C1),
                  ),
                  child: Text(
                    TKey.reset.tr,
                    style: TextStyle(color: Colors.white, fontSize: 14),
                  ),
                ),
              ),
            ),
            VerticalDivider(width: 10, color: Colors.transparent),
            Expanded(
              child: InkWell(
                borderRadius: BorderRadius.circular(50),
                onTap: () {
                  onConfirm.call();
                },
                child: Container(
                  width: double.maxFinite,
                  height: 40,
                  alignment: AlignmentDirectional.center,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    gradient: LinearGradient(
                      colors: [Color(0xFF43FFFF), Color(0xFF0978E9)],
                    ),
                  ),
                  child: Text(
                    TKey.confirm.tr,
                    style: TextStyle(color: Colors.white, fontSize: 14),
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
