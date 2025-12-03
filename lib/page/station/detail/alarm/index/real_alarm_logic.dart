import 'package:cescpro/core/helper/extension_helper.dart';
import 'package:cescpro/core/translations/en.dart';
import 'package:cescpro/http/api/alarm.dart';
import 'package:cescpro/http/api/subscribe.dart';
import 'package:cescpro/http/bean/alarm_item_entity.dart';
import 'package:cescpro/http/bean/analysis_entity.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RealAlarmLogic extends GetxController {
  int? siteId;

  AnalysisEntity? analysis;
  AnalysisTotalAlarmData? get totalAlarmData => analysis?.totalAlarmData;
  AnalysisHighestAlarmData? get highestAlarmData => analysis?.highestAlarmData;

  AnalysisAttentionAlarmData? get attentionAlarmData =>
      analysis?.attentionAlarmData;

  List get list => [
    {
      "title": TKey.alarmLevel1.tr,
      "number": totalAlarmData?.firstCnt ?? 0,
      "color": Color(0xFFEE2727),
    },
    {
      "title": TKey.alarmLevel2.tr,
      "number": totalAlarmData?.secondCnt ?? 0,
      "color": Color(0xFFFFE725),
    },
    {
      "title": TKey.alarmLevel3.tr,
      "number": totalAlarmData?.thirdCnt ?? 0,
      "color": Color(0xFF376FFF),
    },
    {
      "title": TKey.other.tr,
      "number": totalAlarmData?.otherCnt ?? 0,
      "color": Color(0xFF26FFBD),
    },
  ];

  List list2 = [];

  List list3 = [];

  String contents = "";

  @override
  void onInit() {
    super.onInit();
    if (Get.arguments != null) {
      Map<String, dynamic> map = Get.arguments as Map<String, dynamic>;
      siteId = map['siteId'] as int?;
    }
  }

  @override
  void onReady() {
    super.onReady();
    loadData();
    getImportantList();
  }

  final List<Color> colors = [
    Color(0xFFEE2727),
    Color(0xFFFFE725),
    Color(0xFF376FFF),
    Color(0xFF26FFBD),
    Colors.red,
    Colors.green,
    Colors.blue,
    Colors.purple,
    Colors.orange,
    Colors.pink,
  ];

  Future<void> loadData() async {
    if (siteId != null) {
      AnalysisEntity? value = await AlarmAPI.getAnalysis(siteId: "$siteId");
      analysis = value;
      if ((analysis?.highestAlarmData?.items ?? []).isNotEmpty) {
        list2 = (analysis?.highestAlarmData?.items)!
            .mapIndexed(
              (i, e) => {
                "title": e.type ?? "",
                "number": e.cnt ?? 0,
                "color": i <= colors.length ? colors[i] : i.rColor,
              },
            )
            .toList();
      }

      if ((analysis?.attentionAlarmData?.items ?? []).isNotEmpty) {
        list3 = (analysis?.attentionAlarmData?.items)!
            .mapIndexed(
              (i, e) => {
                "title": e.type ?? "",
                "number": e.cnt ?? 0,
                "color": i.rColor,
              },
            )
            .toList();
      }
      update();
    }
  }

  Future<void> getImportantList() async {
    if (siteId != null) {
      final (bool isSucceeful, List<AlarmItemEntity> value) =
          await SubscribeAPI.getImportantList(siteId: siteId!);
      if (isSucceeful) {
        if (value.isNotEmpty) {
          List<String> contentList = value.map((e) => e.showContent()).toList();
          contents = contentList.join(",");
          update();
        }
      }
    }
  }

  @override
  void onClose() {
    super.onClose();
  }
}
