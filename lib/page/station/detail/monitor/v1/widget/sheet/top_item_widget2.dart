import 'package:cescpro/page/station/detail/monitor/v1/monitor_detail_v1_logic.dart';
import 'package:cescpro/page/station/detail/monitor/v1/widget/sheet/select_title_sheet2.dart';
import 'package:flutter/material.dart';

class TopItemWidget2 extends StatelessWidget {
  final MonitorDetailV1Logic logic;
  const TopItemWidget2({super.key, required this.logic});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Color(0xFF313540)),
      width: double.maxFinite,
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () {
            showSelectTitleSheet2(
              logic.childDevices,
              onSelect: (value, did, id, childId) {
                logic.deviceName = value;
                logic.update();
                logic.did = did;
                logic.id = id;
                logic.childId = childId;
                debugPrint(
                  "====>>>>  value:$value,did:$did,id:$id,childId:$childId",
                );
                logic.refreshData();
              },
            );
          },
          child: Container(
            width: double.maxFinite,
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: Row(
              children: [
                Text(
                  logic.deviceName,
                  style: TextStyle(color: Colors.white, fontSize: 14),
                ),
                Spacer(),
                Icon(
                  Icons.arrow_right_rounded,
                  color: Color(0xA6FFFFFF),
                  size: 25,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
