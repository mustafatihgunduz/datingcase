import 'package:datingcase/utils/size_config.dart';
import 'package:flutter/material.dart';

class KStyles {
  static Color kPageColor = const Color(0xff090909);
  static String fontFamily = 'EuclidSemibold';
  static double kEighteenSize = SizeConfig.screenWidth! * 0.046; //* 18 px
  static double kThirteenSize = SizeConfig.screenWidth! * 0.0331; //* 13 px
  static double kTwelveSize = SizeConfig.screenWidth! * 0.0306; //* 12 px
  static double kTwentyFourSize = SizeConfig.screenWidth! * 0.061; //* 24 px
  static double kNineteenSize = SizeConfig.screenWidth! * 0.049; //* 19 px
  static double kFifteenSize = SizeConfig.screenWidth! * 0.0382; //* 15 px
  static double kFourtySize = SizeConfig.screenWidth! * 0.1; //* 40 px
  static double kFiftySize = SizeConfig.screenWidth! * 0.114; //* 50px
  static double kFourtyEightSize = SizeConfig.screenWidth! * 0.11; //* 48px
  static double kThirtySize = SizeConfig.screenWidth! * 0.068;
  static double kThirtySixSize = SizeConfig.screenWidth! * 0.082;
  static double kEightSize = SizeConfig.screenWidth! * 0.018; //* 8
  static double kFourSize = SizeConfig.screenWidth! * 0.009; //* 4
  static double kNineSize = SizeConfig.screenWidth! * 0.021; //* 9
  static double kThirtyThreeSize = SizeConfig.screenWidth! * 0.075; //* 33px
  static double kTwentySixSize = SizeConfig.screenWidth! * 0.06; //* 26
  static double kTwentyTwoSize = SizeConfig.screenWidth! * 0.05; //* 22px
  static double kThirtyOneSize = SizeConfig.screenWidth! * 0.07; //* 31px
  static double kThirtySevenSize = SizeConfig.screenWidth! * 0.084;
  static double kSeventySize = SizeConfig.screenWidth! * 0.16; //* 70px
  static double kTwentySize = SizeConfig.screenWidth! * 0.051; //*20px
  static Color kWhiteColor = const Color(0xFFFFFFFF);
  static Color kButtonColor = const Color(0xffE50914);
  static Color kLimitedBoxShadowColor = const Color(0xff6F060B);
  static BorderRadius kBorderRadius = BorderRadius.circular(18.0);
  static BorderRadius kBottomNavbarRadius = BorderRadius.circular(5.0);
  static BorderRadius kAddPhotoRadius = BorderRadius.circular(33.0);
  static EdgeInsets kButtonPadding = EdgeInsets.symmetric(
    vertical: SizeConfig.screenWidth! * 0.0438, //* 17 px
  );
  static EdgeInsets kLimitedOfferButtonPadding = EdgeInsets.symmetric(
    horizontal: kNineSize,
    vertical: kNineSize,
  );
  static EdgeInsets kSocialContainerPadding = EdgeInsets.symmetric(
    horizontal: kTwentySize,
    vertical: kTwentySize,
  );

  static EdgeInsets kBottomNavbarContainerPadding = EdgeInsets.symmetric(
    horizontal: kFifteenSize,
    vertical: kThirteenSize,
  );

  static TextStyle kHeaderTextStyle(BuildContext context) {
    var kHeaderTextStyle = TextStyle(
      fontFamily: fontFamily,
      fontSize: kEighteenSize,
      color: kWhiteColor,
      decoration: TextDecoration.none,
    );
    return kHeaderTextStyle;
  }

  static TextStyle kAppbarTitleTextStyle(BuildContext context) {
    var kAppbarTitleTextStyle = TextStyle(
      fontFamily: fontFamily,
      fontSize: kFifteenSize,
      color: kWhiteColor,
      decoration: TextDecoration.none,
    );
    return kAppbarTitleTextStyle;
  }

  static TextStyle kBottomNavbarTitleTextStyle(BuildContext context) {
    var kBottomNavbarTitleTextStyle = TextStyle(
      fontFamily: fontFamily,
      fontSize: kTwelveSize,
      color: kWhiteColor,
      fontWeight: FontWeight.bold,
      decoration: TextDecoration.none,
    );
    return kBottomNavbarTitleTextStyle;
  }

