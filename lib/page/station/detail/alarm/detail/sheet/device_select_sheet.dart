import 'package:cescpro/core/translations/en.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

void showDeviceLevelSheet({
  required BuildContext context,
  Function(String?)? onSelect,
  String? deviceType,
}) {
  Get.bottomSheet(
    DeviceSelectSheetWidget(deviceType: deviceType, onSelect: onSelect),
    ignoreSafeArea: false,
  );
}

class DeviceSelectSheetWidget extends StatefulWidget {
  final Function(String?)? onSelect;
  final String? deviceType;
  const DeviceSelectSheetWidget({super.key, this.onSelect, this.deviceType});

  @override
  State<DeviceSelectSheetWidget> createState() =>
      _DeviceSelectSheetWidgetState();
}

class _DeviceSelectSheetWidgetState extends State<DeviceSelectSheetWidget> {
  String? select;

  List<String> deviceTypeList = [
    "ARR",
    "CLU",
    "PCS",
    "METER",
    "COOL",
    "AIR_COOL",
    "DRIER",
    "WATER_LOGGING",
    "FIRE",
    "DIDO",
    "DCDC",
    "STS",
    "PV",
  ];

  @override
  void initState() {
    super.initState();
    if (widget.deviceType != null) {
      select = widget.deviceType;
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
          Divider(height: 5.h, color: Colors.transparent),
          Wrap(
            spacing: 15,
            runSpacing: 15,
            children: [
              ...deviceTypeList.map(
                (e) => InkWell(
                  onTap: () {
                    setState(() {
                      if (select == e) {
                        select = null;
                      } else {
                        select = e;
                      }
                    });
                  },
                  child: Container(
                    padding: EdgeInsetsDirectional.symmetric(
                      horizontal: 15,
                      vertical: 5,
                    ),
                    decoration: BoxDecoration(
                      border: Border.all(
                        width: 1,
                        color: (select == e) ? Color(0xFF43FFFF) : Colors.white,
                      ),
                      borderRadius: BorderRadiusDirectional.circular(5),
                    ),
                    child: Text(
                      e,
                      style: TextStyle(
                        color: (select == e) ? Color(0xFF43FFFF) : Colors.white,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),

          Divider(height: 5.h, color: Colors.transparent),
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
                    widget.onSelect?.call(select);
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
