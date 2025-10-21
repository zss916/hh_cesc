import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SearchBarWidget extends StatefulWidget {
  final Function(String) onInput;

  const SearchBarWidget({super.key, required this.onInput});

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
      height: 37,
      color: Colors.transparent,
      width: double.maxFinite,
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
          prefixIcon: Icon(Icons.search, color: Color(0xFFC8C9CC), size: 20),
          fillColor: Color(0x99484D55),
          filled: true,
          hintText: "",
          hintStyle: TextStyle(color: const Color(0xFFA4A4A4), fontSize: 12.sp),
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
    );
  }
}
