import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';

class SecureStorage extends GetxService {
  static SecureStorage get to => Get.find();
  late final FlutterSecureStorage _storage;

  Future<SecureStorage> init() async {
    _storage = FlutterSecureStorage();
    return this;
  }

  Future<void> save(String key, String value) async {
    await _storage.write(key: key, value: value);
  }

  Future<String?> get(String key) {
    return _storage.read(key: key);
  }

  Future<void> remove(String key) async {
    return _storage.delete(key: key);
  }

  Future<void> clear() async {
    return _storage.deleteAll();
  }
}
