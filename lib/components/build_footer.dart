import 'package:cescpro/core/translations/en.dart';
import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:pull_to_refresh_simple/pull_to_refresh_simple.dart';

class BuildFooter extends StatelessWidget {
  const BuildFooter({super.key});

  @override
  Widget build(BuildContext context) {
    return ClassicFooter(
      idleText: TKey.idleLoadingText.tr,
      canLoadingText: TKey.canLoadingText.tr,
      loadingText: TKey.loadingText.tr,
      noDataText: TKey.noMoreText.tr,
      failedText: TKey.loadFailedText.tr,
    );
  }
}
