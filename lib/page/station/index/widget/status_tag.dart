import 'package:cescpro/core/translations/en.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class StatusTag extends StatelessWidget {
  final int status;
  const StatusTag({super.key, required this.status});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: AlignmentDirectional.center,
      padding: EdgeInsetsDirectional.only(
        start: 8.w,
        end: 8.w,
        top: 2.h,
        bottom: 2.h,
      ),
      decoration: BoxDecoration(
        color: Color(0x3322EEBD),
        border: Border.all(width: 1, color: Color(0xFF22EEBD)),
        borderRadius: BorderRadius.circular(50.r),
      ),
      child: Stack(
        alignment: AlignmentDirectional.center,
        children: [
          // 99.正常 (0:停止1:充电2:放电3:待机) 4: 故障，-3:中断 -2:告警
          if (status == 99)
            Text(
              TKey.common.tr,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 12, color: Color(0xFF22EEBD)),
            ),

          if (status == 0)
            Text(
              TKey.stop.tr,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 12, color: Color(0xFF22EEBD)),
            ),

          if (status == 1)
            Text(
              TKey.charge.tr,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 12, color: Color(0xFF22EEBD)),
            ),

          if (status == 2)
            Text(
              TKey.discharge.tr,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 12, color: Color(0xFF22EEBD)),
            ),

          if (status == 3)
            Text(
              TKey.standby.tr,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 12, color: Color(0xFF22EEBD)),
            ),

          if (status == 4)
            Text(
              TKey.fault.tr,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 12, color: Color(0xFF22EEBD)),
            ),

          if (status == -3)
            Text(
              TKey.interrupt.tr,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 12, color: Color(0xFF22EEBD)),
            ),

          if (status == -2)
            Text(
              TKey.alarm.tr,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 12, color: Color(0xFF22EEBD)),
            ),
        ],
      ),
    );
  }
}
