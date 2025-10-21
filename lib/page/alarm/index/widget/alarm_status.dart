import 'package:cescpro/core/enum/app_enum.dart';
import 'package:cescpro/core/translations/en.dart';
import 'package:cescpro/generated/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class AlarmStatus extends StatelessWidget {
  final int level;
  const AlarmStatus({super.key, required this.level});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.center,
      children: [
        if (level == Alarm.level1.index) buildLevel1(),
        if (level == Alarm.level2.index) buildLevel2(),
        if (level == Alarm.level3.index) buildLevel3(),
      ],
    );
  }

  Widget buildLevel1() => Container(
    padding: EdgeInsetsDirectional.symmetric(horizontal: 5.w, vertical: 2.h),
    decoration: BoxDecoration(
      border: Border.all(width: 1, color: Color(0xFFEB5757)),
      borderRadius: BorderRadius.circular(30),
    ),
    child: Row(
      children: [
        Container(
          margin: EdgeInsetsDirectional.only(end: 4.w),
          child: Image.asset(Assets.imgAlarm1, width: 12, height: 12),
        ),
        Text(
          TKey.alarm1.tr,
          style: TextStyle(fontSize: 12, color: Color(0xFFEB5757)),
        ),
      ],
    ),
  );

  Widget buildLevel2() => Container(
    padding: EdgeInsetsDirectional.symmetric(horizontal: 5.w, vertical: 2.h),
    decoration: BoxDecoration(
      border: Border.all(width: 1, color: Color(0xFFEB9657)),
      borderRadius: BorderRadius.circular(30),
    ),
    child: Row(
      children: [
        Container(
          margin: EdgeInsetsDirectional.only(end: 4.w),
          child: Image.asset(Assets.imgAlarm2, width: 12, height: 12),
        ),
        Text(
          TKey.alarm2.tr,
          style: TextStyle(fontSize: 12, color: Color(0xFFEB9657)),
        ),
      ],
    ),
  );

  Widget buildLevel3() => Container(
    padding: EdgeInsetsDirectional.symmetric(horizontal: 5.w, vertical: 2.h),
    decoration: BoxDecoration(
      border: Border.all(width: 1, color: Color(0xFFEBD357)),
      borderRadius: BorderRadius.circular(30),
    ),
    child: Row(
      children: [
        Container(
          margin: EdgeInsetsDirectional.only(end: 4.w),
          child: Image.asset(Assets.imgAlarm3, width: 12, height: 12),
        ),
        Text(
          TKey.alarm3.tr,
          style: TextStyle(fontSize: 12, color: Color(0xFFEBD357)),
        ),
      ],
    ),
  );
}
