import 'package:cescpro/core/helper/extension_helper.dart';
import 'package:cescpro/core/translations/en.dart';
import 'package:cescpro/page/alarm/index/index.dart';
import 'package:cescpro/page/main/widget/alarm_item_select.dart';
import 'package:cescpro/page/main/widget/alarm_select_sheet.dart';
import 'package:flutter/material.dart' hide DatePickerTheme;
import 'package:flutter_datetime_picker_plus/flutter_datetime_picker_plus.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class AlarmDrawer extends StatefulWidget {
  final Function onReset;
  final Function onConfirm;
  const AlarmDrawer({
    super.key,
    required this.onReset,
    required this.onConfirm,
  });

  @override
  State<AlarmDrawer> createState() => _AlarmDrawerState();
}

class _AlarmDrawerState extends State<AlarmDrawer> {
  String? startTime;
  DateTime? startDateTime;
  String? endTime;
  DateTime? endDateTime;
  String? alarmTitle;
  int? alarmLevel;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AlarmItemSelect(
          title: TKey.affiliatedArea.tr,
          onTap: () async {
            // getCountry();
          },
        ),

        Divider(height: 24.h, color: Colors.transparent),

        AlarmItemSelect(title: TKey.siteName.tr, onTap: () {}),

        Divider(height: 24.h, color: Colors.transparent),

        AlarmItemSelect(title: "设备类型", onTap: () {}),

        Divider(height: 24.h, color: Colors.transparent),

        AlarmItemSelect(
          title: TKey.alarmLevel.tr,
          subTitle: alarmTitle,
          onTap: () {
            showAlarmLevelSheet(
              context: context,
              onSelect: (String alarmLevelTitle, int level) {
                setState(() {
                  alarmTitle = alarmLevelTitle;
                  alarmLevel = level;
                });
              },
            );
            //alarmLevel
          },
        ),
        Divider(height: 24.h, color: Colors.transparent),

        AlarmItemSelect(
          title: TKey.startTime.tr,
          subTitle: startTime,
          onTap: () {
            showDateTimePicker(
              context: context,
              onSelect: (date) {
                String formatted = DateFormat('yyyy-MM-dd').format(date);
                setState(() {
                  startTime = formatted;
                  startDateTime = date;
                });
              },
            );
          },
        ),

        Divider(height: 24.h, color: Colors.transparent),

        AlarmItemSelect(
          title: TKey.endTime.tr,
          subTitle: endTime,
          onTap: () {
            showDateTimePicker(
              context: context,
              onSelect: (date) {
                String formatted = DateFormat('yyyy-MM-dd').format(date);
                setState(() {
                  endTime = formatted;
                  endDateTime = date;
                });
              },
            );
          },
        ),

        Spacer(),

        Row(
          children: [
            Expanded(
              child: InkWell(
                borderRadius: BorderRadius.circular(50),
                onTap: () {
                  widget.onReset.call();
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
                  safeFind<AlarmLogic>()?.startTimeMill =
                      startDateTime?.millisecondsSinceEpoch;
                  safeFind<AlarmLogic>()?.endTimeMill =
                      endDateTime?.millisecondsSinceEpoch;
                  debugPrint(
                    "start: ${safeFind<AlarmLogic>()?.startTimeMill},"
                    " end ${safeFind<AlarmLogic>()?.endTimeMill}"
                    " level:${alarmLevel}",
                  );

                  // widget.onConfirm.call();
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

  void showDateTimePicker({
    required BuildContext context,
    Function(DateTime)? onSelect,
  }) {
    DatePicker.showDatePicker(
      context,
      showTitleActions: true,
      minTime: DateTime(2010, 1, 1),
      maxTime: DateTime.now(),
      //currentTime: DateTime.parse(currentTime),
      locale: LocaleType.zh,
      theme: DatePickerTheme(
        backgroundColor: Color(0xFF23282E),
        itemStyle: TextStyle(
          color: Color(0xFFFFFFFF),
          fontSize: 15,
          fontWeight: FontWeight.w500,
        ),
        cancelStyle: TextStyle(color: Color(0xA6FFFFFF), fontSize: 14),
        doneStyle: TextStyle(color: Color(0xFF13D4D2), fontSize: 14),
      ),

      onChanged: (date) {
        debugPrint('change $date');
      },
      onConfirm: (date) {
        String formatted = DateFormat('yyyy-MM-dd').format(date);
        debugPrint('confirm $formatted , ${date.millisecondsSinceEpoch}');
        onSelect?.call(date);
      },
    );
  }
}
