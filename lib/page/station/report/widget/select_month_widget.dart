import 'package:cescpro/core/setting/app_setting.dart';
import 'package:cescpro/page/station/report/widget/custom_month_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class SelectMonthWidget extends StatefulWidget {
  const SelectMonthWidget({super.key});

  @override
  State<SelectMonthWidget> createState() => _SelectMonthWidgetState();
}

class _SelectMonthWidgetState extends State<SelectMonthWidget> {
  DateTime selectDateTime = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        borderRadius: BorderRadius.circular(5),
        onTap: () {
          showMonthSheet(dateTime: selectDateTime);
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
                    selectDateTime.monthFormatted,
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

  ///月选择
  void showMonthSheet({required DateTime dateTime}) {
    Get.bottomSheet(
      CustomMonthPicker(
        firstDate: DateTime(2015),
        lastDate: DateTime.now(),
        selectedDate: dateTime,
        onChanged: (value) {
          setState(() {
            selectDateTime = value;
          });
        },
      ),
    );
  }
}