  static TextStyle kSubtitleTextStyle(BuildContext context) {
    var kSubtitleTextStyle = TextStyle(
      fontFamily: fontFamily,
      fontSize: kThirteenSize,
      color: kWhiteColor,
      decoration: TextDecoration.none,
    );
    return kSubtitleTextStyle;
  }

  static TextStyle kInputHintTextStyle(BuildContext context) {
    var kSubtitleTextStyle = TextStyle(
      fontFamily: fontFamily,
      fontSize: kTwelveSize,
      color: kWhiteColor.withValues(alpha: 0.5),
    );
    return kSubtitleTextStyle;
  }

  static TextStyle kMovieTitleTextStyle(BuildContext context) {
    var kSubtitleTextStyle = TextStyle(
      fontFamily: fontFamily,
      fontSize: kTwelveSize,
      color: kWhiteColor,
      decoration: TextDecoration.none,
    );
    return kSubtitleTextStyle;
  }

  static TextStyle kMovieYearTextStyle(BuildContext context) {
    var kSubtitleTextStyle = TextStyle(
      fontFamily: fontFamily,
      fontSize: kTwelveSize,
      color: kWhiteColor.withValues(alpha: 0.5),
    );
    return kSubtitleTextStyle;
  }

  static TextStyle kTextButtonTextStyle(BuildContext context) {
    var kSubtitleTextStyle = TextStyle(
      fontFamily: fontFamily,
      fontSize: kTwelveSize,
      color: kWhiteColor,
      decoration: TextDecoration.underline,
      decorationColor: kWhiteColor,
    );
    return kSubtitleTextStyle;
  }

  static TextStyle kButtonTextStyle(BuildContext context) {
    var kButtonTextStyle = TextStyle(
      fontFamily: fontFamily,
      fontSize: kFifteenSize,
      color: kWhiteColor,
      decoration: TextDecoration.none,
    );
    return kButtonTextStyle;
  }

  static TextStyle kLimitedOfferButtonTextStyle(BuildContext context) {
    var kButtonTextStyle = TextStyle(
      fontFamily: fontFamily,
      fontSize: kTwelveSize,
      color: kWhiteColor,
      decoration: TextDecoration.none,
    );
    return kButtonTextStyle;
  }

  static TextStyle kAlertDialogTextStyle(BuildContext context) {
    var kButtonTextStyle = TextStyle(
      fontFamily: fontFamily,
      fontSize: kFifteenSize,
      color: kWhiteColor,
      decoration: TextDecoration.none,
    );
    return kButtonTextStyle;
  }

  static TextStyle kLimitedBoxHeaderTextStyle(BuildContext context) {
    var kLimitedBoxHeaderTextStyle = TextStyle(
      fontFamily: fontFamily,
      fontSize: kTwentySize,
      color: kWhiteColor,
      decoration: TextDecoration.none,
      fontWeight: FontWeight.bold,
    );
    return kLimitedBoxHeaderTextStyle;
  }

  static TextStyle kLimitedBoxDescriptionTextStyle(BuildContext context) {
    var kLimitedBoxDescriptionTextStyle = TextStyle(
      fontFamily: fontFamily,
      fontSize: kTwelveSize,
      color: kWhiteColor,
      decoration: TextDecoration.none,
      fontWeight: FontWeight.normal,
    );
    return kLimitedBoxDescriptionTextStyle;
  }

  static TextStyle kLimitedBoxTitleTextStyle(BuildContext context) {
    var kLimitedBoxTitleTextStyle = TextStyle(
      fontFamily: fontFamily,
      fontSize: kFifteenSize,
      color: kWhiteColor,
      decoration: TextDecoration.none,
      fontWeight: FontWeight.w500,
    );
    return kLimitedBoxTitleTextStyle;
  }

  static TextStyle kLimitedBoxNumberWithLineTextStyle(BuildContext context) {
    var kLimitedBoxTitleTextStyle = TextStyle(
      fontFamily: fontFamily,
      fontSize: kFifteenSize,
      color: kWhiteColor,
      decoration: TextDecoration.lineThrough,
      fontWeight: FontWeight.w500,
    );
    return kLimitedBoxTitleTextStyle;
  }

