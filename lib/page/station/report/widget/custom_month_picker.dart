import 'package:cescpro/core/setting/app_setting.dart';
import 'package:cescpro/core/translations/en.dart';
import 'package:cescpro/page/station/report/widget/custom_year_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class CustomMonthPicker extends StatefulWidget {
  final DateTime selectedDate;
  final ValueChanged<DateTime> onChanged;
  final DateTime firstDate;
  final DateTime lastDate;
  const CustomMonthPicker({
    super.key,
    required this.selectedDate,
    required this.onChanged,
    required this.firstDate,
    required this.lastDate,
  });

  @override
  State<CustomMonthPicker> createState() => _CustomMonthPickerState();
}

class _CustomMonthPickerState extends State<CustomMonthPicker> {
  DateTime currentDate = DateTime.now();

  @override
  void initState() {
    super.initState();
    currentDate = widget.selectedDate;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
      decoration: BoxDecoration(
        color: Color(0xFF313540),
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            margin: EdgeInsets.only(bottom: 0.h),
            width: double.maxFinite,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                  onPressed: () {
                    Get.back();
                  },
                  child: Text(
                    TKey.cancel.tr,
                    style: TextStyle(fontSize: 14, color: Color(0xA6FFFFFF)),
                  ),
                ),

                Text(
                  TKey.selectTime.tr,
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                  ),
                ),

                TextButton(
                  onPressed: () {
                    Get.back();
                    widget.onChanged(currentDate);
                  },
                  child: Text(
                    TKey.confirm.tr,
                    style: TextStyle(fontSize: 14, color: Color(0xFF13D4D2)),
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsetsDirectional.only(top: 0, bottom: 0),
            margin: EdgeInsetsDirectional.only(start: 5, end: 5),
            width: double.maxFinite,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Material(
                  color: Colors.transparent,
                  child: InkWell(
                    borderRadius: BorderRadius.circular(5),
                    onTap: () {
                      setState(() {
                        currentDate = DateTime(
                          currentDate.year - 1,
                          currentDate.month,
                        );
                      });
                    },
                    child: Container(
                      alignment: Alignment.center,
                      padding: EdgeInsets.all(5),
                      child: Icon(
                        Icons.arrow_back_ios,
                        size: 16,
                        color: Color(0xD9FFFFFF),
                      ),
                    ),
                  ),
                ),

                Material(
                  color: Colors.transparent,
                  child: InkWell(
                    onTap: () {
                      showYearSheet(
                        onSelect: (value) {
                          setState(() {
                            currentDate = DateTime(
                              value.year,
                              currentDate.month,
                            );
                          });
                        },
                      );
                    },
                    borderRadius: BorderRadius.circular(5),
                    child: Container(
                      alignment: AlignmentDirectional.center,
                      padding: EdgeInsetsDirectional.all(5),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            "${currentDate.year}/${currentDate.month.formatted}",
                            style: TextStyle(
                              color: Color(0xD9FFFFFF),
                              fontSize: 15.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Icon(
                            Icons.arrow_drop_down_rounded,
                            size: 22,
                            color: Color(0xD9FFFFFF),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),

                Material(
                  color: Colors.transparent,
                  child: InkWell(
                    borderRadius: BorderRadius.circular(5),
                    onTap: () {
                      if (currentDate.year < DateTime.now().year) {
                        setState(() {
                          currentDate = DateTime(
                            currentDate.year + 1,
                            currentDate.month,
                          );
                        });
                      }
                    },
                    child: Container(
                      alignment: Alignment.center,
                      padding: EdgeInsets.all(5),
                      child: Icon(
                        Icons.arrow_forward_ios,
                        size: 16,
                        color: Color(0xD9FFFFFF),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: GridView.builder(
              padding: EdgeInsets.only(top: 10.h, bottom: 10.h),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                mainAxisSpacing: 8.0,
                crossAxisSpacing: 8.0,
                childAspectRatio: 5 / 2,
              ),
              itemCount: 12,
              itemBuilder: (context, index) {
                final month = index + 1;
                final isSelected = month == currentDate.month;

                return GestureDetector(
                  onTap: () {
                    setState(() {
                      currentDate = DateTime(currentDate.year, month);
                    });
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: isSelected
                          ? Color(0xFF13D4D2)
                          : Colors.transparent,
                      borderRadius: BorderRadius.circular(8.0),
                      border: Border.all(
                        color: isSelected
                            ? Color(0xFF13D4D2)
                            : Colors.white.withValues(alpha: 0.65),
                      ),
                    ),
                    child: Center(
                      child: Text(
                        '$month月',
                        style: TextStyle(
                          color: isSelected
                              ? Colors.white
                              : Colors.white.withValues(alpha: 0.65),
                          fontWeight: isSelected
                              ? FontWeight.bold
                              : FontWeight.normal,
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  void showYearSheet({required Function(DateTime) onSelect}) {
    Get.bottomSheet(
      CustomYearPicker(
        firstDate: widget.firstDate,
        lastDate: widget.lastDate,
        selectedDate: currentDate,
        onChanged: (value) {
          onSelect.call(value);
        },
      ),
    );
  }
}
