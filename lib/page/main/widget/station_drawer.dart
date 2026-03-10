import 'package:cescpro/components/warm_status_button.dart';
import 'package:cescpro/core/helper/extension_helper.dart';
import 'package:cescpro/core/translations/en.dart';
import 'package:cescpro/page/station/index/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class StationDrawer extends StatefulWidget {
  final Function onReset;
  final Function onConfirm;
  final int? status;
  const StationDrawer({
    super.key,
    this.status,
    required this.onReset,
    required this.onConfirm,
  });

  @override
  State<StationDrawer> createState() => _StationDrawerState();
}

class _StationDrawerState extends State<StationDrawer> {
  int? select;

  @override
  void initState() {
    super.initState();
    select = widget.status;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: EdgeInsetsDirectional.only(bottom: 20.h),
          width: double.maxFinite,
          child: Text(
            TKey.stationStatus.tr,
            textAlign: TextAlign.start,
            style: TextStyle(color: Colors.white, fontSize: 16),
          ),
        ),
        Container(
          margin: EdgeInsetsDirectional.only(bottom: 18.h),
          width: double.maxFinite,
          child: Wrap(
            runSpacing: 14.w,
            spacing: 14.w,
            children: [
              WarmStatusButton(
                title: TKey.common.tr,
                value: 99,
                isPressed: select == 99,
                onSelect: (value) {
                  setState(() {
                    select = value;
                  });
                },
              ),
              WarmStatusButton(
                title: TKey.alarm.tr,
                value: -2,
                isPressed: select == -2,
                onSelect: (value) {
                  setState(() {
                    select = value;
                  });
                },
              ),
              WarmStatusButton(
                title: TKey.fault.tr,
                value: 4,
                isPressed: select == 4,
                onSelect: (value) {
                  setState(() {
                    select = value;
                  });
                },
              ),
              WarmStatusButton(
                title: TKey.interrupt.tr,
                value: -3,
                isPressed: select == -3,
                onSelect: (value) {
                  setState(() {
                    select = value;
                  });
                },
              ),
            ],
          ),
        ),
        Divider(height: 1, color: Color(0x99313540)),
        Container(
          margin: EdgeInsetsDirectional.only(top: 20.h),
          width: double.maxFinite,
          child: Wrap(
            runSpacing: 14.w,
            spacing: 14.w,
            children: [
              WarmStatusButton(
                title: TKey.charge.tr,
                value: 1,
                isPressed: select == 1,
                onSelect: (value) {
                  setState(() {
                    select = value;
                  });
                },
              ),
              WarmStatusButton(
                title: TKey.discharge.tr,
                value: 2,
                isPressed: select == 2,
                onSelect: (value) {
                  setState(() {
                    select = value;
                  });
                },
              ),
              WarmStatusButton(
                title: TKey.standby.tr,
                value: 3,
                isPressed: select == 3,
                onSelect: (value) {
                  setState(() {
                    select = value;
                  });
                },
              ),
            ],
          ),
        ),
        Spacer(),
        Row(
          children: [
            Expanded(
              child: InkWell(
                borderRadius: BorderRadius.circular(50),
                onTap: () {
                  if (safeFind<StationLogic>()?.statusParam == null) {
                    select = null;
                  } else {
                    if (select != null) {
                      setState(() {
                        select = null;
                        safeFind<StationLogic>()?.statusParam = select;
                        safeFind<StationLogic>()?.toSearch();
                      });
                    }
                  }
                  widget.onReset.call();
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
                    TKey.reset.tr,
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
                  safeFind<StationLogic>()?.statusParam = select;
                  safeFind<StationLogic>()?.toSearch();
                  widget.onConfirm.call();
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
    );
  }
}
