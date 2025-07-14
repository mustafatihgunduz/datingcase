import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorageService {
  final _storage = const FlutterSecureStorage();

  Future<void> saveToken(String token) async {
    await _storage.write(key: 'case_token', value: token);
  }

  Future<String?> getToken() async {
    return await _storage.read(key: 'case_token');
  }

  Future<void> deleteToken() async {
    await _storage.delete(key: 'case_token');
  }
}
