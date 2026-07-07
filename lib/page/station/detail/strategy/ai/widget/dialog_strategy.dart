import 'package:cescpro/core/translations/en.dart';
import 'package:cescpro/generated/assets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void showStrategyDialog() {
  Get.dialog(
    Stack(
      alignment: AlignmentDirectional.center,
      children: [
        Center(
          child: Container(
            constraints: const BoxConstraints(maxWidth: 320),
            margin: const EdgeInsets.symmetric(horizontal: 28),
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              color: Color(0xFF313540),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset(Assets.imgApplyIcon, width: 60, height: 60),
                const SizedBox(height: 8),
                Text(
                  TKey.applyTitle.tr,
                  textAlign: .center,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  TKey.applyContent.tr,
                  style: TextStyle(
                    fontSize: 13,
                    color: Color(0xa6ffffff),
                    height: 1.6,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 18),
                GestureDetector(
                  onTap: () {
                    Get.back();
                  },
                  child: Container(
                    alignment: AlignmentDirectional.center,
                    decoration: BoxDecoration(
                      color: Colors.blueAccent,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    width: double.maxFinite,
                    padding: EdgeInsetsDirectional.symmetric(
                      horizontal: 10,
                      vertical: 14,
                    ),
                    child: Text(
                      TKey.knowTitle.tr,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    ),
  );
}
