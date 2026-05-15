import 'package:cescpro/core/setting/app_loading.dart';
import 'package:cescpro/core/translations/en.dart';
import 'package:cescpro/page/login/dialog/regex_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

void updatePassWord({required Function(String newPassword) onConfirm}) {
  Get.dialog(
    Stack(
      alignment: AlignmentDirectional.center,
      children: [UpdatePasswordDialog(onConfirm: onConfirm)],
    ),
    barrierDismissible: false,
    routeSettings: RouteSettings(name: "updatePassWordDialog"),
  );
}

class UpdatePasswordDialog extends StatefulWidget {
  final Function(String newPassword) onConfirm;

  const UpdatePasswordDialog({super.key, required this.onConfirm});

  @override
  State<UpdatePasswordDialog> createState() => _UpdatePasswordDialogState();
}

class _UpdatePasswordDialogState extends State<UpdatePasswordDialog> {
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController rePasswordController = TextEditingController();
  bool obscure1 = true;
  bool obscure2 = true;

  @override
  void dispose() {
    super.dispose();
    rePasswordController.clear();
    rePasswordController.dispose();
    passwordController.clear();
    passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      padding: EdgeInsetsDirectional.all(15),
      margin: EdgeInsetsDirectional.only(
        start: 15.w,
        end: 15.w,
        top: 10.h,
        bottom: 10.h,
      ),
      decoration: BoxDecoration(
        color: Color(0xFF313540),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            TKey.changePassword.tr,
            style: TextStyle(fontSize: 18, color: Colors.white),
          ),
          Divider(height: 15.h, color: Colors.transparent),
          TextField(
            controller: passwordController,
            style: TextStyle(color: Colors.white),
            obscureText: obscure1,
            cursorColor: Color(0xFF0978E9),
            onTapOutside: (_) {
              FocusManager.instance.primaryFocus?.unfocus();
            },
            decoration: InputDecoration(
              hintText: TKey.inputNewPsd.tr,
              hintStyle: TextStyle(color: Colors.white, fontSize: 14),
              prefixIcon: const Icon(
                Icons.lock_outline,
                color: Colors.white,
                size: 20,
              ),
              suffixIcon: IconButton(
                icon: Icon(
                  obscure1 ? Icons.visibility_off : Icons.visibility,
                  color: Colors.white,
                  size: 20,
                ),
                onPressed: () {
                  setState(() {
                    obscure1 = !obscure1;
                  });
                },
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: const BorderSide(
                  color: Colors.white, // 默认颜色
                  width: 1,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: const BorderSide(
                  color: Color(0xFF0978E9),
                  width: 1,
                ),
              ),
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: const BorderSide(color: Colors.red, width: 1),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: const BorderSide(color: Colors.red, width: 1),
              ),
            ),
          ),
          Divider(height: 30.h, color: Colors.transparent),
          TextField(
            controller: rePasswordController,
            style: TextStyle(color: Colors.white),
            obscureText: obscure2,
            cursorColor: Color(0xFF0978E9),
            onTapOutside: (_) {
              FocusManager.instance.primaryFocus?.unfocus();
            },
            decoration: InputDecoration(
              hintText: TKey.reInputNewPsd.tr,
              hintStyle: TextStyle(color: Colors.white, fontSize: 14),
              prefixIcon: const Icon(
                Icons.lock_outline,
                color: Colors.white,
                size: 20,
              ),
              suffixIcon: IconButton(
                icon: Icon(
                  obscure2 ? Icons.visibility_off : Icons.visibility,
                  color: Colors.white,
                  size: 20,
                ),
                onPressed: () {
                  setState(() {
                    obscure2 = !obscure2;
                  });
                },
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: const BorderSide(
                  color: Colors.white, // 默认颜色
                  width: 1,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: const BorderSide(
                  color: Color(0xFF0978E9),
                  width: 1,
                ),
              ),
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: const BorderSide(color: Colors.red, width: 1),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: const BorderSide(color: Colors.red, width: 1),
              ),
            ),
          ),
          Divider(height: 30.h, color: Colors.transparent),
          Row(
            children: [
              Expanded(
                child: GestureDetector(
                  onTap: () => Get.back(),
                  child: Container(
                    alignment: AlignmentDirectional.center,
                    decoration: BoxDecoration(
                      color: Colors.white10,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    padding: EdgeInsetsDirectional.symmetric(
                      horizontal: 5,
                      vertical: 10,
                    ),
                    child: Text(
                      TKey.cancel.tr,
                      style: TextStyle(fontSize: 14, color: Colors.white),
                    ),
                  ),
                ),
              ),
              VerticalDivider(width: 10.w, color: Colors.transparent),
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    String newPsd = passwordController.text.trim();
                    String reNewPsd = rePasswordController.text.trim();
                    if (newPsd.isEmpty) {
                      AppLoading.toastBottom(TKey.inputNewPsdTip.tr);
                      return;
                    }
                    if (!RegexUtil.password.hasMatch(newPsd)) {
                      AppLoading.toastBottom(TKey.psdMatchTip.tr);
                      return;
                    }
                    if (reNewPsd.isEmpty) {
                      AppLoading.toastBottom(TKey.reInputNewPsdTip.tr);
                      return;
                    }
                    if (newPsd == reNewPsd) {
                      Get.back();
                      widget.onConfirm.call(newPsd);
                    } else {
                      AppLoading.toastBottom(TKey.inputPsdErrorTip.tr);
                    }
                  },
                  child: Container(
                    alignment: AlignmentDirectional.center,
                    decoration: BoxDecoration(
                      color: Color(0x4D43FFFF),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    padding: EdgeInsetsDirectional.symmetric(
                      horizontal: 5,
                      vertical: 10,
                    ),
                    child: Text(
                      TKey.confirm.tr,
                      style: TextStyle(fontSize: 14, color: Color(0xFF43FFFF)),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
