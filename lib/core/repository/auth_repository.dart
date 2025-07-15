import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:datingcase/core/model/user.dart';
import 'package:datingcase/core/services/auth_service.dart';

class AuthRepository {
  final AuthService authService;

  AuthRepository({required this.authService});

  Future<User> login(String email, String password) async {
    if (kDebugMode) {
      return await authService.login(email, password);
    } else {
      await Future.delayed(Duration(seconds: 1));
      return User(
        id: '1',
        name: 'mustafatihgunduz',
        email: 'mustafatihgunduz@gmail.com',
        photoUrl: 'hhttps://picsum.photos/200',
        token: '12354353442-235346435735',
      );
    }
  }

  Future<User> register(String email, String password, String name) async {
    if (kDebugMode) {
      return await authService.register(email, password, name);
    } else {
      await Future.delayed(Duration(seconds: 1));
      return User(
        id: '1',
        name: 'mustafatihgunduz',
        email: 'mustafatihgunduz@gmail.com',
        photoUrl: 'https://picsum.photos/200',
        token: '12354353442-235346435735',
      );
    }
  }

  Future<String> updatePhoto(File file) async {
    if (kDebugMode) {
      return await authService.updatePhoto(file);
    } else {
      await Future.delayed(Duration(seconds: 1));
      return 'https://picsum.photos/200';
    }
  }

  Future<void> logout() async {
    if (kDebugMode) {
      return await authService.logout();
    } else {
      await Future.delayed(Duration(milliseconds: 500));
    }
  }
}
