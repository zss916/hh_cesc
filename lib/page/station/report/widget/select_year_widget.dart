import 'package:cescpro/core/setting/app_setting.dart';
import 'package:cescpro/page/station/report/widget/custom_year_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class SelectYearWidget extends StatefulWidget {
  final Function(DateTime) onSelect;
  const SelectYearWidget({super.key, required this.onSelect});

  @override
  State<SelectYearWidget> createState() => _SelectYearWidgetState();
}

class _SelectYearWidgetState extends State<SelectYearWidget> {
  DateTime selectDateTime = DateTime.now();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        borderRadius: BorderRadius.circular(5),
        onTap: () {
          showYearSheet(dateTime: selectDateTime, onSelect: widget.onSelect);
        },
        child: Container(
          width: double.maxFinite,
          padding: EdgeInsetsDirectional.symmetric(vertical: 10.h),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(Icons.arrow_back_ios, size: 16, color: Color(0xD9FFFFFF)),

              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    selectDateTime.yearFormatted,
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

              Icon(Icons.arrow_forward_ios, size: 16, color: Color(0xD9FFFFFF)),
            ],
          ),
        ),
      ),
    );
  }

  ///年选择
  void showYearSheet({
    required DateTime dateTime,
    required Function(DateTime) onSelect,
  }) {
    Get.bottomSheet(
      CustomYearPicker(
        firstDate: DateTime(2015),
        lastDate: DateTime.now(),
        selectedDate: dateTime,
        onChanged: (value) {
          setState(() {
            selectDateTime = value;
            onSelect.call(selectDateTime);
          });
        },
      ),
    );
  }
}
