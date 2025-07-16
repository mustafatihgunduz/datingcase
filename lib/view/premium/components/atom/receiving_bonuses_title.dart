import 'package:datingcase/constants/styles.dart';
import 'package:datingcase/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class ReceivingBonusesTitle extends StatelessWidget {
  const ReceivingBonusesTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      LocaleKeys.receiving_bonuses.tr(),
      style: KStyles.kLimitedBoxTitleTextStyle(context),
    );
  }
}
