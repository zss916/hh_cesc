import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WarmStatusButton extends StatefulWidget {
  final String title;
  const WarmStatusButton({super.key, required this.title});

  @override
  State<WarmStatusButton> createState() => _WarmStatusButtonState();
}

class _WarmStatusButtonState extends State<WarmStatusButton> {
  bool isPressed = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        setState(() {
          isPressed = !isPressed;
        });
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
            widget.title,
            style: TextStyle(color: Colors.white, fontSize: 14),
          ),
        ),
      ),
    );
  }
}
