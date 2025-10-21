import 'package:cescpro/core/translations/en.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:keyboard_visibility_pro/keyboard_visibility_pro.dart';

class InputPassword extends StatefulWidget {
  final Function(String) onInput;
  final bool isShowError;
  final String? pwd;

  const InputPassword({
    super.key,
    required this.isShowError,
    required this.onInput,
    this.pwd,
  });

  @override
  _EditNameState createState() => _EditNameState();
}

class _EditNameState extends State<InputPassword> {
  TextEditingController textEditCtrl = TextEditingController();
  FocusNode focusNode = FocusNode();
  bool isError = false;

  @override
  void initState() {
    super.initState();
    focusNode.unfocus();
    focusNode.addListener(_onFocusChange);
  }

  @override
  void dispose() {
    focusNode.removeListener(_onFocusChange);
    focusNode.dispose();
    textEditCtrl.dispose();
    super.dispose();
  }

  bool isValidPassword(String password) {
    return true;
    //return isPwd(password);
  }

  void _onFocusChange() {
    if (!focusNode.hasFocus) {
      _valid();
    }
  }

  void _valid() {
    setState(() {
      String psd = textEditCtrl.text.trim();
      isError = !isValidPassword(psd);
    });
  }

  void _hideKeyboard() {
    FocusScope.of(context).requestFocus(FocusNode()); // 隐藏键盘
  }

  bool obscureText = true;

  @override
  Widget build(BuildContext context) {
    return KeyboardVisibility(
      onChanged: (bool isKeyboardVisible) {
        if (!isKeyboardVisible) {
          if (textEditCtrl.text.isNotEmpty) {
            _valid();
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
              focusNode: focusNode,
              obscureText: obscureText,
              onTapOutside: (_) {
                FocusManager.instance.primaryFocus?.unfocus();
              },
              style: TextStyle(color: Colors.white, fontSize: 16.sp),
              decoration: InputDecoration(
                suffixIcon: InkWell(
                  onTap: () {
                    setState(() {
                      obscureText = !obscureText;
                    });
                  },
                  child: Stack(
                    alignment: AlignmentDirectional.center,
                    children: [
                      SizedBox(width: 24, height: 24),
                      /*Image.asset(
                        obscureText
                            ? Assets.imageEyeClose
                            : Assets.imageEyeOpen,
                        width: 24.r,
                        height: 24.r,
                        matchTextDirection: true,
                      ),*/
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
                if (value.trim().isEmpty) {
                  setState(() {
                    isError = false;
                  });
                } else {
                  setState(() {
                    isError = !isValidPassword(value);
                  });
                }

                widget.onInput.call(value);
              },
              onEditingComplete: () {
                _hideKeyboard();
                _valid();
              },
              onSubmitted: (value) {
                _hideKeyboard();
                _valid();
              },
            ),
          ),
          Container(
            alignment: AlignmentDirectional.bottomEnd,
            margin: EdgeInsetsDirectional.only(
              start: 10.w,
              end: 10.w,
              top: 12.h,
            ),
            width: double.maxFinite,
            child: Text(
              TKey.passwordError.tr,
              style: TextStyle(
                color: widget.isShowError
                    ? const Color(0xFFFF4141)
                    : const Color(0xFF6A686D),
                fontSize: 12.sp,
                fontWeight: FontWeight.normal,
              ),
            ),
          ),
          Divider(height: 16.h, color: Colors.transparent),
        ],
      ),
    );
  }
}
