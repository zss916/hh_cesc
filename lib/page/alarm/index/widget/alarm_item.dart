import 'package:cescpro/core/helper/extension_helper.dart';
import 'package:cescpro/core/translations/en.dart';
import 'package:cescpro/http/bean/alarm_item_entity.dart';
import 'package:cescpro/page/alarm/index/widget/alarm_level.dart';
import 'package:cescpro/page/alarm/index/widget/alarm_status.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class AlarmItem extends StatelessWidget {
  final AlarmItemEntity item;
  const AlarmItem({super.key, required this.item});

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
                      AlarmLevel(level: item.alarmLevel ?? 0),
                      Expanded(
                        child: Container(
                          width: double.maxFinite,
                          padding: EdgeInsetsDirectional.only(end: 60),
                          margin: EdgeInsetsDirectional.only(
                            start: 5.w,
                            end: 5.w,
                          ),
                          child: Text(
                            item.siteName ?? "",
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(color: Colors.white, fontSize: 16),
                          ),
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
                        TKey.deviceSerialNumber.tr,
                        style: TextStyle(
                          color: Color(0xA6FFFFFF),
                          fontSize: 14,
                        ),
                      ),

                      Text(
                        item.sn ?? "",
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
                        TKey.alarmDevice.tr,
                        style: TextStyle(
                          color: Color(0xA6FFFFFF),
                          fontSize: 14,
                        ),
                      ),

                      Text(
                        item.deviceName,
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
                        TKey.alarmContent.tr,
                        style: TextStyle(
                          color: Color(0xA6FFFFFF),
                          fontSize: 14,
                        ),
                      ),

                      Expanded(
                        child: Text(
                          item.content ?? "",
                          textAlign: TextAlign.right,
                          style: TextStyle(
                            color: Color(0xFFFFFFFF),
                            fontSize: 14,
                          ),
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
                        TKey.startTime.tr,
                        style: TextStyle(
                          color: Color(0xA6FFFFFF),
                          fontSize: 14,
                        ),
                      ),

                      Text(
                        item.startTimeMill == null
                            ? "--"
                            : (item.startTimeMill ?? 0).timestampFormat,
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
                        TKey.endTime.tr,
                        style: TextStyle(
                          color: Color(0xA6FFFFFF),
                          fontSize: 14,
                        ),
                      ),

                      Text(
                        item.endTimeMill == null
                            ? "--"
                            : (item.endTimeMill ?? 0).timestampFormat,
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

          PositionedDirectional(
            top: 15,
            end: 11.w,
            child: AlarmStatus(status: item.status ?? 0),
          ),
        ],
      ),
    );
  }
}
