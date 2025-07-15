import 'package:datingcase/constants/styles.dart';
import 'package:datingcase/generated/locale_keys.g.dart';
import 'package:datingcase/utils/size_config.dart';
import 'package:datingcase/view/premium/components/bonuses_container_item.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as badges;

class LimitedBoxScreen extends StatelessWidget {
  const LimitedBoxScreen({super.key});

  @override
  Widget build(BuildContext context) {
    print(SizeConfig.screenWidth! * 0.07);
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
        minHeight: SizeConfig.screenHeight! * 0.8,
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
              badges.Badge(
                badgeContent: Text(
                  '+10%',
                  style: KStyles.kLimitedBoxDescriptionTextStyle(context),
                ),
                badgeStyle: badges.BadgeStyle(
                  shape: badges.BadgeShape.square,
                  borderRadius: BorderRadius.circular(24),
                  borderSide: BorderSide(
                    color: Colors.white.withValues(alpha: 0.5),
                  ),

                  padding: EdgeInsetsGeometry.symmetric(
                    horizontal: KStyles.kFifteenSize,
                    vertical: KStyles.kFourSize,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
