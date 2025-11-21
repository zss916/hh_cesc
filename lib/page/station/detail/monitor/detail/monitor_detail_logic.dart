import 'package:cescpro/core/helper/extension_helper.dart';
import 'package:cescpro/http/api/alarm.dart';
import 'package:cescpro/http/api/realTimeData.dart';
import 'package:cescpro/http/api/site.dart';
import 'package:cescpro/http/bean/alarm_item_entity.dart';
import 'package:cescpro/http/bean/com_card_vo_entity.dart';
import 'package:cescpro/http/bean/com_type_list_entity.dart';
import 'package:cescpro/http/bean/comp_tree_entity.dart';
import 'package:get/get.dart';

class MonitorDetailLogic extends GetxController {
  String title = "";

  ComTypeListEntity? comTypeList;

  List<ComCardVoEntity> comCardVoList = [];

  String compTree = "--";

  String? devType;

  @override
  void onInit() {
    super.onInit();
    if (Get.arguments != null) {
      devType = Get.arguments["devType"] as String?;
      title = (Get.arguments["devType"] as String).getTitle();
    }
  }

  @override
  void onReady() {
    super.onReady();
    //getCompTree();
    loadComType();
    // loadComponentListByDev();
  }

  Future<void> loadComType() async {
    //{"siteId":530,"compType":"ARR","did":577,"devNo":2,"nodeNo":2}
    //{"siteId":530,"compType":"PCS","did":577,"devNo":1,"nodeNo":2}
    ComTypeListEntity? value = await RealTimeDataAPI.postComponentTypeList(
      siteId: "530",
      compType: devType ?? "",
      did: 577,
      devNo: 1,
      nodeNo: 2,
    );
    if (value != null) {
      comTypeList = value;
      update();
    }
  }

  Future<void> loadComponentListByDev() async {
    List<ComCardVoEntity> value = await RealTimeDataAPI.postComponentListByDev(
      siteId: "530",
      compType: devType ?? '',
      did: 577,
      devNo: 1,
      nodeNo: 2,
    );
    comCardVoList.assignAll(value);
    update();
  }

  Future<void> getCompTree() async {
    final (bool isSuccessful, List<CompTreeEntity> value) =
        await SiteAPI.getCompTree(siteId: "530", type: devType);
    if (isSuccessful) {
      List<Map<String, dynamic>> list = value.map((e) => e.toJson()).toList();
      String title = handExtractPath(list);
      compTree = title;
      update();
    }
  }

  String handExtractPath(List<dynamic> data) {
    List<String> pathSegments = [];

    void traverse(Map<String, dynamic> node) {
      if (node['labelCn'] != null) {
        pathSegments.add(node['labelCn']);
      }

      if (node['child'] != null && node['child'] is List) {
        List<dynamic> children = node['child'];
        if (children.isNotEmpty) {
          traverse(children.first);
        }
      }
    }

    if (data.isNotEmpty) {
      traverse(data.first);
    }

    return pathSegments.join('/');
  }

  ///todo
  Future<void> loadRealData() async {
    final (bool isSuccessful, List<AlarmItemEntity> value) =
        await AlarmAPI.postRealTimePage(siteId: "530", compType: "ARR");
  }
}
