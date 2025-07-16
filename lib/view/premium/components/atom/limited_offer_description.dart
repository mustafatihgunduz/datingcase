import 'package:datingcase/constants/styles.dart';
import 'package:datingcase/generated/locale_keys.g.dart';
import 'package:datingcase/utils/size_config.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class LimitedOfferDescription extends StatelessWidget {
  const LimitedOfferDescription({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Container(
        constraints: BoxConstraints(maxWidth: SizeConfig.screenWidth! / 1.5),
        child: Text(
          LocaleKeys.limited_offer_description.tr(),
          textAlign: TextAlign.center,
          style: KStyles.kLimitedBoxDescriptionTextStyle(context),
        ),
      ),
    );
  }
}
