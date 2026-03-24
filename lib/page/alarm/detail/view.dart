import 'package:cescpro/core/helper/extension_helper.dart';
import 'package:cescpro/core/translations/en.dart';
import 'package:cescpro/http/bean/alarm_item_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class AlarmDetailsPage extends StatelessWidget {
  const AlarmDetailsPage({super.key});

  AlarmItemEntity? get item => Get.arguments as AlarmItemEntity?;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_new_rounded, color: Colors.white),
          onPressed: () {
            Get.back();
          },
        ),
        backgroundColor: Color(0xFF23282E),
        surfaceTintColor: Colors.transparent,
        centerTitle: true,
        title: Text(
          "告警详情",
          textAlign: TextAlign.center,
          style: TextStyle(color: Color(0xDEFFFFFF), fontSize: 18.sp),
        ),
        // systemOverlayStyle: barStyle,
      ),
      backgroundColor: Color(0xFF23282E),
      //body: AlarmView(),
      body: Container(
        width: double.maxFinite,
        //constraints: BoxConstraints(minHeight: 200),
        margin: EdgeInsetsDirectional.only(
          start: 16.w,
          end: 16.w,
          bottom: 20.h,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(14),
          color: Color(0xFF313540),
        ),
        child: Column(
          children: [
            Container(
              padding: EdgeInsetsDirectional.all(14),
              width: double.maxFinite,
              child: Text(
                item?.siteName ?? "",
                //overflow: TextOverflow.ellipsis,
                softWrap: true,
                style: TextStyle(color: Colors.white, fontSize: 15.sp),
              ),
            ),

            Container(
              padding: EdgeInsetsDirectional.symmetric(
                vertical: 5,
                horizontal: 14,
              ),
              width: double.maxFinite,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    TKey.startTime.tr,
                    style: TextStyle(color: Color(0xA6FFFFFF), fontSize: 14),
                  ),

                  Text(
                    item?.startTimeMill == null
                        ? "--"
                        : (item?.startTimeMill ?? 0).timestampFormat,
                    style: TextStyle(color: Color(0xFFFFFFFF), fontSize: 14),
                  ),
                ],
              ),
            ),

            if (item?.endTimeMill != null)
              Container(
                padding: EdgeInsetsDirectional.symmetric(
                  vertical: 5,
                  horizontal: 14,
                ),
                width: double.maxFinite,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      TKey.endTime.tr,
                      style: TextStyle(color: Color(0xA6FFFFFF), fontSize: 14),
                    ),

                    Text(
                      item?.endTimeMill == null
                          ? "--"
                          : (item?.endTimeMill ?? 0).timestampFormat,
                      style: TextStyle(color: Color(0xFFFFFFFF), fontSize: 14),
                    ),
                  ],
                ),
              ),

            Container(
              padding: EdgeInsetsDirectional.symmetric(
                vertical: 5,
                horizontal: 14,
              ),
              width: double.maxFinite,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    TKey.deviceSerialNumber.tr,
                    style: TextStyle(color: Color(0xA6FFFFFF), fontSize: 14),
                  ),

                  Text(
                    item?.sn ?? "",
                    style: TextStyle(color: Color(0xFFFFFFFF), fontSize: 14),
                  ),
                ],
              ),
            ),

            Container(
              padding: EdgeInsetsDirectional.symmetric(
                vertical: 5,
                horizontal: 14,
              ),
              width: double.maxFinite,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    TKey.alarmDevice.tr,
                    style: TextStyle(color: Color(0xA6FFFFFF), fontSize: 14),
                  ),

                  Text(
                    item?.deviceName ?? "",
                    style: TextStyle(color: Color(0xFFFFFFFF), fontSize: 14),
                  ),
                ],
              ),
            ),

            Container(
              padding: EdgeInsetsDirectional.symmetric(
                vertical: 5,
                horizontal: 14,
              ),
              width: double.maxFinite,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    TKey.alarmContent.tr,
                    style: TextStyle(color: Color(0xA6FFFFFF), fontSize: 14),
                  ),

                  Text(
                    item?.content ?? "",
                    style: TextStyle(color: Color(0xFFFFFFFF), fontSize: 14),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
