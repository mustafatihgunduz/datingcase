import 'package:datingcase/constants/styles.dart';
import 'package:datingcase/generated/locale_keys.g.dart';
import 'package:datingcase/utils/size_config.dart';
import 'package:datingcase/view/auth/components/atoms/custom_auth_button.dart';
import 'package:datingcase/view/premium/components/atom/limited_offer_description.dart';
import 'package:datingcase/view/premium/components/atom/limited_offer_title.dart';
import 'package:datingcase/view/premium/components/atom/pick_token_title.dart';
import 'package:datingcase/view/premium/components/atom/receiving_bonuses_title.dart';
import 'package:datingcase/view/premium/components/bonuses_item_row.dart';
import 'package:datingcase/view/premium/components/offer_box_row.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class LimitedBoxScreen extends StatelessWidget {
  const LimitedBoxScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: RadialGradient(
          center: Alignment.topCenter,
          radius: 0.6,
          colors: [KStyles.kLimitedBoxShadowColor, KStyles.kPageColor],
        ),
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      constraints: BoxConstraints(
        minWidth: double.infinity,
        minHeight: SizeConfig.screenHeight! * 0.7,
      ),
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: KStyles.kEighteenSize,
            vertical: KStyles.kTwentyFourSize,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              LimitedOfferTitle(),
              SizedBox(height: KStyles.kFourSize),
              LimitedOfferDescription(),
              SizedBox(height: KStyles.kThirteenSize),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(24),
                  gradient: RadialGradient(
                    center: Alignment.topCenter,
                    radius: 0.6,
                    colors: [
                      KStyles.kLimitedBoxShadowColor,
                      KStyles.kWhiteColor.withValues(alpha: 0.6),
                    ],
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.only(
                    left: KStyles.kTwentyTwoSize,
                    right: KStyles.kTwentyTwoSize,
                    bottom: KStyles.kFifteenSize,
                    top: KStyles.kTwentyTwoSize,
                  ),
                  child: Column(
                    children: [
                      ReceivingBonusesTitle(),
                      SizedBox(height: KStyles.kFifteenSize),
                      BonusesItemRow(),
                    ],
                  ),
                ),
              ),
              SizedBox(height: KStyles.kTwentyTwoSize),
              PickTokenTitle(),
              SizedBox(height: KStyles.kFifteenSize),
              OfferBoxRow(),
              SizedBox(height: KStyles.kEighteenSize),
              CustomAuthButton(
                title: LocaleKeys.see_all_tokens.tr(),
                onTap: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
