import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PolicyWidget extends StatelessWidget {
  final Function onServiceTap;
  final Function onPrivacyTap;

  const PolicyWidget({
    super.key,
    required this.onServiceTap,
    required this.onPrivacyTap,
  });

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        children: [
          TextSpan(
            text: "登录即表示您已阅读，理解并同意",
            children: [
              const TextSpan(text: '《'),
              TextSpan(
                style: TextStyle(
                  color: const Color(0xFFFFFFFF),
                  fontSize: 12.sp,
                ),
                text: "用户协议",
                recognizer: TapGestureRecognizer()
                  ..onTap = () {
                    onServiceTap.call();
                  },
              ),
              const TextSpan(text: ' '),
              TextSpan(text: "&"),
              const TextSpan(text: ' '),
              TextSpan(
                style: TextStyle(
                  color: const Color(0xFFFFFFFF),
                  fontSize: 12.sp,
                ),
                text: "隐私协议",
                recognizer: TapGestureRecognizer()
                  ..onTap = () {
                    onPrivacyTap.call();
                  },
              ),
              TextSpan(text: "》"),
            ],
            style: TextStyle(
              color: Color(0x73FFFFFF),
              fontSize: 12.sp,
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
      textAlign: TextAlign.center,
      maxLines: 3,
    );
  }
}
