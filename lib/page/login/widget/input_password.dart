import 'package:cescpro/core/translations/en.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:keyboard_visibility_pro/keyboard_visibility_pro.dart';

class InputPassword extends StatelessWidget {
  final Function(String) onInput;
  final String? pwd;
  final TextEditingController? textEditCtrl;
  final FocusNode? pwdFocusNode;
  final bool obscureText;
  final Function() onObscure;

  const InputPassword({
    super.key,
    required this.onInput,
    required this.onObscure,
    required this.obscureText,
    this.textEditCtrl,
    this.pwdFocusNode,
    this.pwd,
  });

  @override
  Widget build(BuildContext context) {
    return KeyboardVisibility(
      onChanged: (bool isKeyboardVisible) {
        if (!isKeyboardVisible) {
          if ((textEditCtrl?.text ?? "").isNotEmpty) {
            // onValid.call();
          }
        }
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            height: 48,
            color: Colors.transparent,
            width: double.maxFinite,
            child: TextField(
              cursorColor: Colors.white,
              controller: textEditCtrl,
              focusNode: pwdFocusNode,
              obscureText: obscureText,
              onTapOutside: (_) {
                FocusManager.instance.primaryFocus?.unfocus();
              },
              style: TextStyle(color: Colors.white, fontSize: 16.sp),
              decoration: InputDecoration(
                suffixIcon: InkWell(
                  borderRadius: BorderRadius.circular(50),
                  onTap: () {
                    onObscure.call();
                  },
                  child: Stack(
                    alignment: AlignmentDirectional.center,
                    children: [
                      Icon(
                        obscureText ? Icons.visibility_off : Icons.visibility,
                        color: Colors.white70,
                      ),
                    ],
                  ),
                ),
                fillColor: Color(0x99484D55),
                filled: true,
                hintText: TKey.password.tr,
                hintStyle: TextStyle(
                  color: const Color(0xFFA4A4A4),
                  fontSize: 16.sp,
                ),
                errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(50.r),
                  borderSide: BorderSide(color: Colors.transparent),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(50.r),
                  borderSide: BorderSide(color: Colors.transparent),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(50.r), // 启用时的边框圆角
                  borderSide: BorderSide(color: Colors.transparent),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(50.r),
                  borderSide: BorderSide(color: Colors.transparent),
                ),
              ),
              onChanged: (value) {
                onInput.call(value);
              },
              onEditingComplete: () {
                _hideKeyboard(context);
                //onValid.call();
              },
              onSubmitted: (value) {
                _hideKeyboard(context);
                // onValid.call();
              },
            ),
          ),
          Divider(height: 16.h, color: Colors.transparent),
        ],
      ),
    );
  }

  void _hideKeyboard(BuildContext context) {
    FocusScope.of(context).requestFocus(FocusNode()); // 隐藏键盘
  }
}
