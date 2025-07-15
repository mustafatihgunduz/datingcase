import 'package:datingcase/view/splash/logo_screen.dart';
import 'package:datingcase/view/splash/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:datingcase/core/services/secure_storage_service.dart';
import 'package:datingcase/core/services/navigation_service.dart';

class AuthCheck extends StatefulWidget {
  const AuthCheck({super.key});

  @override
  State<AuthCheck> createState() => _AuthCheckState();
}

class _AuthCheckState extends State<AuthCheck> {
  final SecureStorageService _secureStorage = SecureStorageService();
  final NavigationService _navigationService = NavigationService();

  @override
  void initState() {
    super.initState();
    _startSequence();
  }

  int _step = 0;

  Future<void> _startSequence() async {
    await Future.delayed(const Duration(seconds: 2));
    setState(() {
      _step = 1;
    });

    await Future.delayed(const Duration(seconds: 2));
    await _checkAuth();
  }

  Future<void> _checkAuth() async {
    final token = await _secureStorage.getToken();

    if (token != null && token.isNotEmpty) {
      _navigationService.pushReplacement('/nav');
    } else {
      _navigationService.pushReplacement('/login');
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_step == 0) {
      return const SplashScreen();
    } else if (_step == 1) {
      return const LogoScreen();
    } else {
      return const SizedBox.shrink();
    }
  }
}
