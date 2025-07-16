import 'package:datingcase/constants/styles.dart';
import 'package:datingcase/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class LimitedOfferTitle extends StatelessWidget {
  const LimitedOfferTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Text(
        LocaleKeys.limited_offer.tr(),
        style: KStyles.kLimitedBoxHeaderTextStyle(context),
      ),
    );
  }
}
