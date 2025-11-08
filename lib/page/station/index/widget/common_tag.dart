import 'package:cescpro/core/translations/en.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class CommonTag extends StatelessWidget {
  final int type;
  const CommonTag({super.key, required this.type});

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
        border: Border.all(width: 1, color: Color(0x739D9D9D)),
        borderRadius: BorderRadius.circular(50.r),
      ),
      child: Stack(
        alignment: AlignmentDirectional.center,
        children: [
          ///1-纯储能；2-光储充；3-储能液冷; 4-光储
          if (type == 1)
            Text(
              TKey.pureEnergyStorage.tr,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 12, color: Colors.white),
            ),

          if (type == 2)
            Text(
              TKey.pvStorageCharging.tr,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 12, color: Colors.white),
            ),

          if (type == 3)
            Text(
              TKey.energyStorageLiquidCooling.tr,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 12, color: Colors.white),
            ),

          if (type == 4)
            Text(
              TKey.pvStorage.tr,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 12, color: Colors.white),
            ),
        ],
      ),
    );
  }
}
