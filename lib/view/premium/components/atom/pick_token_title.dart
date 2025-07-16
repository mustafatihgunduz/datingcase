import 'package:datingcase/constants/styles.dart';
import 'package:datingcase/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class PickTokenTitle extends StatelessWidget {
  const PickTokenTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Text(
        LocaleKeys.pick_token_for_unlock_features.tr(),
        style: KStyles.kLimitedBoxTitleTextStyle(context),
      ),
    );
  }
}
