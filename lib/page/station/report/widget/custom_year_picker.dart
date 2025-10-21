import 'package:cescpro/core/translations/en.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class CustomYearPicker extends StatefulWidget {
  final DateTime selectedDate;
  final ValueChanged<DateTime> onChanged;
  final DateTime firstDate;
  final DateTime lastDate;
  const CustomYearPicker({
    super.key,
    required this.selectedDate,
    required this.onChanged,
    required this.firstDate,
    required this.lastDate,
  });

  @override
  State<CustomYearPicker> createState() => _CustomYearPickerState();
}

class _CustomYearPickerState extends State<CustomYearPicker> {
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
        children: [
          Container(
            margin: EdgeInsets.only(bottom: 5.h),
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
          Expanded(
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                mainAxisSpacing: 10.0,
                crossAxisSpacing: 10.0,
                childAspectRatio: 5 / 2,
              ),
              itemCount: widget.lastDate.year - widget.firstDate.year + 1,
              itemBuilder: (context, index) {
                final year = widget.firstDate.year + index;
                final isSelected = year == currentDate.year;

                return GestureDetector(
                  onTap: () {
                    setState(() {
                      currentDate = DateTime(year);
                    });
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: isSelected
                          ? Color(0xFF13D4D2)
                          : Colors.transparent,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: isSelected
                            ? Color(0xFF13D4D2)
                            : Colors.white.withValues(alpha: 0.65),
                      ),
                    ),
                    child: Center(
                      child: Text(
                        '$year',
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
}
