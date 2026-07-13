import 'package:cescpro/page/station/detail/strategy/ai/widget/circular_progress_gauge.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void showAIProgressDialog() {
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
                CircularProgressGauge(value: 3, max: 7, size: 170),
                const SizedBox(height: 8),
                Text(
                  "数据积累中，AI暂未就绪",
                  textAlign: .center,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: Color(0xDEFFFFFF),
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  "AI策略需要 至少7天 的运行数据用于学习您的电站特征 \n积累完成后将自动开启AI策略预览",
                  style: TextStyle(fontSize: 10, color: Color(0xa6ffffff)),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 20),
                Text(
                  "已积累3天，还需4天",
                  style: TextStyle(fontSize: 10, color: Color(0xFF0C80EA)),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 20),
                GestureDetector(
                  onTap: () {
                    Get.back();
                  },
                  child: Container(
                    alignment: AlignmentDirectional.center,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [Color(0xFF43FFFF), Color(0xFF0978E9)],
                      ),
                      borderRadius: BorderRadius.circular(50),
                    ),
                    width: double.maxFinite,
                    padding: EdgeInsetsDirectional.symmetric(
                      horizontal: 10,
                      vertical: 14,
                    ),
                    child: Text(
                      "返回策略页",
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
    barrierDismissible: false,
  );
}
