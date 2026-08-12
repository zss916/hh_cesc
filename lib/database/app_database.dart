/*
import 'package:cescpro/database/dao/home_dao.dart';
import 'package:cescpro/database/dao/user_profile_dao.dart';
import 'package:cescpro/objectbox.g.dart';
import 'package:get/get.dart';

class AppDBService extends GetxService {
  static AppDBService get to => Get.find();

  late final UserProfileDao userProfileDao;
  late final HomeDao homeDao;

  Future<AppDBService> init() async {
    final Store store = await openStore();
    userProfileDao = UserProfileDao.create(store);
    homeDao = HomeDao.create(store);
    return this;
  }
}
*/
