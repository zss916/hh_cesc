import 'package:cescpro/http/bean/statistic_record_entity.dart';
import 'package:get/get.dart';

class OliveSiteDetailLogic extends GetxController {
  int index = -1;
  StatisticRecordEntity? statisticRecord;
  //Pos的是充，Neg的放

  @override
  void onInit() {
    super.onInit();
    if (Get.arguments != null) {
      Map<String, dynamic> map = Get.arguments as Map<String, dynamic>;
      if (map['index'] != null) {
        index = map['index'] as int;
      }
      statisticRecord = map['statisticRecord'] as StatisticRecordEntity?;
      update();
    }
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
