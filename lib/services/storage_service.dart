import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class StorageService {
  final FlutterSecureStorage _secureStorage;
  StorageService(this._secureStorage);

  static const tokenKey = "authToken";
  Future<void> saveToken(String token) async {
    await _secureStorage.write(key: tokenKey, value: token);
  }

  Future<String?> getToken() async {
    return await _secureStorage.read(key: tokenKey);
  }

  Future<void> deleteToken() async {
    await _secureStorage.delete(key: tokenKey);
  }
}
