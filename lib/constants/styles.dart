import 'package:datingcase/utils/size_config.dart';
import 'package:flutter/material.dart';

class KStyles {
  static Color kPageColor = const Color(0xff090909);
  static String fontFamily = 'EuclidSemibold';
  static double kEighteenFontSize = SizeConfig.screenWidth! * 0.046; //* 18 px
  static double kThirteenFontSize = SizeConfig.screenWidth! * 0.0331; //* 13 px
  static double kTwelveFontSize = SizeConfig.screenWidth! * 0.0306; //* 12 px
  static double kTwentyFourSize = SizeConfig.screenWidth! * 0.061; //* 24 px
  static double kNineteenSize = SizeConfig.screenWidth! * 0.049; //* 19 px
  static double kFifteenSize = SizeConfig.screenWidth! * 0.0382; //* 15 px
  static double kFourtySize = SizeConfig.screenWidth! * 0.1; //* 40 px
  static Color kWhiteColor = const Color(0xFFFFFFFF);
  static Color kButtonColor = const Color(0xffE50914);
  static BorderRadius kBorderRadius = BorderRadius.circular(18.0);
  static EdgeInsets kButtonPadding = EdgeInsets.symmetric(
    vertical: SizeConfig.screenWidth! * 0.0438, //* 17 px
  );
  static EdgeInsets kSocialContainerPadding = EdgeInsets.symmetric(
    horizontal: SizeConfig.screenWidth! * 0.051, //* 20 px
    vertical: SizeConfig.screenWidth! * 0.051, //* 20 px
  );

  static TextStyle kHeaderTextStyle(BuildContext context) {
    var kHeaderTextStyle = TextStyle(
      fontFamily: fontFamily,
      fontSize: kEighteenFontSize,
      color: kWhiteColor,
      decoration: TextDecoration.none,
    );
    return kHeaderTextStyle;
  }

  static TextStyle kSubtitleTextStyle(BuildContext context) {
    var kSubtitleTextStyle = TextStyle(
      fontFamily: fontFamily,
      fontSize: kThirteenFontSize,
      color: kWhiteColor,
      decoration: TextDecoration.none,
    );
    return kSubtitleTextStyle;
  }

  static TextStyle kInputHintTextStyle(BuildContext context) {
    var kSubtitleTextStyle = TextStyle(
      fontFamily: fontFamily,
      fontSize: kTwelveFontSize,
      color: kWhiteColor.withValues(alpha: 0.5),
    );
    return kSubtitleTextStyle;
  }

  static TextStyle kTextButtonTextStyle(BuildContext context) {
    var kSubtitleTextStyle = TextStyle(
      fontFamily: fontFamily,
      fontSize: kTwelveFontSize,
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

  static ButtonStyle kButtonStyle(BuildContext context) {
    var kButtonStyle = ButtonStyle(
      backgroundColor: WidgetStatePropertyAll<Color>(kButtonColor),
      padding: WidgetStatePropertyAll<EdgeInsets>(kButtonPadding),
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

  static InputDecoration kInputDecoration(
    BuildContext context,
    String hintText,
    String prefixIconPath,
  ) {
    var kInputDecoration = InputDecoration(
      filled: true,
      fillColor: kWhiteColor.withValues(alpha: 0.1),
      hintText: hintText,
      hintStyle: kInputHintTextStyle(context),
      prefixIcon: Image.asset(prefixIconPath),
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
