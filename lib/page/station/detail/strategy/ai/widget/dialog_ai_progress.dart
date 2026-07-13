import 'package:cescpro/core/router/index.dart';
import 'package:cescpro/core/translations/en.dart';
import 'package:cescpro/page/station/detail/strategy/ai/widget/circular_progress_gauge.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void showAIProgressDialog({required int day}) {
  Get.dialog(
    PopScope(
      canPop: false,
      child: Stack(
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
                  CircularProgressGauge(value: day, max: 7, size: 170),
                  const SizedBox(height: 8),
                  Text(
                    TKey.strategyProgressTitle.tr,
                    textAlign: .center,
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: Color(0xDEFFFFFF),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    TKey.strategyProgressContent.tr,
                    style: TextStyle(fontSize: 10, color: Color(0xa6ffffff)),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 20),
                  Text(
                    TKey.strategyProgressTip.trArgs(["$day", "${7 - day}"]),
                    style: TextStyle(fontSize: 10, color: Color(0xFF0C80EA)),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 20),
                  GestureDetector(
                    onTap: () {
                      Get.back(closeOverlays: true);
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
                        TKey.backStrategy.tr,
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
    ),
    routeSettings: RouteSettings(name: APages.aIProgressDialog),
    barrierDismissible: false,
  );
}
