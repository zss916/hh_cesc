import 'package:cescpro/core/storage/app_event_bus.dart';
import 'package:cescpro/core/translations/en.dart';
import 'package:cescpro/generated/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';

class BuildEmpty extends StatelessWidget {
  const BuildEmpty({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.maxFinite,
      height: double.maxFinite,
      child: GestureDetector(
        onTap: () {
          AppEventBus.eventBus.fire(NetWorkRefresh());
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(Assets.imgEmpty, width: 200, height: 95),
            Text(
              TKey.noDataAvailable.tr,
              style: TextStyle(fontSize: 18, color: Color(0xFF909399)),
            ),
            Container(
              margin: EdgeInsetsDirectional.only(top: 17.h, bottom: 120.h),
              child: Text(
                TKey.noDataAvailableTip.tr,
                style: TextStyle(fontSize: 14, color: Color(0xFF909399)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
