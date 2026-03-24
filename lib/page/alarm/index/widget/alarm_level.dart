import 'package:cescpro/core/enum/app_enum.dart';
import 'package:cescpro/core/translations/en.dart';
import 'package:cescpro/generated/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class AlarmLevel extends StatelessWidget {
  final int level;
  final int? status;
  const AlarmLevel({super.key, required this.level, this.status});

  @override
  Widget build(BuildContext context) {
    return status == AlarmSatusEnum.ended.index
        ? buildLevelTemp()
        : Stack(
            alignment: AlignmentDirectional.center,
            children: [
              if (level == Alarm.level1.value) buildLevel1(),
              if (level == Alarm.level2.value) buildLevel2(),
              if (level == Alarm.level3.value) buildLevel3(),
            ],
          );
  }

  Widget buildLevelTemp() => Container(
    padding: EdgeInsetsDirectional.symmetric(horizontal: 5.w, vertical: 2.h),
    decoration: BoxDecoration(
      border: Border.all(width: 1, color: Color(0xFF908E8D)),
      borderRadius: BorderRadius.circular(30),
      color: Color(0xFF908E8D),
    ),
    child: Row(
      children: [
        Container(
          margin: EdgeInsetsDirectional.only(end: 4.w),
          child: Image.asset(Assets.imgAlarm0, width: 12, height: 12),
        ),
        Stack(
          alignment: AlignmentDirectional.center,
          children: [
            if (level == Alarm.level1.value)
              Text(
                TKey.alarm1.tr,
                style: TextStyle(fontSize: 12, color: Colors.white),
              ),
            if (level == Alarm.level2.value)
              Text(
                TKey.alarm2.tr,
                style: TextStyle(fontSize: 12, color: Colors.white),
              ),
            if (level == Alarm.level3.value)
              Text(
                TKey.alarm3.tr,
                style: TextStyle(fontSize: 12, color: Colors.white),
              ),
          ],
        ),
      ],
    ),
  );

  Widget buildLevel1() => Container(
    padding: EdgeInsetsDirectional.symmetric(horizontal: 5.w, vertical: 2.h),
    decoration: BoxDecoration(
      border: Border.all(width: 1, color: Color(0xFFEB5757)),
      borderRadius: BorderRadius.circular(30),
      color: Color(0xFFFEF0EC),
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
      border: Border.all(width: 1, color: Color(0xFFD7870A)),
      borderRadius: BorderRadius.circular(30),
      color: Color(0xFFF7F1E3),
    ),
    child: Row(
      children: [
        Container(
          margin: EdgeInsetsDirectional.only(end: 4.w),
          child: Image.asset(Assets.imgAlarm2, width: 12, height: 12),
        ),
        Text(
          TKey.alarm2.tr,
          style: TextStyle(fontSize: 12, color: Color(0xFFD7870A)),
        ),
      ],
    ),
  );

  Widget buildLevel3() => Container(
    clipBehavior: Clip.hardEdge,
    padding: EdgeInsetsDirectional.symmetric(horizontal: 5.w, vertical: 2.h),
    decoration: BoxDecoration(
      border: Border.all(width: 1, color: Color(0xFFC4A82D)),
      borderRadius: BorderRadius.circular(30),
      color: Color(0xFFF0ECDB),
    ),
    child: Row(
      children: [
        Container(
          margin: EdgeInsetsDirectional.only(end: 4.w),
          child: Image.asset(Assets.imgAlarm3, width: 12, height: 12),
        ),
        Text(
          TKey.alarm3.tr,
          style: TextStyle(fontSize: 12, color: Color(0xFFC4A82D)),
        ),
      ],
    ),
  );
}
