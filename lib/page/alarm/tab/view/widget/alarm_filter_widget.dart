import 'package:cescpro/core/enum/app_enum.dart';
import 'package:cescpro/core/storage/app_event_bus.dart';
import 'package:cescpro/core/translations/en.dart';
import 'package:cescpro/generated/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';

class AlarmFilterWidget extends StatelessWidget {
  final int? alarmLevel;
  const AlarmFilterWidget({super.key, this.alarmLevel});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(5),
      onTap: () {
        AppEventBus.eventBus.fire(
          OpenDrawerEvent(
            DrawerTypeEnum.historyAlarm.index,
            alarmLevel: alarmLevel,
          ),
        );
      },
      child: Container(
        padding: EdgeInsetsDirectional.only(
          start: 8,
          end: 8,
          top: 3,
          bottom: 3,
        ),
        child: Row(
          spacing: 8.w,
          children: [
            Image.asset(Assets.imgFilterIcon, width: 24, height: 24),
            Text(
              TKey.filter.tr,
              style: TextStyle(fontSize: 12, color: Color(0xFFD2D4D5)),
            ),
          ],
        ),
      ),
    );
  }
}
