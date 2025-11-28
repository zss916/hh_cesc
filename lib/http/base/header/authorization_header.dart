import 'package:cescpro/core/user/user.dart';

class AuthorizationHeader {
  static String getAuthorization() {
    return "${User.getTokenHead()}${User.getToken()}";
  }
}
