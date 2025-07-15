import 'dart:convert';
import 'dart:io';

import 'package:datingcase/core/model/user.dart';
import 'package:datingcase/core/services/logger_service.dart';
import 'package:datingcase/core/services/secure_storage_service.dart';
import 'package:http/http.dart' as http;

String baseUrl = "https://caseapi.servicelabs.tech";
final _secureStorage = SecureStorageService();

class AuthService {
  Future<User> login(String email, String password) async {
    try {
      final Uri url = Uri.parse('$baseUrl/user/login');
      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({'email': email, 'password': password}),
      );
      CaseLogger.info('Response status for login user: ${response.statusCode}');
      CaseLogger.debug('Response body for login user: ${response.body}');
      if (response.statusCode == 200) {
        final user = jsonDecode(response.body);
        final data = user['data'];
        return User.fromJson(data);
      } else {
        throw Exception(
          'Login Failed because : ${response.statusCode} returned',
        );
      }
    } catch (e, stack) {
      CaseLogger.error('Exception during login', e, stack);
      throw Exception('Login Failed');
    }
  }

  Future<User> register(String email, String password, String name) async {
    try {
      final Uri url = Uri.parse('$baseUrl/user/register');
      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({'email': email, 'password': password, 'name': name}),
      );
      CaseLogger.info(
        'Response status for registering user: ${response.statusCode}',
      );
      CaseLogger.debug('Response body for registering user: ${response.body}');
      if (response.statusCode == 200) {
        final user = jsonDecode(response.body);
        final data = user['data'];
        return User.fromJson(data);
      } else {
        throw Exception(
          'Register Failed because : ${response.statusCode} returned',
        );
      }
    } catch (e, stack) {
      CaseLogger.error('Exception during Register', e, stack);
      throw Exception('Register Failed');
    }
  }

  Future<String> updatePhoto(File imageFile) async {
    final token = await _secureStorage.getToken();
    if (token == null) {
      CaseLogger.error('No token found. User not logged in.');
      throw Exception('No token found. User not logged in.');
    }

    final uri = Uri.parse('$baseUrl/user/upload_photo');
    final request = http.MultipartRequest('POST', uri)
      ..headers['Authorization'] = 'Bearer $token'
      ..files.add(await http.MultipartFile.fromPath('file', imageFile.path));

    final streamedResponse = await request.send();
    final response = await http.Response.fromStream(streamedResponse);

    CaseLogger.info('Photo upload status: ${response.statusCode}');
    CaseLogger.debug('Photo upload response: ${response.body}');

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return data['photoUrl'] as String;
    } else {
      throw Exception('Failed to upload photo: ${response.statusCode}');
    }
  }

  Future<void> logout() async {
    try {
      await _secureStorage.deleteToken();
      CaseLogger.info('User logged out successfully. Token removed.');
    } catch (e, stack) {
      CaseLogger.error('Exception during logout', e, stack);
      throw Exception('Logout Failed');
    }
  }
}
