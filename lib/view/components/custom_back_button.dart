import 'package:datingcase/constants/styles.dart';
import 'package:datingcase/core/services/navigation_service.dart';
import 'package:datingcase/core/services/secure_storage_service.dart';
import 'package:flutter/material.dart';

class CustomBackArrow extends StatelessWidget {
  CustomBackArrow({
    super.key,
    required NavigationService navigationService,
    this.isProfileScreen = false,
  }) : _navigationService = navigationService;

  final NavigationService _navigationService;
  bool isProfileScreen;
  @override
  Widget build(BuildContext context) {
    final SecureStorageService secureStorageService = SecureStorageService();
    return GestureDetector(
      onTap: () async {
        if (isProfileScreen) {
          await secureStorageService.deleteToken();
          _navigationService.pushReplacement('/login');
        } else {
          _navigationService.goBack();
        }
      },
      child: Container(
        margin: EdgeInsets.only(left: KStyles.kTwentyFourSize),
        decoration: KStyles.kBackButtonContainerDecoration(),
        child: Image.asset('assets/icons/back.png'),
      ),
    );
  }
}
