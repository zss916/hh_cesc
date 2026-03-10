import 'package:cescpro/core/helper/extension_helper.dart';
import 'package:flutter/material.dart';

class SelectStatusWidget extends StatefulWidget {
  final Function(int? value)? onSelectItem;

  const SelectStatusWidget({super.key, this.onSelectItem});

  @override
  State<SelectStatusWidget> createState() => _SelectStatusWidgetState();
}

class _SelectStatusWidgetState extends State<SelectStatusWidget> {
  int selected = -1;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      scrollDirection: Axis.horizontal,
      padding: EdgeInsetsDirectional.only(start: 8),
      itemCount: stationStatus.length,
      itemBuilder: (BuildContext context, int index) {
        Map<String, dynamic> item = stationStatus[index];
        return UnconstrainedBox(
          child: InkWell(
            borderRadius: BorderRadius.circular(100),
            onTap: () {
              if (selected == index) {
                setState(() {
                  stationStatus[index]["selected"] = false;
                  selected = -1;
                });
                widget.onSelectItem?.call(null);
              } else {
                setState(() {
                  for (int i = 0; i < (stationStatus.length); i++) {
                    stationStatus[i]["selected"] = (i == index);
                    selected = index;
                  }
                });
                widget.onSelectItem?.call(
                  (stationStatus[selected]['value'] as int),
                );
              }
            },
            child: Container(
              height: 30,
              alignment: Alignment.center,
              padding: EdgeInsets.only(left: 10, right: 10),
              constraints: BoxConstraints(minWidth: 72),
              decoration: BoxDecoration(
                border: Border.all(
                  width: 1,
                  color: item["selected"] == true
                      ? Color(0xFF73FBFF)
                      : Color(0x1AE5E5E5),
                ),
                color: item["selected"] == true
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
