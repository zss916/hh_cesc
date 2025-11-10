import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// 99.正常 (0:停止1:充电2:放电3:待机) 4: 故障，-3:中断 -2:告警
class WarmStatusButton extends StatelessWidget {
  final String title;
  final bool isPressed;
  final int value;
  final Function(int value)? onSelect;
  const WarmStatusButton({
    super.key,
    required this.title,
    required this.value,
    required this.isPressed,
    this.onSelect,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onSelect?.call(value);
      },
      child: UnconstrainedBox(
        child: Container(
          alignment: AlignmentDirectional.center,
          padding: EdgeInsetsDirectional.symmetric(
            horizontal: 25.w,
            vertical: 6.h,
          ),
          decoration: BoxDecoration(
            border: Border.all(
              width: 1,
              color: isPressed ? Color(0xFF73FBFF) : Colors.transparent,
            ),
            borderRadius: BorderRadius.circular(5),
            color: isPressed ? Color(0x6122B3F2) : Color(0x5986A3C1),
          ),
          constraints: BoxConstraints(minWidth: 80.w, minHeight: 32.h),
          child: Text(
            title,
            style: TextStyle(color: Colors.white, fontSize: 14),
          ),
        ),
      ),
    );
  }
}
