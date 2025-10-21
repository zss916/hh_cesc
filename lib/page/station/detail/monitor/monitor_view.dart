import 'package:cescpro/components/common_app_bar.dart';
import 'package:cescpro/core/router/index.dart';
import 'package:cescpro/core/translations/en.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class MonitorView extends StatelessWidget {
  const MonitorView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: baseAppBar(title: TKey.monitor.tr),
      backgroundColor: Color(0xFF23282E),
      body: buildBody(viewState: 0),
    );
  }

  Widget buildBody({required int viewState}) {
    return switch (viewState) {
      _ when viewState == 0 => buildList(),
      _ => SizedBox(),
    };
  }

  Widget buildList() => GridView.builder(
    itemCount: 4,
    padding: EdgeInsetsDirectional.only(
      top: 12.h,
      start: 14.w,
      end: 14.w,
      bottom: 150.h,
    ),
    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: 2,
      mainAxisSpacing: 16.r,
      crossAxisSpacing: 16.r,
      childAspectRatio: 163 / 62,
    ),
    itemBuilder: (BuildContext context, int index) {
      return GestureDetector(
        onTap: () {
          PageTools.toMonitorDetail();
        },
        child: Container(
          width: double.maxFinite,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            //color: Color(0xFF2D2F33),
            gradient: LinearGradient(
              colors: [Color(0x99767E8A), Color(0x99414852)],
            ),
            borderRadius: BorderRadius.circular(10.r),
          ),
          child: Center(
            child: Text(
              getTitle(index),
              style: TextStyle(
                color: Colors.white,
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
      );
    },
  );

  String getTitle(int index) {
    switch (index) {
      case 0:
        return "电池系统";
      case 1:
        return "PCS";
      case 2:
        return "电表";
      case 3:
        return "液冷";
      default:
        return "";
    }
  }
}
