import 'package:cescpro/core/enum/app_enum.dart';
import 'package:cescpro/core/translations/en.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

///1 发生中
///0 已结束
class AlarmStatus extends StatelessWidget {
  final int status;
  const AlarmStatus({super.key, required this.status});

  @override
  Widget build(BuildContext context) {
    return UnconstrainedBox(
      child: Container(
        padding: EdgeInsetsDirectional.only(start: 15.w, end: 5.w),
        height: 22,
        alignment: AlignmentDirectional.centerEnd,
        decoration: BoxDecoration(
          borderRadius: BorderRadiusDirectional.horizontal(
            start: Radius.circular(50.r),
          ),
          gradient: LinearGradient(
            colors: status == AlarmSatusEnum.ended.index
                ? [Color(0xFF989898), Color(0xFFD5D5D5)]
                : [Color(0xFF366FFF), Color(0xFF5DA0FC)],
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
          ),
        ),
        child: FittedBox(
          child: Text(
            status == AlarmSatusEnum.ended.index
                ? TKey.ended.tr
                : TKey.inProgress.tr,
            style: TextStyle(
              color: Colors.white,
              fontSize: 12,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }
}
