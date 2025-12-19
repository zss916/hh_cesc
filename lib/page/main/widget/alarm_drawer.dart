import 'package:cescpro/core/helper/extension_helper.dart';
import 'package:cescpro/core/model/country_entity.dart';
import 'package:cescpro/core/service/app_info_service.dart';
import 'package:cescpro/core/translations/en.dart';
import 'package:cescpro/http/bean/site_data_entity.dart';
import 'package:cescpro/page/alarm/index/index.dart';
import 'package:cescpro/page/main/index.dart';
import 'package:cescpro/page/main/sheet/alarm_select_sheet.dart';
import 'package:cescpro/page/main/sheet/select_country_sheet.dart';
import 'package:cescpro/page/main/sheet/site_select_sheet.dart';
import 'package:cescpro/page/main/widget/alarm_item_select.dart';
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
  CountryEntity? countryItem;
  //SiteDataEntity? site;
  int? siteId;
  String? siteName;

  @override
  void initState() {
    super.initState();
    siteId = safeFind<AlarmLogic>()?.siteId;
    siteName = safeFind<AlarmLogic>()?.siteName;
    countryItem = safeFind<AlarmLogic>()?.country;
    alarmTitle = (safeFind<AlarmLogic>()?.alarmLevel ?? 0).getAlarmTitle();
    int? startTimeMill = safeFind<AlarmLogic>()?.startTimeMill;
    if (startTimeMill != null) {
      startDateTime = DateTime.fromMillisecondsSinceEpoch(startTimeMill);
      startTime = DateFormat('yyyy-MM-dd').format(startDateTime!);
    }
    int? endTimeMill = safeFind<AlarmLogic>()?.endTimeMill;
    if (endTimeMill != null) {
      endDateTime = DateTime.fromMillisecondsSinceEpoch(endTimeMill);
      endTime = DateFormat('yyyy-MM-dd').format(endDateTime!);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AlarmItemSelect(
          title: TKey.affiliatedArea.tr,
          subTitle: countryItem?.name,
          onTap: () {
            showSelectCountrySheet(
              country: countryItem,
              AppInfoService.to.countryList,
              onSelectItem: (CountryEntity? country) {
                setState(() {
                  countryItem = country;
                });
              },
            );
          },
        ),

        Divider(height: 24.h, color: Colors.transparent),

        AlarmItemSelect(
          title: TKey.siteName.tr,
          subTitle: siteName,
          onTap: () {
            List<SiteDataEntity> data = safeFind<MainLogic>()?.sites ?? [];
            showSiteSelectSheet(
              sites: data,
              onSelect: (value) {
                setState(() {
                  siteId = value.id;
                  siteName = value.name;
                });
              },
            );
          },
        ),

        //Divider(height: 24.h, color: Colors.transparent),

        // AlarmItemSelect(title: "设备类型", onTap: () {}),
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
                  safeFind<AlarmLogic>()?.startTimeMill = null;
                  safeFind<AlarmLogic>()?.endTimeMill = null;
                  safeFind<AlarmLogic>()?.country = null;
                  safeFind<AlarmLogic>()?.alarmLevel = null;
                  safeFind<AlarmLogic>()?.siteId = null;
                  safeFind<AlarmLogic>()?.refreshData(isLoading: true);
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
                  safeFind<AlarmLogic>()?.country = countryItem;
                  safeFind<AlarmLogic>()?.alarmLevel = alarmLevel;
                  safeFind<AlarmLogic>()?.siteId = siteId;
                  safeFind<AlarmLogic>()?.siteName = siteName;
                  safeFind<AlarmLogic>()?.loadData();
                  widget.onConfirm.call();

                  /* debugPrint(
                    "start: ${safeFind<AlarmLogic>()?.startTimeMill},"
                    " end ${safeFind<AlarmLogic>()?.endTimeMill}"
                    " level:${alarmLevel}",
                  );*/
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
      locale: Get.isEn ? LocaleType.en : LocaleType.zh,
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
