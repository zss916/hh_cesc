import 'package:cescpro/core/router/index.dart';
import 'package:flutter/material.dart';

class TopItemWidget extends StatelessWidget {
  final String title;
  const TopItemWidget({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Color(0xFF313540)),
      width: double.maxFinite,
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () {
            PageTools.toBatteryCluster();
          },
          child: Container(
            width: double.maxFinite,
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: Row(
              children: [
                Text(
                  title,
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
