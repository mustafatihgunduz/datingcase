import 'package:datingcase/constants/styles.dart';
import 'package:datingcase/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class LoginDescription extends StatelessWidget {
  const LoginDescription({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      LocaleKeys.login_description.tr(),
      style: KStyles.kSubtitleTextStyle(context),
      textAlign: TextAlign.center,
    );
  }
}
