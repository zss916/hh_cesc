import 'package:cescpro/core/translations/en.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

void showAlarmLevelSheet({
  required BuildContext context,
  Function(String, int)? onSelect,
  int? selectLevel,
}) {
  Get.bottomSheet(
    AlarmSelectSheetWidget(selectLevel: selectLevel, onSelect: onSelect),
    ignoreSafeArea: false,
  );
}

class AlarmSelectSheetWidget extends StatefulWidget {
  final Function(String, int)? onSelect;
  final int? selectLevel;
  const AlarmSelectSheetWidget({super.key, this.onSelect, this.selectLevel});

  @override
  State<AlarmSelectSheetWidget> createState() => _AlarmSelectSheetWidgetState();
}

class _AlarmSelectSheetWidgetState extends State<AlarmSelectSheetWidget> {
  int? select;
  String? selectTitle;

  @override
  void initState() {
    super.initState();
    if (widget.selectLevel != null) {
      select = widget.selectLevel;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color(0xFF23282E),
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(10),
          topLeft: Radius.circular(10),
        ),
      ),
      padding: EdgeInsetsDirectional.symmetric(
        horizontal: 20.w,
        vertical: 20.h,
      ),
      width: double.maxFinite,
      child: Column(
        spacing: 20.h,
        mainAxisSize: MainAxisSize.min,
        children: [
          InkWell(
            onTap: () {
              setState(() {
                select = (select == 1) ? null : 1;
                selectTitle = TKey.alarmLevel1.tr;
              });
            },
            child: Container(
              width: double.maxFinite,
              decoration: BoxDecoration(
                border: select == 1
                    ? Border.all(width: 1, color: Color(0xFF43FFFF))
                    : Border.all(width: 1, color: Colors.white10),
                color: Colors.white10,
                borderRadius: BorderRadius.circular(10),
              ),
              padding: EdgeInsetsDirectional.symmetric(
                horizontal: 15,
                vertical: 15,
              ),
              child: Text(
                TKey.alarmLevel1.tr,
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
          InkWell(
            onTap: () {
              setState(() {
                select = (select == 2) ? null : 2;
                selectTitle = TKey.alarmLevel2.tr;
              });
            },
            child: Container(
              width: double.maxFinite,
              decoration: BoxDecoration(
                border: select == 2
                    ? Border.all(width: 1, color: Color(0xFF43FFFF))
                    : Border.all(width: 1, color: Colors.white10),
                color: Colors.white10,
                borderRadius: BorderRadius.circular(10),
              ),
              padding: EdgeInsetsDirectional.symmetric(
                horizontal: 15,
                vertical: 15,
              ),
              child: Text(
                TKey.alarmLevel2.tr,
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
          InkWell(
            onTap: () {
              setState(() {
                select = (select == 3) ? null : 3;
                selectTitle = TKey.alarmLevel3.tr;
              });
            },
            child: Container(
              width: double.maxFinite,
              decoration: BoxDecoration(
                border: select == 3
                    ? Border.all(width: 1, color: Color(0xFF43FFFF))
                    : Border.all(width: 1, color: Colors.white10),
                color: Colors.white10,
                borderRadius: BorderRadius.circular(10),
              ),
              padding: EdgeInsetsDirectional.symmetric(
                horizontal: 15,
                vertical: 15,
              ),
              child: Text(
                TKey.alarmLevel3.tr,
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
          Row(
            children: [
              Expanded(
                child: InkWell(
                  borderRadius: BorderRadius.circular(50),
                  onTap: () {
                    Get.back();
                  },
                  child: Container(
                    width: double.maxFinite,
                    height: 40,
                    alignment: AlignmentDirectional.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: Color(0x5986A3C1),
                    ),
                    child: Text(
                      TKey.cancel.tr,
                      style: TextStyle(color: Colors.white, fontSize: 14),
                    ),
                  ),
                ),
              ),
              VerticalDivider(width: 10, color: Colors.transparent),
              Expanded(
                child: InkWell(
                  borderRadius: BorderRadius.circular(50),
                  onTap: () {
                    Get.back();
                    if (select != null) {
                      widget.onSelect?.call(selectTitle ?? "", select!);
                    }
                    // widget.onConfirm.call();
                  },
                  child: Container(
                    width: double.maxFinite,
                    height: 40,
                    alignment: AlignmentDirectional.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      gradient: LinearGradient(
                        colors: [Color(0xFF43FFFF), Color(0xFF0978E9)],
                      ),
                    ),
                    child: Text(
                      TKey.confirm.tr,
                      style: TextStyle(color: Colors.white, fontSize: 14),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
