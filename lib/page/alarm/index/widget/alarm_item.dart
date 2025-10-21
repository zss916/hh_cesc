import 'package:cescpro/core/enum/app_enum.dart';
import 'package:cescpro/page/alarm/index/widget/alarm_status.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AlarmItem extends StatelessWidget {
  const AlarmItem({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        //todo
      },
      child: Stack(
        alignment: AlignmentDirectional.center,
        children: [
          Container(
            width: double.maxFinite,
            //constraints: BoxConstraints(minHeight: 200),
            margin: EdgeInsetsDirectional.only(start: 16.w, end: 16.w),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(14),
              color: Color(0xFF313540),
            ),
            child: Column(
              children: [
                Container(
                  padding: EdgeInsetsDirectional.all(14),
                  width: double.maxFinite,
                  child: Row(
                    children: [
                      AlarmStatus(level: Alarm.level3.index),
                      Container(
                        margin: EdgeInsetsDirectional.only(
                          start: 5.w,
                          end: 5.w,
                        ),
                        child: Text(
                          "广东阡陌一号站",
                          style: TextStyle(color: Colors.white, fontSize: 16),
                        ),
                      ),
                    ],
                  ),
                ),

                Divider(
                  height: 1,
                  color: Color(0x14EEF2F8),
                  indent: 10.w,
                  endIndent: 10.w,
                ),

                Container(
                  padding: EdgeInsetsDirectional.symmetric(
                    vertical: 8,
                    horizontal: 14,
                  ),
                  width: double.maxFinite,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "EMS设备号：",
                        style: TextStyle(
                          color: Color(0xA6FFFFFF),
                          fontSize: 14,
                        ),
                      ),

                      Text(
                        "xxxxxxxxx",
                        style: TextStyle(
                          color: Color(0xFFFFFFFF),
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ),

                Container(
                  padding: EdgeInsetsDirectional.symmetric(
                    vertical: 8,
                    horizontal: 14,
                  ),
                  width: double.maxFinite,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "告警设备：",
                        style: TextStyle(
                          color: Color(0xA6FFFFFF),
                          fontSize: 14,
                        ),
                      ),

                      Text(
                        "xxxxxxxxx",
                        style: TextStyle(
                          color: Color(0xFFFFFFFF),
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ),

                Container(
                  padding: EdgeInsetsDirectional.symmetric(
                    vertical: 8,
                    horizontal: 14,
                  ),
                  width: double.maxFinite,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "告警内容：",
                        style: TextStyle(
                          color: Color(0xA6FFFFFF),
                          fontSize: 14,
                        ),
                      ),

                      Text(
                        "xxxxxxxxx",
                        style: TextStyle(
                          color: Color(0xFFFFFFFF),
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ),

                Container(
                  padding: EdgeInsetsDirectional.symmetric(
                    vertical: 8,
                    horizontal: 14,
                  ),
                  width: double.maxFinite,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "开始时间：",
                        style: TextStyle(
                          color: Color(0xA6FFFFFF),
                          fontSize: 14,
                        ),
                      ),

                      Text(
                        "xxxxxxxxx",
                        style: TextStyle(
                          color: Color(0xFFFFFFFF),
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ),

                Container(
                  padding: EdgeInsetsDirectional.symmetric(
                    vertical: 8,
                    horizontal: 14,
                  ),
                  width: double.maxFinite,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "结束时间：",
                        style: TextStyle(
                          color: Color(0xA6FFFFFF),
                          fontSize: 14,
                        ),
                      ),

                      Text(
                        "xxxxxxxxx",
                        style: TextStyle(
                          color: Color(0xFFFFFFFF),
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
