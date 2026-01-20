import 'dart:async';

import 'package:cescpro/core/helper/extension_helper.dart';
import 'package:cescpro/core/router/index.dart';
import 'package:cescpro/core/storage/app_event_bus.dart';
import 'package:cescpro/core/translations/en.dart';
import 'package:cescpro/core/user/user.dart';
import 'package:cescpro/generated/assets.dart';
import 'package:cescpro/page/login/widget/policy_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CheckWidget extends StatefulWidget {
  const CheckWidget({super.key});

  @override
  State<CheckWidget> createState() => _CheckWidgetState();
}

class _CheckWidgetState extends State<CheckWidget> {
  bool isCheck = false;
  late StreamSubscription<CheckPolicy> event;

  @override
  void initState() {
    super.initState();
    bool isAgree = User.to.getPrivacyAgreed();
    if (mounted) {
      setState(() {
        isCheck = isAgree;
      });
    }
    event = AppEventBus.eventBus.on<CheckPolicy>().listen((event) {
      if (mounted) {
        setState(() {
          isCheck = event.isCheck;
        });
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    event.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(
          value: isCheck,
          side: BorderSide(color: Colors.white),
          activeColor: Color(0xFF43FFFF),
          onChanged: (bool? value) {
            if (mounted) {
              setState(() {
                isCheck = !isCheck;
                User.to.setPrivacyAgreed(isAgree: isCheck);
              });
            }
          },
        ),
        Expanded(
          child: PolicyWidget(
            onPrivacyTap: () {
              PageTools.toWeb(
                title: TKey.privacyPolicy.tr,
                url: Get.isEn
                    ? Assets.htmlUserPolicyEn
                    : Assets.htmlUserPolicyZh,
              );
            },
            onServiceTap: () {
              PageTools.toWeb(
                title: TKey.userAgreement.tr,
                url: Get.isEn
                    ? Assets.htmlUserPolicyEn
                    : Assets.htmlUserPolicyZh,
              );
            },
          ),
        ),
      ],
    );
  }
}
