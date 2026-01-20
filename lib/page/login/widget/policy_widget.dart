import 'package:cescpro/core/translations/en.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';

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
            text: TKey.loginAgreement.tr,
            children: [
              const TextSpan(text: '《'),
              TextSpan(
                style: TextStyle(
                  color: const Color(0xFFFFFFFF),
                  fontSize: 12.sp,
                ),
                text: TKey.userAgreement.tr,
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
                text: TKey.privacyPolicy.tr,
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
      textAlign: TextAlign.start,
      maxLines: 3,
    );
  }
}
