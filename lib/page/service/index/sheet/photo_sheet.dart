import 'package:cescpro/core/translations/en.dart';
import 'package:cescpro/generated/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

void showPhotoSheet({Function? onAlbum, Function? onTakePhoto}) {
  Get.bottomSheet(
    PhotoWidget(onAlbum: onAlbum, onTakePhoto: onTakePhoto),
    ignoreSafeArea: false,
  );
}

class PhotoWidget extends StatelessWidget {
  final Function? onAlbum;
  final Function? onTakePhoto;
  const PhotoWidget({super.key, this.onAlbum, this.onTakePhoto});

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        color: Color(0xFF313540),
        borderRadius: BorderRadiusDirectional.vertical(top: Radius.circular(4)),
      ),
      width: double.maxFinite,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          InkWell(
            onTap: () {
              Get.back();
              onAlbum?.call();
            },
            child: Container(
              width: double.maxFinite,
              alignment: Alignment.center,
              padding: EdgeInsets.all(14),
              decoration: BoxDecoration(color: Color(0xFF313540)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(Assets.imgAlbum, width: 24, height: 24),
                  VerticalDivider(width: 10.w, color: Colors.transparent),
                  Text(
                    TKey.album.tr,
                    style: TextStyle(color: Colors.white, fontSize: 14.sp),
                  ),
                ],
              ),
            ),
          ),
          Divider(color: Color(0x14FFFFFF), height: 1),
          InkWell(
            onTap: () {
              Get.back();
              onTakePhoto?.call();
            },
            child: Container(
              width: double.maxFinite,
              alignment: Alignment.center,
              padding: EdgeInsets.all(14),
              decoration: BoxDecoration(color: Color(0xFF313540)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(Assets.imgTakePhoto, width: 24, height: 24),
                  VerticalDivider(width: 10.w, color: Colors.transparent),
                  Text(
                    TKey.takePhoto.tr,
                    style: TextStyle(color: Colors.white, fontSize: 14.sp),
                  ),
                ],
              ),
            ),
          ),
          Divider(color: Color(0xFF2A2D36), height: 4),
          InkWell(
            onTap: () {
              Get.back();
            },
            child: Container(
              width: double.maxFinite,
              alignment: Alignment.center,
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(color: Color(0xFF313540)),
              child: Text(
                TKey.cancel.tr,
                textAlign: TextAlign.center,
                style: TextStyle(color: Color(0xFF0F96FF), fontSize: 14.sp),
              ),
            ),
          ),
          Divider(color: Colors.transparent, height: 20),
        ],
      ),
    );
  }
}
