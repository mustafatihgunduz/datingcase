import 'package:datingcase/constants/styles.dart';
import 'package:datingcase/generated/locale_keys.g.dart';
import 'package:datingcase/utils/size_config.dart';
import 'package:datingcase/view/auth/components/atoms/custom_auth_button.dart';
import 'package:datingcase/view/premium/components/bonuses_container_item.dart';
import 'package:datingcase/view/premium/components/offer_box.dart';
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
              Align(
                alignment: Alignment.center,
                child: Text(
                  LocaleKeys.limited_offer.tr(),
                  style: KStyles.kLimitedBoxHeaderTextStyle(context),
                ),
              ),
              SizedBox(height: KStyles.kFourSize),
              Align(
                alignment: Alignment.center,
                child: Container(
                  constraints: BoxConstraints(
                    maxWidth: SizeConfig.screenWidth! / 1.5,
                  ),
                  child: Text(
                    LocaleKeys.limited_offer_description.tr(),
                    textAlign: TextAlign.center,
                    style: KStyles.kLimitedBoxDescriptionTextStyle(context),
                  ),
                ),
              ),
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
                      Text(
                        LocaleKeys.receiving_bonuses.tr(),
                        style: KStyles.kLimitedBoxTitleTextStyle(context),
                      ),
                      SizedBox(height: KStyles.kFifteenSize),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          BonusesContainerItem(
                            image: 'assets/icons/premium.png',
                            text: LocaleKeys.premium_account.tr(),
                          ),
                          BonusesContainerItem(
                            image: 'assets/icons/more_match.png',
                            text: LocaleKeys.more_matching.tr(),
                          ),
                          BonusesContainerItem(
                            image: 'assets/icons/highlight.png',
                            text: LocaleKeys.highlight.tr(),
                          ),
                          BonusesContainerItem(
                            image: 'assets/icons/more_like.png',
                            text: LocaleKeys.more_likes.tr(),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: KStyles.kTwentyTwoSize),
              Align(
                alignment: Alignment.center,
                child: Text(
                  LocaleKeys.pick_token_for_unlock_features.tr(),
                  style: KStyles.kLimitedBoxTitleTextStyle(context),
                ),
              ),
              SizedBox(height: KStyles.kFifteenSize),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  OfferBox(
                    discountNumber: '+10%',
                    oldNumber: '200',
                    newNumber: '300',
                    price: '₺99,99',
                  ),
                  OfferBox(
                    discountNumber: '+70%',
                    oldNumber: '2000',
                    newNumber: '3375',
                    price: '₺799,99',
                    isMiddle: true,
                  ),
                  OfferBox(
                    discountNumber: '+35%',
                    oldNumber: '1000',
                    newNumber: '1350',
                    price: '₺399,99',
                  ),
                ],
              ),
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
