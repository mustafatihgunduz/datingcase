import 'package:datingcase/constants/styles.dart';
import 'package:datingcase/core/services/navigation_service.dart';
import 'package:flutter/material.dart';

class CustomBottomNavigate extends StatelessWidget {
  const CustomBottomNavigate({
    super.key,
    required NavigationService navigationService,
    required this.title,
    required this.route,
    required this.buttonTitle,
  }) : _navigationService = navigationService;

  final NavigationService _navigationService;
  final String title;
  final String route;
  final String buttonTitle;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: KStyles.kEightSize),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(title, style: KStyles.kInputHintTextStyle(context)),
          TextButton(
            onPressed: () => _navigationService.pushReplacement(route),
            child: Text(
              buttonTitle,
              style: KStyles.kTextButtonTextStyle(context),
            ),
          ),
        ],
      ),
    );
  }
}
