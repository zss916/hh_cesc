import 'package:cescpro/page/station/detail/monitor/detail/monitor_detail_logic.dart';
import 'package:cescpro/page/station/detail/monitor/detail/widget/sheet/select_title_sheet.dart';
import 'package:flutter/material.dart';

class TopItemWidget extends StatelessWidget {
  final MonitorDetailLogic logic;
  const TopItemWidget({super.key, required this.logic});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Color(0xFF313540)),
      width: double.maxFinite,
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () {
            showSelectTitleSheet(
              logic.titles,
              onSelect: (value, did, nodeNo, devNo) {
                logic.compTree = value;
                logic.did = did;
                logic.nodeNo = nodeNo;
                logic.devNo = devNo;
                logic.switchTree();
              },
            );
          },
          child: Container(
            width: double.maxFinite,
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: Row(
              children: [
                Text(
                  logic.compTree,
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
