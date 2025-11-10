import 'package:cescpro/core/translations/en.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class AlarmItemSelect extends StatelessWidget {
  final Function onTap;
  final String title;
  final String? subTitle;
  const AlarmItemSelect({
    super.key,
    required this.onTap,
    required this.title,
    this.subTitle,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: double.maxFinite,
          child: Text(
            title,
            textAlign: TextAlign.start,
            style: TextStyle(color: Colors.white, fontSize: 12),
          ),
        ),
        Container(
          clipBehavior: Clip.hardEdge,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: Color(0xFF484D55),
          ),
          margin: EdgeInsetsDirectional.only(top: 10.h),
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: () {
                onTap.call();
              },
              child: Container(
                width: double.maxFinite,
                padding: EdgeInsetsDirectional.symmetric(
                  horizontal: 10,
                  vertical: 9,
                ),
                child: Row(
                  children: [
                    Text(
                      subTitle ?? TKey.selectHint.tr,
                      style: TextStyle(
                        color: subTitle != null
                            ? Colors.white
                            : Color(0x73FFFFFF),
                        fontSize: 14,
                      ),
                    ),
                    Spacer(),
                    Icon(
                      Icons.arrow_forward_ios,
                      size: 16,
                      color: Colors.white60,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
