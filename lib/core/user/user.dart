import 'package:cescpro/core/storage/storage.dart';

class User {
  static final String token = "token";

  static String getToken() {
    return StorageService.to.getString(token);
  }

  static setToken() {
    StorageService.to.setString(token, "token");
  }
}
