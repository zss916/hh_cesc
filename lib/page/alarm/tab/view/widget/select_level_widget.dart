import 'package:cescpro/core/translations/en.dart';
import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';

class SelectLevelWidget extends StatelessWidget {
  int? alarmLevel;
  final Function(int? value)? onCall;

  SelectLevelWidget({super.key, required this.alarmLevel, this.onCall});

  List<Map<String, dynamic>> get levelList => [
    {"title": TKey.alarmLevel1.tr, "value": 1},
    {"title": TKey.alarmLevel2.tr, "value": 2},
    {"title": TKey.alarmLevel3.tr, "value": 3},
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      scrollDirection: Axis.horizontal,
      padding: EdgeInsetsDirectional.only(start: 8, top: 3, bottom: 3),
      itemCount: levelList.length,
      itemBuilder: (BuildContext context, int index) {
        Map<String, dynamic> item = levelList[index];
        return UnconstrainedBox(
          child: InkWell(
            borderRadius: BorderRadius.circular(100),
            onTap: () {
              if (alarmLevel == (item['value'] as int)) {
                alarmLevel = null;
              } else {
                alarmLevel = (item['value'] as int);
              }
              onCall?.call(alarmLevel);
            },
            child: Container(
              height: 30,
              alignment: Alignment.center,
              padding: EdgeInsets.only(left: 10, right: 10),
              constraints: BoxConstraints(minWidth: 72),
              decoration: BoxDecoration(
                border: Border.all(
                  width: 1,
                  color: item["value"] == alarmLevel
                      ? Color(0xFF73FBFF)
                      : Color(0x1AE5E5E5),
                ),
                color: item["value"] == alarmLevel
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
