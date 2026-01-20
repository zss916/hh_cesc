import 'dart:io';

import 'package:cescpro/core/helper/extension_helper.dart';
import 'package:cescpro/core/router/index.dart';
import 'package:cescpro/core/storage/app_event_bus.dart';
import 'package:cescpro/core/translations/en.dart';
import 'package:cescpro/core/user/user.dart';
import 'package:cescpro/generated/assets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PrivacyDialog {
  static void showPrivacyPolicyDialog({Function? onNext}) {
    Get.dialog(
      barrierDismissible: false,
      PopScope(
        canPop: false,
        child: AlertDialog(
          backgroundColor: const Color(0xFF23282E),
          title: Text(
            TKey.privacyPolicyTitle.tr,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
            textAlign: TextAlign.center,
          ),
          content: SizedBox(
            width: Get.width * 0.8,
            child: Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: TKey.privacyPolicyReadUnderstand.tr,
                    style: TextStyle(fontSize: 14, color: Colors.white),
                  ),
                  WidgetSpan(
                    child: GestureDetector(
                      onTap: () {
                        PageTools.toWeb(
                          title: TKey.userAgreement.tr,
                          url: Get.isEn
                              ? Assets.htmlUserPolicyEn
                              : Assets.htmlUserPolicyZh,
                        );
                      },
                      child: Text(
                        '《${TKey.userAgreement.tr}》',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.redAccent,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                  ),
                  TextSpan(
                    text: TKey.privacyPolicyAnd.tr,
                    style: TextStyle(fontSize: 14, color: Colors.white),
                  ),
                  WidgetSpan(
                    child: GestureDetector(
                      onTap: () {
                        PageTools.toWeb(
                          title: TKey.privacyPolicy.tr,
                          url: Get.isEn
                              ? Assets.htmlUserPolicyEn
                              : Assets.htmlUserPolicyZh,
                        );
                      },
                      child: Text(
                        '《${TKey.privacyPolicy.tr}》',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.redAccent,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                  ),
                  TextSpan(
                    text: TKey.privacyPolicyAfterUse.tr,
                    style: TextStyle(fontSize: 14, color: Colors.white),
                  ),
                  TextSpan(
                    text: TKey.privacyPolicyCollectInfo.tr,
                    style: TextStyle(fontSize: 14, color: Colors.white),
                  ),
                  WidgetSpan(
                    child: GestureDetector(
                      onTap: () {
                        PageTools.toWeb(
                          title: TKey.userAgreement.tr,
                          url: Get.isEn
                              ? Assets.htmlUserPolicyEn
                              : Assets.htmlUserPolicyZh,
                        );
                      },
                      child: Text(
                        '《${TKey.userAgreement.tr}》',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.redAccent,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                  ),
                  TextSpan(
                    text: TKey.privacyPolicyAnd.tr,
                    style: TextStyle(fontSize: 14, color: Colors.white),
                  ),
                  WidgetSpan(
                    child: GestureDetector(
                      onTap: () {
                        PageTools.toWeb(
                          title: TKey.privacyPolicy.tr,
                          url: Get.isEn
                              ? Assets.htmlUserPolicyEn
                              : Assets.htmlUserPolicyZh,
                        );
                      },
                      child: Text(
                        '《${TKey.privacyPolicy.tr}》',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.redAccent,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                  ),
                  TextSpan(
                    text: TKey.privacyPolicyViewDetails.tr,
                    style: TextStyle(fontSize: 14, color: Colors.white),
                  ),
                  TextSpan(
                    text: TKey.privacyPolicyContinueUse.tr,
                    style: TextStyle(fontSize: 14, color: Colors.white),
                  ),
                  TextSpan(
                    text: TKey.privacyPolicyOrSelect.tr,
                    style: TextStyle(fontSize: 14, color: Colors.white),
                  ),
                  TextSpan(
                    text: TKey.privacyPolicyExit.tr,
                    style: TextStyle(fontSize: 14, color: Colors.white),
                  ),
                ],
              ),
              textAlign: TextAlign.justify,
            ),
          ),
          actions: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  child: TextButton(
                    onPressed: () {
                      AppEventBus.eventBus.fire(CheckPolicy(false));
                      Get.back(closeOverlays: true);
                      exit(0);
                    },
                    style: ButtonStyle(
                      backgroundColor: WidgetStateProperty.all(
                        const Color(0xFFE0E0E0),
                      ),
                      padding: WidgetStateProperty.all(
                        const EdgeInsets.symmetric(vertical: 12),
                      ),
                      shape: WidgetStateProperty.all(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    ),
                    child: Text(
                      TKey.privacyPolicyDisagree.tr,
                      style: TextStyle(color: Colors.black87, fontSize: 16),
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: TextButton(
                    onPressed: () async {
                      // 同意，保存状态
                      User.to.setPrivacyAgreed(isAgree: true);
                      Get.back();
                      onNext?.call();
                    },
                    style: ButtonStyle(
                      backgroundColor: WidgetStateProperty.all(Colors.red),
                      padding: WidgetStateProperty.all(
                        const EdgeInsets.symmetric(vertical: 12),
                      ),
                      shape: WidgetStateProperty.all(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    ),
                    child: Text(
                      TKey.privacyPolicyAgree.tr,
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
