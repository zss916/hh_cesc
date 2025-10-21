import 'package:cescpro/core/translations/en.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class InputAccount extends StatefulWidget {
  final Function(String) onInput;

  const InputAccount({super.key, required this.onInput});

  @override
  _EditNameState createState() => _EditNameState();
}

class _EditNameState extends State<InputAccount> {
  TextEditingController textEditCtrl = TextEditingController();
  FocusNode focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    focusNode.unfocus();
  }

  @override
  void dispose() {
    focusNode.dispose();
    textEditCtrl.dispose();
    super.dispose();
  }

  void _hideKeyboard() {
    FocusScope.of(context).requestFocus(FocusNode());
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          height: 48,
          color: Colors.transparent,
          width: double.maxFinite,
          child: TextField(
            cursorColor: Colors.white,
            //keyboardType: TextInputType.emailAddress,
            controller: textEditCtrl,
            focusNode: focusNode,
            onTapOutside: (_) {
              FocusManager.instance.primaryFocus?.unfocus();
            },
            style: TextStyle(color: Colors.white, fontSize: 16.sp),
            decoration: InputDecoration(
              fillColor: Color(0x99484D55),
              filled: true,
              hintText: TKey.account.tr,
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
                borderRadius: BorderRadius.circular(50.r),
                borderSide: BorderSide(color: Colors.transparent),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(50.r),
                borderSide: BorderSide(color: Colors.transparent),
              ),
            ),
            onChanged: (value) {
              widget.onInput.call(value);
            },
            onEditingComplete: () {
              _hideKeyboard();
            },
            onSubmitted: (value) {
              _hideKeyboard();
            },
          ),
        ),

        Divider(height: 16.h, color: Colors.transparent),
      ],
    );
  }
}
