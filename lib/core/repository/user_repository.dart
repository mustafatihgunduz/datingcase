import 'package:flutter/foundation.dart';
import 'package:datingcase/core/model/user.dart';
import 'package:datingcase/core/services/user_service.dart';

class UserRepository {
  final UserService userService;

  UserRepository({required this.userService});

  Future<User> getUserProfile() async {
    if (kDebugMode) {
      return await userService.getUserProfile();
    } else {
      await Future.delayed(Duration(seconds: 1));
      //! Uygulama Debugda çalışacağı için tersini yazıyorum.
      return User(
        id: '1',
        name: 'mustafatihgunduz',
        email: 'mustafatihgunduz@gmail.com',
        photoUrl: 'https://picsum.photos/200',
        token: '12354353442-235346435735',
      );
    }
  }
}
