import 'package:cescpro/core/helper/extension_helper.dart';
import 'package:cescpro/core/translations/en.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:marquee/marquee.dart';

class InterruptTip extends StatelessWidget {
  final int value;
  const InterruptTip({super.key, required this.value});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: 35.h,
      padding: EdgeInsetsDirectional.only(start: 10.w, end: 10.w, top: 10.h),
      width: double.maxFinite,
      child: Marquee(
        scrollAxis: Axis.horizontal,
        blankSpace: 50.0,
        text: TKey.emsInterruptTip.trArgs(["${value.timestampFormat}}"]),
        style: TextStyle(color: Colors.red, fontSize: 13),
      ),
    );
  }
}
