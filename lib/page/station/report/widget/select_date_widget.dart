import 'package:cescpro/core/helper/extension_helper.dart';
import 'package:cescpro/core/setting/app_setting.dart';
import 'package:flutter/material.dart' hide DatePickerTheme;
import 'package:flutter_datetime_picker_plus/flutter_datetime_picker_plus.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class SelectDateWidget extends StatefulWidget {
  final Function(DateTime start, DateTime end) onSelect;
  const SelectDateWidget({super.key, required this.onSelect});

  @override
  State<SelectDateWidget> createState() => _SelectDateWidgetState();
}

class _SelectDateWidgetState extends State<SelectDateWidget> {
  DateTime startDateTime = DateTime(
    DateTime.now().year,
    DateTime.now().month,
    1,
  );
  DateTime endDateTime = DateTime.now();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Container(
        width: double.maxFinite,
        padding: EdgeInsetsDirectional.symmetric(vertical: 5.h),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            InkWell(
              borderRadius: BorderRadius.circular(5.r),
              onTap: () {
                /*SelectRangeDate.show(
                  startDate: startDate,
                  endDate: endDate,
                  onApplyClick: (DateTime startDate, DateTime endDate) {
                    print('Start Date: $startDate');
                    print('End Date: $endDate');
                  },
                );*/

                /*CalendarDatePicker2(
                  config: CalendarDatePicker2Config(),
                  value: [],
                  onValueChanged: (dates) {},
                );*/

                showSelectTimePicker(
                  context: context,
                  initDateTime: DateTime(
                    DateTime.now().year,
                    DateTime.now().month,
                    1,
                  ),
                  onConfirm: (value) {
                    startDateTime = value;
                    widget.onSelect.call(startDateTime, endDateTime);
                  },
                );

                /* Get.bottomSheet(
                  Container(
                    width: double.maxFinite,
                    color: Colors.white,
                    padding: EdgeInsetsDirectional.only(bottom: 15.h),
                    child: CalendarDatePicker2WithActionButtons(
                      config: CalendarDatePicker2WithActionButtonsConfig(
                        calendarType: CalendarDatePicker2Type.range,
                        //firstDate: DateTime.now().subtract(Duration(days: 365)),
                        lastDate: DateTime.now(),
                      ),
                      value: [],
                      onValueChanged: (dates) {
                        debugPrint("first: ${dates.first}");
                        debugPrint("last: ${dates.last}");
                      },
                      onCancelTapped: () {
                        Get.back();
                      },
                      onOkTapped: () {
                        //Get.back();
                      },
                    ),
                  ),
                );*/

                /*showSelectTimePicker(
                  context: context,
                  initDateTime: startDateTime,
                  onConfirm: (dateTime) {
                    setState(() {
                      startDateTime = dateTime;
                    });
                  },
                );*/
              },
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 5.h),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Colors.transparent,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      startDateTime.dateFormatted,
                      style: TextStyle(
                        color: Color(0xD9FFFFFF),
                        fontSize: 15.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    /*Icon(
                      Icons.arrow_drop_down_rounded,
                      size: 20,
                      color: Color(0xD9FFFFFF),
                    ),*/
                  ],
                ),
              ),
            ),
            Container(
              margin: EdgeInsetsDirectional.symmetric(horizontal: 8.w),
              child: Text(
                "-",
                style: TextStyle(color: Color(0xD9FFFFFF), fontSize: 15.sp),
              ),
            ),
            InkWell(
              borderRadius: BorderRadius.circular(5.r),
              onTap: () {
                showSelectTimePicker(
                  context: context,
                  initDateTime: DateTime.now(),
                  onConfirm: (value) {
                    endDateTime = value;
                    widget.onSelect.call(startDateTime, endDateTime);
                  },
                );
              },
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 5.h),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Colors.transparent,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      endDateTime.dateFormatted,
                      style: TextStyle(
                        color: Color(0xD9FFFFFF),
                        fontSize: 15.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Icon(
                      Icons.arrow_drop_down_rounded,
                      size: 20,
                      color: Color(0xD9FFFFFF),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// 显示时间选择器
  void showSelectTimePicker({
    required BuildContext context,
    required DateTime initDateTime,
    Function(DateTime)? onConfirm,
  }) {
    DatePicker.showDatePicker(
      context,
      showTitleActions: true,
      minTime: DateTime(2015, 1, 1),
      maxTime: DateTime.now(),
      currentTime: initDateTime,
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
        debugPrint('change ===>>$date');
      },
      onConfirm: (date) {
        onConfirm?.call(date);
        // debugPrint('confirm ====>>$date');
        // String formatted = DateFormat('yyyy-MM-dd').format(date);
      },
    );
  }

  ///日期范围选择
  /*Future<void> showDateRangeSheet({
    required DateTime startTime,
    required DateTime endTime,
  }) async {
    Get.bottomSheet(
      DateRangePickerDialog(
        initialEntryMode: DatePickerEntryMode.calendarOnly,
        firstDate: DateTime(2015),
        lastDate: DateTime.now(),
        currentDate: null,
        initialDateRange: DateTimeRange(start: startTime, end: endTime),
        selectableDayPredicate: (_, s, e) {
          return true;
        },
      ),
    );
  }*/
}
