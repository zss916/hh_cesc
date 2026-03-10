import 'package:cescpro/core/translations/en.dart';
import 'package:cescpro/generated/assets.dart';
import 'package:cescpro/page/station/index/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class SearchBarWidget extends StatefulWidget {
  final Function() onInput;

  final StationLogic logic;
  const SearchBarWidget({
    super.key,
    required this.logic,
    required this.onInput,
  });

  @override
  _SearchBarWidgetState createState() => _SearchBarWidgetState();
}

class _SearchBarWidgetState extends State<SearchBarWidget> {
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
    return Container(
      height: 40,
      color: Colors.transparent,
      width: double.maxFinite,
      child: Row(
        children: [
          Expanded(
            child: TextField(
              cursorColor: Colors.white,
              controller: textEditCtrl,
              focusNode: focusNode,
              onTapOutside: (_) {
                FocusManager.instance.primaryFocus?.unfocus();
              },
              style: TextStyle(color: Colors.white, fontSize: 12.sp),
              decoration: InputDecoration(
                contentPadding: EdgeInsets.only(top: 0.5, left: 0, right: 10),
                prefixIcon: Container(
                  margin: EdgeInsetsDirectional.only(start: 16),
                  child: Stack(
                    alignment: AlignmentDirectional.center,
                    children: [
                      Image.asset(Assets.imgSearchIcon, width: 26, height: 26),
                    ],
                  ),
                ),
                prefixIconConstraints: BoxConstraints(
                  maxWidth: 24 + 16,
                  maxHeight: 24,
                ),
                fillColor: Color(0xFF2B3139),
                filled: true,
                hintText: TKey.searchHint.tr,
                hintMaxLines: 1,
                alignLabelWithHint: true,
                hintStyle: TextStyle(
                  color: const Color(0xFFA4A4A4),
                  fontSize: 12,
                ),
                suffixIcon: Stack(
                  alignment: AlignmentDirectional.centerEnd,
                  children: [
                    InkWell(
                      child: Container(
                        margin: EdgeInsetsDirectional.only(end: 16),
                        padding: EdgeInsetsDirectional.symmetric(
                          horizontal: 10.w,
                          vertical: 5.h,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5.r),
                          color: Colors.blue,
                        ),
                        child: Text(
                          TKey.search.tr,
                          style: TextStyle(color: Colors.white, fontSize: 12),
                        ),
                      ),
                      onTap: () {
                        _hideKeyboard();
                        widget.onInput.call();
                      },
                    ),
                  ],
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
                widget.logic.nameParam = value;
              },
              onEditingComplete: () {
                _hideKeyboard();
              },
              onSubmitted: (value) {
                _hideKeyboard();
                widget.onInput.call();
              },
            ),
          ),
          SizedBox.shrink(),
        ],
      ),
    );
  }
}
