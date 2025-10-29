import 'package:cescpro/core/user/user.dart';

class AuthorizationHeader {
  static String getAuthorization() {
    //return "Bearer eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJjZXNjIiwiY3JlYXRlZCI6MTc1ODAxNDczODIxMCwiZXhwIjoxNzU4MTAxMTM4fQ.JynPlyG_KECHTTrhshT5L3vwFlWot9znA27FB8CWdU_CbB10VA_cj38Q3bIC_G2x3XwlgL0NvugUbwX2T_ZK5Q";
    return "${User.getTokenHead()}${User.getToken()}";
  }
}
