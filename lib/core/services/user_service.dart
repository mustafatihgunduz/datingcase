import 'dart:convert';

import 'package:datingcase/core/model/user.dart';
import 'package:datingcase/core/services/logger_service.dart';
import 'package:datingcase/core/services/secure_storage_service.dart';
import 'package:http/http.dart' as http;

class UserService {
  final SecureStorageService _secureStorage = SecureStorageService();
  String baseUrl = "https://caseapi.servicelabs.tech";
  Future<User> getUserProfile() async {
    final Uri url = Uri.parse('$baseUrl/user/profile');
    final token = await _secureStorage.getToken();
    try {
      final response = await http.get(
        url,
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
      );
      CaseLogger.info(
        'Response status for getting profile user: ${response.statusCode}',
      );
      CaseLogger.debug(
        'Response body for getting profile user: ${response.body}',
      );
      if (response.statusCode == 200) {
        final Map<String, dynamic> userMap = jsonDecode(response.body);
        final data = userMap['data'];
        return User(
          id: data['id'] ?? '',
          name: data['name'] ?? '',
          email: data['email'] ?? '',
          photoUrl: data['photoUrl'] ?? '',
        );
      } else if (response.statusCode == 401) {
        CaseLogger.error(
          'Unauthorized: Token invalid or missing : ${response.body}',
        );
        throw Exception('Unauthorized: Token invalid or missing');
      } else {
        throw Exception('Failed to load user profile: ${response.statusCode}');
      }
    } catch (e, stack) {
      CaseLogger.error('Exception during getting user profile', e, stack);
      throw Exception('Network error: $e');
    }
  }
}