  static TextStyle kLimitedBoxNumberTextStyle(BuildContext context) {
    var kLimitedBoxTitleTextStyle = TextStyle(
      fontFamily: fontFamily,
      fontSize: kTwentySixSize,
      color: kWhiteColor,
      decoration: TextDecoration.lineThrough,
      fontWeight: FontWeight.bold,
    );
    return kLimitedBoxTitleTextStyle;
  }

  static TextStyle kAlertDialogButtonTextStyle(
    BuildContext context,
    Color color,
  ) {
    var kButtonTextStyle = TextStyle(
      fontFamily: fontFamily,
      fontSize: kTwelveSize,
      color: color,
      decoration: TextDecoration.none,
    );
    return kButtonTextStyle;
  }

  static ButtonStyle kButtonStyle(BuildContext context) {
    var kButtonStyle = ButtonStyle(
      backgroundColor: WidgetStatePropertyAll<Color>(kButtonColor),
      padding: WidgetStatePropertyAll<EdgeInsets>(
        EdgeInsets.symmetric(horizontal: kEighteenSize, vertical: kNineSize),
      ),
      shape: WidgetStatePropertyAll<OutlinedBorder>(
        RoundedRectangleBorder(borderRadius: kBorderRadius),
      ),
    );
    return kButtonStyle;
  }

  static ButtonStyle kLimitedOfferButtonStyle(BuildContext context) {
    var kButtonStyle = ButtonStyle(
      backgroundColor: WidgetStatePropertyAll<Color>(kButtonColor),
      padding: WidgetStatePropertyAll<EdgeInsets>(kLimitedOfferButtonPadding),
      shape: WidgetStatePropertyAll<OutlinedBorder>(
        RoundedRectangleBorder(borderRadius: kBorderRadius),
      ),
    );
    return kButtonStyle;
  }

  static BoxDecoration kSocialContainerDecoration() {
    var kSocialContainerDecoration = BoxDecoration(
      color: kWhiteColor.withValues(alpha: 0.1),
      border: Border.all(color: kWhiteColor.withValues(alpha: 0.2), width: 1.0),
      borderRadius: kBorderRadius,
    );
    return kSocialContainerDecoration;
  }

  static BoxDecoration kBackButtonContainerDecoration() {
    var kBackButtonContainerDecoration = BoxDecoration(
      color: kWhiteColor.withValues(alpha: 0.1),
      border: Border.all(color: kWhiteColor.withValues(alpha: 0.2), width: 1.0),
      shape: BoxShape.circle,
    );
    return kBackButtonContainerDecoration;
  }

  static BoxDecoration kAddPhotoContainerDecoration() {
    var kAddPhotoContainerDecoration = BoxDecoration(
      color: kWhiteColor.withValues(alpha: 0.1),
      border: Border.all(color: kWhiteColor.withValues(alpha: 0.2), width: 1.0),
      borderRadius: kAddPhotoRadius,
    );
    return kAddPhotoContainerDecoration;
  }

  static BoxDecoration kBottomNavbarContainerDecoration() {
    var kBottomNavbarContainerDecoration = BoxDecoration(
      color: kWhiteColor.withValues(alpha: 0.1),
      border: Border.all(color: kWhiteColor.withValues(alpha: 0.2), width: 1.0),
      borderRadius: kBottomNavbarRadius,
    );
    return kBottomNavbarContainerDecoration;
  }

  static InputDecoration kInputDecoration(
    BuildContext context,
    String hintText,
    String prefixIcon, {
    String trailingIcon = 'assets/icons/hide.png',
    bool hasTrailing = false,
  }) {
    var kInputDecoration = InputDecoration(
      filled: true,
      fillColor: kWhiteColor.withValues(alpha: 0.1),
      hintText: hintText,
      hintStyle: kInputHintTextStyle(context),
      prefixIcon: Image.asset(prefixIcon),
      suffixIcon: hasTrailing ? Image.asset(trailingIcon) : null,
      border: OutlineInputBorder(
        borderRadius: kBorderRadius,
        borderSide: BorderSide.none,
      ),
      contentPadding: EdgeInsets.symmetric(
        horizontal: kTwentyFourSize,
        vertical: kNineteenSize,
      ),
    );
    return kInputDecoration;
  }
}
