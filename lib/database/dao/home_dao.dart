/*
import 'package:cescpro/database/entity/home.dart';
import 'package:cescpro/objectbox.g.dart';

class HomeDao {
  late final Store store;
  late final Box<Home> homeBox;

  HomeDao._create(this.store) {
    homeBox = Box<Home>(store);
  }

  static HomeDao create(Store store) {
    return HomeDao._create(store);
  }

  Future<Home?> fetchData() async {
    var queryBuilder = homeBox.query()
      ..order(Home_.id, flags: Order.descending).watch();
    var query = queryBuilder.build();
    Future<Home?> bean = query.findFirstAsync().whenComplete(() {
      query.close();
    });
    return bean;
  }

  Future<Home?> putAndGetAsync(Home entity) async {
    return await homeBox.putAndGetAsync(entity);
  }

  Future<void> clear() async {
    homeBox.removeAllAsync();
  }
}
*/
