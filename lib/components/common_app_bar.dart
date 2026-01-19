import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

///base appBar
class ComAppBar extends AppBar {
  ComAppBar({
    super.key,
    String? title,
    Widget? leading,
    bool? centerTitle,
    super.actions,
    Color? backgroundColor,
    super.bottom,
    SystemUiOverlayStyle? systemOverlayStyle,
    Widget? titleWidget,
    bool isTextDark = true,
    Function? back,
    bool? isSetBg,
  }) : super(
         backgroundColor: backgroundColor ?? Colors.transparent,
         elevation: 0,
         title:
             titleWidget ??
             Text(
               title ?? '',
               maxLines: 1,
               textAlign: TextAlign.center,
               style: TextStyle(
                 color: Colors.white,
                 fontSize: 22.sp,
                 fontWeight: FontWeight.w500,
               ),
             ),
         centerTitle: centerTitle ?? true,
         foregroundColor: Colors.transparent,
         surfaceTintColor: Colors.transparent,
         systemOverlayStyle: barStyle,
       );
}

SystemUiOverlayStyle barStyle = const SystemUiOverlayStyle(
  statusBarColor: Colors.transparent,
  // iOS配置
  statusBarIconBrightness: Brightness.dark,
  systemNavigationBarDividerColor: Colors.transparent,
  // Android配置
  statusBarBrightness: Brightness.light,
  systemNavigationBarColor: Colors.transparent,
  systemNavigationBarIconBrightness: Brightness.light,
);

///baseAppBar
AppBar baseAppBar({required String title}) => AppBar(
  leading: IconButton(
    icon: Icon(Icons.arrow_back_ios_new_rounded, color: Colors.white),
    onPressed: () => Get.back(),
  ),
  backgroundColor: Color(0xFF23282E),
  surfaceTintColor: Colors.transparent,
  centerTitle: true,
  title: Text(
    title,
    textAlign: TextAlign.center,
    style: TextStyle(color: Color(0xDEFFFFFF), fontSize: 18.sp),
  ),
  // systemOverlayStyle: barStyle,
);
