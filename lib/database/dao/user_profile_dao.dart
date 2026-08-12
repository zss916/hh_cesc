/*
import 'package:cescpro/database/entity/user_profile.dart';
import 'package:cescpro/objectbox.g.dart';

class UserProfileDao {
  late final Store store;
  late final Box<Person> personBox;

  UserProfileDao._create(this.store) {
    personBox = Box<Person>(store);
  }

  static UserProfileDao create(Store store) {
    return UserProfileDao._create(store);
  }

  Future<Person?> fetchUserProfile() async {
    var queryBuilder = personBox.query()
      ..order(Person_.id, flags: Order.descending).watch();
    var query = queryBuilder.build();
    Future<Person?> bean = query.findFirstAsync().whenComplete(() {
      query.close();
    });
    return bean;
  }

  Future<Person?> putAndGetAsync(Person entity) async {
    return await personBox.putAndGetAsync(entity);
  }

  Future<void> clear() async {
    personBox.removeAllAsync();
  }
}
*/
