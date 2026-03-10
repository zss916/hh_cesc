import 'package:cescpro/page/station/index/index.dart';
import 'package:flutter/material.dart';

class SelectStatusWidget extends StatelessWidget {
  final StationLogic logic;
  const SelectStatusWidget({super.key, required this.logic});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      scrollDirection: Axis.horizontal,
      padding: EdgeInsetsDirectional.only(start: 8),
      itemCount: logic.stationStatus.length,
      itemBuilder: (BuildContext context, int index) {
        Map<String, dynamic> item = logic.stationStatus[index];
        return UnconstrainedBox(
          child: InkWell(
            borderRadius: BorderRadius.circular(100),
            onTap: () {
              if (logic.statusParam == (item['value'] as int)) {
                logic.statusParam = null;
              } else {
                logic.statusParam = (item['value'] as int);
              }
              logic.toSearch();
              //logic.update();
            },
            child: Container(
              height: 30,
              alignment: Alignment.center,
              padding: EdgeInsets.only(left: 10, right: 10),
              constraints: BoxConstraints(minWidth: 72),
              decoration: BoxDecoration(
                border: Border.all(
                  width: 1,
                  color: item["value"] == logic.statusParam
                      ? Color(0xFF73FBFF)
                      : Color(0x1AE5E5E5),
                ),
                color: item["value"] == logic.statusParam
                    ? Color(0x6122B3F2)
                    : Color(0x1AE5E5E5),
                borderRadius: BorderRadius.circular(100),
              ),
              child: Text(
                "${item["title"]}",
                style: TextStyle(fontSize: 12, color: Color(0xC4FFFFFF)),
              ),
            ),
          ),
        );
      },
      separatorBuilder: (BuildContext context, int index) =>
          const VerticalDivider(width: 12, color: Colors.transparent),
    );
  }
}
