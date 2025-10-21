import 'package:cescpro/components/common_app_bar.dart';
import 'package:cescpro/core/translations/en.dart';
import 'package:cescpro/core/widget/alarm_level_status_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_popup/flutter_popup.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class AlarmDetailPage extends StatelessWidget {
  const AlarmDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: baseAppBar(title: TKey.alarmDetailsData.tr),
      backgroundColor: Color(0xFF23282E),
      body: Column(
        children: [
          Container(
            decoration: BoxDecoration(color: Color(0xFF313540)),
            width: double.maxFinite,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CustomPopup(
                  arrowColor: Colors.white,
                  barrierColor: Colors.transparent,
                  backgroundColor: Colors.white,
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: 30,
                    vertical: 10,
                  ),
                  content: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: List.generate(5, (index) => Text('menu$index')),
                  ),
                  child: Material(
                    color: Colors.transparent,
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 12,
                      ),
                      child: Row(
                        children: [
                          Text(
                            TKey.alarmLevel.tr,
                            style: TextStyle(color: Colors.white, fontSize: 14),
                          ),
                          Icon(
                            Icons.arrow_drop_down_rounded,
                            color: Color(0xA6FFFFFF),
                            size: 25,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),

                Material(
                  color: Colors.transparent,
                  child: InkWell(
                    onTap: () {
                      showMenu(
                        context: context,
                        position: RelativeRect.fromLTRB(
                          0,
                          Get.statusBarHeight + 50,
                          0,
                          0,
                        ),
                        items: [
                          PopupMenuItem(
                            child: Container(
                              width: double.maxFinite,
                              child: Text('menu1'),
                            ),
                          ),
                          PopupMenuItem(child: Text('menu2')),
                          PopupMenuItem(child: Text('menu3')),
                        ],
                      );
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 12,
                      ),
                      child: Row(
                        children: [
                          Text(
                            TKey.deviceType.tr,
                            style: TextStyle(color: Colors.white, fontSize: 14),
                          ),
                          Icon(
                            Icons.arrow_drop_down_rounded,
                            color: Color(0xA6FFFFFF),
                            size: 25,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.separated(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
              itemCount: 13,
              itemBuilder: (BuildContext context, int index) => Container(
                width: double.maxFinite,
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Color(0xFF313540),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text(
                          "告警设备：",
                          style: TextStyle(
                            fontSize: 14,
                            color: Color(0xA6FFFFFF),
                          ),
                        ),
                        Spacer(),
                        Text(
                          "PCS",
                          style: TextStyle(
                            fontSize: 14,
                            color: Color(0xFFFFFFFF),
                          ),
                        ),
                      ],
                    ),
                    Divider(height: 16.h, color: Colors.transparent),
                    Row(
                      children: [
                        Text(
                          "设备序列号：",
                          style: TextStyle(
                            fontSize: 14,
                            color: Color(0xA6FFFFFF),
                          ),
                        ),
                        Spacer(),
                        Text(
                          "2451130000108",
                          style: TextStyle(
                            fontSize: 14,
                            color: Color(0xFFFFFFFF),
                          ),
                        ),
                      ],
                    ),
                    Divider(height: 16.h, color: Colors.transparent),
                    Row(
                      children: [
                        Text(
                          "告警等级：",
                          style: TextStyle(
                            fontSize: 14,
                            color: Color(0xA6FFFFFF),
                          ),
                        ),
                        Spacer(),
                        AlarmLevelStatusWidget(level: 0),
                        VerticalDivider(width: 2.w, color: Colors.transparent),
                        Text(
                          "一级",
                          style: TextStyle(
                            fontSize: 14,
                            color: Color(0xFFFFFFFF),
                          ),
                        ),
                      ],
                    ),
                    Divider(height: 16.h, color: Colors.transparent),
                    Row(
                      children: [
                        Text(
                          "告警内容：",
                          style: TextStyle(
                            fontSize: 14,
                            color: Color(0xA6FFFFFF),
                          ),
                        ),
                        Spacer(),
                        Text(
                          "321电池温度过高",
                          style: TextStyle(
                            fontSize: 14,
                            color: Color(0xFFFFFFFF),
                          ),
                        ),
                      ],
                    ),
                    Divider(height: 16.h, color: Colors.transparent),
                    Row(
                      children: [
                        Text(
                          "发生时间：",
                          style: TextStyle(
                            fontSize: 14,
                            color: Color(0xA6FFFFFF),
                          ),
                        ),
                        Spacer(),
                        Text(
                          "2025-09-08 10:20:23",
                          style: TextStyle(
                            fontSize: 14,
                            color: Color(0xFFFFFFFF),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              separatorBuilder: (BuildContext context, int index) =>
                  Divider(height: 12.h, color: Colors.transparent),
            ),
          ),
        ],
      ),
    );
  }
}
