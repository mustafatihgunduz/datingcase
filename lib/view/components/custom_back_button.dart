import 'package:datingcase/constants/styles.dart';
import 'package:datingcase/core/services/navigation_service.dart';
import 'package:flutter/material.dart';

class CustomBackArrow extends StatelessWidget {
  const CustomBackArrow({
    super.key,
    required NavigationService navigationService,
  }) : _navigationService = navigationService;

  final NavigationService _navigationService;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _navigationService.goBack(),
      child: Container(
        margin: EdgeInsets.only(left: KStyles.kTwentyFourSize),
        decoration: KStyles.kBackButtonContainerDecoration(),
        child: Image.asset('assets/icons/back.png'),
      ),
    );
  }
}
