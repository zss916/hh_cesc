import 'package:cescpro/http/bean/child_item_info.dart';
import 'package:cescpro/page/station/detail/monitor/v1/monitor_detail_v1_logic.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ChildDataWidget extends StatelessWidget {
  final MonitorDetailV1Logic logic;
  const ChildDataWidget({super.key, required this.logic});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      // physics: NeverScrollableScrollPhysics(),
      itemCount: (logic.arrValue?.childList ?? []).length,
      itemBuilder: (_, i) {
        ChildItemInfo item = (logic.arrValue?.childList ?? [])[i];
        return Container(
          width: double.maxFinite,
          padding: EdgeInsetsDirectional.symmetric(
            horizontal: 15,
            vertical: 10,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Color(0xFF313540),
          ),
          child: Row(
            children: [
              Text(
                item.name ?? "-",
                style: TextStyle(color: Colors.white, fontSize: 14),
              ),
              Spacer(),
              Text(
                "${item.value}",
                style: TextStyle(color: Colors.white, fontSize: 14),
              ),
            ],
          ),
        );
      },
      separatorBuilder: (_, int index) =>
          Divider(height: 20.h, color: Colors.transparent),
    );
  }
}
