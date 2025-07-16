import 'package:datingcase/constants/styles.dart';
import 'package:datingcase/core/services/navigation_service.dart';
import 'package:datingcase/generated/locale_keys.g.dart';
import 'package:datingcase/utils/alerts/feature_add_later.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class ForgotPassword extends StatelessWidget {
  const ForgotPassword({
    super.key,
    required NavigationService navigationService,
  }) : _navigationService = navigationService;

  final NavigationService _navigationService;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: TextButton(
        onPressed: () {
          featureAddLater(context, _navigationService);
        },
        child: Text(
          LocaleKeys.forgot_my_password.tr(),
          style: KStyles.kTextButtonTextStyle(context),
        ),
      ),
    );
  }
}
