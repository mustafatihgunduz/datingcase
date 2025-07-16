import 'package:badges/badges.dart' as badges;
import 'package:datingcase/constants/styles.dart';
import 'package:datingcase/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class OfferBox extends StatelessWidget {
  OfferBox({
    super.key,
    required this.discountNumber,
    required this.oldNumber,
    required this.newNumber,
    required this.price,
    this.isMiddle = false,
  });
  final String discountNumber;
  final String oldNumber;
  final String newNumber;
  final String price;
  bool isMiddle;
  @override
  Widget build(BuildContext context) {
    return badges.Badge(
      badgeContent: Text(
        discountNumber,
        style: KStyles.kLimitedBoxDescriptionTextStyle(context),
      ),
      position: badges.BadgePosition.custom(
        top: -KStyles.kEightSize,
        start: KStyles.kThirtySixSize,
      ),
      badgeStyle: badges.BadgeStyle(
        badgeColor: isMiddle
            ? KStyles.kLimitedBoxMiddleColor
            : KStyles.kLimitedBoxShadowColor,
        padding: EdgeInsetsGeometry.symmetric(
          horizontal: KStyles.kFifteenSize,
          vertical: KStyles.kFourSize,
        ),
        borderSide: BorderSide(
          width: 3,
          color: KStyles.kWhiteColor.withValues(alpha: 0.5),
        ),
        borderRadius: BorderRadius.circular(24),
        shape: badges.BadgeShape.square,
      ),
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: KStyles.kFourSize),
        decoration: BoxDecoration(
          border: Border.all(width: 1, color: KStyles.kWhiteColor),
          borderRadius: BorderRadius.circular(16),
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: isMiddle
                ? [KStyles.kLimitedBoxMiddleColor, KStyles.kButtonColor]
                : [KStyles.kLimitedBoxShadowColor, KStyles.kButtonColor],
          ),
        ),
        child: Padding(
          padding: EdgeInsets.only(
            top: KStyles.kFourtyFiveSize,
            left: KStyles.kNineSize,
            bottom: KStyles.kNineSize,
            right: KStyles.kNineSize,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                oldNumber,
                style: KStyles.kLimitedBoxNumberWithLineTextStyle(context),
              ),
              Text(
                newNumber,
                style: KStyles.kLimitedBoxNumberTextStyle(context),
              ),
              Text(
                LocaleKeys.token.tr(),
                style: KStyles.kLimitedBoxTitleTextStyle(context),
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: KStyles.kTwelveSize,
                  right: KStyles.kTwelveSize,
                  top: KStyles.kThirtySixSize,
                  bottom: KStyles.kFifteenSize,
                ),
                child: Divider(
                  color: KStyles.kWhiteColor.withValues(alpha: 0.5),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    price,
                    style: KStyles.kLimitedBoxTitleTextStyle(context).copyWith(
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Montserrat',
                    ),
                  ),
                  Text(
                    LocaleKeys.for_weekly.tr(),
                    style: KStyles.kLimitedBoxDescriptionTextStyle(context),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
