import 'package:cescpro/core/translations/en.dart';
import 'package:cescpro/page/main/widget/alarm_item_select.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class AlarmDrawer extends StatelessWidget {
  final Function onReset;
  final Function onConfirm;
  const AlarmDrawer({
    super.key,
    required this.onReset,
    required this.onConfirm,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AlarmItemSelect(title: TKey.affiliatedArea.tr, onTap: () {}),

        Divider(height: 24.h, color: Colors.transparent),

        AlarmItemSelect(title: TKey.siteName.tr, onTap: () {}),

        Divider(height: 24.h, color: Colors.transparent),

        AlarmItemSelect(title: "设备类型", onTap: () {}),

        Divider(height: 24.h, color: Colors.transparent),

        AlarmItemSelect(title: "告警等级", onTap: () {}),

        Divider(height: 24.h, color: Colors.transparent),

        AlarmItemSelect(title: "开始时间", onTap: () {}),

        Divider(height: 24.h, color: Colors.transparent),

        AlarmItemSelect(title: "结束时间", onTap: () {}),

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
